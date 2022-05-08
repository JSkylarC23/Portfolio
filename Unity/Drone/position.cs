using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Diagnostics;
using UnityEngine;
using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class position : MonoBehaviour
{

    public GameObject drone;
    Vector3 pos;
    string message;

    private static int localport;

    private string IP;
    public int port;

    IPEndPoint remoteEndPoint;
    UdpClient client;

    // Start is called before the first frame update
    void Start()
    {
        IP = "127.0.0.1";
        port = 2600;

        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), port);
        client = new UdpClient();
    }

    // Update is called once per frame
    void Update()
    {
        pos = drone.transform.position;
        string message = pos.x.ToString("f3") + " , " + pos.y.ToString("f3") + " , " + pos.z.ToString("f3");

        byte[] data = Encoding.UTF8.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);

        //UnityEngine.Debug.Log(message);
    }
}