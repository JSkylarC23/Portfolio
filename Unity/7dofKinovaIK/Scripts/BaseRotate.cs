using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Globalization;

public class BaseRotate : MonoBehaviour
{
    public float torque;
    public Rigidbody rb;
    private double dub;
    private float var;

    // receiving Thread
    Thread receiveThread;

    // udpclient object
    UdpClient client;

    // public
    // public string IP = "127.0.0.1"; default local
    public int port; // define > init

    // infos
    public string lastReceivedUDPPacket = "";
    public string allReceivedUDPPackets = ""; // clean up this from time to time!

    private static void Main()
    {
        BaseRotate receiveObj = new BaseRotate();
        receiveObj.init();

        string text = "";
        do
        {
            text = Console.ReadLine();
        }
        while (!text.Equals("exit"));
    }
    // start from unity3d
    public void Start()
    {
        rb = GetComponent<Rigidbody>();
        init();
    }

    private void init()
    {
        print("UDPSend.init()");

        port = 2701;

        print("Sending to 127.0.0.1 : " + port);
        print("Test-Sending to this Port: nc -u 127.0.0.1  " + port + "");

        receiveThread = new Thread(new ThreadStart(ReceiveData));
        receiveThread.IsBackground = true;
        receiveThread.Start();

    }

    private void ReceiveData()
    {

        client = new UdpClient(port);
        while (true)
        {

            try
            {
                IPEndPoint anyIP = new IPEndPoint(IPAddress.Any, 0);
                byte[] data = client.Receive(ref anyIP);

                //double[] dub = new double[data.Length / 8];
                //Buffer.BlockCopy(data, 0, dub, 0, dub.Length * 8);

                string text = Encoding.UTF8.GetString(data);

                //var = Convert.ToInt16(data);

                dub = BitConverter.ToDouble(data, 0);

                var = (float)dub;

                print("Base >> " + dub);

                lastReceivedUDPPacket = text;

                // ....
                allReceivedUDPPackets = allReceivedUDPPackets + text;

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

    // Update is called once per frame
    void Update()
    {
        transform.Rotate(Vector3.up * var * Time.deltaTime * .004f, Space.World);

        //UnityEngine.Debug.Log(lastReceivedUDPPacket);
    }
}