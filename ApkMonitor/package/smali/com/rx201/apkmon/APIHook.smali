.class public Lcom/rx201/apkmon/APIHook;
.super Landroid/app/Application;
.source "APIHook.java"


# static fields
.field static final DEBUG:Z = true

.field private static PendingLocalTransactions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/Stack",
            "<",
            "Lcom/rx201/apkmon/TransactionInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private static PendingRemoteTransactions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/Stack",
            "<",
            "Lcom/rx201/apkmon/TransactionInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field private static ReverseDNS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static StartLogged:Z

.field public static app:Lcom/rx201/apkmon/APIHook;

.field private static cached_ti:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/rx201/apkmon/TransactionInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 505
    const-string v0, "apihook"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 507
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v0, v2, :cond_2f

    const/4 v0, 0x1

    :goto_d
    invoke-static {v0}, Lcom/rx201/apkmon/APIHook;->Hook(Z)V

    .line 518
    sput-boolean v1, Lcom/rx201/apkmon/APIHook;->StartLogged:Z

    .line 532
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/APIHook;->PendingLocalTransactions:Ljava/util/Map;

    .line 533
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/APIHook;->PendingRemoteTransactions:Ljava/util/Map;

    .line 535
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/APIHook;->cached_ti:Ljava/util/Stack;

    .line 638
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/rx201/apkmon/APIHook;->ReverseDNS:Ljava/util/HashMap;

    return-void

    :cond_2f
    move v0, v1

    .line 507
    goto :goto_d
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 512
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 513
    sput-object p0, Lcom/rx201/apkmon/APIHook;->app:Lcom/rx201/apkmon/APIHook;

    .line 514
    return-void
.end method

.method public static native Hook(Z)V
.end method

.method public static native KillMe()V
.end method

.method public static LOG_E(Ljava/lang/String;Ljava/lang/String;)V
    .registers 2
    .parameter "tag"
    .parameter "msg"

    .prologue
    .line 530
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    return-void
.end method

.method public static LOG_I(Ljava/lang/String;Ljava/lang/String;)V
    .registers 2
    .parameter "tag"
    .parameter "msg"

    .prologue
    .line 527
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    return-void
.end method

.method private static ProcessReply(Ljava/lang/Boolean;ILandroid/os/Parcel;)[B
    .registers 11
    .parameter "isRemote"
    .parameter "ThreadID"
    .parameter "data"

    .prologue
    const/4 v0, 0x0

    .line 584
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3, p1}, Lcom/rx201/apkmon/APIHook;->getTransactionStack(ZI)Ljava/util/Stack;

    move-result-object v1

    .line 585
    .local v1, stack:Ljava/util/Stack;,"Ljava/util/Stack<Lcom/rx201/apkmon/TransactionInfo;>;"
    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v3

    if-nez v3, :cond_25

    .line 587
    const-string v3, "apihook"

    const-string v4, "%d ProcessReply: Empty stack, skip."

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/rx201/apkmon/APIHook;->LOG_E(Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    :cond_24
    :goto_24
    return-object v0

    .line 590
    :cond_25
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3, p1}, Lcom/rx201/apkmon/APIHook;->getTransactionStack(ZI)Ljava/util/Stack;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/rx201/apkmon/TransactionInfo;

    .line 592
    .local v2, tr:Lcom/rx201/apkmon/TransactionInfo;
    iget-object v3, v2, Lcom/rx201/apkmon/TransactionInfo;->Handler:Lcom/rx201/apkmon/TransactionHandler;

    if-eqz v3, :cond_24

    .line 594
    iget-object v3, v2, Lcom/rx201/apkmon/TransactionInfo;->Handler:Lcom/rx201/apkmon/TransactionHandler;

    invoke-virtual {v3, p2}, Lcom/rx201/apkmon/TransactionHandler;->HandleAfterTransact(Landroid/os/Parcel;)[B

    move-result-object v0

    .line 595
    .local v0, r:[B
    invoke-static {v2}, Lcom/rx201/apkmon/APIHook;->recycleTI(Lcom/rx201/apkmon/TransactionInfo;)V

    goto :goto_24
.end method

.method private static ProcessTransaction(Ljava/lang/Boolean;ILjava/lang/String;ILandroid/os/Parcel;)[B
    .registers 8
    .parameter "isRemote"
    .parameter "ThreadID"
    .parameter "Descriptor"
    .parameter "transactionCode"
    .parameter "data"

    .prologue
    .line 566
    invoke-static {p2, p3}, Lcom/rx201/apkmon/TransactionHandlerFactory;->getHandler(Ljava/lang/String;I)Lcom/rx201/apkmon/TransactionHandler;

    move-result-object v0

    .line 567
    .local v0, handler:Lcom/rx201/apkmon/TransactionHandler;
    invoke-static {}, Lcom/rx201/apkmon/APIHook;->obtainTI()Lcom/rx201/apkmon/TransactionInfo;

    move-result-object v1

    .line 568
    .local v1, tr:Lcom/rx201/apkmon/TransactionInfo;
    if-nez v1, :cond_21

    .line 569
    new-instance v1, Lcom/rx201/apkmon/TransactionInfo;

    .end local v1           #tr:Lcom/rx201/apkmon/TransactionInfo;
    invoke-direct {v1, p2, p3, v0}, Lcom/rx201/apkmon/TransactionInfo;-><init>(Ljava/lang/String;ILcom/rx201/apkmon/TransactionHandler;)V

    .line 576
    .restart local v1       #tr:Lcom/rx201/apkmon/TransactionInfo;
    :goto_f
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2, p1}, Lcom/rx201/apkmon/APIHook;->getTransactionStack(ZI)Ljava/util/Stack;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 577
    if-eqz v0, :cond_28

    .line 578
    invoke-virtual {v0, p2, p4}, Lcom/rx201/apkmon/TransactionHandler;->HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B

    move-result-object v2

    .line 580
    :goto_20
    return-object v2

    .line 572
    :cond_21
    iput-object p2, v1, Lcom/rx201/apkmon/TransactionInfo;->Descriptor:Ljava/lang/String;

    .line 573
    iput p3, v1, Lcom/rx201/apkmon/TransactionInfo;->Code:I

    .line 574
    iput-object v0, v1, Lcom/rx201/apkmon/TransactionInfo;->Handler:Lcom/rx201/apkmon/TransactionHandler;

    goto :goto_f

    .line 580
    :cond_28
    const/4 v2, 0x0

    goto :goto_20
.end method

.method public static getSystemContext()Landroid/content/Context;
    .registers 1

    .prologue
    .line 521
    sget-object v0, Lcom/rx201/apkmon/APIHook;->app:Lcom/rx201/apkmon/APIHook;

    invoke-virtual {v0}, Lcom/rx201/apkmon/APIHook;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method private static declared-synchronized getTransactionStack(ZI)Ljava/util/Stack;
    .registers 6
    .parameter "isRemote"
    .parameter "ThreadID"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI)",
            "Ljava/util/Stack",
            "<",
            "Lcom/rx201/apkmon/TransactionInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 552
    const-class v3, Lcom/rx201/apkmon/APIHook;

    monitor-enter v3

    if-eqz p0, :cond_21

    :try_start_5
    sget-object v1, Lcom/rx201/apkmon/APIHook;->PendingRemoteTransactions:Ljava/util/Map;

    .line 553
    .local v1, stackmap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Stack<Lcom/rx201/apkmon/TransactionInfo;>;>;"
    :goto_7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Stack;

    .line 554
    .local v0, stack:Ljava/util/Stack;,"Ljava/util/Stack<Lcom/rx201/apkmon/TransactionInfo;>;"
    if-nez v0, :cond_1f

    .line 556
    new-instance v0, Ljava/util/Stack;

    .end local v0           #stack:Ljava/util/Stack;,"Ljava/util/Stack<Lcom/rx201/apkmon/TransactionInfo;>;"
    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 557
    .restart local v0       #stack:Ljava/util/Stack;,"Ljava/util/Stack<Lcom/rx201/apkmon/TransactionInfo;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1f
    .catchall {:try_start_5 .. :try_end_1f} :catchall_24

    .line 559
    :cond_1f
    monitor-exit v3

    return-object v0

    .line 552
    .end local v0           #stack:Ljava/util/Stack;,"Ljava/util/Stack<Lcom/rx201/apkmon/TransactionInfo;>;"
    .end local v1           #stackmap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Stack<Lcom/rx201/apkmon/TransactionInfo;>;>;"
    :cond_21
    :try_start_21
    sget-object v1, Lcom/rx201/apkmon/APIHook;->PendingLocalTransactions:Ljava/util/Map;
    :try_end_23
    .catchall {:try_start_21 .. :try_end_23} :catchall_24

    goto :goto_7

    :catchall_24
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public static native loadDecisions(Ljava/lang/String;)[B
.end method

.method private static obtainTI()Lcom/rx201/apkmon/TransactionInfo;
    .registers 2

    .prologue
    .line 538
    sget-object v1, Lcom/rx201/apkmon/APIHook;->cached_ti:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    if-lez v1, :cond_11

    .line 540
    sget-object v1, Lcom/rx201/apkmon/APIHook;->cached_ti:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rx201/apkmon/TransactionInfo;

    .line 544
    .local v0, t:Lcom/rx201/apkmon/TransactionInfo;
    :goto_10
    return-object v0

    .end local v0           #t:Lcom/rx201/apkmon/TransactionInfo;
    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public static onBeforeConnect(ILjava/lang/String;I)I
    .registers 8
    .parameter "sockfd"
    .parameter "addr"
    .parameter "port"

    .prologue
    const/4 v4, 0x7

    .line 642
    const-string v3, "::ffff:"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_38

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 644
    .local v1, RemoteIP:Ljava/lang/String;
    :goto_d
    sget-object v3, Lcom/rx201/apkmon/APIHook;->ReverseDNS:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 645
    .local v0, DomainName:Ljava/lang/String;
    if-nez v0, :cond_2b

    const-string v3, "::ffff:"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 646
    sget-object v3, Lcom/rx201/apkmon/APIHook;->ReverseDNS:Ljava/util/HashMap;

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #DomainName:Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 648
    .restart local v0       #DomainName:Ljava/lang/String;
    :cond_2b
    new-instance v3, Lcom/rx201/apkmon/permissions/SocketConnectPermission;

    invoke-direct {v3, v1, v0, p2}, Lcom/rx201/apkmon/permissions/SocketConnectPermission;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-static {v3}, Lcom/rx201/apkmon/Utility;->PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z

    move-result v2

    .line 649
    .local v2, result:Z
    if-eqz v2, :cond_3a

    const/4 v3, 0x1

    :goto_37
    return v3

    .end local v0           #DomainName:Ljava/lang/String;
    .end local v1           #RemoteIP:Ljava/lang/String;
    .end local v2           #result:Z
    :cond_38
    move-object v1, p1

    .line 642
    goto :goto_d

    .line 649
    .restart local v0       #DomainName:Ljava/lang/String;
    .restart local v1       #RemoteIP:Ljava/lang/String;
    .restart local v2       #result:Z
    :cond_3a
    const/4 v3, 0x0

    goto :goto_37
.end method

.method public static onBeforeExecvp(Ljava/lang/String;)I
    .registers 2
    .parameter "filename"

    .prologue
    .line 671
    new-instance v0, Lcom/rx201/apkmon/permissions/ExecPermission;

    invoke-direct {v0, p0}, Lcom/rx201/apkmon/permissions/ExecPermission;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/rx201/apkmon/Utility;->PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public static onDNSResolve(Ljava/lang/String;Ljava/lang/String;)I
    .registers 3
    .parameter "DomainName"
    .parameter "IPaddr"

    .prologue
    .line 655
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 656
    sget-object v0, Lcom/rx201/apkmon/APIHook;->ReverseDNS:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 657
    :cond_b
    const/4 v0, 0x0

    return v0
.end method

.method public static onDlOpen(Ljava/lang/String;I)I
    .registers 4
    .parameter "filename"
    .parameter "flag"

    .prologue
    const/4 v0, 0x1

    .line 662
    if-nez p0, :cond_4

    .line 667
    :cond_3
    :goto_3
    return v0

    .line 664
    :cond_4
    const-string v1, "/system/lib/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_14

    const-string v1, "/vendor/lib/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    :cond_14
    const-string v1, ".."

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 667
    :cond_1c
    new-instance v1, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;

    invoke-direct {v1, p0}, Lcom/rx201/apkmon/permissions/NativeLibraryPermission;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/rx201/apkmon/Utility;->PolicyCheck(Lcom/rx201/apkmon/permissions/AurasiumPermission;)Z

    move-result v1

    if-nez v1, :cond_3

    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static on_BC_REPLY(IIILandroid/os/Parcel;)[B
    .registers 5
    .parameter "ThreadID"
    .parameter "command"
    .parameter "transactionCode"
    .parameter "parcel"

    .prologue
    .line 630
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0, p0, p3}, Lcom/rx201/apkmon/APIHook;->ProcessReply(Ljava/lang/Boolean;ILandroid/os/Parcel;)[B

    move-result-object v0

    return-object v0
.end method

.method public static on_BC_TRANSACTION(IIILjava/lang/String;Landroid/os/Parcel;)[B
    .registers 7
    .parameter "ThreadID"
    .parameter "command"
    .parameter "transactionCode"
    .parameter "Descriptor"
    .parameter "parcel"

    .prologue
    const/4 v1, 0x1

    .line 614
    sget-boolean v0, Lcom/rx201/apkmon/APIHook;->StartLogged:Z

    if-nez v0, :cond_7

    .line 618
    sput-boolean v1, Lcom/rx201/apkmon/APIHook;->StartLogged:Z

    .line 620
    :cond_7
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0, p0, p3, p2, p4}, Lcom/rx201/apkmon/APIHook;->ProcessTransaction(Ljava/lang/Boolean;ILjava/lang/String;ILandroid/os/Parcel;)[B

    move-result-object v0

    return-object v0
.end method

.method public static on_BR_REPLY(IIILandroid/os/Parcel;)[B
    .registers 5
    .parameter "ThreadID"
    .parameter "command"
    .parameter "transactionCode"
    .parameter "parcel"

    .prologue
    .line 635
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0, p0, p3}, Lcom/rx201/apkmon/APIHook;->ProcessReply(Ljava/lang/Boolean;ILandroid/os/Parcel;)[B

    move-result-object v0

    return-object v0
.end method

.method public static on_BR_TRANSACTION(IIILjava/lang/String;Landroid/os/Parcel;)[B
    .registers 6
    .parameter "ThreadID"
    .parameter "command"
    .parameter "transactionCode"
    .parameter "Descriptor"
    .parameter "parcel"

    .prologue
    .line 625
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0, p0, p3, p2, p4}, Lcom/rx201/apkmon/APIHook;->ProcessTransaction(Ljava/lang/Boolean;ILjava/lang/String;ILandroid/os/Parcel;)[B

    move-result-object v0

    return-object v0
.end method

.method private static recycleTI(Lcom/rx201/apkmon/TransactionInfo;)V
    .registers 2
    .parameter "ti"

    .prologue
    .line 548
    sget-object v0, Lcom/rx201/apkmon/APIHook;->cached_ti:Ljava/util/Stack;

    invoke-virtual {v0, p0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    return-void
.end method

.method public static native saveDecisions(Ljava/lang/String;[B)V
.end method


# virtual methods
.method public native WriteTest()Ljava/lang/String;
.end method
