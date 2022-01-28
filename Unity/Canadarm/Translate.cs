using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class Translate : MonoBehaviour
{
    private double dub;
    public float var;
    public float pos;
    public float speed;

    public GameObject axis3;
    public GameObject axis4;
    public GameObject axis5;

    Thread receiveThread;
    UdpClient client;
    public int port;

    private static void Main()
    {
        Translate receiveObj = new Translate();
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
                print("Arm 1 Target = " + var);
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

    public void Update()
    {

        if (var >= 0.25f || var <= -0.25f)
        {
            axis3.transform.Rotate(Vector3.up * -1 * speed * Time.deltaTime);
            axis4.transform.Rotate(Vector3.up * (2 * speed) * Time.deltaTime);
            axis5.transform.Rotate(Vector3.up * -1 * speed * Time.deltaTime);
        }

        if (Input.GetKey(KeyCode.Z))
        {
            axis3.transform.Rotate(Vector3.up * -1 * speed * Time.deltaTime);
            axis4.transform.Rotate(Vector3.up  * (2*speed) * Time.deltaTime);
            axis5.transform.Rotate(Vector3.up * -1 * speed * Time.deltaTime);
        }

        if (Input.GetKey(KeyCode.X))
        {
            axis3.transform.Rotate(Vector3.up * speed * Time.deltaTime);
            axis4.transform.Rotate(Vector3.up  * -1 * (2*speed) * Time.deltaTime);
            axis5.transform.Rotate(Vector3.up * speed * Time.deltaTime);
        }

    }

}
