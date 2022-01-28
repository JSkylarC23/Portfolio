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

public class Angle1 : MonoBehaviour
{
    Vector3 refAng;

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
        port = 2100;
        refAng = transform.forward;

        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), port);
        client = new UdpClient();
    }

    // Update is called once per frame
    void Update()
    {
        var curAng = transform.forward;
        float ang = Vector3.Angle(refAng, curAng);
        float rad1 = ang * Mathf.Deg2Rad;
        //UnityEngine.Debug.Log("angle 1 = " + ang);

        string message = rad1.ToString();
        byte[] data = Encoding.UTF8.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);
    }
}