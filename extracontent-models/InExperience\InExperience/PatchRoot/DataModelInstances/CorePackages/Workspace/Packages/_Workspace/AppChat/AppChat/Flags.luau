return {
    getFFlagEnableModularExternalNavigationHandler = require(script.getFFlagEnableModularExternalNavigationHandler), 
    getFFlagEnableStandaloneAppChat = require(script.getFFlagEnableStandaloneAppChat), 
    getFFlagChatTabHideGroupsLinkOnVR = require(script.getFFlagChatTabHideGroupsLinkOnVR), 
    FFlagRenderSquadLobbyOnlyWhenVisible = require(script.FFlagRenderSquadLobbyOnlyWhenVisible), 
    FFlagGroupOSAGetConversationParticipants = game:DefineFastFlag("GroupOSAGetConversationParticipants2", false), 
    FFlagAppChatTelemetryCounterWithEmittedInfo = game:DefineFastFlag("AppChatTelemetryCounterWithEmittedInfo", false), 
    FFlagAppChatTelemetryStats = game:DefineFastFlag("AppChatTelemetryStats", false), 
    FFlagAppChatSuppressGroupOSAContextCard = require(script.FFlagAppChatSuppressGroupOSAContextCard), 
    FFlagAppChatConversationHeaderTCIndicator = require(script.FFlagAppChatConversationHeaderTCIndicator), 
    FFlagAppChatExcludeSyntheticPreviewFromMessages = game:DefineFastFlag("AppChatExcludeSyntheticPreviewFromMessages", false), 
    FFlagAppChatShowInvitedStatusInParticipantList = game:DefineFastFlag("AppChatShowInvitedStatusInParticipantList", false)
};