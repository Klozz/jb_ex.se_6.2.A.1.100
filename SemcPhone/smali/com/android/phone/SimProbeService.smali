.class public Lcom/android/phone/SimProbeService;
.super Landroid/app/IntentService;
.source "SimProbeService.java"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mPhone:Lcom/android/internal/telephony/PhoneBase;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 34
    const-class v0, Lcom/android/phone/SimProbeService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 65
    new-instance v0, Lcom/android/phone/SimProbeService$1;

    invoke-direct {v0, p0}, Lcom/android/phone/SimProbeService$1;-><init>(Lcom/android/phone/SimProbeService;)V

    iput-object v0, p0, Lcom/android/phone/SimProbeService;->mHandler:Landroid/os/Handler;

    .line 35
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    .line 37
    packed-switch v0, :pswitch_data_0

    .line 44
    const-string v0, "SimProbeService"

    const-string v1, "Unable to retrieve a PhoneBase interface."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    :goto_0
    return-void

    .line 40
    :pswitch_0
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/PhoneProxy;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneProxy;->getActivePhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/PhoneBase;

    iput-object v0, p0, Lcom/android/phone/SimProbeService;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    goto :goto_0

    .line 37
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 5
    .parameter "intent"

    .prologue
    .line 51
    iget-object v1, p0, Lcom/android/phone/SimProbeService;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    if-eqz v1, :cond_0

    .line 52
    iget-object v1, p0, Lcom/android/phone/SimProbeService;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getIccFileHandler()Lcom/android/internal/telephony/uicc/IccFileHandler;

    move-result-object v0

    .line 53
    .local v0, iccFh:Lcom/android/internal/telephony/uicc/IccFileHandler;
    const/16 v1, 0x6fc5

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/android/phone/SimProbeService;->mHandler:Landroid/os/Handler;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->loadEFLinearFixed(IILandroid/os/Message;)V

    .line 57
    .end local v0           #iccFh:Lcom/android/internal/telephony/uicc/IccFileHandler;
    :goto_0
    return-void

    .line 55
    :cond_0
    const-string v1, "SimProbeService"

    const-string v2, "Warning, unable to probe ICC card."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
