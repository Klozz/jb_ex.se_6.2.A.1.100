.class Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;
.super Ljava/lang/Object;
.source "SomcRejectMsgSetting.java"

# interfaces
.implements Lcom/android/phone/SomcRejectMsgManager$DbFailListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/SomcRejectMsgSetting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateCallback"
.end annotation


# instance fields
.field private final mCurrentPref:Lcom/android/phone/MultiLineTitleEditTextPreference;

.field private final mPrevPrefValue:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/phone/SomcRejectMsgSetting;


# direct methods
.method public constructor <init>(Lcom/android/phone/SomcRejectMsgSetting;Lcom/android/phone/MultiLineTitleEditTextPreference;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "currentPref"
    .parameter "prevPrefValue"

    .prologue
    .line 39
    iput-object p1, p0, Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;->this$0:Lcom/android/phone/SomcRejectMsgSetting;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p2, p0, Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;->mCurrentPref:Lcom/android/phone/MultiLineTitleEditTextPreference;

    .line 41
    iput-object p3, p0, Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;->mPrevPrefValue:Ljava/lang/String;

    .line 42
    return-void
.end method


# virtual methods
.method public updateFailed()V
    .locals 3

    .prologue
    .line 45
    iget-object v0, p0, Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;->this$0:Lcom/android/phone/SomcRejectMsgSetting;

    invoke-virtual {v0}, Lcom/android/phone/SomcRejectMsgSetting;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;->this$0:Lcom/android/phone/SomcRejectMsgSetting;

    const v2, 0x7f0b010e

    invoke-virtual {v1, v2}, Lcom/android/phone/SomcRejectMsgSetting;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 48
    iget-object v0, p0, Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;->mPrevPrefValue:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;->mCurrentPref:Lcom/android/phone/MultiLineTitleEditTextPreference;

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;->mCurrentPref:Lcom/android/phone/MultiLineTitleEditTextPreference;

    iget-object v1, p0, Lcom/android/phone/SomcRejectMsgSetting$UpdateCallback;->mPrevPrefValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/android/phone/MultiLineTitleEditTextPreference;->setValue(Ljava/lang/String;)V

    .line 51
    :cond_0
    return-void
.end method
