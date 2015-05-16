.class Lcom/rx201/apkmon/LocationRequestUpdatesHandler;
.super Lcom/rx201/apkmon/TransactionHandler;
.source "APIHook.java"


# instance fields
.field private intercept:Z


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 429
    invoke-direct {p0}, Lcom/rx201/apkmon/TransactionHandler;-><init>()V

    .line 431
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rx201/apkmon/LocationRequestUpdatesHandler;->intercept:Z

    .line 429
    return-void
.end method


# virtual methods
.method public HandleAfterTransact(Landroid/os/Parcel;)[B
    .registers 6
    .parameter "parcel"

    .prologue
    .line 476
    iget-boolean v3, p0, Lcom/rx201/apkmon/LocationRequestUpdatesHandler;->intercept:Z

    if-eqz v3, :cond_7

    .line 480
    :try_start_4
    invoke-virtual {p1}, Landroid/os/Parcel;->readException()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_7} :catch_9

    .line 490
    :cond_7
    const/4 v2, 0x0

    :goto_8
    return-object v2

    .line 481
    :catch_9
    move-exception v0

    .line 483
    .local v0, e:Ljava/lang/Exception;
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 484
    .local v1, p:Landroid/os/Parcel;
    invoke-virtual {v1}, Landroid/os/Parcel;->writeNoException()V

    .line 485
    invoke-virtual {v1}, Landroid/os/Parcel;->marshall()[B

    move-result-object v2

    .line 486
    .local v2, result:[B
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    goto :goto_8
.end method

.method public HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B
    .registers 15
    .parameter "Descriptor"
    .parameter "data"

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 434
    new-instance v10, Lcom/rx201/apkmon/permissions/PrivacyPermission;

    sget-object v11, Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;->GPS_Last:Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;

    invoke-direct {v10, v11}, Lcom/rx201/apkmon/permissions/PrivacyPermission;-><init>(Lcom/rx201/apkmon/permissions/PrivacyPermission$PRIVACY_TYPE;)V

    invoke-static {v10}, Lcom/rx201/apkmon/Utility;->PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z

    move-result v10

    if-nez v10, :cond_5e

    .line 436
    iput-boolean v8, p0, Lcom/rx201/apkmon/LocationRequestUpdatesHandler;->intercept:Z

    .line 438
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v4

    .line 440
    .local v4, p:Landroid/os/Parcel;
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    .line 441
    .local v5, provider:Ljava/lang/String;
    invoke-virtual {v4, v5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 443
    const/4 v0, 0x0

    .line 444
    .local v0, criteria:Landroid/location/Criteria;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v10

    if-eqz v10, :cond_56

    .line 445
    sget-object v10, Landroid/location/Criteria;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v10, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #criteria:Landroid/location/Criteria;
    check-cast v0, Landroid/location/Criteria;

    .line 446
    .restart local v0       #criteria:Landroid/location/Criteria;
    invoke-virtual {v4, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 447
    invoke-virtual {v0, v4, v9}, Landroid/location/Criteria;->writeToParcel(Landroid/os/Parcel;I)V

    .line 454
    :goto_31
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    .line 455
    .local v2, minTime:J
    invoke-virtual {v4, v2, v3}, Landroid/os/Parcel;->writeLong(J)V

    .line 457
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    move-result v1

    .line 458
    .local v1, minDistance:F
    invoke-virtual {v4, v1}, Landroid/os/Parcel;->writeFloat(F)V

    .line 460
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v10

    if-eqz v10, :cond_5a

    move v7, v8

    .line 461
    .local v7, singleShot:Z
    :goto_46
    if-eqz v7, :cond_5c

    :goto_48
    invoke-virtual {v4, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 465
    invoke-virtual {v4, v9}, Landroid/os/Parcel;->writeInt(I)V

    .line 466
    invoke-virtual {v4}, Landroid/os/Parcel;->marshall()[B

    move-result-object v6

    .line 467
    .local v6, result:[B
    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    .line 472
    .end local v0           #criteria:Landroid/location/Criteria;
    .end local v1           #minDistance:F
    .end local v2           #minTime:J
    .end local v4           #p:Landroid/os/Parcel;
    .end local v5           #provider:Ljava/lang/String;
    .end local v6           #result:[B
    .end local v7           #singleShot:Z
    :goto_55
    return-object v6

    .line 451
    .restart local v0       #criteria:Landroid/location/Criteria;
    .restart local v4       #p:Landroid/os/Parcel;
    .restart local v5       #provider:Ljava/lang/String;
    :cond_56
    invoke-virtual {v4, v9}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_31

    .restart local v1       #minDistance:F
    .restart local v2       #minTime:J
    :cond_5a
    move v7, v9

    .line 460
    goto :goto_46

    .restart local v7       #singleShot:Z
    :cond_5c
    move v8, v9

    .line 461
    goto :goto_48

    .line 471
    .end local v0           #criteria:Landroid/location/Criteria;
    .end local v1           #minDistance:F
    .end local v2           #minTime:J
    .end local v4           #p:Landroid/os/Parcel;
    .end local v5           #provider:Ljava/lang/String;
    .end local v7           #singleShot:Z
    :cond_5e
    iput-boolean v9, p0, Lcom/rx201/apkmon/LocationRequestUpdatesHandler;->intercept:Z

    .line 472
    const/4 v6, 0x0

    goto :goto_55
.end method
