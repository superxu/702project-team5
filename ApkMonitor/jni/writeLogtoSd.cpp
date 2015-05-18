/**
 * Add by song
 */


#include <jni.h>
#include <stdio.h>
#include <fstream>
#include <iostream>
#include <string>
using namespace std;
/* Header for class com_rx201_apkmon_APIHook */

#ifndef _Included_com_rx201_apkmon_APIHook
#define _Included_com_rx201_apkmon_APIHook
#ifdef __cplusplus
extern "C" {
#endif
#undef com_rx201_apkmon_APIHook_DEBUG
#define com_rx201_apkmon_APIHook_DEBUG 0L


/*
 * Class:     com_rx201_apkmon_APIHook
 * Method:    writeLog
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_com_rx201_apkmon_APIHook_writeLog(JNIEnv *env, jobject, jstring str1, jstring str2)
{

      const char* chars = env->GetStringUTFChars(str1, NULL);
      const char* pkgname = env->GetStringUTFChars(str2, NULL);
      string pkgname1  = pkgname;

      string path = "/data/data/"+ pkgname1 +"/AurasiumLog.txt";
      const char*path1 = path.c_str();

     ofstream out(path1,ios::out|ios::app);
     if (out.is_open())
    {
        //str =str + endl;
        out.write(chars,strlen(chars));
         out << "\n";
         out.close();
     }
     (env)->ReleaseStringUTFChars(str2 ,pkgname);

     (env)->ReleaseStringUTFChars(str1 ,chars);
  }


#ifdef __cplusplus
}
#endif
#endif



