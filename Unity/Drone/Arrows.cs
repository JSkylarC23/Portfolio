using UnityEngine;
using System.Collections;

using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class Arrows : MonoBehaviour
{
    //local host
    public string IP = "127.0.0.1";

    //Ports
    public int portLocal = 8010;
    public int portRemote = 8011;

    // Create necessary UdpClient objects
    UdpClient client;
    IPEndPoint remoteEndPoint;

    // Receiving Thread
    Thread receiveThread;
    // Message to be sent
    public string strMessageSend = "";

    // info strings
    public string lastReceivedUDPPacket = "";
    public string allReceivedUDPPackets = "";
    // clear this from time to time!

    public Renderer rend;
    public Renderer rendLeft;
    public Renderer rendRight;
    public Renderer rendUp;
    public Renderer rendDown;
    public Renderer rendIn;
    public Renderer rendOut;


    public GameObject arrowLeft;
    public GameObject arrowRight;
    public GameObject arrowUp;
    public GameObject arrowDown;
    public GameObject arrowIn;
    public GameObject arrowOut;

    int counterLeft = 0;
    int counterRight = 0;
    int counterUp = 0;
    int counterDown = 0;
    int counterIn = 0;
    int counterOut = 0;
    int total;
    int i;

    // start from Unity3d
    public void Start()
    {
        init();

        rendLeft = arrowLeft.gameObject.GetComponent<Renderer>();
        rendRight = arrowRight.gameObject.GetComponent<Renderer>();
        rendUp = arrowUp.gameObject.GetComponent<Renderer>();
        rendDown = arrowDown.gameObject.GetComponent<Renderer>();
        rendIn = arrowIn.gameObject.GetComponent<Renderer>();
        rendOut = arrowOut.gameObject.GetComponent<Renderer>();

        rendLeft.enabled = false;
        rendRight.enabled = false;
        rendUp.enabled = false;
        rendDown.enabled = false;
        rendIn.enabled = false;
        rendOut.enabled = false;

        StartCoroutine("HideUnhide");
    }

    void Update()
    {
        total = counterLeft + counterRight + counterUp + counterDown + counterIn + counterOut;
        if (total == 120)
        {
            Application.Quit();
        }
    }

    IEnumerator HideUnhide()
    {
        //Debug.Log("Coroutine");

        while (total < 120)
        {
            i = UnityEngine.Random.Range(1, 7);
            //Debug.Log(i);

            switch (i)
            {
                case 1: //arrow left
                    if (counterLeft < 20)
                    {
                        yield return (new WaitForSeconds(1));
                        rendLeft.enabled = true;
                        sendData("l" + "\n");
                        yield return (new WaitForSeconds(3));
                        rendLeft.enabled = false;
                        sendData("f" + "\n");
                        yield return (new WaitForSeconds(2 + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        counterLeft = counterLeft + 1;
                        Debug.Log(total);
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 2: //arrow right
                    if (counterRight < 20)
                    {
                        yield return (new WaitForSeconds(1));
                        rendRight.enabled = true;
                        sendData("r" + "\n");
                        yield return (new WaitForSeconds(3));
                        rendRight.enabled = false;
                        sendData("f" + "\n");
                        yield return (new WaitForSeconds(2 + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        counterRight = counterRight + 1;
                        Debug.Log(total);
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 3: //arrow up
                    if (counterUp < 20)
                    {

                        yield return (new WaitForSeconds(1));
                        rendUp.enabled = true;
                        sendData("u" + "\n");
                        yield return (new WaitForSeconds(3));
                        rendUp.enabled = false;
                        sendData("f" + "\n");
                        yield return (new WaitForSeconds(2 + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        counterUp = counterUp + 1;
                        Debug.Log(total);
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 4: //arrow down
                    if (counterDown < 20)
                    {
                        yield return (new WaitForSeconds(1));
                        rendDown.enabled = true;
                        sendData("d" + "\n");
                        yield return (new WaitForSeconds(3));
                        rendDown.enabled = false;
                        sendData("f" + "\n");
                        yield return (new WaitForSeconds(2 + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        counterDown = counterDown + 1;
                        Debug.Log(total);
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 5: //arrow in
                    if (counterIn < 20)
                    {
                        yield return (new WaitForSeconds(1));
                        rendIn.enabled = true;
                        sendData("i" + "\n");
                        yield return (new WaitForSeconds(3));
                        rendIn.enabled = false;
                        sendData("f" + "\n");
                        yield return (new WaitForSeconds(2 + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        counterIn = counterIn + 1;
                        Debug.Log(total);
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 6: //arrow out
                    if (counterOut < 20)
                    {
                        yield return (new WaitForSeconds(1));
                        rendOut.enabled = true;
                        sendData("o" + "\n");
                        yield return (new WaitForSeconds(3));
                        rendOut.enabled = false;
                        sendData("f" + "\n");
                        yield return (new WaitForSeconds(2 + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        counterOut = counterOut + 1;
                        Debug.Log(total);
                        break;
                    }
                    else
                    {
                        break;
                    }
            }
        }
    }

    /* OnGUI
    void OnGUI()
    {
        Rect rectObj = new Rect(40, 10, 200, 400);
        GUIStyle style = new GUIStyle();
        style.alignment = TextAnchor.UpperLeft;
        GUI.Box(rectObj, "# UDP Object Receive\n127.0.0.1:" + portLocal + "\n"
        + "\nLast Packet: \n" + lastReceivedUDPPacket
        + "\n\nAll Messages: \n" + allReceivedUDPPackets
            , style);

        strMessageSend = GUI.TextField(new Rect(40, 420, 140, 20), strMessageSend);
        if (GUI.Button(new Rect(190, 420, 40, 20), "send"))
        {
            sendData(strMessageSend + "\n");
        }

    }
    */

    // Initialization code
    private void init()
    {
        // Initialize (seen in comments window)
        print("UDP Object init()");

        // Create remote endpoint (to Matlab) 
        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), portRemote);

        // Create local client
        client = new UdpClient(portLocal);

        // local endpoint define (where messages are received)
        // Create a new thread for reception of incoming messages
        receiveThread = new Thread(
            new ThreadStart(ReceiveData));
        receiveThread.IsBackground = true;
        receiveThread.Start();
    }

    // Receive data, update packets received
    private void ReceiveData()
    {
        while (true)
        {

            try
            {
                IPEndPoint anyIP = new IPEndPoint(IPAddress.Any, 0);
                byte[] data = client.Receive(ref anyIP);
                string text = Encoding.UTF8.GetString(data);
                print(">> " + text);
                lastReceivedUDPPacket = text;
                allReceivedUDPPackets = allReceivedUDPPackets + text;

            }
            catch (Exception err)
            {
                print(err.ToString());
            }
        }
    }

    // Send data
    private void sendData(string message)
    {
        try
        {
            byte[] data = Encoding.UTF8.GetBytes(message);
            client.Send(data, data.Length, remoteEndPoint);

        }
        catch (Exception err)
        {
            print(err.ToString());
        }
    }

    // getLatestUDPPacket, clears all previous packets
    public string getLatestUDPPacket()
    {
        allReceivedUDPPackets = "";
        return lastReceivedUDPPacket;
    }

    //Prevent crashes - close clients and threads properly!
    void OnDisable()
    {
        if (receiveThread != null)
            receiveThread.Abort();

        client.Close();
    }

}