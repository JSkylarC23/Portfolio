using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Globalization;

public class HandColor : MonoBehaviour
{
    public List<Transform> Objs;
    private float r;
    private float g;

    private double dub;
    public float var;

    private double dub2;
    private float var2;

    Thread receiveThread;
    UdpClient client;
    UdpClient client2;
    public int port;
    public int port2;

    public string lastReceivedUDPPacket = "";
    public string allReceivedUDPPackets = "";


    private static void Main()
    {
        HandColor receiveObj = new HandColor();
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
        init();
    }
    private void init()
    {
        print("UDPSend.init()");

        //port = 25000;

        print("Sending to 127.0.0.1 : " + port);
        print("Test-Sending to this Port: nc -u 127.0.0.1  " + port + "");

        receiveThread = new Thread(new ThreadStart(ReceiveData));
        receiveThread.IsBackground = true;
        receiveThread.Start();

    }

    public void ReceiveData()
    {

        client = new UdpClient(port);
        client2 = new UdpClient(port2);
        while (true)
        {

            try
            {
                IPEndPoint anyIP = new IPEndPoint(IPAddress.Any, 0);
                byte[] data = client.Receive(ref anyIP);

                dub = BitConverter.ToDouble(data, 0);

                var = (float)dub;

                print("Class >> " + var);

            }
            catch (Exception err)
            {
                print(err.ToString());
            }

            try
            {
                IPEndPoint anyIP = new IPEndPoint(IPAddress.Any, 0);
                byte[] data2 = client2.Receive(ref anyIP);

                dub2 = BitConverter.ToDouble(data2, 0);

                var2 = (float)dub2;

                print("Class >> " + var2);

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
        foreach (Transform Tform in Objs)
        {
            if (var > .5)
            {
                r = (var * .01f + .99f) * 255;
                g = var2 * .01f * 255;
            }
            else
            {
                r = var * .01f * 255;
                g = (var2 * .01f + .99f) * 255;
            }

            Debug.Log("red =" + r);
            Debug.Log("green =" + g);

            Tform.GetComponent<Renderer>().material.color = new Color(r, g, 0); //rgb

        }
    }
}
