.class Lcom/rx201/apkmon/TransactionHandler;
.super Ljava/lang/Object;
.source "APIHook.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public HandleAfterTransact(Landroid/os/Parcel;)[B
    .registers 3
    .parameter "parcel"

    .prologue
    .line 179
    const/4 v0, 0x0

    return-object v0
.end method

.method public HandleBeforeTransact(Ljava/lang/String;Landroid/os/Parcel;)[B
    .registers 4
    .parameter "Descriptor"
    .parameter "parcel"

    .prologue
    .line 169
    const/4 v0, 0x0

    return-object v0
.end method
