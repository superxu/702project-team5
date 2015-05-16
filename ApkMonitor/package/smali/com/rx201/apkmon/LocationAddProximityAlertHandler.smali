.class Lcom/rx201/apkmon/LocationAddProximityAlertHandler;
.super Lcom/rx201/apkmon/TransactionHandler;
.source "APIHook.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 394
    invoke-direct {p0}, Lcom/rx201/apkmon/TransactionHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B
    .registers 16
    .parameter "Descriptor"
    .parameter "parcel"

    .prologue
    const/4 v12, 0x0

    .line 397
    new-instance v10, Lcom/rx201/apkmon/permissions/PrivacyPermission;

    sget-object v11, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->GPS_Proximity:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-direct {v10, v11}, Lcom/rx201/apkmon/permissions/PrivacyPermission;-><init>(Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;)V

    invoke-static {v10}, Lcom/rx201/apkmon/Utility;->PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z

    move-result v10

    if-nez v10, :cond_54

    .line 399
    invoke-virtual {p2}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v4

    .line 400
    .local v4, latitude:D
    invoke-virtual {p2}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v6

    .line 401
    .local v6, longitude:D
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    move-result v8

    .line 402
    .local v8, radius:F
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    .line 404
    .local v0, expiration:J
    const/4 v2, 0x0

    .line 405
    .local v2, intent:Landroid/app/PendingIntent;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v10

    if-eqz v10, :cond_2d

    .line 406
    sget-object v10, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v10, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .end local v2           #intent:Landroid/app/PendingIntent;
    check-cast v2, Landroid/app/PendingIntent;

    .line 409
    .restart local v2       #intent:Landroid/app/PendingIntent;
    :cond_2d
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v3

    .line 410
    .local v3, p:Landroid/os/Parcel;
    invoke-virtual {v3, v4, v5}, Landroid/os/Parcel;->writeDouble(D)V

    .line 411
    invoke-virtual {v3, v6, v7}, Landroid/os/Parcel;->writeDouble(D)V

    .line 412
    invoke-virtual {v3, v8}, Landroid/os/Parcel;->writeFloat(F)V

    .line 413
    const-wide/16 v10, 0x0

    invoke-virtual {v3, v10, v11}, Landroid/os/Parcel;->writeLong(J)V

    .line 414
    if-eqz v2, :cond_50

    .line 416
    const/4 v10, 0x1

    invoke-virtual {v3, v10}, Landroid/os/Parcel;->writeInt(I)V

    .line 417
    invoke-virtual {v2, v3, v12}, Landroid/app/PendingIntent;->writeToParcel(Landroid/os/Parcel;I)V

    .line 421
    :goto_48
    invoke-virtual {v3}, Landroid/os/Parcel;->marshall()[B

    move-result-object v9

    .line 422
    .local v9, result:[B
    invoke-virtual {v3}, Landroid/os/Parcel;->recycle()V

    .line 425
    .end local v0           #expiration:J
    .end local v2           #intent:Landroid/app/PendingIntent;
    .end local v3           #p:Landroid/os/Parcel;
    .end local v4           #latitude:D
    .end local v6           #longitude:D
    .end local v8           #radius:F
    .end local v9           #result:[B
    :goto_4f
    return-object v9

    .line 420
    .restart local v0       #expiration:J
    .restart local v2       #intent:Landroid/app/PendingIntent;
    .restart local v3       #p:Landroid/os/Parcel;
    .restart local v4       #latitude:D
    .restart local v6       #longitude:D
    .restart local v8       #radius:F
    :cond_50
    invoke-virtual {v3, v12}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_48

    .line 425
    .end local v0           #expiration:J
    .end local v2           #intent:Landroid/app/PendingIntent;
    .end local v3           #p:Landroid/os/Parcel;
    .end local v4           #latitude:D
    .end local v6           #longitude:D
    .end local v8           #radius:F
    :cond_54
    const/4 v9, 0x0

    goto :goto_4f
.end method
