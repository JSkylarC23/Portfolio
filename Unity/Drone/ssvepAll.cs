using UnityEngine;
using System.Collections;

using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class ssvepAll : MonoBehaviour
{
    public string IP = "127.0.0.1";
    public int portLocal;
    public int portRemote;
    UdpClient client;
    IPEndPoint remoteEndPoint;
    Thread receiveThread;
    public string strMessageSend = "";
    public string lastReceivedUDPPacket = "";
    public string allReceivedUDPPackets = "";

    private Renderer rendLeft;
    private Renderer rendRight;
    private Renderer rendUp;
    private Renderer rendDown;
    private Renderer rendIn;
    private Renderer rendOut;
    private Renderer rendS1;
    private Renderer rendS2;

    public GameObject letterLeft;
    public GameObject letterRight;
    public GameObject letterUp;
    public GameObject letterDown;
    public GameObject letterIn;
    public GameObject letterOut;
    public GameObject letterS1;
    public GameObject letterS2;

    int counterLeft = 0;
    int counterRight = 0;
    int counterUp = 0;
    int counterDown = 0;
    int counterIn = 0;
    int counterOut = 0;
    int counterS1 = 0;
    int counterS2 = 0;
    int total;
    int i;

    Coroutine flashL;
    Coroutine flashR;
    Coroutine flashU;
    Coroutine flashD;
    Coroutine flashI;
    Coroutine flashO;
    Coroutine flashS1;
    Coroutine flashS2;

    public float lFrequency;
    public float rFrequency;
    public float uFrequency;
    public float dFrequency;
    public float iFrequency;
    public float oFrequency;
    public float s1Frequency;
    public float s2Frequency;

    public void Start()
    {
        init();

        rendLeft = letterLeft.gameObject.GetComponent<Renderer>();
        rendRight = letterRight.gameObject.GetComponent<Renderer>();
        rendUp = letterUp.gameObject.GetComponent<Renderer>();
        rendDown = letterDown.gameObject.GetComponent<Renderer>();
        rendIn = letterIn.gameObject.GetComponent<Renderer>();
        rendOut = letterOut.gameObject.GetComponent<Renderer>();
        rendS1 = letterS1.gameObject.GetComponent<Renderer>();
        rendS2 = letterS2.gameObject.GetComponent<Renderer>();

        StartCoroutine("FlashL");
        StartCoroutine("FlashR");
        StartCoroutine("FlashU");
        StartCoroutine("FlashD");
        StartCoroutine("FlashI");
        StartCoroutine("FlashO");
        StartCoroutine("FlashS1");
        StartCoroutine("FlashS2");

        //StartCoroutine("Flash");
    }

    void Update()
    {
        total = counterLeft + counterRight + counterUp + counterDown + counterIn + counterOut;
        if (total == 120)
        {
            Application.Quit();
        }
    }

    IEnumerator Flash()
    {
        while (total < 120)
        {
            i = UnityEngine.Random.Range(1, 7);

            switch (i)
            {
                case 1: //letter left
                    if (counterLeft < 20)
                    {
                        Debug.Log("left");
                        yield return (new WaitForSeconds(1));
                        sendData("l" + "\n");
                        flashL = StartCoroutine(FlashL());
                        yield return (new WaitForSeconds(3));
                        StopCoroutine(flashL);
                        rendLeft.enabled = true;
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
                case 2: //letter right
                    if (counterRight < 20)
                    {
                        Debug.Log("right");
                        yield return (new WaitForSeconds(1));
                        sendData("r" + "\n");
                        flashR = StartCoroutine(FlashR());
                        yield return (new WaitForSeconds(3));
                        StopCoroutine(flashR);
                        rendRight.enabled = true;
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
                case 3: //letter up
                    if (counterUp < 20)
                    {
                        Debug.Log("up");
                        yield return (new WaitForSeconds(1));
                        sendData("u" + "\n");
                        flashU = StartCoroutine(FlashU());
                        yield return (new WaitForSeconds(3));
                        StopCoroutine(flashU);
                        rendUp.enabled = true;
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
                case 4: //letter down
                    if (counterDown < 20)
                    {
                        Debug.Log("down");
                        yield return (new WaitForSeconds(1));
                        sendData("d" + "\n");
                        flashD = StartCoroutine(FlashD());
                        yield return (new WaitForSeconds(3));
                        StopCoroutine(flashD);
                        rendDown.enabled = true;
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
                case 5: //letter in
                    if (counterIn < 20)
                    {
                        Debug.Log("in");
                        yield return (new WaitForSeconds(1));
                        sendData("i" + "\n");
                        flashI = StartCoroutine(FlashI());
                        yield return (new WaitForSeconds(3));
                        StopCoroutine(flashI);
                        rendIn.enabled = true;
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
                case 6: //letter out
                    if (counterOut < 20)
                    {
                        Debug.Log("out");
                        yield return (new WaitForSeconds(1));
                        sendData("o" + "\n");
                        flashO = StartCoroutine(FlashO());
                        yield return (new WaitForSeconds(3));
                        StopCoroutine(flashO);
                        rendOut.enabled = true;
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

    IEnumerator FlashL()
    {
        while (true)
        {
            yield return (new WaitForSeconds(1 / (2 * lFrequency)));
            rendLeft.enabled = true;
            yield return (new WaitForSeconds(1 / (2 * lFrequency)));
            rendLeft.enabled = false;
        }
    }

    IEnumerator FlashR()
    {
        while (true)
        {
            yield return (new WaitForSeconds(1 / (2 * rFrequency)));
            rendRight.enabled = true;
            yield return (new WaitForSeconds(1 / (2 * rFrequency)));
            rendRight.enabled = false;
        }
    }

    IEnumerator FlashU()
    {
        while (true)
        {
            yield return (new WaitForSeconds(1 / (2 * uFrequency)));
            rendUp.enabled = true;
            yield return (new WaitForSeconds(1 / (2 * uFrequency)));
            rendUp.enabled = false;
        }
    }

    IEnumerator FlashD()
    {
        while (true)
        {
            yield return (new WaitForSeconds(1 / (2 * dFrequency)));
            rendDown.enabled = true;
            yield return (new WaitForSeconds(1 / (2 * dFrequency)));
            rendDown.enabled = false;
        }
    }

    IEnumerator FlashI()
    {
        while (true)
        {
            yield return (new WaitForSeconds(1 / (2 * iFrequency)));
            rendIn.enabled = true;
            yield return (new WaitForSeconds(1 / (2 * iFrequency)));
            rendIn.enabled = false;
        }
    }

    IEnumerator FlashO()
    {
        while (true)
        {
            yield return (new WaitForSeconds(1 / (2 * oFrequency)));
            rendOut.enabled = true;
            yield return (new WaitForSeconds(1 / (2 * oFrequency)));
            rendOut.enabled = false;
        }
    }

    IEnumerator FlashS1()
    {
        while (true)
        {
            yield return (new WaitForSeconds(1 / (2 * s1Frequency)));
            rendS1.enabled = true;
            yield return (new WaitForSeconds(1 / (2 * s1Frequency)));
            rendS1.enabled = false;
        }
    }

    IEnumerator FlashS2()
    {
        while (true)
        {
            yield return (new WaitForSeconds(1 / (2 * s2Frequency)));
            rendS2.enabled = true;
            yield return (new WaitForSeconds(1 / (2 * s2Frequency)));
            rendS2.enabled = false;
        }
    }

    private void init()
    {
        print("UDP Object init()");
        remoteEndPoint = new IPEndPoint(IPAddress.Parse(IP), portRemote);
        client = new UdpClient(portLocal);
        receiveThread = new Thread(new ThreadStart(ReceiveData));
        receiveThread.IsBackground = true;
        receiveThread.Start();
    }

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

    public string getLatestUDPPacket()
    {
        allReceivedUDPPackets = "";
        return lastReceivedUDPPacket;
    }

    void OnDisable()
    {
        if (receiveThread != null)
            receiveThread.Abort();

        client.Close();
    }

}