using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class score : MonoBehaviour
{
    public int redScore;
    public int blueScore;
    bool can = true;

    public TextMesh scoreRed1;
    public TextMesh scoreBlue1;
    public TextMesh scoreRed2;
    public TextMesh scoreBlue2;

    public GameObject redPlayer;
    public GameObject bluePlayer;
    Rigidbody rb;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {

    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.name == "Plane1")
        {
            if (can == true)
            {
                can = false;
                redScore++;
                scoreRed1.GetComponent<TextMesh>().text = redScore.ToString();
                scoreRed2.GetComponent<TextMesh>().text = redScore.ToString();
                Debug.Log("red score = " + redScore);
                StartCoroutine(Reset());
            }
        }
            
        if (collision.gameObject.name == "Plane2")
        {
            if (can == true)
            {
                can = false;
                blueScore++;
                scoreBlue1.GetComponent<TextMesh>().text = blueScore.ToString();
                scoreBlue2.GetComponent<TextMesh>().text = blueScore.ToString();
                Debug.Log("blue score = " + blueScore);
                StartCoroutine(Reset());
            }
        }
    }

    IEnumerator Reset()
    {
        yield return new WaitForSeconds(1);
        rb.velocity = Vector3.zero;
        transform.position = new Vector3(0, .75f, 0);
        redPlayer.transform.position = new Vector3(0, .5f, -5);
        redPlayer.transform.localEulerAngles = new Vector3(0, 0, 0);
        bluePlayer.transform.position = new Vector3(0, .5f, 5);
        bluePlayer.transform.localEulerAngles = new Vector3(0, 180, 0);
        can = true;
    }
}
