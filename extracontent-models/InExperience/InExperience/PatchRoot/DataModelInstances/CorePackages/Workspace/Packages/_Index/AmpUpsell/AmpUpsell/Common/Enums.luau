local v0 = {
    Phone = "Phone", 
    GovernmentId = "GovernmentId", 
    Email = "Email", 
    AddedEmail = "AddedEmail", 
    ParentConsent = "ParentConsent", 
    ParentLink = "ParentLink", 
    AgeEstimation = "AgeEstimation", 
    Subscription = "Subscription", 
    CardVerification = "CardVerification", 
    Wait = "Wait", 
    UserAgreement = "UserAgreement", 
    UserSettings = "UserSettings", 
    Invalid = "Invalid"
};
local v1 = {
    Granted = "Granted", 
    Denied = "Denied", 
    Actionable = "Actionable", 
    Pending = "Pending", 
    Error = "Error"
};
local v2 = {
    Success = "Success", 
    Failure = "Failure", 
    Cancelled = "Cancelled", 
    Unknown = "Unknown", 
    RetryRequested = "RetryRequested"
};
local v3 = {
    AllowFacialAgeEstimation = "allowFacialAgeEstimation"
};
local v4 = {
    ChargebackReenableAccount = "ChargebackReenableAccount", 
    SavePaymentMethods = "SavePaymentMethods", 
    UpdateUserSetting = "UpdateUserSetting", 
    UpdateBirthdate = "UpdateBirthdate", 
    LinkToChild = "LinkToChild", 
    ManageFriend = "ManageFriend", 
    ManageExperience = "ManageExperience", 
    LiftPunishment = "LiftPunishment", 
    AddTrustedConnection = "AddTrustedConnection", 
    SendTransfer = "SendTransfer", 
    ReceiveTransfer = "ReceiveTransfer", 
    Unknown = "Unknown"
};
local v5 = {
    ConnectedMobile = 1, 
    Verified = 2, 
    GotResults = 3, 
    UpdatedRobloxProfile = 4
};
local v6 = {
    Error = 1, 
    RequestSent = 2, 
    AlreadyLinkedSendRequest = 3, 
    NewParentCollectEmail = 4, 
    NewParentSendRequest = 5, 
    NewParentLoading = 6
};
local v7 = {
    InternalVPCError = "InternalVPCError", 
    InvalidEmail = "InvalidEmail", 
    Flooded = "Flooded", 
    ReceiverFlooded = "ReceiverFlooded", 
    SenderFlooded = "SenderFlooded", 
    BadUserInput = "BadUserInput", 
    UserStateRecoursePathMismatch = "UserStateRecoursePathMismatch", 
    SenderFloodedRequestCreated = "SenderFloodedRequestCreated", 
    GenericError = "GenericError", 
    ConflictingPendingConsent = "ConflictingPendingConsent"
};
local v8 = {
    RetryVPC = "RetryVPC", 
    RetryAMP = "RetryAMP", 
    NoRetry = "NoRetry", 
    Success = "Success"
};
local v9 = {
    InvalidEmailAddress = "InvalidEmailAddress", 
    EmailNotUnique = "EmailNotUnique", 
    LinkingIneligible = "LinkingIneligible", 
    ParentAtLinkLimit = "ParentAtLinkLimit", 
    SenderFlooded = "SenderFlooded", 
    ReceiverFlooded = "ReceiverFlooded", 
    InvalidParameter = "InvalidParameter", 
    UpdateUserSettingRequestInvalid = "UpdateUserSettingRequestInvalid", 
    AlreadyLinked = "AlreadyLinked", 
    ChildAtLinkLimit = "ChildAtLinkLimit", 
    NoLinkedParents = "NoLinkedParents", 
    SenderFloodedRequestCreated = "SenderFloodedRequestCreated", 
    Unknown = "Unknown", 
    ServiceUnavailable = "ServiceUnavailable", 
    IllegalState = "IllegalState", 
    InvalidUserID = "InvalidUserID", 
    ConsentAlreadyApplied = "ConsentAlreadyApplied", 
    ConsentAlreadyRequestedConflictingData = "ConsentAlreadyRequestedConflictingData", 
    ReceiverNotWhitelisted = "ReceiverNotWhitelisted", 
    InvalidComplianceFeature = "InvalidComplianceFeature", 
    ChildTooOld = "ChildTooOld", 
    UserForgotten = "UserForgotten", 
    UnsupportedNotificationType = "UnsupportedNotificationType", 
    UnsupportedRequestType = "UnsupportedRequestType", 
    ChildIneligibleForConsent = "ChildIneligibleForConsent"
};
return {
    ActionTypeEnum = v0, 
    AccessResponseEnum = v1, 
    ActionStatusEnum = v2, 
    VPCRequestTypeEnum = v4, 
    IDVStep = v5, 
    VPCStepEnum = v6, 
    VPCErrorCategoriesEnum = v7, 
    VPCRetryBehaviorEnum = v8, 
    UserSettingsSettingNameEnum = v3, 
    VPCErrorCodesEnum = v9
};