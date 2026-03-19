local v0 = require(script.Parent.Enums);
local l_ActionTypeEnum_0 = v0.ActionTypeEnum;
local l_VPCErrorCategoriesEnum_0 = v0.VPCErrorCategoriesEnum;
local v3 = {
    [l_ActionTypeEnum_0.GovernmentId] = {
        title = "Feature.AgeVerificationUpsell.Modal.Title", 
        message = "Feature.AgeVerificationUpsell.Modal.ContentText", 
        buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel", 
        buttonSettings = "Feature.AgeVerificationUpsell.Button.Settings"
    }, 
    [l_ActionTypeEnum_0.Phone] = {
        title = "Amp.AccountSettingsUpsell.Phone.Modal.Title", 
        message = "Amp.AccountSettingsUpsell.Phone.Modal.ContentText", 
        buttonCancel = "Amp.AccountSettingsUpsell.Phone.Button.Cancel", 
        buttonSettings = "Amp.AccountSettingsUpsell.Phone.Button.Settings"
    }, 
    [l_ActionTypeEnum_0.Email] = {
        title = "Amp.AccountSettingsUpsell.Email.Modal.Title", 
        message = "Amp.AccountSettingsUpsell.Email.Modal.ContentText", 
        buttonCancel = "Amp.AccountSettingsUpsell.Email.Button.Cancel", 
        buttonSettings = "Amp.AccountSettingsUpsell.Email.Button.Settings"
    }, 
    [l_ActionTypeEnum_0.AddedEmail] = {
        title = "Amp.AccountSettingsUpsell.Email.Modal.Title", 
        message = "Amp.AccountSettingsUpsell.Email.Modal.ContentText", 
        buttonCancel = "Amp.AccountSettingsUpsell.Email.Button.Cancel", 
        buttonSettings = "Amp.AccountSettingsUpsell.Email.Button.Settings"
    }
};
local v4 = {
    title = "Amp.IDVUpsell.Modal.Title", 
    beginText = "Amp.IDVUpsell.Modal.QRHeaderText", 
    disclaimer = "Amp.IDVUpsell.Modal.Disclaimer", 
    privacyLinkText = "Amp.IDVUpsell.Modal.PrivacyLinkText", 
    idDirectionsHeader = "Amp.IDVUpsell.Directions.IDHeader", 
    idDirectionsBody = "Amp.IDVUpsell.Directions.IDBody", 
    phoneDirectionsHeader = "Amp.IDVUpsell.Directions.PhoneHeader", 
    phoneDirectionsBody = "Amp.IDVUpsell.Directions.PhoneBody", 
    privacyPageHeader = "Amp.IDVUpsell.PrivacyPageHeader", 
    ageVerifyPrompt = "Verification.Identity.Label.AgeVerifyPrompt", 
    verifyInBrowser = "Verification.Identity.Label.VerifyInBrowser", 
    dontCloseWindowDisclaimer = "Verification.Identity.Label.PleaseDoNotClose", 
    havingTroubleInfoText = "Verification.Identity.Label.HavingTroubleScanCode", 
    startVerification = "Amp.IDVUpsell.Button.StartVerification", 
    cancel = "Amp.IDVUpsell.Button.Cancel"
};
local v5 = {
    timeout = "Amp.IDVErrorScreen.Timeout", 
    declined = "Amp.IDVErrorScreen.Declined", 
    retry = "Amp.IDVErrorScreen.Retry", 
    close = "Amp.IDVErrorScreen.Close", 
    title = "Amp.IDVErrorScreen.Title"
};
local v6 = {
    titleText = "Feature.Parents.Title.EnterParentEmailV2", 
    buttonText = "Feature.Parents.Action.SendEmail", 
    textFieldHeaderText = "Feature.Parents.Label.EmailCapitalized", 
    errorText = "Feature.Parents.Message.InvalidEmail", 
    emailPlaceholder = "Feature.Parents.Label.Email", 
    privacyLinkText = "Amp.IDVUpsell.PrivacyPageHeader"
};
local v7 = {
    [l_VPCErrorCategoriesEnum_0.InternalVPCError] = {
        title = "Feature.Parents.Title.SomethingWentWrong", 
        body = "Feature.Parents.Message.SomethingWentWrong"
    }, 
    [l_VPCErrorCategoriesEnum_0.InvalidEmail] = {
        title = "Feature.Parents.Title.SomethingWentWrong", 
        body = "Feature.Parents.Message.EmailIneligible"
    }, 
    [l_VPCErrorCategoriesEnum_0.Flooded] = {
        title = "Feature.Parents.Title.SomethingWentWrong", 
        body = "Feature.Parents.Message.TooManyAttempts"
    }, 
    [l_VPCErrorCategoriesEnum_0.SenderFlooded] = {
        title = "Feature.Parents.Title.SomethingWentWrong", 
        body = "Feature.Parents.Message.TooManyAttemptAskParent"
    }, 
    [l_VPCErrorCategoriesEnum_0.ReceiverFlooded] = {
        title = "Feature.Parents.Title.SomethingWentWrong", 
        body = "Feature.Parents.Message.TooManyAttempts"
    }, 
    [l_VPCErrorCategoriesEnum_0.BadUserInput] = {
        title = "Feature.Parents.Title.SomethingWentWrong", 
        body = "Feature.Parents.Message.SomethingWentWrong"
    }, 
    [l_VPCErrorCategoriesEnum_0.UserStateRecoursePathMismatch] = {
        title = "Feature.Parents.Title.SomethingWentWrong", 
        body = "Feature.Parents.Message.SomethingWentWrong"
    }, 
    [l_VPCErrorCategoriesEnum_0.SenderFloodedRequestCreated] = {
        title = "Amp.Upsell.Title.RequestSent", 
        body = "Feature.Parents.Message.RequestCreatedEmailNotSent"
    }, 
    [l_VPCErrorCategoriesEnum_0.GenericError] = {
        title = "Feature.Parents.Title.SomethingWentWrong", 
        body = "Feature.Parents.Message.SomethingWentWrong"
    }, 
    [l_VPCErrorCategoriesEnum_0.ConflictingPendingConsent] = {
        title = "Feature.Parents.Title.SomethingWentWrong", 
        body = "Feature.Parents.Message.ConflictingPendingConsent"
    }
};
local v8 = {
    retryButton = "Amp.ErrorScreen.Retry", 
    cancelButton = "Amp.ErrorScreen.Cancel", 
    okButton = "CommonUI.Controls.Action.OK"
};
local v9 = {
    title = "Amp.Upsell.Title.RequestSent", 
    oneParentBody = "Amp.Upsell.Message.EmailSent", 
    multipleParentsBody = "Amp.Upsell.Message.EmailSentPluralParent", 
    buttonText = "CommonUI.Controls.Action.OK"
};
return {
    accountSettingsUpsellStrings = v3, 
    idvWithQRCodeUpsellStrings = v4, 
    idvErrorScreenStrings = v5, 
    vpcUpsellGatherEmailStrings = v6, 
    vpcErrorCategoryToMessageStrings = v7, 
    vpcErrorScreenStrings = v8, 
    vpcConfirmationScreenStrings = v9
};