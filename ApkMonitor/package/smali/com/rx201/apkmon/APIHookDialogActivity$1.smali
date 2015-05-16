.class Lcom/rx201/apkmon/APIHookDialogActivity$1;
.super Ljava/lang/Object;
.source "APIHookDialogActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rx201/apkmon/APIHookDialogActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rx201/apkmon/APIHookDialogActivity;


# direct methods
.method constructor <init>(Lcom/rx201/apkmon/APIHookDialogActivity;)V
    .registers 2
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/rx201/apkmon/APIHookDialogActivity$1;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/rx201/apkmon/APIHookDialogActivity$1;->this$0:Lcom/rx201/apkmon/APIHookDialogActivity;

    const/4 v1, 0x0

    #setter for: Lcom/rx201/apkmon/APIHookDialogActivity;->RememberDecision:Z
    invoke-static {v0, v1}, Lcom/rx201/apkmon/APIHookDialogActivity;->access$0(Lcom/rx201/apkmon/APIHookDialogActivity;Z)V

    .line 73
    return-void
.end method
