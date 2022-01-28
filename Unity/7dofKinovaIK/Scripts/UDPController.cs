using UnityEngine;
using System.Collections;

using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Globalization;

public class UDPController : MonoBehaviour
{

    // receiving Thread
    Thread receiveThread;

    // udpclient object
    UdpClient client;

    // public
    // public string IP = "127.0.0.1"; default local
    public int port; // define > init

    // infos
    public string lastReceivedUDPPacket = "";
    public string allReceivedUDPPackets = ""; // clean up this from time to time!


    public Rigidbody Drone;
    public GameObject RButton;
    public GameObject LButton;


    /*Speed*/
    public int ForwardBackward = 50;
    /*Speed*/
    public int Tilt = 50;
    /*Speed*/
    public int FlyLeftRight = 50;
    /*Speed*/
    public int UpDown = 50;

    private Vector3 DroneRotation;
    public bool Mobile;
    private float Rx;
    private float Ry;
    private float Lx;
    private float Ly;

    // start from shell
    private static void Main()
    {
        UDPController receiveObj = new UDPController();
        receiveObj.init();

        string text = "";
        do
        {
            text = Console.ReadLine();
        }
        while (!text.Equals("exit"));
    }
    // start from unity3d
    public void Start()
    {

        init();
    }

    // OnGUI
    /*
    void OnGUI()
    {
        Rect rectObj = new Rect(40, 10, 200, 400);
        GUIStyle style = new GUIStyle();
        style.alignment = TextAnchor.UpperLeft;
        GUI.Box(rectObj, "# UDPReceive\n127.0.0.1 " + port + " #\n"
                    + "shell> nc -u 127.0.0.1 : " + port + " \n"
                    + "\nLast Packet: \n" + lastReceivedUDPPacket
                    + "\n\nAll Messages: \n" + allReceivedUDPPackets
                , style);
    }
    */
    // init
    private void init()
    {
        print("UDPSend.init()");

        port = 25000;

        print("Sending to 127.0.0.1 : " + port);
        print("Test-Sending to this Port: nc -u 127.0.0.1  " + port + "");

        receiveThread = new Thread(new ThreadStart(ReceiveData));
        receiveThread.IsBackground = true;
        receiveThread.Start();

    }

    // receive thread
    private void ReceiveData()
    {

        client = new UdpClient(port);
        while (true)
        {

            try
            {
                IPEndPoint anyIP = new IPEndPoint(IPAddress.Any, 0);
                byte[] data = client.Receive(ref anyIP);

                print(">> " + data);

                //string text = Encoding.UTF8.GetChars(data).ToString();

                string text = Encoding.UTF8.GetString(data); // for matlab code

                print(">> " + text);

                lastReceivedUDPPacket = text;

                // ....
                allReceivedUDPPackets = allReceivedUDPPackets + text;

            }
            catch (Exception err)
            {
                print(err.ToString());
            }
        }
    }

    // getLatestUDPPacket
    // cleans up the rest
    public string getLatestUDPPacket()
    {
        allReceivedUDPPackets = "";
        Debug.Log(lastReceivedUDPPacket);
        return lastReceivedUDPPacket;
    }

    private void OnApplicationQuit()
    {
        try
        {
            receiveThread.Abort();
            receiveThread = null;
            client.Close();
        }
        catch (Exception err)
        {
            Debug.Log("<color=red>" + err.Message + "</color>");
        }
    }

    void Update()
    {
        /*
        Rx = RButton.GetComponent<DroneCanvasC>().Rx;
        Ry = RButton.GetComponent<DroneCanvasC>().Ry;
        Lx = LButton.GetComponent<DroneCanvasC>().Lx;
        Ly = LButton.GetComponent<DroneCanvasC>().Ly;
        */
    }

    void FixedUpdate()
    {
        DroneRotation = Drone.transform.localEulerAngles;
        if (DroneRotation.z > 10 && DroneRotation.z <= 180) { Drone.AddRelativeTorque(0, 0, -10); }//if tilt too big(stabilizes drone on z-axis)
        if (DroneRotation.z > 180 && DroneRotation.z <= 350) { Drone.AddRelativeTorque(0, 0, 10); }//if tilt too big(stabilizes drone on z-axis)
        if (DroneRotation.z > 1 && DroneRotation.z <= 10) { Drone.AddRelativeTorque(0, 0, -3); }//if tilt not very big(stabilizes drone on z-axis)
        if (DroneRotation.z > 350 && DroneRotation.z < 359) { Drone.AddRelativeTorque(0, 0, 3); }//if tilt not very big(stabilizes drone on z-axis)


        if (Mobile == false)
        {
            if (lastReceivedUDPPacket.Contains("l")) { Drone.AddRelativeTorque(0, Tilt / -1, 0); }//tilt drone left
            if (lastReceivedUDPPacket.Contains("r")) { Drone.AddRelativeTorque(0, Tilt, 0); }//tilt drone right
        }
        /*
        if (Mobile == true)
        {
            Drone.AddRelativeTorque(0, Lx / 5, 0);//tilt drone left and right

        }
        */
        if (DroneRotation.x > 10 && DroneRotation.x <= 180) { Drone.AddRelativeTorque(-10, 0, 0); }//if tilt too big(stabilizes drone on x-axis)
        if (DroneRotation.x > 180 && DroneRotation.x <= 350) { Drone.AddRelativeTorque(10, 0, 0); }//if tilt too big(stabilizes drone on x-axis)
        if (DroneRotation.x > 1 && DroneRotation.x <= 10) { Drone.AddRelativeTorque(-3, 0, 0); }//if tilt not very big(stabilizes drone on x-axis)
        if (DroneRotation.x > 350 && DroneRotation.x < 359) { Drone.AddRelativeTorque(3, 0, 0); }//if tilt not very big(stabilizes drone on x-axis)


        Drone.AddForce(0, 9, 0);//drone not lose height very fast, if you want not to lose height al all change 9 into 9.80665 
        if (Mobile == false)
        {
            /*
            if (Input.GetKey(KeyCode.W)) { Drone.AddRelativeForce(0, 0, ForwardBackward); Drone.AddRelativeTorque(10, 0, 0); }//drone fly forward

            if (Input.GetKey(KeyCode.LeftArrow)) { Drone.AddRelativeForce(FlyLeftRight / -1, 0, 0); Drone.AddRelativeTorque(0, 0, 10); }//rotate drone left

            if (Input.GetKey(KeyCode.RightArrow)) { Drone.AddRelativeForce(FlyLeftRight, 0, 0); Drone.AddRelativeTorque(0, 0, -10); }//rotate drone right

            if (Input.GetKey(KeyCode.S)) { Drone.AddRelativeForce(0, 0, ForwardBackward / -1); Drone.AddRelativeTorque(-10, 0, 0); }// drone fly backward

            if (Input.GetKey(KeyCode.UpArrow)) { Drone.AddRelativeForce(0, UpDown, 0); }//drone fly up

            if (Input.GetKey(KeyCode.DownArrow)) { Drone.AddRelativeForce(0, UpDown / -1, 0); }//drone fly down
                                */

            //v = lastReceivedUDPPacket.ToString() ;

            if (lastReceivedUDPPacket.Contains("o")) { Drone.AddRelativeForce(0, 0, ForwardBackward); Drone.AddRelativeTorque(10, 0, 0); }//drone fly forward

            //if (lastReceivedUDPPacket.Contains("l")) { Drone.AddRelativeForce(FlyLeftRight / -1, 0, 0); Drone.AddRelativeTorque(0, 0, 10); }//rotate drone left

            //if (lastReceivedUDPPacket.Contains("r")) { Drone.AddRelativeForce(FlyLeftRight, 0, 0); Drone.AddRelativeTorque(0, 0, -10); }//rotate drone right

            if (lastReceivedUDPPacket.Contains("i")) { Drone.AddRelativeForce(0, 0, ForwardBackward / -1); Drone.AddRelativeTorque(-10, 0, 0); }// drone fly backward

            if (lastReceivedUDPPacket.Contains("u")) { Drone.AddRelativeForce(0, UpDown, 0); }//drone fly up

            if (lastReceivedUDPPacket.Contains("d")) { Drone.AddRelativeForce(0, UpDown / -1, 0); }//drone fly down


        }
        /*
        if (Mobile == true)
        {
            Drone.AddRelativeForce(0, 0, Ly / 2); if (Ly > 5) { Drone.AddRelativeTorque(10, 0, 0); }; if (Ly < -5) { Drone.AddRelativeTorque(-10, 0, 0); }//drone fly forward or backward

            Drone.AddRelativeForce(Rx, 0, 0); if (Rx > 5) { Drone.AddRelativeTorque(0, 0, -10); }; if (Rx < -5) { Drone.AddRelativeTorque(0, 0, 10); }


            Drone.AddRelativeForce(0, Ry / 2, 0);//drone fly up or down
        }
        */
    }
}
