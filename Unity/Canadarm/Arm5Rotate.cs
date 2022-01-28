using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class Arm5Rotate : MonoBehaviour
{
    private double dub;
    public float var;
    public float pos;

    Thread receiveThread;
    UdpClient client;
    public int port;

    private static void Main()
    {
        Arm5Rotate receiveObj = new Arm5Rotate();
        receiveObj.init();
    }

    void Start()
    {
        init();
    }

    private void init()
    {
        print("UDPSend.init()");
        print("Sending to 127.0.0.1 : " + port);

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
                var = (float)dub;
                print("Arm 5 Target = " + var);
            }
            catch (Exception err)
            {
                print(err.ToString());
            }
        }
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
            Debug.Log(err.Message);
        }
    }

    void Update()
    {
        HingeJoint hinge = GetComponent<HingeJoint>();
        float pos = var * Mathf.Rad2Deg;

        //transform.rotation = Quaternion.Euler(0, pos, 0);

        //print(pos);

        
        JointSpring hingeSpring = hinge.spring;
        hingeSpring.spring = 5;
        hingeSpring.damper = 25;
        hingeSpring.targetPosition = pos;
        hinge.useSpring = true;
        

        //pos = pos + 1;
    }
}
