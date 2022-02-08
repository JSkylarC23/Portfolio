using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Text;
using System.Net;
using System.Net.Sockets;

public class TrainingButton : MonoBehaviour
{
    public GameObject cylinder;
    bool on;
    bool trainBool;
    bool start;
    private float train;
    public GameObject grabText;
    public GameObject relaxText;
    private Renderer rendGrab;
    private Renderer rendRelax;

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
        trainBool = false;
        start = true;
        rendGrab = grabText.gameObject.GetComponent<Renderer>();
        rendRelax = relaxText.gameObject.GetComponent<Renderer > ();
        rendGrab.enabled = false;
        rendRelax.enabled = false;

        IP = "127.0.0.1";
        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), port);
        client = new UdpClient();
    }

    void Update()
    {
        if (on == true)
        {
            Debug.Log("Training on");
            cylinder.gameObject.GetComponent<Renderer>().material.color = Color.red;
            trainBool = true;

            if (start == true)
            {
                // flash 5,4,3,2,1
                Debug.Log("Start Coroutine");
                StartCoroutine("Train");
                start = false;
            }
        }
        else
        {
            Debug.Log("Training off");
            cylinder.gameObject.GetComponent<Renderer>().material.color = Color.green;
            train = 0;
            trainBool = false;
        }

        string message = train.ToString();
        byte[] data = Encoding.ASCII.GetBytes(message);
        client.Send(data, data.Length, remoteEndPoint);

        Debug.Log(message);
    }

    void OnTriggerEnter(Collider other)
    {
        Debug.Log("train collision enter");

        if (on == true)
        {
            on = false;
        }
        else
        {
            on = true;
            start = true;
        }
    }

    IEnumerator Train()
    {
        while (true)
        {
            if (trainBool == false)
            {
                rendRelax.enabled = false;
                rendGrab.enabled = false;
                yield return (new WaitForSeconds(1));
            }
            else
            {
                Debug.Log("relax");
                rendRelax.enabled = true;
                rendGrab.enabled = false;
                train = 2;
                yield return (new WaitForSeconds(5));
                Debug.Log("Grab");
                rendRelax.enabled = false;
                rendGrab.enabled = true;
                train = 1;
                yield return (new WaitForSeconds(5));
            }
        }
    }
}
