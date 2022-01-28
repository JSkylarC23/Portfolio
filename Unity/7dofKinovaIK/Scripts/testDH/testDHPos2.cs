using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class testDHPos2 : MonoBehaviour
{
    private float var;
    private float c;
    public float pos;

    void Start()
    {
        HingeJoint hinge = GetComponent<HingeJoint>();

        // Make the spring reach shoot for a 70 degree angle.
        // This could be used to fire off a catapult.

        float var = -90;
        float c = 0;
        JointSpring hingeSpring = hinge.spring;
        hingeSpring.spring = 5;
        hingeSpring.damper = 30;
        hingeSpring.targetPosition = var - c;
        hinge.spring = hingeSpring;
        hinge.useSpring = true;
    }

    // Update is called once per frame
    void Update()
    {
        //transform.localRotation = Quaternion.Euler(pos, 0, 0);
        Debug.Log("Axis 2 pos = " + pos);
    }
}

