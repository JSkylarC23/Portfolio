using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class testDHPos4 : MonoBehaviour
{
    private float var;
    private float c;
    // Start is called before the first frame update
    void Start()
    {
        HingeJoint hinge = GetComponent<HingeJoint>();

        // Make the spring reach shoot for a 70 degree angle.
        // This could be used to fire off a catapult.

        float var = 0;
        float c = 0;
        JointSpring hingeSpring = hinge.spring;
        hingeSpring.spring = 5;
        hingeSpring.damper = 10;
        hingeSpring.targetPosition = var - c;
        hinge.spring = hingeSpring;
        hinge.useSpring = true;
    }

    // Update is called once per frame
    void Update()
    {

    }
}

