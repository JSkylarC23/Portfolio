using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveObject : MonoBehaviour
{
    public float movementSpeed;
    public float rotateSpeed;

    // Start is called before the first frame update
    void Start()
    {
     
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.A))  //Left
        {
            transform.Translate(Vector3.left * movementSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.D))  //Right
        {
            transform.Translate(Vector3.right * movementSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.W))  //Forward
        {
            transform.Translate(Vector3.forward * movementSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.S))  //Backward
        {
            transform.Translate(Vector3.back * movementSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.E))  //Up
        {
            transform.Translate(Vector3.up * movementSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.Q))  //Down
        {
            transform.Translate(Vector3.down * movementSpeed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.UpArrow))  //Rotate up
        {
            transform.Rotate(Vector3.left * rotateSpeed * Time.deltaTime, Space.Self);
        }
        if (Input.GetKey(KeyCode.DownArrow))  //Rotate down
        {
            transform.Rotate(Vector3.right * rotateSpeed * Time.deltaTime, Space.Self);
        }
        if (Input.GetKey(KeyCode.RightArrow))  //Rotate yaw right
        {
            transform.Rotate(Vector3.up * rotateSpeed * Time.deltaTime, Space.Self);
        }
        if (Input.GetKey(KeyCode.LeftArrow))  //Rotate yaw left
        {
            transform.Rotate(Vector3.down * rotateSpeed * Time.deltaTime, Space.Self);
        }
        if (Input.GetKey(KeyCode.Keypad0))  //Rotate roll right
        {
            transform.Rotate(Vector3.back * rotateSpeed * Time.deltaTime, Space.Self);
        }
        if (Input.GetKey(KeyCode.RightControl))  //Rotate roll left
        {
            transform.Rotate(Vector3.forward * rotateSpeed * Time.deltaTime, Space.Self);
        }
    }
}
