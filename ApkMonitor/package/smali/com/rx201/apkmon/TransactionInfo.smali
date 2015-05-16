.class Lcom/rx201/apkmon/TransactionInfo;
.super Ljava/lang/Object;
.source "APIHook.java"


# instance fields
.field public Code:I

.field public Descriptor:Ljava/lang/String;

.field public Handler:Lcom/rx201/apkmon/TransactionHandler;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILcom/rx201/apkmon/TransactionHandler;)V
    .registers 4
    .parameter "descriptor"
    .parameter "code"
    .parameter "handler"

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/rx201/apkmon/TransactionInfo;->Descriptor:Ljava/lang/String;

    .line 64
    iput p2, p0, Lcom/rx201/apkmon/TransactionInfo;->Code:I

    .line 65
    iput-object p3, p0, Lcom/rx201/apkmon/TransactionInfo;->Handler:Lcom/rx201/apkmon/TransactionHandler;

    .line 66
    return-void
.end method
