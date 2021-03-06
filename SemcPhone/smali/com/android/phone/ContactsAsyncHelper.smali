.class public Lcom/android/phone/ContactsAsyncHelper;
.super Ljava/lang/Object;
.source "ContactsAsyncHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/ContactsAsyncHelper$WorkerHandler;,
        Lcom/android/phone/ContactsAsyncHelper$ImageTracker;,
        Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;,
        Lcom/android/phone/ContactsAsyncHelper$OnImageLoadCompleteListener;
    }
.end annotation


# static fields
.field private static sInstance:Lcom/android/phone/ContactsAsyncHelper;

.field private static sThreadHandler:Landroid/os/Handler;


# instance fields
.field private final mResultHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 109
    new-instance v0, Lcom/android/phone/ContactsAsyncHelper;

    invoke-direct {v0}, Lcom/android/phone/ContactsAsyncHelper;-><init>()V

    sput-object v0, Lcom/android/phone/ContactsAsyncHelper;->sInstance:Lcom/android/phone/ContactsAsyncHelper;

    .line 110
    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .prologue
    .line 314
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v1, Lcom/android/phone/ContactsAsyncHelper$1;

    invoke-direct {v1, p0}, Lcom/android/phone/ContactsAsyncHelper$1;-><init>(Lcom/android/phone/ContactsAsyncHelper;)V

    iput-object v1, p0, Lcom/android/phone/ContactsAsyncHelper;->mResultHandler:Landroid/os/Handler;

    .line 315
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ContactsAsyncWorker"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 316
    .local v0, thread:Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 317
    new-instance v1, Lcom/android/phone/ContactsAsyncHelper$WorkerHandler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/android/phone/ContactsAsyncHelper$WorkerHandler;-><init>(Lcom/android/phone/ContactsAsyncHelper;Landroid/os/Looper;)V

    sput-object v1, Lcom/android/phone/ContactsAsyncHelper;->sThreadHandler:Landroid/os/Handler;

    .line 318
    return-void
.end method

.method static synthetic access$000(Lcom/android/phone/ContactsAsyncHelper;Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/android/phone/ContactsAsyncHelper;->getNumberIcon(Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/phone/ContactsAsyncHelper;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/phone/ContactsAsyncHelper;->mResultHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private getNumberIcon(Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;)V
    .locals 7
    .parameter "args"

    .prologue
    .line 371
    iget-object v4, p1, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->cookie:Ljava/lang/Object;

    instance-of v4, v4, Lcom/android/phone/SomcInCallScreen$AsyncLoadCookie;

    if-nez v4, :cond_1

    .line 396
    :cond_0
    :goto_0
    return-void

    .line 375
    :cond_1
    iget-object v4, p1, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/sonyericsson/appextensions/ApplicationExtensionFactory;->getContactMethodDecorator(Landroid/content/Context;)Lcom/sonyericsson/feature/IContactMethodDecorator;

    move-result-object v0

    .line 377
    .local v0, contactMethodDecoratorInstance:Lcom/sonyericsson/feature/IContactMethodDecorator;
    if-eqz v0, :cond_0

    .line 379
    iget-object v1, p1, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->cookie:Ljava/lang/Object;

    check-cast v1, Lcom/android/phone/SomcInCallScreen$AsyncLoadCookie;

    .line 381
    .local v1, cookie:Lcom/android/phone/SomcInCallScreen$AsyncLoadCookie;
    const/4 v2, 0x0

    .line 383
    .local v2, decorationObj:Lcom/sonyericsson/model/ContactMethodDecoration;
    :try_start_0
    iget-object v4, p1, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->context:Landroid/content/Context;

    const-string v5, "tel:"

    iget-object v6, v1, Lcom/android/phone/SomcInCallScreen$AsyncLoadCookie;->callerInfo:Lcom/android/internal/telephony/CallerInfo;

    iget-object v6, v6, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    invoke-interface {v0, v4, v5, v6}, Lcom/sonyericsson/feature/IContactMethodDecorator;->getDecoration(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/sonyericsson/model/ContactMethodDecoration;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 390
    :goto_1
    if-eqz v2, :cond_0

    .line 391
    invoke-virtual {v2}, Lcom/sonyericsson/model/ContactMethodDecoration;->getIcon()Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, p1, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->resultIcon:Landroid/graphics/Bitmap;

    .line 392
    sget-boolean v4, Lcom/android/phone/PhoneApp;->DBG:Z

    if-eqz v4, :cond_0

    .line 393
    const-string v4, "ContactsAsyncHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "contact number icon: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p1, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->resultIcon:Landroid/graphics/Bitmap;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 385
    :catch_0
    move-exception v3

    .line 386
    .local v3, ex:Ljava/io/IOException;
    const-string v4, "ContactsAsyncHelper"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception in fetching icon for number"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Lcom/android/phone/SomcInCallScreen$AsyncLoadCookie;->callerInfo:Lcom/android/internal/telephony/CallerInfo;

    iget-object v6, v6, Lcom/android/internal/telephony/CallerInfo;->phoneNumber:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static final startObtainPhotoAsync(ILandroid/content/Context;Landroid/net/Uri;Lcom/android/phone/ContactsAsyncHelper$OnImageLoadCompleteListener;Ljava/lang/Object;)V
    .locals 5
    .parameter "token"
    .parameter "context"
    .parameter "personUri"
    .parameter "listener"
    .parameter "cookie"

    .prologue
    .line 340
    if-nez p2, :cond_0

    .line 341
    const-string v2, "ContactsAsyncHelper"

    const-string v3, "Uri is missing"

    invoke-static {v2, v3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    :goto_0
    return-void

    .line 349
    :cond_0
    new-instance v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;-><init>(Lcom/android/phone/ContactsAsyncHelper$1;)V

    .line 350
    .local v0, args:Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;
    iput-object p4, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->cookie:Ljava/lang/Object;

    .line 351
    iput-object p1, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->context:Landroid/content/Context;

    .line 352
    iput-object p2, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->uri:Landroid/net/Uri;

    .line 353
    iput-object p3, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->listener:Lcom/android/phone/ContactsAsyncHelper$OnImageLoadCompleteListener;

    .line 356
    sget-object v2, Lcom/android/phone/ContactsAsyncHelper;->sThreadHandler:Landroid/os/Handler;

    invoke-virtual {v2, p0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 357
    .local v1, msg:Landroid/os/Message;
    const/4 v2, 0x1

    iput v2, v1, Landroid/os/Message;->arg1:I

    .line 358
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 360
    sget-boolean v2, Lcom/android/phone/PhoneApp;->DBG:Z

    if-eqz v2, :cond_1

    const-string v2, "ContactsAsyncHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Begin loading image: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/android/phone/ContactsAsyncHelper$WorkerArgs;->uri:Landroid/net/Uri;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", displaying default image for now."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    :cond_1
    sget-object v2, Lcom/android/phone/ContactsAsyncHelper;->sThreadHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
