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

public class Firstx : MonoBehaviour
{
    Vector3 pos;
    int posxint;

    string message;

    private static int localport;

    private string IP;
    public int port;

    IPEndPoint remoteEndPoint;
    UdpClient client;

    void Start()
    {
        IP = "127.0.0.1";
        //port = 5100;

        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), port);
        client = new UdpClient();
    }

    // Update is called once per frame
    void Update()
    {
        pos = transform.position;
        float posx = pos.x;

        if (posx >= 0)
            {
            posxint = Mathf.FloorToInt(posx);
            }
        else
            {
            posxint = Mathf.CeilToInt(posx);
            }
        

        //UnityEngine.Debug.Log("pos x first digit " + posxint);

        string message = posxint.ToString("0");

        byte[] data = Encoding.UTF8.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);
    }
}