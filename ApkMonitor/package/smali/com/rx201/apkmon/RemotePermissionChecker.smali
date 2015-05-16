.class Lcom/rx201/apkmon/RemotePermissionChecker;
.super Ljava/lang/Object;
.source "APIHook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$rx201$apkmon$RemotePermissionChecker$RemoteType:[I

.field private static prng:Ljava/util/Random;


# instance fields
.field private DefaultChoice:I

.field private DefaultDelay:I

.field private Result:I

.field private extraResult:I

.field private permission:Lcom/rx201/apkmon/permissions/AurasiumPermission;

.field private responseToken:I

.field private target:Landroid/content/ComponentName;

.field private targetType:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;


# direct methods
.method static synthetic $SWITCH_TABLE$com$rx201$apkmon$RemotePermissionChecker$RemoteType()[I
    .registers 3

    .prologue
    .line 946
    sget-object v0, Lcom/rx201/apkmon/RemotePermissionChecker;->$SWITCH_TABLE$com$rx201$apkmon$RemotePermissionChecker$RemoteType:[I

    if-eqz v0, :cond_5

    :goto_4
    return-object v0

    :cond_5
    invoke-static {}, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->values()[Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_c
    sget-object v1, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->Activity:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    invoke-virtual {v1}, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_15} :catch_23

    :goto_15
    :try_start_15
    sget-object v1, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->Service:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    invoke-virtual {v1}, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_1e} :catch_21

    :goto_1e
    sput-object v0, Lcom/rx201/apkmon/RemotePermissionChecker;->$SWITCH_TABLE$com$rx201$apkmon$RemotePermissionChecker$RemoteType:[I

    goto :goto_4

    :catch_21
    move-exception v1

    goto :goto_1e

    :catch_23
    move-exception v1

    goto :goto_15
.end method

.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 968
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/RemotePermissionChecker;->prng:Ljava/util/Random;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 984
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 948
    const/4 v0, -0x1

    iput v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->Result:I

    .line 960
    const/4 v0, 0x0

    iput v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->DefaultDelay:I

    .line 985
    return-void
.end method

.method public constructor <init>(Lcom/rx201/apkmon/permissions/AurasiumPermission;Landroid/content/ComponentName;Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;)V
    .registers 5
    .parameter "permission"
    .parameter "target"
    .parameter "type"

    .prologue
    .line 974
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 948
    const/4 v0, -0x1

    iput v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->Result:I

    .line 960
    const/4 v0, 0x0

    iput v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->DefaultDelay:I

    .line 977
    iput-object p1, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->permission:Lcom/rx201/apkmon/permissions/AurasiumPermission;

    .line 978
    iput-object p2, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->target:Landroid/content/ComponentName;

    .line 979
    iput-object p3, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->targetType:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    .line 980
    sget-object v0, Lcom/rx201/apkmon/RemotePermissionChecker;->prng:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    iput v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->responseToken:I

    .line 981
    return-void
.end method

.method static synthetic access$0(Lcom/rx201/apkmon/RemotePermissionChecker;)I
    .registers 2
    .parameter

    .prologue
    .line 969
    iget v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->responseToken:I

    return v0
.end method

.method static synthetic access$1(Lcom/rx201/apkmon/RemotePermissionChecker;I)V
    .registers 2
    .parameter
    .parameter

    .prologue
    .line 948
    iput p1, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->Result:I

    return-void
.end method

.method static synthetic access$2(Lcom/rx201/apkmon/RemotePermissionChecker;I)V
    .registers 2
    .parameter
    .parameter

    .prologue
    .line 954
    iput p1, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->extraResult:I

    return-void
.end method


# virtual methods
.method public SetDefaultChoice(II)V
    .registers 3
    .parameter "delay"
    .parameter "choice"

    .prologue
    .line 964
    iput p2, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->DefaultChoice:I

    .line 965
    iput p1, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->DefaultDelay:I

    .line 966
    return-void
.end method

.method public check()I
    .registers 5

    .prologue
    .line 1034
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1035
    .local v0, MsgboxThread:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1036
    :goto_8
    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v2

    if-nez v2, :cond_13

    .line 1043
    invoke-virtual {p0}, Lcom/rx201/apkmon/RemotePermissionChecker;->getResult()I

    move-result v2

    return v2

    .line 1038
    :cond_13
    :try_start_13
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_13 .. :try_end_16} :catch_17

    goto :goto_8

    .line 1039
    :catch_17
    move-exception v1

    .line 1040
    .local v1, e:Ljava/lang/InterruptedException;
    const-string v2, "RemotePermission"

    const-string v3, "Current thread interrupted."

    invoke-static {v2, v3}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8
.end method

.method public getExtraResult()I
    .registers 2

    .prologue
    .line 957
    iget v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->extraResult:I

    return v0
.end method

.method public getResult()I
    .registers 2

    .prologue
    .line 951
    iget v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->Result:I

    return v0
.end method

.method public run()V
    .registers 5

    .prologue
    .line 989
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 990
    new-instance v0, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;

    invoke-direct {v0}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;-><init>()V

    .line 994
    .local v0, i:Lcom/rx201/apkmon/permissions/PermissionRequestIntent;
    const-string v2, "ACTION_SHOW_DIALOG"

    invoke-virtual {v0, v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 996
    iget-object v2, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->target:Landroid/content/ComponentName;

    invoke-virtual {v0, v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 997
    sget-object v2, Lcom/rx201/apkmon/Utility;->AppPackageName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->setApplicationPackage(Ljava/lang/String;)V

    .line 998
    iget v2, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->responseToken:I

    invoke-virtual {v0, v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->setResponseToken(I)V

    .line 999
    iget-object v2, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->permission:Lcom/rx201/apkmon/permissions/AurasiumPermission;

    invoke-virtual {v0, v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->setPermissionRequest(Lcom/rx201/apkmon/permissions/AurasiumPermission;)V

    .line 1000
    new-instance v2, Landroid/os/Messenger;

    new-instance v3, Lcom/rx201/apkmon/RemotePermissionChecker$1;

    invoke-direct {v3, p0}, Lcom/rx201/apkmon/RemotePermissionChecker$1;-><init>(Lcom/rx201/apkmon/RemotePermissionChecker;)V

    invoke-direct {v2, v3}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->setResultMessenger(Landroid/os/Messenger;)V

    .line 1013
    iget v2, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->DefaultDelay:I

    if-lez v2, :cond_3c

    .line 1014
    iget v2, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->DefaultDelay:I

    invoke-virtual {v0, v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->setDefaultDelay(I)V

    .line 1015
    iget v2, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->DefaultChoice:I

    invoke-virtual {v0, v2}, Lcom/rx201/apkmon/permissions/PermissionRequestIntent;->setDefaultChoice(I)V

    .line 1018
    :cond_3c
    invoke-static {}, Lcom/rx201/apkmon/RemotePermissionChecker;->$SWITCH_TABLE$com$rx201$apkmon$RemotePermissionChecker$RemoteType()[I

    move-result-object v2

    iget-object v3, p0, Lcom/rx201/apkmon/RemotePermissionChecker;->targetType:Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;

    invoke-virtual {v3}, Lcom/rx201/apkmon/RemotePermissionChecker$RemoteType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_5c

    .line 1026
    const/4 v1, 0x0

    .line 1028
    .local v1, succeed:Z
    :goto_4c
    if-eqz v1, :cond_51

    .line 1029
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 1031
    :cond_51
    return-void

    .line 1020
    .end local v1           #succeed:Z
    :pswitch_52
    invoke-static {v0}, Lcom/rx201/apkmon/Utility;->LowlevelStartService(Landroid/content/Intent;)Z

    move-result v1

    .line 1021
    .restart local v1       #succeed:Z
    goto :goto_4c

    .line 1023
    .end local v1           #succeed:Z
    :pswitch_57
    invoke-static {v0}, Lcom/rx201/apkmon/Utility;->LowlevelStartActivity(Landroid/content/Intent;)Z

    move-result v1

    .line 1024
    .restart local v1       #succeed:Z
    goto :goto_4c

    .line 1018
    :pswitch_data_5c
    .packed-switch 0x1
        :pswitch_52
        :pswitch_57
    .end packed-switch
.end method
