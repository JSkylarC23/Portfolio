using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Globalization;

public class TargetPos3 : MonoBehaviour
{
    private double dub;
    public float var1;
    public float var;
    bool start = false;
    Vector3 forward;
    Vector3 origin;
    public GameObject refAxis;

    Thread receiveThread;
    UdpClient client;
    public int port;

    public string lastReceivedUDPPacket = "";
    public string allReceivedUDPPackets = ""; // clean up this from time to time!private double dub;


    private static void Main()
    {
        TargetPos3 receiveObj = new TargetPos3();
        receiveObj.init();

        string text = "";
        do
        {
            text = Console.ReadLine();
        }
        while (!text.Equals("exit"));
    }

    void Start()
    {
        origin = refAxis.transform.up;

        HingeJoint hinge = GetComponent<HingeJoint>();

        float c = -90;
        JointSpring hingeSpring = hinge.spring;
        hingeSpring.spring = 5;
        hingeSpring.damper = 25;
        hingeSpring.targetPosition = c;
        hinge.spring = hingeSpring;
        hinge.useSpring = true;

        init();
    }
    private void init()
    {
        print("UDPSend.init()");

        port = 3003;

        print("Sending to 127.0.0.1 : " + port);
        print("Test-Sending to this Port: nc -u 127.0.0.1  " + port + "");

        receiveThread = new Thread(new ThreadStart(ReceiveData));
        receiveThread.IsBackground = true;
        receiveThread.Start();

    }

    public void ReceiveData()
    {

        client = new UdpClient(port);
        while (true)
        {

            try
            {
                IPEndPoint anyIP = new IPEndPoint(IPAddress.Any, 0);
                byte[] data = client.Receive(ref anyIP);

                dub = BitConverter.ToDouble(data, 0);

                var1 = (float)dub;

                //print("Axis 3 target >> " + var1);

            }
            catch (Exception err)
            {
                print(err.ToString());
            }
        }
    }

    public string getLatestUDPPacket()
    {
        allReceivedUDPPackets = "";
        Debug.Log(lastReceivedUDPPacket);
        return lastReceivedUDPPacket;
    }

    private void OnApplicationQuit()
    {
        try
        {
            receiveThread.Abort();
            receiveThread = null;
            client.Close();
        }
        catch (Exception err)
        {
            Debug.Log("<color=red>" + err.Message + "</color>");
        }
    }


    void Update()
    {
        //forward = transform.InverseTransformDirection(Vector3.forward);
        //float angle = 180.0f - Vector3.Angle(refAxis.transform.up, transform.up);
        float angle = 180.0f - Vector3.SignedAngle(refAxis.transform.up, transform.up, -1*transform.right);

        if (360 < angle)
        {
            angle = angle - 360.0f;
        }

        if (0 > angle)
        {
            angle = angle + 360.0f;
        }

        //Debug.Log("Axis 3 angle = " + angle);

        if (91 >= angle)
        {
            start = true;
        }

        if (start == true)
        {
            HingeJoint hinge = GetComponent<HingeJoint>();

            float var = var1 * Mathf.Rad2Deg - 180.0f;

            if (var > 180)
            {
                var = var - 360.0f;
                if (var > 180)
                {
                    var = var - 360.0f;
                }
            }

            if (var < -180)
            {
                var = var + 360.0f;
                if (var < -180)
                {
                    var = var + 360.0f;
                }
            }

            //print("Axis 3 target >> " + var);

            JointSpring hingeSpring = hinge.spring;
            hingeSpring.spring = 5;
            hingeSpring.damper = 50;
            hingeSpring.targetPosition = var;  //var1
            hinge.spring = hingeSpring;
            hinge.useSpring = true;
        }
    }
}
