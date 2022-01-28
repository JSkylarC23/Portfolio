using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveObject : MonoBehaviour
{

    public float speed;

    void Start()
    {
        
    }


    void Update()
    {
        if (Input.GetKey(KeyCode.W))
        {
            Debug.Log("Forward");
            transform.Translate(Vector3.forward * speed * Time.deltaTime);
        }

        if (Input.GetKey(KeyCode.A))
        {
            Debug.Log("Left");
            transform.Translate(-Vector3.right * speed * Time.deltaTime);
        }

        if (Input.GetKey(KeyCode.S))
        {
            Debug.Log("Backward");
            transform.Translate(-Vector3.forward * speed * Time.deltaTime);
        }

        if (Input.GetKey(KeyCode.D))
        {
            Debug.Log("Right");
            transform.Translate(Vector3.right * speed * Time.deltaTime);
        }

        if (Input.GetKey(KeyCode.Q))
        {
            Debug.Log("Up");
            transform.Translate(Vector3.up * speed * Time.deltaTime);
        }

        if (Input.GetKey(KeyCode.E))
        {
            Debug.Log("Down");
            transform.Translate(-Vector3.up * speed * Time.deltaTime);
        }
    }
}
