using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class Arm2Rotate : MonoBehaviour
{
    private double dub;
    public float var;
    public float pos;
    public float speed;

    Thread receiveThread;
    UdpClient client;
    public int port;

    private static void Main()
    {
        Arm2Rotate receiveObj = new Arm2Rotate();
        receiveObj.init();
    }

    void Start()
    {
        transform.Rotate(90.0f, 0.0f, 0.0f);
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
                print("Arm 2 Target = " + var);
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
        //if (var >= 0.25f || var <= -0.25f)
        //{
        //    transform.Rotate(Vector3.right * var * speed * Time.deltaTime);
        //}

        /*
        if (var == 1) //Input.GetKey(KeyCode.A)
        {
            transform.Rotate(Vector3.right * -1 * speed * Time.deltaTime);
        }
        if (var == 2) //Input.GetKey(KeyCode.S)
        {
            transform.Rotate(Vector3.right * speed * Time.deltaTime);
        }

        
        HingeJoint hinge = GetComponent<HingeJoint>();
        float pos = var * Mathf.Rad2Deg;

        JointSpring hingeSpring = hinge.spring;
        hingeSpring.spring = 5;
        hingeSpring.damper = 25;
        hingeSpring.targetPosition = pos;
        hinge.useSpring = true;
        
        //pos = pos + 1;
        */
    }
}
