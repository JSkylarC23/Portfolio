using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HandtestL : MonoBehaviour
{
    public int ctrl;
    public float speed;
    public float threshhold;

    // get objects
    public GameObject ThumbHinge1;
    public GameObject ThumbHinge2;
    public GameObject ThumbHinge3;
    public GameObject IndexHinge1;
    public GameObject IndexHinge2;
    public GameObject IndexHinge3;
    public GameObject MiddleHinge1;
    public GameObject MiddleHinge2;
    public GameObject MiddleHinge3;
    public GameObject RingHinge1;
    public GameObject RingHinge2;
    public GameObject RingHinge3;
    public GameObject PinkyHinge1;
    public GameObject PinkyHinge2;
    public GameObject PinkyHinge3;

    // define poses
    Quaternion start;
    //Quaternion targetIndex1;
    Vector3 currentEulerAngles;

    float targetThumb1;
    float targetThumb2;
    float currentThumb2;
    float targetThumb3;
    float currentThumb3;
    float targetIndex1;
    float targetIndex2;
    float currentIndex2;
    float targetIndex3;
    float currentIndex3;
    float targetMiddle1;
    float targetMiddle2;
    float currentMiddle2;
    float targetMiddle3;
    float currentMiddle3;
    float targetRing1;
    float targetRing2;
    float currentRing2;
    float targetRing3;
    float currentRing3;
    float targetPinky1;
    float targetPinky2;
    float currentPinky2;
    float targetPinky3;
    float currentPinky3;

    // Start is called before the first frame update
    void Start()
    {
        // UDP receive
        //IndexHinge1.transform.rotation = Quaternion.AngleAxis(90, Vector3.right);
        //IndexHinge1.transform.Rotate(0.0f, -60.0f, 0.0f, Space.Self);
    }

    // UDP receive

    // Update is called once per frame
    void Update()
    {
        // read current angle

        // if control signal ==
        // set target angles
        // move from current to target ??

        // if (target angle - current angle) < threshhold
        // no rotate
        // elseif target angle > current angle
        // rotate +
        // else if target angle < current angle
        // rotate -

        if (ctrl == 1) // Thumb
        {
            targetThumb1 = 60;
            targetThumb2 = 50;
            targetThumb3 = -40;

            targetIndex1 = 0;
            targetIndex2 = 0;
            targetIndex3 = 0;

            targetMiddle1 = 0;
            targetMiddle2 = 0;
            targetMiddle3 = 0;

            targetRing1 = 0;
            targetRing2 = 0;
            targetRing3 = 0;

            targetPinky1 = 0;
            targetPinky2 = 0;
            targetPinky3 = 0;
        }
        else if (ctrl == 2) // Index
        {
            //targetThumb1 = 0;
            //targetThumb2 = 0;
            //targetThumb3 = 0;

            targetIndex1 = 60;
            targetIndex2 = -50;
            targetIndex3 = -40;

            targetMiddle1 = 0;
            targetMiddle2 = 0;
            targetMiddle3 = 0;

            targetRing1 = 0;
            targetRing2 = 0;
            targetRing3 = 0;

            targetPinky1 = 0;
            targetPinky2 = 0;
            targetPinky3 = 0;
        }
        else if (ctrl == 3) // Middle
        {
            //targetThumb1 = 0;
            //targetThumb2 = 0;
            //targetThumb3 = 0;

            targetIndex1 = 0;
            targetIndex2 = 0;
            targetIndex3 = 0;

            targetMiddle1 = 60;
            targetMiddle2 = -50;
            targetMiddle3 = -40;

            targetRing1 = 0;
            targetRing2 = 0;
            targetRing3 = 0;

            targetPinky1 = 0;
            targetPinky2 = 0;
            targetPinky3 = 0;
        }
        else if (ctrl == 4) // Ring
        {
            //targetThumb1 = 0;
            //targetThumb2 = 0;
            //targetThumb3 = 0;

            targetIndex1 = 0;
            targetIndex2 = 0;
            targetIndex3 = 0;

            targetMiddle1 = 0;
            targetMiddle2 = 0;
            targetMiddle3 = 0;

            targetRing1 = 60;
            targetRing2 = -50;
            targetRing3 = -40;

            targetPinky1 = 0;
            targetPinky2 = 0;
            targetPinky3 = 0;
        }
        else if (ctrl == 5) // Pinky
        {
            //targetThumb1 = 0;
            //targetThumb2 = 0;
            //targetThumb3 = 0;

            targetIndex1 = 0;
            targetIndex2 = 0;
            targetIndex3 = 0;

            targetMiddle1 = 0;
            targetMiddle2 = 0;
            targetMiddle3 = 0;

            targetRing1 = 0;
            targetRing2 = 0;
            targetRing3 = 0;

            targetPinky1 = 60;
            targetPinky2 = -50;
            targetPinky3 = -40;
        }
        else if (ctrl == 6) // Fist
        {
            targetThumb1 = 60;
            targetThumb2 = 50;
            targetThumb3 = -40;

            targetIndex1 = 60;
            targetIndex2 = -50;
            targetIndex3 = -40;

            targetMiddle1 = 60;
            targetMiddle2 = -50;
            targetMiddle3 = -40;

            targetRing1 = 60;
            targetRing2 = -50;
            targetRing3 = -40;

            targetPinky1 = 60;
            targetPinky2 = -50;
            targetPinky3 = -40;
        }
        else // rest
        {
            targetThumb1 = 0;
            targetThumb2 = 0;
            targetThumb3 = 0;

            targetIndex1 = 0;
            targetIndex2 = 0;
            targetIndex3 = 0;

            targetMiddle1 = 0;
            targetMiddle2 = 0;
            targetMiddle3 = 0;

            targetRing1 = 0;
            targetRing2 = 0;
            targetRing3 = 0;

            targetPinky1 = 0;
            targetPinky2 = 0;
            targetPinky3 = 0;
        }

        // Thumb
        if (Mathf.Abs(ThumbHinge1.transform.localRotation.eulerAngles.x - targetThumb1) > threshhold) // PinkyHinge1
        {
            if (ThumbHinge1.transform.localRotation.eulerAngles.x <= targetThumb1)
            {
                ThumbHinge1.transform.Rotate(-speed * Time.deltaTime, 0.0f, 0.0f, Space.Self);
            }
            else
            {
                ThumbHinge1.transform.Rotate(speed * Time.deltaTime, 0.0f, 0.0f, Space.Self);
            }
        }

        Debug.Log(ThumbHinge2.transform.localRotation.eulerAngles.x);
        if (ThumbHinge2.transform.localRotation.eulerAngles.x > 180)
        {
            Debug.Log(ThumbHinge2.transform.localRotation.eulerAngles.x);
            currentThumb2 = -1 * (360 - ThumbHinge2.transform.localRotation.eulerAngles.x);
            Debug.Log(currentThumb2);
        }
        else
        {
            currentThumb2 = ThumbHinge2.transform.localRotation.eulerAngles.x;
        }

        if (Mathf.Abs(-1 * (360 - ThumbHinge2.transform.localRotation.eulerAngles.x) - targetThumb2) > threshhold) // ThumbHinge2
        {
            if (currentThumb2 <= targetThumb2)
            {
                ThumbHinge2.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                ThumbHinge2.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        if (ThumbHinge3.transform.localRotation.eulerAngles.y > 180)
        {
            currentThumb3 = -1 * (360 - ThumbHinge3.transform.localRotation.eulerAngles.y);
        }

        if (Mathf.Abs(-1 * (360 - ThumbHinge3.transform.localRotation.eulerAngles.y) - targetThumb3) > threshhold) // ThumbHinge3
        {
            if (currentThumb3 >= targetThumb3)
            {
                ThumbHinge3.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                ThumbHinge3.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }


        // Index
        if (Mathf.Abs(IndexHinge1.transform.localRotation.eulerAngles.x - targetIndex1) > threshhold) // IndexHinge1
        {
            if (IndexHinge1.transform.localRotation.eulerAngles.x <= targetIndex1)
            {
                IndexHinge1.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                IndexHinge1.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        //Debug.Log(IndexHinge2.transform.localRotation.eulerAngles.y);
        //Debug.Log(-1*(360-IndexHinge2.transform.localRotation.eulerAngles.y));

        if (IndexHinge2.transform.localRotation.eulerAngles.y > 180)
        {
            currentIndex2 = -1 * (360 - IndexHinge2.transform.localRotation.eulerAngles.y);
            //Debug.Log(currentIndex2);
        }

        if (Mathf.Abs(-1 * (360 - IndexHinge2.transform.localRotation.eulerAngles.y) - targetIndex2) > threshhold) // IndexHinge2
        {
            if (currentIndex2 >= targetIndex2)
            {
                IndexHinge2.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                IndexHinge2.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        if (IndexHinge3.transform.localRotation.eulerAngles.y > 180)
        {
            currentIndex3 = -1 * (360 - IndexHinge3.transform.localRotation.eulerAngles.y);
        }

        if (Mathf.Abs(-1 * (360 - IndexHinge3.transform.localRotation.eulerAngles.y) - targetIndex3) > threshhold) // IndexHinge3
        {
            if (currentIndex3 >= targetIndex3)
            {
                IndexHinge3.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                IndexHinge3.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        // Middle
        if (Mathf.Abs(MiddleHinge1.transform.localRotation.eulerAngles.x - targetMiddle1) > threshhold) // MiddleHinge1
        {
            if (MiddleHinge1.transform.localRotation.eulerAngles.x <= targetMiddle1)
            {
                MiddleHinge1.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                MiddleHinge1.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        if (MiddleHinge2.transform.localRotation.eulerAngles.y > 180)
        {
            currentMiddle2 = -1 * (360 - MiddleHinge2.transform.localRotation.eulerAngles.y);
        }

        if (Mathf.Abs(-1 * (360 - MiddleHinge2.transform.localRotation.eulerAngles.y) - targetMiddle2) > threshhold) // MiddleHinge2
        {
            if (currentMiddle2 >= targetMiddle2)
            {
                MiddleHinge2.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                MiddleHinge2.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        if (MiddleHinge3.transform.localRotation.eulerAngles.y > 180)
        {
            currentMiddle3 = -1 * (360 - MiddleHinge3.transform.localRotation.eulerAngles.y);
        }

        if (Mathf.Abs(-1 * (360 - MiddleHinge3.transform.localRotation.eulerAngles.y) - targetMiddle3) > threshhold) // MiddleHinge3
        {
            if (currentMiddle3 >= targetMiddle3)
            {
                MiddleHinge3.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                MiddleHinge3.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        // Ring
        if (Mathf.Abs(RingHinge1.transform.localRotation.eulerAngles.x - targetRing1) > threshhold) // RingHinge1
        {
            if (RingHinge1.transform.localRotation.eulerAngles.x <= targetRing1)
            {
                RingHinge1.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                RingHinge1.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        if (RingHinge2.transform.localRotation.eulerAngles.y > 180)
        {
            currentRing2 = -1 * (360 - RingHinge2.transform.localRotation.eulerAngles.y);
        }

        if (Mathf.Abs(-1 * (360 - RingHinge2.transform.localRotation.eulerAngles.y) - targetRing2) > threshhold) // RingHinge2
        {
            if (currentRing2 >= targetRing2)
            {
                RingHinge2.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                RingHinge2.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        if (RingHinge3.transform.localRotation.eulerAngles.y > 180)
        {
            currentRing3 = -1 * (360 - RingHinge3.transform.localRotation.eulerAngles.y);
        }

        if (Mathf.Abs(-1 * (360 - RingHinge3.transform.localRotation.eulerAngles.y) - targetRing3) > threshhold) // RingHinge3
        {
            if (currentRing3 >= targetRing3)
            {
                RingHinge3.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                RingHinge3.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        // Pinky
        if (Mathf.Abs(PinkyHinge1.transform.localRotation.eulerAngles.x - targetPinky1) > threshhold) // PinkyHinge1
        {
            if (PinkyHinge1.transform.localRotation.eulerAngles.x <= targetPinky1)
            {
                PinkyHinge1.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                PinkyHinge1.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        if (PinkyHinge2.transform.localRotation.eulerAngles.y > 180)
        {
            currentPinky2 = -1 * (360 - PinkyHinge2.transform.localRotation.eulerAngles.y);
        }

        if (Mathf.Abs(-1 * (360 - PinkyHinge2.transform.localRotation.eulerAngles.y) - targetPinky2) > threshhold) // PinkyHinge2
        {
            if (currentPinky2 >= targetPinky2)
            {
                PinkyHinge2.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                PinkyHinge2.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

        if (PinkyHinge3.transform.localRotation.eulerAngles.y > 180)
        {
            currentPinky3 = -1 * (360 - PinkyHinge3.transform.localRotation.eulerAngles.y);
        }

        if (Mathf.Abs(-1 * (360 - PinkyHinge3.transform.localRotation.eulerAngles.y) - targetPinky3) > threshhold) // PinkyHinge3
        {
            if (currentPinky3 >= targetPinky3)
            {
                PinkyHinge3.transform.Rotate(0.0f, -speed * Time.deltaTime, 0.0f, Space.Self);
            }
            else
            {
                PinkyHinge3.transform.Rotate(0.0f, speed * Time.deltaTime, 0.0f, Space.Self);
            }
        }

    }

}