.class Lcom/android/phone/FdnSetting$4;
.super Ljava/lang/Object;
.source "FdnSetting.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/FdnSetting;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/FdnSetting;

.field final synthetic val$button:Lcom/android/phone/EditPinPreference;


# direct methods
.method constructor <init>(Lcom/android/phone/FdnSetting;Lcom/android/phone/EditPinPreference;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 574
    iput-object p1, p0, Lcom/android/phone/FdnSetting$4;->this$0:Lcom/android/phone/FdnSetting;

    iput-object p2, p0, Lcom/android/phone/FdnSetting$4;->val$button:Lcom/android/phone/EditPinPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 4
    .parameter "dialog"

    .prologue
    .line 576
    iget-object v0, p0, Lcom/android/phone/FdnSetting$4;->this$0:Lcom/android/phone/FdnSetting;

    #calls: Lcom/android/phone/FdnSetting;->resetPinChangeStateForPUK2()V
    invoke-static {v0}, Lcom/android/phone/FdnSetting;->access$600(Lcom/android/phone/FdnSetting;)V

    .line 577
    iget-object v0, p0, Lcom/android/phone/FdnSetting$4;->this$0:Lcom/android/phone/FdnSetting;

    iget-object v1, p0, Lcom/android/phone/FdnSetting$4;->val$button:Lcom/android/phone/EditPinPreference;

    const/4 v2, 0x0

    const/4 v3, 0x1

    #calls: Lcom/android/phone/FdnSetting;->displayPinChangeDialog(Lcom/android/phone/EditPinPreference;IZ)V
    invoke-static {v0, v1, v2, v3}, Lcom/android/phone/FdnSetting;->access$1000(Lcom/android/phone/FdnSetting;Lcom/android/phone/EditPinPreference;IZ)V

    .line 578
    return-void
.end method
