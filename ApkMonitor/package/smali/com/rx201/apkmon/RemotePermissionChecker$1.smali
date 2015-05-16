.class Lcom/rx201/apkmon/RemotePermissionChecker$1;
.super Landroid/os/Handler;
.source "APIHook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rx201/apkmon/RemotePermissionChecker;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rx201/apkmon/RemotePermissionChecker;


# direct methods
.method constructor <init>(Lcom/rx201/apkmon/RemotePermissionChecker;)V
    .registers 2
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/rx201/apkmon/RemotePermissionChecker$1;->this$0:Lcom/rx201/apkmon/RemotePermissionChecker;

    .line 1000
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .parameter "msg"

    .prologue
    .line 1005
    iget v0, p1, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/rx201/apkmon/RemotePermissionChecker$1;->this$0:Lcom/rx201/apkmon/RemotePermissionChecker;

    #getter for: Lcom/rx201/apkmon/RemotePermissionChecker;->responseToken:I
    invoke-static {v1}, Lcom/rx201/apkmon/RemotePermissionChecker;->access$0(Lcom/rx201/apkmon/RemotePermissionChecker;)I

    move-result v1

    if-ne v0, v1, :cond_20

    .line 1006
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 1007
    iget-object v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker$1;->this$0:Lcom/rx201/apkmon/RemotePermissionChecker;

    iget v1, p1, Landroid/os/Message;->arg1:I

    #setter for: Lcom/rx201/apkmon/RemotePermissionChecker;->Result:I
    invoke-static {v0, v1}, Lcom/rx201/apkmon/RemotePermissionChecker;->access$1(Lcom/rx201/apkmon/RemotePermissionChecker;I)V

    .line 1008
    iget-object v0, p0, Lcom/rx201/apkmon/RemotePermissionChecker$1;->this$0:Lcom/rx201/apkmon/RemotePermissionChecker;

    iget v1, p1, Landroid/os/Message;->arg2:I

    #setter for: Lcom/rx201/apkmon/RemotePermissionChecker;->extraResult:I
    invoke-static {v0, v1}, Lcom/rx201/apkmon/RemotePermissionChecker;->access$2(Lcom/rx201/apkmon/RemotePermissionChecker;I)V

    .line 1011
    :goto_1f
    return-void

    .line 1010
    :cond_20
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto :goto_1f
.end method
