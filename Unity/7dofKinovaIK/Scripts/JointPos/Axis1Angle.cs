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

public class Axis1Angle : MonoBehaviour
{
    Vector3 refAng;

    string message;

    private static int localport;

    private string IP;
    public int port;

    public GameObject refAxis;
    Vector3 origin;

    IPEndPoint remoteEndPoint;
    UdpClient client;

    // Start is called before the first frame update
    void Start()
    {
        origin = refAxis.transform.right;

        IP = "127.0.0.1";
        port = 2001;
        refAng = transform.forward;

        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), port);
        client = new UdpClient();
    }

    // Update is called once per frame
    void Update()
    {
        float angle = 180.0f + Vector3.SignedAngle(origin, transform.forward, transform.up);

        if (360 < angle)
        {
            angle = angle - 360.0f;
        }

        if (0 > angle)
        {
            angle = angle + 360.0f;
        }

        float rad1 = angle * Mathf.Deg2Rad;
        UnityEngine.Debug.Log("angle 1 check = " + angle);

        string message = rad1.ToString("f3");
        byte[] data = Encoding.UTF8.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);
    }
}