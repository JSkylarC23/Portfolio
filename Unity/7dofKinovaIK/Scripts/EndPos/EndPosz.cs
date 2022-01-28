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

public class EndPosz : MonoBehaviour
{
    Vector3 pos;
    float poz;

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
        float posz = pos.z;
        UnityEngine.Debug.Log("pos z is " + posz.ToString("f4"));

        string message = posz.ToString("f4");
        byte[] data = Encoding.UTF8.GetBytes(message);
        //UnityEngine.Debug.Log("data = " + data[0]);
        client.Send(data, data.Length, remoteEndPoint);
    }
}