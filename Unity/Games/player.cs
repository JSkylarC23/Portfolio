using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class player : MonoBehaviour
{
    public float translateSpeed;
    public float rotateSpeed;

    public GameObject projectile;
    public Transform spawnPoint;

    public int x = 0;
    public GameObject zombie;

    public TextMesh scoreCount;
    public static int count;
    public GameObject win;
    private Renderer winRend;
    public static bool lose;

    void Start()
    {
        StartCoroutine(spawn());
        winRend = win.GetComponent<Renderer>();
    }

    void Update()
    {
        scoreCount.GetComponent<TextMesh>().text = destroy.count.ToString();

        if (destroy.count == 10)
        {
            winRend.enabled = true;
        }
        if (destroy.lose == false)
        {
            if (Input.GetKey(KeyCode.CapsLock)) //X
            {
                transform.Translate(-.8f * translateSpeed, 0, 0, Space.Self);
            }
            if (Input.GetKey(KeyCode.S)) //G
            {
                transform.Translate(0, 0, -translateSpeed, Space.Self);
            }
            if (Input.GetKey(KeyCode.V)) //K
            {
                transform.Translate(.8f * translateSpeed, 0, 0, Space.Self);
            }
            if (Input.GetKey(KeyCode.W)) //T
            {
                transform.Translate(0, 0, translateSpeed, Space.Self);
            }
            if (Input.GetKey(KeyCode.A)) //F
            {
                transform.Rotate(0, -rotateSpeed, 0, Space.Self);
            }
            if (Input.GetKey(KeyCode.D)) //Y
            {
                transform.Rotate(0, rotateSpeed, 0, Space.Self);
            }
            if (Input.GetKeyDown(KeyCode.Space)) //RightAlt
            {
                GameObject bullet = Instantiate(projectile, spawnPoint.position, Quaternion.Euler(90, transform.localEulerAngles.y, 0)) as GameObject; //transform.position + new Vector3(0.0f, 0.3f, 0.7f) (spawnPoint.position), Quaternion.identity (transform.rotation) Quaternion.Euler(90, 0, 0)
                bullet.GetComponent<Rigidbody>().AddForce(5000 * transform.forward); // * 100
            }
        }
    }

    IEnumerator spawn()
    {
        while (x < 10)
        {
            GameObject zombieClone = Instantiate(zombie, new Vector3(Random.Range(-145f, 145f), .5f, Random.Range(-145f, 145f)), Quaternion.identity) as GameObject;
            x++;
            yield return new WaitForSeconds(5);
        }
    }
}