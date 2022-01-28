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

public class Signx : MonoBehaviour
{
    Vector3 pos;
    int signx = 0;

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

    // Update is called once per frame
    void Update()
    {
        pos = transform.position;
        float posx = pos.x;

        if (posx > 1)
        {
            signx = 1;
        }
        else
        {
            signx = 0;
        }

        string message = signx.ToString();
        //UnityEngine.Debug.Log("pos x Sign " + message);

        byte[] data = Encoding.UTF8.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);
    }
}