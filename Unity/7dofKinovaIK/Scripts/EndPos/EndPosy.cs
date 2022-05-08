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

public class EndPosy : MonoBehaviour
{
    Vector3 pos;
    float posy;

    string message;

    private static int localport;

    private string IP;
    public int port;


    IPEndPoint remoteEndPoint;
    UdpClient client;

    void Start()
    {
        IP = "127.0.0.1";

        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), port);
        client = new UdpClient();
    }

    void Update()
    {
        pos = transform.position;
        posy = pos.y - 4.5f;
        UnityEngine.Debug.Log("pos y is " + posy.ToString("f4"));


        string message = posy.ToString("f4");
        byte[] data = Encoding.UTF8.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);
    }
}