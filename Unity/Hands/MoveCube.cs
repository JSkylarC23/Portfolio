using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class MoveCube: MonoBehaviour
{
    public float speed;
    public GameObject sphere;

    private double dub;
    public float var;

    Thread receiveThread;
    UdpClient client;
    public int port;

    public string lastReceivedUDPPacket = "";
    public string allReceivedUDPPackets = "";

    private static void Main()
    {
        MoveCube receiveObj = new MoveCube();
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

                var = (float)dub;

                print("Class >> " + var);

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
        

    }

    void OnTriggerStay(Collider other)
    {
        if (var == 1)
        {
            transform.position = Vector3.MoveTowards(transform.position, sphere.transform.position, speed * Time.deltaTime);
        }
        Debug.Log("SphereGrab is within cube trigger");
    }
}
