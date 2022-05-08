using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Text;
using System.Net;
using System.Net.Sockets;

public class ControlButton : MonoBehaviour
{
    public GameObject cylinder;
    bool on;
    private float train;

    string message;

    private static int localport;

    private string IP;
    public int port;

    IPEndPoint remoteEndPoint;
    UdpClient client;

    void Start()
    {
        train = 0;
        on = false;

        IP = "127.0.0.1";
        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), port);
        client = new UdpClient();
    }

    void Update()
    {
        if (on == true)
        {
            Debug.Log("Control on");
            cylinder.gameObject.GetComponent<Renderer>().material.color = Color.red;
            train = 1;
        }
        else
        {
            Debug.Log("Control off");
            cylinder.gameObject.GetComponent<Renderer>().material.color = Color.blue ;
            train = 0;
        }

        string message = train.ToString();
        byte[] data = Encoding.ASCII.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);

        Debug.Log(message);
    }

    void OnTriggerEnter(Collider other)
    {
        Debug.Log("control collision enter");

        if (on == true)
        {
            on = false;
        }
        else
        {
            on = true;
        }
    }

    void OnTriggerExit(Collider other)
    {
        Debug.Log("control collision exit");
    }
}
