local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = {
    AbuseReportMenuRootName = "AbuseReportMenuNewRoot", 
    AbuseReportMenuPlaceholderFrame = "AbuseReportMenuPlaceholderFrame", 
    ModalBaseSelectorDialogRootName = "ModalBaseSelectorDialog", 
    ReportModes = {
        Classic = "Classic", 
        SelectInScene = "SelectInScene"
    }, 
    ReportTypes = {
        Person = "Person", 
        Experience = "Experience"
    }, 
    PlayerAbuseTypes = {
        Swearing = "Swearing", 
        Username = "Inappropriate Username", 
        Bullying = "Bullying", 
        Scamming = "Scamming", 
        Dating = "Dating", 
        Cheating = "Cheating/Exploiting", 
        Personal = "Personal Question", 
        Links = "Offsite Links"
    }, 
    PlayerVoiceAbuseTypes = {
        Swearing = "Swearing", 
        Username = "Inappropriate Username", 
        Bullying = "Bullying", 
        Scamming = "Scamming", 
        Dating = "Dating", 
        Cheating = "Cheating/Exploiting", 
        Personal = "Personal Question"
    }, 
    InappropriateContentAbuseReason = "Inappropriate Content", 
    AbuseMethods = {
        TextChat = "Text Chat", 
        VoiceChat = "Voice Chat", 
        Other = "Other", 
        Avatar = "Avatar"
    }
};
v2.AbuseMethodToVectorMapping = {
    [v2.AbuseMethods.TextChat] = "chat", 
    [v2.AbuseMethods.VoiceChat] = "voice", 
    [v2.AbuseMethods.Other] = "other", 
    [v2.AbuseMethods.Avatar] = "avatar"
};
v2.AnalyticsAbuseMethods = {
    Chat = "Chat", 
    Voice = "Voice", 
    Other = "Other", 
    Game = "Game"
};
v2.AbuseMethodToAnalyticsMapping = {
    [v2.AbuseMethods.TextChat] = v2.AnalyticsAbuseMethods.Chat, 
    [v2.AbuseMethods.VoiceChat] = v2.AnalyticsAbuseMethods.Voice, 
    [v2.AbuseMethods.Other] = v2.AnalyticsAbuseMethods.Other, 
    [v2.AbuseMethods.Avatar] = v2.AnalyticsAbuseMethods.Other
};
v2.AbuseMethodSublabel = {
    TextChat = "This person typed a mean word in text chat", 
    VoiceChat = "This person was screaming on top of their lungs", 
    Other = "This person is following me, wearing a bad shirt, etc.", 
    Avatar = "This person's avatar is wearing offensive clothing"
};
v2.PlayerMenuActions = {
    UpdateAbuseReason = "UpdateAbuseReason", 
    UpdateComment = "UpdateComment", 
    UpdateMethodOfAbuse = "UpdateMethodOfAbuse", 
    UpdateAbuser = "UpdateAbuser", 
    UpdatedSelectedChatAndOrderedMessages = "UpdatedSelectedChatAndOrderedMessages", 
    UpdatePlayerNameMap = "UpdatePlayerNameMap", 
    SetVoiceEnabled = "SetVoiceEnabled", 
    ClearState = "ClearState", 
    SetShowModalSelector = "SetShowModalSelector", 
    SetMenuOpenTimestamp = "SetMenuOpenTimestamp", 
    SetPreselectedPlayer = "SetPreselectedPlayer"
};
v2.ReportAnythingActions = {
    ClearAll = "ClearAll", 
    ClearAnnotationFlowProperties = "ClearAnnotationFlowProperties", 
    SetScreenshotId = "SetScreenshotId", 
    SetScreenshotContentId = "SetScreenshotContentId", 
    SetAnnotationPoints = "SetAnnotationPoints", 
    SetIdentificationResults = "SetIdentificationResults", 
    CompleteAttachment = "CompleteAttachment", 
    SetAnnotationAreaDimensions = "SetAnnotationAreaDimensions", 
    SetAnnotationCircleRadius = "SetAnnotationCircleRadius", 
    SetAnnotationOptionSeen = "SetAnnotationOptionSeen"
};
v2.AnalyticsActions = {
    Reset = "Reset", 
    SetMenuOpenedTimestamp = "SetMenuOpenedTimestamp", 
    IncrementExperiencePersonChanged = "IncrementExperiencePersonChanged", 
    IncrementTypeofabuseChanged = "IncrementTypeofabuseChanged", 
    IncrementPersonChanged = "IncrementPersonChanged", 
    IncrementReasonChanged = "IncrementReasonChanged", 
    IncrementCaptureScene = "IncrementCaptureScene", 
    IncrementChatLineChanged = "IncrementChatLineChanged", 
    SetMemoryRequirementMet = "SetMemoryRequirementMet", 
    SetViewportInformation = "SetViewportInformation", 
    SetSubmissionCompleted = "SetSubmissionCompleted", 
    SetTypeOfAbuseSelection = "SetTypeOfAbuseSelection", 
    SetPreselectedAbuseSelection = "SetPreselectedAbuseSelection", 
    SetReasonSelection = "SetReasonSelection", 
    SetCommentAdded = "SetCommentAdded", 
    SwitchToExperienceInitialSelections = "SwitchToExperienceInitialSelections", 
    SwitchToPersonInitialSelections = "SwitchToPersonInitialSelections"
};
v2.ReportSuccessToast = {
    ReportAnythingGeneric = "We\226\128\153ve received your report and will take action soon if needed. Your feedback helps keep our community safe.", 
    ChatGeneric = "Thanks for your report! Our moderators will review the chat logs and evaluate what happened.", 
    Cheating = "Thanks for your report! We've recorded your report for evaluation.", 
    BadUserName = "Thanks for your report! Our moderators will evaluate the username.", 
    Place = "Thanks for your report! Our moderators will review the place and make a determination."
};
v2.localizationKeys = {
    ReportType = "Feature.ReportAbuse.Label.ReportType", 
    Person = "Feature.ReportAbuse.Label.Person", 
    Experience = "Feature.ReportAbuse.Label.Experience", 
    SelectInScene = "Feature.ReportAbuse.Action.SelectInScene", 
    BuildAReport = "Feature.ReportAbuse.Action.BuildAReport", 
    [v2.AbuseMethods.TextChat] = "Feature.ReportAbuse.Label.TextChat", 
    [v2.AbuseMethods.VoiceChat] = "Feature.SettingsHub.MethodOfAbuse.VoiceChat.Title", 
    [v2.AbuseMethods.Other] = "Feature.SettingsHub.MethodOfAbuse.Other.Title", 
    [v2.AbuseMethods.Avatar] = "Feature.ReportAbuse.Label.Avatar", 
    [v2.InappropriateContentAbuseReason] = "Feature.ReportAbuse.Label.Content", 
    [v2.PlayerAbuseTypes.Swearing] = "Feature.ReportAbuse.Problem.Swearing", 
    [v2.PlayerAbuseTypes.Username] = "Feature.ReportAbuse.ProblemSurface.Username", 
    [v2.PlayerAbuseTypes.Bullying] = "Feature.ReportAbuse.Problem.Bullying", 
    [v2.PlayerAbuseTypes.Scamming] = "Feature.ReportAbuse.Problem.Scamming", 
    [v2.PlayerAbuseTypes.Dating] = "Feature.ReportAbuse.Problem.Dating", 
    [v2.PlayerAbuseTypes.Cheating] = "Feature.ReportAbuse.Problem.Cheating", 
    [v2.PlayerAbuseTypes.Personal] = "Feature.ReportAbuse.Problem.Personal", 
    [v2.PlayerAbuseTypes.Links] = "Feature.ReportAbuse.Problem.Links", 
    [v2.PlayerVoiceAbuseTypes.Swearing] = "Feature.ReportAbuse.Problem.Swearing", 
    [v2.PlayerVoiceAbuseTypes.Username] = "Feature.ReportAbuse.ProblemSurface.Username", 
    [v2.PlayerVoiceAbuseTypes.Bullying] = "Feature.ReportAbuse.Problem.Bullying", 
    [v2.PlayerVoiceAbuseTypes.Scamming] = "Feature.ReportAbuse.Problem.Scamming", 
    [v2.PlayerVoiceAbuseTypes.Dating] = "Feature.ReportAbuse.Problem.Dating", 
    [v2.PlayerVoiceAbuseTypes.Cheating] = "Feature.ReportAbuse.Problem.Cheating", 
    [v2.PlayerVoiceAbuseTypes.Personal] = "Feature.ReportAbuse.Problem.Personal", 
    ReasonForAbuse = "Feature.SettingsHub.Label.ReasonForAbuse", 
    AttachScreenshot = "Feature.SettingsHub.Label.AttachScreenshot", 
    SceneCaptured = "Feature.SettingsHub.Label.SceneCaptured", 
    CaptureScene = "Feature.SettingsHub.Action.CaptureScene", 
    MethodOfAbuse = "Feature.SettingsHub.Label.MethodOfAbuse", 
    WhichChat = "Feature.SettingsHub.Label.WhichChatOptional", 
    WhichPerson = "Feature.SettingsHub.Label.WhichPlayer", 
    ChooseOne = "Feature.SettingsHub.Label.ChooseOne", 
    ReportCommentPlaceholder = "Feature.SettingsHub.Label.ReportComment", 
    SubmitButton = "Feature.ReportAbuse.Action.Submit", 
    FooterInformation1 = "Feature.ReportAbuse.Message.OSACopy1", 
    FooterInformation2 = "Feature.ReportAbuse.Message.ReportInformationCopy"
};
v2.InitialIdentificationResults = {
    identifiedAvatars = {}, 
    identifiedAds = {}, 
    avatarIDStats = {
        totalPlayers = 0, 
        checkedPlayers = 0, 
        duration = 0
    }, 
    adIDStats = {
        totalPlayers = 0, 
        checkedPlayers = 0, 
        duration = 0
    }
};
v2.ReportAnythingInitialState = {
    identificationResults = v2.InitialIdentificationResults, 
    screenshotId = "", 
    screenshotContentId = "", 
    attachCompleted = false, 
    annotationPoints = {}
};
v2.AnalyticsInitialState = {
    menuEverShown = false, 
    menuOpenedUnixTimestampMilliseconds = 0, 
    experiencePersonChangeCount = 0, 
    typeofabuseChangeCount = 0, 
    personChangeCount = 0, 
    reasonChangeCount = 0, 
    captureSceneCount = 0, 
    chatLineChangeCount = 0, 
    viewportSizeX = -1, 
    viewportSizeY = -1, 
    isPortraitMode = false, 
    isSubmissionCompleted = false, 
    typeofabuseSelection = nil, 
    reasonSelection = nil, 
    commentAdded = false, 
    experiencePersonSelection = nil, 
    memoryRequirementMet = -1
};
v2.AnalyticsPersonInitialSelections = {
    typeofabuseSelection = nil, 
    reasonSelection = nil, 
    commentAdded = false, 
    experiencePersonSelection = string.lower(v2.ReportTypes.Person)
};
v2.AnalyticsExpeirenceInitialSelections = {
    typeofabuseSelection = v2.AnalyticsAbuseMethods.Game, 
    reasonSelection = v2.InappropriateContentAbuseReason, 
    commentAdded = false, 
    experiencePersonSelection = string.lower(v2.ReportTypes.Experience)
};
v2.AbuseVector = {
    Voice = "voice"
};
v2.MenuItemHeight = 42;
v2.MenuItemHeightTight = 36;
v2.FreeCommentsMenuItemHeight = 60;
v2.FieldLabelSize = 18;
v2.LeftContainerWidth = 240;
v2.RightContainerWidth = 300;
v2.MenuItemDynamicWidthOffset = 100;
v2.FieldLabelSizeSmall = 16;
v2.LeftContainerWidthSmall = 100;
v2.RightContainerWidthSmall = 180;
v2.SmallLayoutThreshold = 540;
v2.ReportMenuFontStyle = "Header1";
v2.ReportMenuButtonSize = 36;
v2.ReportMenuButtonSizeConsole = 48;
v2.InitPersonUIState = {
    reportType = v2.ReportTypes.Person, 
    comment = "", 
    playerObjects = {}, 
    menuContainerWidth = 0, 
    allegedAbuserId = nil, 
    allegedAbuser = nil, 
    abuseReason = nil, 
    methodOfAbuse = nil, 
    isVoiceEnabled = nil, 
    menuOpenedUnixTimestampMilliseconds = nil, 
    modalSelectorCellData = nil, 
    isModalSelectorShown = nil, 
    preselectedPlayer = nil, 
    selectedMessage = nil, 
    orderedMessages = {}
};
v2.InitExperienceUIState = {
    reportType = v2.ReportTypes.Experience, 
    comment = "", 
    abuseReason = v2.InappropriateContentAbuseReason, 
    menuContainerWidth = 0
};
v2.ChatLineReportingVariant = {
    IGM_CLRv1 = "IGM_CLRv1"
};
return v2;