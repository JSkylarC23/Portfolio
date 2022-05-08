using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class destroy : MonoBehaviour
{
    private GameObject playerPos;
    public float speed;
    public static int count = 0;
    private GameObject ded;
    private Renderer dedRend;
    private Renderer playerRend;
    public static bool lose;

    void Start()
    {
        lose = false;
        playerPos = GameObject.Find("/player");
        ded = GameObject.Find("player/ded");
        dedRend = ded.GetComponent<Renderer>();
        playerRend = playerPos.GetComponent<Renderer>();
    }

    void FixedUpdate()
    {
        Vector3 relativePos = transform.position - playerPos.transform.position;
        Quaternion rotation = Quaternion.LookRotation(relativePos, Vector3.up);
        transform.rotation = rotation;
        transform.position = Vector3.MoveTowards(transform.position, playerPos.transform.position, speed * Time.deltaTime);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.name == "player")
        {
            Debug.Log("U Ded");
            dedRend.enabled = true;
            lose = true;
            playerRend.enabled = false;
        }
        else
        {
            Destroy(gameObject);
            count = count + 1;
            Debug.Log("Destroyed = " + count);
        }
    }
}