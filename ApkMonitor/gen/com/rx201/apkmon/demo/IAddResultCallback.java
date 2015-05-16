/*
 * This file is auto-generated.  DO NOT MODIFY.
 * Original file: /home/xushupeng/workspace/ApkMonitor/aidl/com/rx201/apkmon/demo/IAddResultCallback.aidl
 */
package com.rx201.apkmon.demo;
// Adder service interface.

public interface IAddResultCallback extends android.os.IInterface
{
/** Local-side IPC implementation stub class. */
public static abstract class Stub extends android.os.Binder implements com.rx201.apkmon.demo.IAddResultCallback
{
private static final java.lang.String DESCRIPTOR = "com.rx201.apkmon.demo.IAddResultCallback";
/** Construct the stub at attach it to the interface. */
public Stub()
{
this.attachInterface(this, DESCRIPTOR);
}
/**
 * Cast an IBinder object into an com.rx201.apkmon.demo.IAddResultCallback interface,
 * generating a proxy if needed.
 */
public static com.rx201.apkmon.demo.IAddResultCallback asInterface(android.os.IBinder obj)
{
if ((obj==null)) {
return null;
}
android.os.IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
if (((iin!=null)&&(iin instanceof com.rx201.apkmon.demo.IAddResultCallback))) {
return ((com.rx201.apkmon.demo.IAddResultCallback)iin);
}
return new com.rx201.apkmon.demo.IAddResultCallback.Stub.Proxy(obj);
}
@Override public android.os.IBinder asBinder()
{
return this;
}
@Override public boolean onTransact(int code, android.os.Parcel data, android.os.Parcel reply, int flags) throws android.os.RemoteException
{
switch (code)
{
case INTERFACE_TRANSACTION:
{
reply.writeString(DESCRIPTOR);
return true;
}
case TRANSACTION_onResult:
{
data.enforceInterface(DESCRIPTOR);
int _arg0;
_arg0 = data.readInt();
int _arg1;
_arg1 = data.readInt();
int _result = this.onResult(_arg0, _arg1);
reply.writeNoException();
reply.writeInt(_result);
return true;
}
}
return super.onTransact(code, data, reply, flags);
}
private static class Proxy implements com.rx201.apkmon.demo.IAddResultCallback
{
private android.os.IBinder mRemote;
Proxy(android.os.IBinder remote)
{
mRemote = remote;
}
@Override public android.os.IBinder asBinder()
{
return mRemote;
}
public java.lang.String getInterfaceDescriptor()
{
return DESCRIPTOR;
}
@Override public int onResult(int i1, int i2) throws android.os.RemoteException
{
android.os.Parcel _data = android.os.Parcel.obtain();
android.os.Parcel _reply = android.os.Parcel.obtain();
int _result;
try {
_data.writeInterfaceToken(DESCRIPTOR);
_data.writeInt(i1);
_data.writeInt(i2);
mRemote.transact(Stub.TRANSACTION_onResult, _data, _reply, 0);
_reply.readException();
_result = _reply.readInt();
}
finally {
_reply.recycle();
_data.recycle();
}
return _result;
}
}
static final int TRANSACTION_onResult = (android.os.IBinder.FIRST_CALL_TRANSACTION + 0);
}
public int onResult(int i1, int i2) throws android.os.RemoteException;
}
