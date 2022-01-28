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

public class Firsty : MonoBehaviour
{
    Vector3 pos;
    int posyint;
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
        float posy = pos.y;

        if (posy >= 0)
        {
            posyint = Mathf.FloorToInt(posy);
        }
        else
        {
            posyint = Mathf.CeilToInt(posy);
        }

        string message = posy.ToString("0");
        //UnityEngine.Debug.Log("pos y first digit " + message);

        byte[] data = Encoding.UTF8.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);
    }
}