using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class movePlayer : MonoBehaviour
{
    public float translateSpeed;
    public float rotateSpeed;

    void Start()
    {
        
    }

    void FixedUpdate()
    {
        if(Input.GetKey(KeyCode.A))
        {
            transform.Translate(-.8f*translateSpeed, 0, 0, Space.Self);
        }
        if (Input.GetKey(KeyCode.S))
        {
            transform.Translate(0, 0, -translateSpeed, Space.Self);
        }
        if (Input.GetKey(KeyCode.D))
        {
            transform.Translate(.8f*translateSpeed, 0, 0, Space.Self);
        }
        if (Input.GetKey(KeyCode.W))
        {
            transform.Translate(0, 0, translateSpeed, Space.Self);
        }
        if (Input.GetKey(KeyCode.CapsLock))
        {
            transform.Rotate(0, -rotateSpeed, 0, Space.Self);
        }
        if (Input.GetKey(KeyCode.Space))
        {
            transform.Rotate(0, rotateSpeed, 0, Space.Self);
        }
    }
}
