local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Telemetry.Telemetry);
local _ = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local _ = require(l_Parent_0.SocialLuaAnalytics);
local v5 = require(l_script_FirstAncestor_0.Telemetry.DefaultTelemetryEvents);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationBadgingLogging);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatTelemetryCounterWithEmittedInfo;
local l_namedCounterConfigurationNoEmittedInfo_0 = v5.namedCounterConfigurationNoEmittedInfo;
local l_namedCounterConfigurationAndFormat_0 = v5.namedCounterConfigurationAndFormat;
local l_namedStatConfigurationAndFormat_0 = v5.namedStatConfigurationAndFormat;
local l_EVENT_INGEST_NO_EMITTED_INFO_0 = v5.EVENT_INGEST_NO_EMITTED_INFO;
return {
    AppChatVisible = v2.new({
        name = "appChatVisible", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.Navigation.Visible", function(v13) --[[ Line: 28 ]]
                return {
                    isChatEnabled = v13.isChatEnabled, 
                    isChatLoading = v13.isChatLoading
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.Navigation.Visible"), 
            v5.eventIngestWithFormatFunction(function(v14) --[[ Line: 39 ]]
                return {
                    isChatEnabled = v14.isChatEnabled, 
                    isChatLoading = v14.isChatLoading
                };
            end)
        }
    }), 
    AppChatClosed = v2.new({
        name = "appChatClosed", 
        description = "", 
        lastUpdated = {
            2026, 
            2, 
            9
        }, 
        backendsList = {
            l_namedCounterConfigurationAndFormat_0("AppChat.Navigation.Closed", function(v15) --[[ Line: 53 ]]
                return {
                    isChatEnabled = v15.isChatEnabled, 
                    isChatLoading = v15.isChatLoading
                };
            end), 
            v5.eventIngestWithFormatFunction(function(v16) --[[ Line: 63 ]]
                return {
                    isChatEnabled = v16.isChatEnabled, 
                    isChatLoading = v16.isChatLoading
                };
            end)
        }
    }), 
    ScreenRendered = v2.new({
        name = "chatLandingScreenRendered", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.Rendered", function(v17) --[[ Line: 78 ]]
                return {
                    isChatEnabled = v17.isChatEnabled
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Rendered"), 
            v5.eventIngestWithFormatFunction(function(v18) --[[ Line: 86 ]]
                return {
                    isChatEnabled = v18.isChatEnabled
                };
            end)
        }
    }), 
    ChatEmptyStateScreenRendered = v2.new({
        name = "chatEmptyStateScreenRendered", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.EmptyState.Rendered", function(v19) --[[ Line: 101 ]]
                return {
                    emptyStateType = v19.emptyStateType
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.EmptyState.Rendered"), 
            v5.eventIngestWithFormatFunction(function(v20) --[[ Line: 110 ]]
                return {
                    emptyStateType = v20.emptyStateType
                };
            end)
        }
    }), 
    ChatAddFriendsBtnClicked = v2.new({
        name = "chatAddFriendsBtnClicked", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Button.AddConnections"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingSearchBtnClicked = v2.new({
        name = "chatLandingSearchBtnClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Button.Search"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingComposeBtnClicked = v2.new({
        name = "chatLandingComposeBtnClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Button.Compose"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingNotifBtnClicked = v2.new({
        name = "chatLandingNotifBtnClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Button.Notifications"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingSnoozeBtnClicked = v2.new({
        name = "chatLandingSnoozeBtnClicked", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.Button.Snooze", function(v21) --[[ Line: 159 ]]
                return {
                    isChatNotificationsMuted = v21.isChatNotificationsMuted
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Button.Snooze"), 
            v5.eventIngestWithFormatFunction(function(v22) --[[ Line: 168 ]]
                return {
                    isChatNotificationsMuted = v22.isChatNotificationsMuted
                };
            end)
        }
    }), 
    ConversationCellRendered = if v6 then v2.new({
        name = "chatLandingConversationCellRendered", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.ConversationCell.Rendered", function(v23) --[[ Line: 185 ]]
                -- upvalues: v7 (copy)
                return {
                    isFiltered = v23.isFiltered, 
                    hasUnreadMessages = v23.hasUnreadMessages, 
                    selectedConversationModerationType = v23.selectedConversationModerationType, 
                    selectedConversationUserPendingStatus = v23.selectedConversationUserPendingStatus, 
                    osaAcknowledgementStatus = if v7 then v23.osaAcknowledgementStatus else nil
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.ConversationCell.Rendered"), 
            v5.eventIngestWithFormatFunction(function(v24) --[[ Line: 208 ]]
                -- upvalues: v7 (copy)
                return {
                    isFiltered = v24.isFiltered, 
                    conversationListCount = v24.conversationListCount, 
                    selectedConversationId = v24.selectedConversationId, 
                    selectedIndex = v24.selectedIndex, 
                    hasUnreadMessages = v24.hasUnreadMessages, 
                    selectedConversationModerationType = v24.selectedConversationModerationType, 
                    selectedConversationUserPendingStatus = v24.selectedConversationUserPendingStatus, 
                    participantUserIds = v24.participantUserIds, 
                    osaAcknowledgementStatus = if v7 then v24.osaAcknowledgementStatus else nil
                };
            end)
        }
    }) else nil, 
    ConversationCellRenderedIndexStat = v2.new({
        name = "chatLandingConversationCellRenderedIndexStat", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            30
        }, 
        backendsList = {
            l_namedStatConfigurationAndFormat_0("chatLandingConversationCellRenderedIndexStat", function(_) --[[ Line: 241 ]]
                return {};
            end)
        }
    }), 
    ConversationClicked = v2.new({
        name = "chatLandingConversationClicked", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.Button.Conversation", function(v26) --[[ Line: 256 ]]
                -- upvalues: v7 (copy)
                return {
                    isFiltered = v26.isFiltered, 
                    hasUnreadMessages = v26.hasUnreadMessages, 
                    selectedConversationModerationType = v26.selectedConversationModerationType, 
                    selectedConversationUserPendingStatus = v26.selectedConversationUserPendingStatus, 
                    osaAcknowledgementStatus = if v7 then v26.osaAcknowledgementStatus else nil
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Button.Conversation"), 
            v5.eventIngestWithFormatFunction(function(v27) --[[ Line: 280 ]]
                -- upvalues: v6 (copy), v7 (copy)
                return {
                    isFiltered = v27.isFiltered, 
                    conversationListCount = v27.conversationListCount, 
                    selectedConversationId = v27.selectedConversationId, 
                    selectedIndex = v27.selectedIndex, 
                    hasUnreadMessages = v27.hasUnreadMessages, 
                    selectedConversationModerationType = v27.selectedConversationModerationType, 
                    selectedConversationUserPendingStatus = v27.selectedConversationUserPendingStatus, 
                    participantUserIds = if v6 then v27.participantUserIds else nil, 
                    osaAcknowledgementStatus = if v7 then v27.osaAcknowledgementStatus else nil, 
                    osaImpressionId = if v7 then v27.osaImpressionId else nil
                };
            end)
        }
    }), 
    ConversationClickedIndexStat = v2.new({
        name = "chatLandingConversationClickedIndexStat", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            30
        }, 
        backendsList = {
            l_namedStatConfigurationAndFormat_0("chatLandingConversationClickedIndexStat", function(_) --[[ Line: 316 ]]
                return {};
            end)
        }
    }), 
    ChatLandingGroupsBtnClicked = v2.new({
        name = "chatLandingGroupsBtnClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Button.Groups"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingPvUpsellRendered = v2.new({
        name = "chatLandingPvUpsellRendered", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.PvUpsell.Rendered"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingPvUpsellDismissed = v2.new({
        name = "chatLandingPvUpsellDismissed", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.PvUpsell.Dismissed"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingPvUpsellContinueClicked = v2.new({
        name = "chatLandingPvUpsellContinueClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.PvUpsell.Button.Continue"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingPvUpsellSucceeded = v2.new({
        name = "chatLandingPvUpsellSucceeded", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.PvUpsell.Succeeded"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingPvUpsellFailed = v2.new({
        name = "chatLandingPvUpsellFailed", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.PvUpsell.Failed"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingUnfilteredThreadsFtuxRendered = v2.new({
        name = "chatLandingUnfilteredThreadsFtuxRendered", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.UnfilteredThreadsFtux.Rendered"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingUnfilteredThreadsFtuxDismissed = v2.new({
        name = "chatLandingUnfilteredThreadsFtuxDismissed", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.UnfilteredThreadsFtux.Dismissed"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ChatLandingUnfilteredThreadsFtuxLearnMoreClicked = v2.new({
        name = "chatLandingUnfilteredThreadsFtuxLearnMoreClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.UnfilteredThreadsFtux.Button.LearnMore"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    })
};