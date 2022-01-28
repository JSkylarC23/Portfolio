using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class testDHPos1 : MonoBehaviour
{
    private float var;
    private float c;
    public float pos;

    
    void Start()
    {
        HingeJoint hinge = GetComponent<HingeJoint>();

        // Make the spring reach shoot for a 70 degree angle.
        // This could be used to fire off a catapult.

        float var = 180; //0
        float c = 0;
        JointSpring hingeSpring = hinge.spring;
        hingeSpring.spring = 5;
        hingeSpring.damper = 25;
        hingeSpring.targetPosition = var - c;
        hinge.spring = hingeSpring;
        hinge.useSpring = true;
    }

    
    void Update()
    {
        //transform.rotation = Quaternion.Euler(0, pos, 0);
        Debug.Log("Axis 1 pos = " + pos);
    }
}
