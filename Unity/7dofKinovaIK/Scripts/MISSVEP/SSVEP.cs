using UnityEngine;
using System.Collections;

using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class SSVEP : MonoBehaviour
{
    public string IP = "127.0.0.1";
    public int portLocal = 8010;
    public int portRemote = 8011;
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

    int counterLeft = 1;
    int counterRight = 1;
    int counterUp = 1;
    int counterDown = 1;
    int counterIn = 1;
    int counterOut = 1;
    int counterS = 1;
    int total;
    public int goal;
    int i;
    public int onTime;
    public int offTime;

    Coroutine flashL;
    Coroutine flashR;
    Coroutine flashU;
    Coroutine flashD;
    Coroutine flashI;
    Coroutine flashO;
    Coroutine flashS;

    public float lFrequency;
    public float rFrequency;
    public float uFrequency;
    public float dFrequency;
    public float iFrequency;
    public float oFrequency;
    public float sFrequency;

    public void Start()
    {
        init();

        rendLeft = letterLeft.gameObject.GetComponent<Renderer>();
        rendRight = letterRight.gameObject.GetComponent<Renderer>();
        rendUp = letterUp.gameObject.GetComponent<Renderer>();
        rendDown = letterDown.gameObject.GetComponent<Renderer>();
        rendIn = letterIn.gameObject.GetComponent<Renderer>();
        rendOut = letterOut.gameObject.GetComponent<Renderer>();
        rendS2 = letterS1.gameObject.GetComponent<Renderer>();
        rendS1 = letterS2.gameObject.GetComponent<Renderer>();

        StartCoroutine("Flash");
    }

    void Update()
    {
        if (total == goal*7)
        {
            Debug.Log("Finished");
            total = total + 1;
            //Application.Quit();
        }
    }

    IEnumerator Flash()
    {
        while (total < goal*7)
        {
            i = UnityEngine.Random.Range(1, 8);

            switch (i)
            {
                case 1: //letter left
                    if (counterLeft < goal + 1)
                    {
                        Debug.Log("left " + counterLeft);
                        total = counterLeft + counterRight + counterUp + counterDown + counterIn + counterOut + counterS - 6;
                        Debug.Log("total " + total);
                        //yield return (new WaitForSeconds(1));
                        sendData("l" + "\n");
                        flashL = StartCoroutine(FlashL());
                        yield return (new WaitForSeconds(onTime));
                        StopCoroutine(flashL);
                        rendLeft.enabled = true;
                        sendData("f" + "\n");
                        counterLeft = counterLeft + 1;
                        yield return (new WaitForSeconds(offTime + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 2: //letter right
                    if (counterRight < goal + 1)
                    {
                        Debug.Log("right " + counterRight);
                        total = counterLeft + counterRight + counterUp + counterDown + counterIn + counterOut + counterS -6;
                        Debug.Log("total " + total);
                        //yield return (new WaitForSeconds(1));
                        sendData("r" + "\n");
                        flashR = StartCoroutine(FlashR());
                        yield return (new WaitForSeconds(onTime));
                        StopCoroutine(flashR);
                        rendRight.enabled = true;
                        sendData("f" + "\n");
                        counterRight = counterRight + 1;
                        yield return (new WaitForSeconds(offTime + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 3: //letter up
                    if (counterUp < goal + 1)
                    {
                        Debug.Log("up " + counterUp);
                        total = counterLeft + counterRight + counterUp + counterDown + counterIn + counterOut + counterS -6;
                        Debug.Log("total " + total);
                        //yield return (new WaitForSeconds(1));
                        sendData("u" + "\n");
                        flashU = StartCoroutine(FlashU());
                        yield return (new WaitForSeconds(onTime));
                        StopCoroutine(flashU);
                        rendUp.enabled = true;
                        sendData("f" + "\n");
                        counterUp = counterUp + 1;
                        yield return (new WaitForSeconds(offTime + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 4: //letter down
                    if (counterDown < goal + 1)
                    {
                        Debug.Log("down " + counterDown);
                        total = counterLeft + counterRight + counterUp + counterDown + counterIn + counterOut + counterS -6;
                        Debug.Log("total " + total);
                        //yield return (new WaitForSeconds(1));
                        sendData("d" + "\n");
                        flashD = StartCoroutine(FlashD());
                        yield return (new WaitForSeconds(onTime));
                        StopCoroutine(flashD);
                        rendDown.enabled = true;
                        sendData("f" + "\n");
                        counterDown = counterDown + 1;
                        yield return (new WaitForSeconds(offTime + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 5: //letter in
                    if (counterIn < goal + 1)
                    {
                        Debug.Log("in " + counterIn);
                        total = counterLeft + counterRight + counterUp + counterDown + counterIn + counterOut + counterS -6;
                        Debug.Log("total " + total);
                        //yield return (new WaitForSeconds(1));
                        sendData("i" + "\n");
                        flashI = StartCoroutine(FlashI());
                        yield return (new WaitForSeconds(onTime));
                        StopCoroutine(flashI);
                        rendIn.enabled = true;
                        sendData("f" + "\n");
                        counterIn = counterIn + 1;
                        yield return (new WaitForSeconds(offTime + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 6: //letter out
                    if (counterOut < goal + 1)
                    {
                        Debug.Log("out " + counterOut);
                        total = counterLeft + counterRight + counterUp + counterDown + counterIn + counterOut + counterS -6;
                        Debug.Log("total " + total);
                        //yield return (new WaitForSeconds(1));
                        sendData("o" + "\n");
                        flashO = StartCoroutine(FlashO());
                        yield return (new WaitForSeconds(onTime));
                        StopCoroutine(flashO);
                        rendOut.enabled = true;
                        sendData("f" + "\n");
                        counterOut = counterOut + 1;
                        yield return (new WaitForSeconds(offTime + UnityEngine.Random.Range(-1.0f, 1.0f)));
                        break;
                    }
                    else
                    {
                        break;
                    }
                case 7: //letter S
                    if (counterS < goal + 1)
                    {
                        Debug.Log("S " + counterS);
                        total = counterLeft + counterRight + counterUp + counterDown + counterIn + counterOut + counterS -6;
                        Debug.Log("total " + total);
                        //yield return (new WaitForSeconds(1));
                        sendData("s" + "\n");
                        flashS = StartCoroutine(FlashS());
                        yield return (new WaitForSeconds(onTime));
                        StopCoroutine(flashS);
                        rendS1.enabled = true;
                        rendS2.enabled = true;
                        sendData("f" + "\n");
                        counterS = counterS + 1;
                        yield return (new WaitForSeconds(offTime + UnityEngine.Random.Range(-1.0f, 1.0f)));
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

    IEnumerator FlashS()
    {
        while (true)
        {
            yield return (new WaitForSeconds(1 / (2 * sFrequency)));
            rendS1.enabled = true;
            rendS2.enabled = true;
            yield return (new WaitForSeconds(1 / (2 * sFrequency)));
            rendS1.enabled = false;
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