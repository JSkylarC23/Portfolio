using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using UnityEngine;
//using Debug = UnityEngine.Debug;

public class Counter : MonoBehaviour
{
    public int count = 0;

    // Start is called before the first frame update
    
    void OnTriggerEnter(Collider other)
    {
        count = count + 1;
        UnityEngine.Debug.Log("Rings " + count);
    }
}
