using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Globalization;

public class Axis1Rotate : MonoBehaviour
{
    public float angle;
    public Rigidbody rb;
    private double dub;
    private float var1;

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
        Axis1Rotate receiveObj = new Axis1Rotate();
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
        rb = GetComponent<Rigidbody>(); //what?
        init();
    }

    private void init()
    {
        print("UDPSend.init()");

        port = 3001;

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

                //double[] dub = new double[data.Length / 8];
                //Buffer.BlockCopy(data, 0, dub, 0, dub.Length * 8);

                //string text = Encoding.UTF8.GetString(data);

                //var = Convert.ToInt16(data);

                dub = BitConverter.ToDouble(data, 0);

                var1 = (float)dub;

                print("Axis 1 >> " + var1);

                //lastReceivedUDPPacket = text;

                // ....
                //allReceivedUDPPackets = allReceivedUDPPackets + text;

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
        transform.Rotate(Vector3.up * var1*2 * angle * Time.deltaTime, Space.World);
    }
}