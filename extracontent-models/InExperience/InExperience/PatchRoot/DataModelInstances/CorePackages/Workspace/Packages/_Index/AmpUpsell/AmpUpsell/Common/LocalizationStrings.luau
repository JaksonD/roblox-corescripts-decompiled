local v0 = require(script.Parent.Enums);
local _ = require(script.Parent.Types);
local l_ActionTypeEnum_0 = v0.ActionTypeEnum;
local l_UserSettingsSettingNameEnum_0 = v0.UserSettingsSettingNameEnum;
local l_VPCErrorCategoriesEnum_0 = v0.VPCErrorCategoriesEnum;
local v5 = {
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
local v6 = {
    [l_UserSettingsSettingNameEnum_0.AllowFacialAgeEstimation] = {
        title = "Feature.AgeVerificationUpsell.Modal.Title", 
        message = "Feature.AgeVerificationUpsell.Modal.ContentText", 
        buttonCancel = "Feature.AgeVerificationUpsell.Button.Cancel", 
        buttonSettings = "Feature.AgeVerificationUpsell.Button.Settings"
    }
};
local function v10(v7) --[[ Line: 53 ]] --[[ Name: accountSettingsUpsellStringsFn ]]
    -- upvalues: l_ActionTypeEnum_0 (copy), v6 (copy), v5 (copy)
    local l_action_0 = v7.action;
    if l_action_0 == l_ActionTypeEnum_0.UserSettings then
        local l_userSettings_0 = v7.userSettings;
        if l_userSettings_0 and l_userSettings_0.settingName then
            return v6[l_userSettings_0.settingName];
        else
            return nil;
        end;
    else
        return v5[l_action_0];
    end;
end;
local v11 = {
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
local v12 = {
    timeout = "Amp.IDVErrorScreen.Timeout", 
    declined = "Amp.IDVErrorScreen.Declined", 
    retry = "Amp.IDVErrorScreen.Retry", 
    close = "Amp.IDVErrorScreen.Close", 
    title = "Amp.IDVErrorScreen.Title"
};
local v13 = {
    titleText = "Feature.Parents.Title.EnterParentEmailV2", 
    buttonText = "Feature.Parents.Action.SendEmail", 
    textFieldHeaderText = "Feature.Parents.Label.ParentEmail", 
    errorText = "Feature.Parents.Message.InvalidEmail", 
    emailPlaceholder = "Feature.Parents.Label.Email", 
    privacyLinkText = "Amp.IDVUpsell.PrivacyPageHeader", 
    childInstructions = "Feature.Parents.Description.EnterParentEmail.ChildInstructions", 
    parentInstructionsPC = "Feature.Parents.Description.EnterParentEmail.PC", 
    parentInstructionsNoPC = "Feature.Parents.Description.EnterParentEmail.NoPC"
};
local v14 = {
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
local v15 = {
    retryButton = "Amp.ErrorScreen.Retry", 
    cancelButton = "Amp.ErrorScreen.Cancel", 
    okButton = "CommonUI.Controls.Action.OK"
};
local v16 = {
    title = "Amp.Upsell.Title.RequestSent", 
    oneParentBody = "Amp.Upsell.Message.EmailSent", 
    multipleParentsBody = "Amp.Upsell.Message.EmailSentPluralParent", 
    buttonText = "CommonUI.Controls.Action.OK"
};
return {
    accountSettingsUpsellStringsFn = v10, 
    accountSettingsUpsellStrings = v5, 
    idvWithQRCodeUpsellStrings = v11, 
    idvErrorScreenStrings = v12, 
    vpcUpsellGatherEmailStrings = v13, 
    vpcErrorCategoryToMessageStrings = v14, 
    vpcErrorScreenStrings = v15, 
    vpcConfirmationScreenStrings = v16
};