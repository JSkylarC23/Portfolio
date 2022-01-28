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

public class Angle3 : MonoBehaviour
{
    public Transform target;

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
        port = 2300;

        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), port);
        client = new UdpClient();
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 targetDir = target.position - transform.position;
        float angle = Vector3.Angle(targetDir, transform.forward);
        float rad3 = angle * Mathf.Deg2Rad;
        //UnityEngine.Debug.Log("angle 3 = " + rad3);

        string message = rad3.ToString();
        byte[] data = Encoding.UTF8.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);
    }
}
