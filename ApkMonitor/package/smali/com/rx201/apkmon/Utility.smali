.class Lcom/rx201/apkmon/Utility;
.super Ljava/lang/Object;
.source "APIHook.java"


# static fields
.field private static AM_getDefault:Ljava/lang/reflect/Method; = null

.field private static AM_startActivity:Ljava/lang/reflect/Method; = null

.field private static AM_startService:Ljava/lang/reflect/Method; = null

.field static final AppPackageName:Ljava/lang/String; = null

.field static final ConsentDialogActivityName:Ljava/lang/String; = null

.field private static DecisionsLoaded:Z = false

.field private static IfAM:Ljava/lang/Class; = null

.field static final LocalConsentDialogName:Landroid/content/ComponentName; = null

.field private static SavedDecisions:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static final SecurittManagerService:Ljava/lang/String; = "com.rx201.asm.PermissionCheck"

.field static final SecurityManagerIntent:Landroid/content/Intent; = null

.field static final SecurityManagerPackage:Ljava/lang/String; = "com.rx201.asm"

.field private static clsAMN:Ljava/lang/Class;

.field private static cls_IApplicationThread:Ljava/lang/Class;

.field private static pfd:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 677
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->AppPackageName:Ljava/lang/String;

    .line 678
    const-class v0, Lcom/rx201/apkmon/APIHookDialogActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->ConsentDialogActivityName:Ljava/lang/String;

    .line 679
    new-instance v0, Landroid/content/ComponentName;

    sget-object v1, Lcom/rx201/apkmon/Utility;->AppPackageName:Ljava/lang/String;

    sget-object v2, Lcom/rx201/apkmon/Utility;->ConsentDialogActivityName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/rx201/apkmon/Utility;->LocalConsentDialogName:Landroid/content/ComponentName;

    .line 682
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 683
    const-string v1, "com.rx201.asm"

    const-string v2, "com.rx201.asm.PermissionCheck"

    .line 682
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->SecurityManagerIntent:Landroid/content/Intent;

    .line 748
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    .line 749
    const/4 v0, 0x0

    sput-boolean v0, Lcom/rx201/apkmon/Utility;->DecisionsLoaded:Z

    .line 856
    const/4 v0, 0x0

    sput-object v0, Lcom/rx201/apkmon/Utility;->clsAMN:Ljava/lang/Class;

    .line 875
    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 676
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized LogAccess(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .parameter "PolicyName"
    .parameter "PolicyUID"

    .prologue
    .line 725
    const-class v4, Lcom/rx201/apkmon/Utility;

    monitor-enter v4

    :try_start_3
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v2

    .line 726
    .local v2, temp:Landroid/content/Context;
    invoke-static {v2}, Lcom/rx201/apkmon/Utility;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_64

    move-result-object v0

    .line 731
    .local v0, appname:Ljava/lang/String;
    :try_start_b
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/FileWriter;

    const-string v5, "/data/local/tmp/access.txt"

    const/4 v6, 0x1

    invoke-direct {v3, v5, v6}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v1, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 732
    .local v1, out:Ljava/io/BufferedWriter;
    const-string v3, "*****AppStart*****\n"

    invoke-virtual {v1, v3}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 733
    const-string v3, "Application Name: "

    invoke-virtual {v1, v3}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 734
    invoke-virtual {v1, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 735
    const-string v3, "\n"

    invoke-virtual {v1, v3}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 736
    const-string v3, "Access Time: Package Name: Issue\n"

    invoke-virtual {v1, v3}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 737
    const-string v3, "%s    %s:    %s %s\n"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    .line 738
    const-string v7, "yyyy-MM-dd hh:mm:ss"

    invoke-static {v7}, Lcom/rx201/apkmon/Utility;->now(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    .line 739
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    .line 740
    aput-object p0, v5, v6

    const/4 v6, 0x3

    if-eqz p1, :cond_61

    .end local p1
    :goto_4e
    aput-object p1, v5, v6

    .line 737
    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 741
    const-string v3, "*****************\n"

    invoke-virtual {v1, v3}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 742
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V
    :try_end_5f
    .catchall {:try_start_b .. :try_end_5f} :catchall_64
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_5f} :catch_67

    .line 746
    .end local v1           #out:Ljava/io/BufferedWriter;
    :goto_5f
    monitor-exit v4

    return-void

    .line 740
    .restart local v1       #out:Ljava/io/BufferedWriter;
    .restart local p1
    :cond_61
    :try_start_61
    const-string p1, ""
    :try_end_63
    .catchall {:try_start_61 .. :try_end_63} :catchall_64
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_63} :catch_67

    goto :goto_4e

    .line 725
    .end local v0           #appname:Ljava/lang/String;
    .end local v1           #out:Ljava/io/BufferedWriter;
    .end local v2           #temp:Landroid/content/Context;
    .end local p1
    :catchall_64
    move-exception v3

    monitor-exit v4

    throw v3

    .line 744
    .restart local v0       #appname:Ljava/lang/String;
    .restart local v2       #temp:Landroid/content/Context;
    :catch_67
    move-exception v3

    goto :goto_5f
.end method

.method private static LookupSavedPolicyDecision(Ljava/lang/String;Ljava/lang/String;)I
    .registers 11
    .parameter "PolicyName"
    .parameter "PolicyUID"

    .prologue
    .line 753
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 755
    .local v3, key:Ljava/lang/String;
    sget-object v7, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    monitor-enter v7

    .line 756
    :try_start_14
    sget-boolean v6, Lcom/rx201/apkmon/Utility;->DecisionsLoaded:Z

    if-nez v6, :cond_4d

    .line 757
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/rx201/apkmon/APIHook;->loadDecisions(Ljava/lang/String;)[B

    move-result-object v0

    .line 758
    .local v0, data:[B
    if-eqz v0, :cond_4a

    .line 760
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_2f
    .catchall {:try_start_14 .. :try_end_2f} :catchall_65

    .line 762
    .local v2, in:Ljava/io/ByteArrayInputStream;
    :try_start_2f
    new-instance v4, Ljava/io/ObjectInputStream;

    invoke-direct {v4, v2}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 763
    .local v4, objIn:Ljava/io/ObjectInputStream;
    sget-object v6, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->clear()V

    .line 764
    sget-object v8, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    invoke-virtual {v8, v6}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 765
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->close()V

    .line 766
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_4a
    .catchall {:try_start_2f .. :try_end_4a} :catchall_65
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_4a} :catch_5a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2f .. :try_end_4a} :catch_68

    .line 773
    .end local v2           #in:Ljava/io/ByteArrayInputStream;
    .end local v4           #objIn:Ljava/io/ObjectInputStream;
    :cond_4a
    :goto_4a
    const/4 v6, 0x1

    :try_start_4b
    sput-boolean v6, Lcom/rx201/apkmon/Utility;->DecisionsLoaded:Z

    .line 775
    .end local v0           #data:[B
    :cond_4d
    sget-object v6, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 755
    .local v5, r:Ljava/lang/Integer;
    monitor-exit v7

    .line 777
    if-nez v5, :cond_73

    .line 778
    const/4 v6, -0x2

    .line 780
    :goto_59
    return v6

    .line 767
    .end local v5           #r:Ljava/lang/Integer;
    .restart local v0       #data:[B
    .restart local v2       #in:Ljava/io/ByteArrayInputStream;
    :catch_5a
    move-exception v1

    .line 768
    .local v1, e:Ljava/io/IOException;
    const-string v6, "apkmon"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4a

    .line 755
    .end local v0           #data:[B
    .end local v1           #e:Ljava/io/IOException;
    .end local v2           #in:Ljava/io/ByteArrayInputStream;
    :catchall_65
    move-exception v6

    monitor-exit v7
    :try_end_67
    .catchall {:try_start_4b .. :try_end_67} :catchall_65

    throw v6

    .line 769
    .restart local v0       #data:[B
    .restart local v2       #in:Ljava/io/ByteArrayInputStream;
    :catch_68
    move-exception v1

    .line 770
    .local v1, e:Ljava/lang/ClassNotFoundException;
    :try_start_69
    const-string v6, "apkmon"

    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_72
    .catchall {:try_start_69 .. :try_end_72} :catchall_65

    goto :goto_4a

    .line 780
    .end local v0           #data:[B
    .end local v1           #e:Ljava/lang/ClassNotFoundException;
    .end local v2           #in:Ljava/io/ByteArrayInputStream;
    .restart local v5       #r:Ljava/lang/Integer;
    :cond_73
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_59
.end method

.method public static LowlevelStartActivity(Landroid/content/Intent;)Z
    .registers 10
    .parameter "intent"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 880
    :try_start_2
    invoke-static {}, Lcom/rx201/apkmon/Utility;->resolveClasses()V

    .line 881
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    if-nez v4, :cond_51

    .line 884
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xe

    if-ge v4, v5, :cond_141

    .line 885
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startActivity"

    const/16 v6, 0xa

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    .line 886
    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-class v8, [Landroid/net/Uri;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-class v8, Landroid/os/IBinder;

    aput-object v8, v6, v7

    const/4 v7, 0x6

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x8

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x9

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    .line 885
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    .line 906
    :cond_51
    :goto_51
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_getDefault:Ljava/lang/reflect/Method;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 907
    .local v1, mAm:Ljava/lang/Object;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xe

    if-ge v4, v5, :cond_a4

    .line 908
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    const/16 v5, 0xa

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v6, 0x2

    invoke-virtual {p0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 909
    :cond_a4
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-ge v4, v5, :cond_102

    .line 910
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    const/16 v5, 0xd

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v6, 0x2

    invoke-virtual {p0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0xb

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 911
    :cond_102
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x12

    if-ge v4, v5, :cond_26e

    .line 912
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    const/16 v5, 0x9

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    const/4 v6, 0x1

    invoke-virtual {p0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const/4 v7, 0x0

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 920
    .end local v1           #mAm:Ljava/lang/Object;
    :goto_140
    return v2

    .line 887
    :cond_141
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x10

    if-ge v4, v5, :cond_1ca

    .line 889
    const-string v4, "android.os.ParcelFileDescriptor"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    .line 890
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startActivity"

    const/16 v6, 0xd

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    .line 891
    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-class v8, [Landroid/net/Uri;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-class v8, Landroid/os/IBinder;

    aput-object v8, v6, v7

    const/4 v7, 0x6

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x8

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x9

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0xa

    .line 892
    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0xb

    sget-object v8, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0xc

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    .line 890
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;
    :try_end_1a3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1a3} :catch_1a5

    goto/16 :goto_51

    .line 917
    :catch_1a5
    move-exception v0

    .line 918
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "apkmon"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "exception: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    .line 919
    const-string v2, "apkmon"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    move v2, v3

    .line 920
    goto/16 :goto_140

    .line 893
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1ca
    :try_start_1ca
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x12

    if-ge v4, v5, :cond_21c

    .line 894
    const-string v4, "android.os.ParcelFileDescriptor"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    .line 895
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startActivity"

    const/16 v6, 0xa

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    .line 896
    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-class v8, Landroid/os/IBinder;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x6

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x7

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x8

    .line 897
    sget-object v8, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x9

    const-class v8, Landroid/os/Bundle;

    aput-object v8, v6, v7

    .line 895
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    goto/16 :goto_51

    .line 899
    :cond_21c
    const-string v4, "android.os.ParcelFileDescriptor"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    .line 900
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startActivity"

    const/16 v6, 0xb

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    .line 901
    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    const-class v8, Landroid/os/IBinder;

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x6

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0x8

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    const/16 v7, 0x9

    .line 902
    sget-object v8, Lcom/rx201/apkmon/Utility;->pfd:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/16 v7, 0xa

    const-class v8, Landroid/os/Bundle;

    aput-object v8, v6, v7

    .line 900
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    goto/16 :goto_51

    .line 914
    .restart local v1       #mAm:Ljava/lang/Object;
    :cond_26e
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startActivity:Ljava/lang/reflect/Method;

    const/16 v5, 0xb

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x2

    aput-object p0, v5, v6

    const/4 v6, 0x3

    invoke-virtual {p0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const/4 v7, 0x0

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2b0
    .catch Ljava/lang/Exception; {:try_start_1ca .. :try_end_2b0} :catch_1a5

    goto/16 :goto_140
.end method

.method public static LowlevelStartService(Landroid/content/Intent;)Z
    .registers 10
    .parameter "intent"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 928
    :try_start_2
    invoke-static {}, Lcom/rx201/apkmon/Utility;->resolveClasses()V

    .line 930
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startService:Ljava/lang/reflect/Method;

    if-nez v4, :cond_25

    .line 932
    sget-object v4, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    const-string v5, "startService"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-class v8, Ljava/lang/String;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    sput-object v4, Lcom/rx201/apkmon/Utility;->AM_startService:Ljava/lang/reflect/Method;

    .line 934
    :cond_25
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_getDefault:Ljava/lang/reflect/Method;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 935
    .local v1, mAm:Ljava/lang/Object;
    sget-object v4, Lcom/rx201/apkmon/Utility;->AM_startService:Ljava/lang/reflect/Method;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v6, 0x2

    const/4 v7, 0x0

    aput-object v7, v5, v6

    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_40} :catch_41

    .line 941
    .end local v1           #mAm:Ljava/lang/Object;
    :goto_40
    return v2

    .line 938
    :catch_41
    move-exception v0

    .line 939
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "apkmon"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "exception: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    .line 940
    const-string v2, "apkmon"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    move v2, v3

    .line 941
    goto :goto_40
.end method

.method public static declared-synchronized PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z
    .registers 6
    .parameter "permission"

    .prologue
    .line 814
    const-class v4, Lcom/rx201/apkmon/Utility;

    monitor-enter v4

    const/4 v0, 0x0

    .line 817
    .local v0, decision:I
    :try_start_4
    invoke-virtual {p0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->getPermissionIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 818
    .local v1, permissionName:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/rx201/apkmon/permissions/AurasiumPermission;->getGroupingIdentifier()Ljava/lang/String;

    move-result-object v2

    .line 819
    .local v2, permissionUID:Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/rx201/apkmon/Utility;->LogAccess(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_12

    .line 820
    const/4 v3, 0x1

    monitor-exit v4

    return v3

    .line 814
    .end local v1           #permissionName:Ljava/lang/String;
    .end local v2           #permissionUID:Ljava/lang/String;
    :catchall_12
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method private static SavePolicyDecision(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 10
    .parameter "PolicyName"
    .parameter "PolicyUID"
    .parameter "decision"

    .prologue
    .line 786
    const/4 v4, -0x1

    if-ne p2, v4, :cond_4

    .line 804
    :goto_3
    return-void

    .line 788
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 789
    .local v1, key:Ljava/lang/String;
    sget-object v5, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    monitor-enter v5

    .line 790
    :try_start_18
    sget-object v4, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 793
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_26
    .catchall {:try_start_18 .. :try_end_26} :catchall_4b

    .line 795
    .local v3, out:Ljava/io/ByteArrayOutputStream;
    :try_start_26
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v3}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 796
    .local v2, objOut:Ljava/io/ObjectOutputStream;
    sget-object v4, Lcom/rx201/apkmon/Utility;->SavedDecisions:Ljava/util/HashMap;

    invoke-virtual {v2, v4}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 797
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V

    .line 798
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->getSystemContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-static {v4, v6}, Lcom/rx201/apkmon/APIHook;->saveDecisions(Ljava/lang/String;[B)V

    .line 799
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_49
    .catchall {:try_start_26 .. :try_end_49} :catchall_4b
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_49} :catch_4e

    .line 789
    .end local v2           #objOut:Ljava/io/ObjectOutputStream;
    :goto_49
    :try_start_49
    monitor-exit v5

    goto :goto_3

    .end local v3           #out:Ljava/io/ByteArrayOutputStream;
    :catchall_4b
    move-exception v4

    monitor-exit v5
    :try_end_4d
    .catchall {:try_start_49 .. :try_end_4d} :catchall_4b

    throw v4

    .line 800
    .restart local v3       #out:Ljava/io/ByteArrayOutputStream;
    :catch_4e
    move-exception v0

    .line 801
    .local v0, e:Ljava/io/IOException;
    :try_start_4f
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_52
    .catchall {:try_start_4f .. :try_end_52} :catchall_4b

    goto :goto_49
.end method

.method public static getApplicationName(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .parameter "context"

    .prologue
    .line 717
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v0, v1, Landroid/content/pm/ApplicationInfo;->labelRes:I

    .line 718
    .local v0, stringId:I
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static isASMAvailable()Z
    .registers 4

    .prologue
    .line 686
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    .line 687
    .local v1, executor:Ljava/util/concurrent/ExecutorService;
    new-instance v3, Lcom/rx201/apkmon/Utility$1;

    invoke-direct {v3}, Lcom/rx201/apkmon/Utility$1;-><init>()V

    invoke-interface {v1, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 699
    .local v2, result:Ljava/util/concurrent/Future;,"Ljava/util/concurrent/Future<Ljava/lang/Boolean;>;"
    :try_start_d
    invoke-interface {v2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_16} :catch_18
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_d .. :try_end_16} :catch_1e

    move-result v3

    .line 705
    :goto_17
    return v3

    .line 700
    :catch_18
    move-exception v0

    .line 701
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 705
    .end local v0           #e:Ljava/lang/InterruptedException;
    :goto_1c
    const/4 v3, 0x0

    goto :goto_17

    .line 702
    :catch_1e
    move-exception v0

    .line 703
    .local v0, e:Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_1c
.end method

.method public static now(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .parameter "dateFormat"

    .prologue
    .line 709
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 710
    .local v0, cal:Ljava/util/Calendar;
    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-direct {v1, p0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 711
    .local v1, sdf:Ljava/text/SimpleDateFormat;
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static resolveClasses()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 864
    sget-object v0, Lcom/rx201/apkmon/Utility;->clsAMN:Ljava/lang/Class;

    if-nez v0, :cond_27

    .line 866
    const-string v0, "android.app.ActivityManagerNative"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->clsAMN:Ljava/lang/Class;

    .line 867
    sget-object v0, Lcom/rx201/apkmon/Utility;->clsAMN:Ljava/lang/Class;

    const-string v1, "getDefault"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->AM_getDefault:Ljava/lang/reflect/Method;

    .line 869
    const-string v0, "android.app.IActivityManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->IfAM:Ljava/lang/Class;

    .line 870
    const-string v0, "android.app.IApplicationThread"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/rx201/apkmon/Utility;->cls_IApplicationThread:Ljava/lang/Class;

    .line 872
    :cond_27
    return-void
.end method
