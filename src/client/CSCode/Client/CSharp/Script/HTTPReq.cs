/*
author:  Ԭɭ��
date:    2017.11.25
ver:     1.0
desc:    HTTP�����ļ�  
*/


using UnityEngine;
using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using XLua;
using War.Base;
using UnityEngine.Networking;

namespace War.Script
{
    [LuaCallCSharp]
    public class HTTPReq: MonoBehaviour
    {
        IEnumerator Req(string url)
        {
            var www = new WWW(url);
            yield return www;
            if(www.isDone)
            {
                Debug.Log("���");
                if (string.IsNullOrEmpty(www.error))
                    Debug.Log("�ɹ�");
                else
                    Debug.Log("ʧ��"+www.error);
            }
            else
            {
                Debug.Log("δ���");
            }

        }

        public void SendHttpReq(string url)
        {       
            StartCoroutine(Req(url));
        }
    }
}