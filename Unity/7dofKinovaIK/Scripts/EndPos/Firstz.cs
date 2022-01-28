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

public class Firstz : MonoBehaviour
{
    Vector3 pos;
    string message;
    int poszint;

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
        float posz = pos.z;

        if (posz >= 0)
        {
            poszint = Mathf.FloorToInt(posz);
        }
        else
        {
            poszint = Mathf.CeilToInt(posz);
        }

        string message = poszint.ToString("0");
        //UnityEngine.Debug.Log("pos z first digit " + message);

        byte[] data = Encoding.UTF8.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);
    }
}