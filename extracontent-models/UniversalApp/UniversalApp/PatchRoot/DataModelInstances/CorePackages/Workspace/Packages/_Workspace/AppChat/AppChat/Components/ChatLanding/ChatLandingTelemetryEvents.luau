local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Telemetry.Telemetry);
local _ = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local _ = require(l_Parent_0.SocialLuaAnalytics);
local v5 = require(l_script_FirstAncestor_0.Telemetry.DefaultTelemetryEvents);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.Navigation.Visible", function(v12) --[[ Line: 27 ]]
                return {
                    isChatEnabled = v12.isChatEnabled, 
                    isChatLoading = v12.isChatLoading
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.Navigation.Visible"), 
            v5.eventIngestWithFormatFunction(function(v13) --[[ Line: 38 ]]
                return {
                    isChatEnabled = v13.isChatEnabled, 
                    isChatLoading = v13.isChatLoading
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
            l_namedCounterConfigurationAndFormat_0("AppChat.Navigation.Closed", function(v14) --[[ Line: 52 ]]
                return {
                    isChatEnabled = v14.isChatEnabled, 
                    isChatLoading = v14.isChatLoading
                };
            end), 
            v5.eventIngestWithFormatFunction(function(v15) --[[ Line: 62 ]]
                return {
                    isChatEnabled = v15.isChatEnabled, 
                    isChatLoading = v15.isChatLoading
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.Rendered", function(v16) --[[ Line: 77 ]]
                return {
                    isChatEnabled = v16.isChatEnabled
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Rendered"), 
            v5.eventIngestWithFormatFunction(function(v17) --[[ Line: 85 ]]
                return {
                    isChatEnabled = v17.isChatEnabled
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.EmptyState.Rendered", function(v18) --[[ Line: 100 ]]
                return {
                    emptyStateType = v18.emptyStateType
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.EmptyState.Rendered"), 
            v5.eventIngestWithFormatFunction(function(v19) --[[ Line: 109 ]]
                return {
                    emptyStateType = v19.emptyStateType
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.Button.Snooze", function(v20) --[[ Line: 158 ]]
                return {
                    isChatNotificationsMuted = v20.isChatNotificationsMuted
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Button.Snooze"), 
            v5.eventIngestWithFormatFunction(function(v21) --[[ Line: 167 ]]
                return {
                    isChatNotificationsMuted = v21.isChatNotificationsMuted
                };
            end)
        }
    }), 
    ConversationCellRendered = v2.new({
        name = "chatLandingConversationCellRendered", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.ConversationCell.Rendered", function(v22) --[[ Line: 183 ]]
                -- upvalues: v6 (copy)
                return {
                    isFiltered = v22.isFiltered, 
                    hasUnreadMessages = v22.hasUnreadMessages, 
                    selectedConversationModerationType = v22.selectedConversationModerationType, 
                    selectedConversationUserPendingStatus = v22.selectedConversationUserPendingStatus, 
                    osaAcknowledgementStatus = if v6 then v22.osaAcknowledgementStatus else nil
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.ConversationCell.Rendered"), 
            v5.eventIngestWithFormatFunction(function(v23) --[[ Line: 206 ]]
                -- upvalues: v6 (copy)
                return {
                    isFiltered = v23.isFiltered, 
                    conversationListCount = v23.conversationListCount, 
                    selectedConversationId = v23.selectedConversationId, 
                    selectedIndex = v23.selectedIndex, 
                    hasUnreadMessages = v23.hasUnreadMessages, 
                    selectedConversationModerationType = v23.selectedConversationModerationType, 
                    selectedConversationUserPendingStatus = v23.selectedConversationUserPendingStatus, 
                    participantUserIds = v23.participantUserIds, 
                    osaAcknowledgementStatus = if v6 then v23.osaAcknowledgementStatus else nil
                };
            end)
        }
    }), 
    ConversationCellRenderedIndexStat = v2.new({
        name = "chatLandingConversationCellRenderedIndexStat", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            30
        }, 
        backendsList = {
            l_namedStatConfigurationAndFormat_0("chatLandingConversationCellRenderedIndexStat", function(_) --[[ Line: 238 ]]
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatLanding.Button.Conversation", function(v25) --[[ Line: 253 ]]
                -- upvalues: v6 (copy)
                return {
                    isFiltered = v25.isFiltered, 
                    hasUnreadMessages = v25.hasUnreadMessages, 
                    selectedConversationModerationType = v25.selectedConversationModerationType, 
                    selectedConversationUserPendingStatus = v25.selectedConversationUserPendingStatus, 
                    osaAcknowledgementStatus = if v6 then v25.osaAcknowledgementStatus else nil
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatLanding.Button.Conversation"), 
            v5.eventIngestWithFormatFunction(function(v26) --[[ Line: 277 ]]
                -- upvalues: v6 (copy)
                return {
                    isFiltered = v26.isFiltered, 
                    conversationListCount = v26.conversationListCount, 
                    selectedConversationId = v26.selectedConversationId, 
                    selectedIndex = v26.selectedIndex, 
                    hasUnreadMessages = v26.hasUnreadMessages, 
                    selectedConversationModerationType = v26.selectedConversationModerationType, 
                    selectedConversationUserPendingStatus = v26.selectedConversationUserPendingStatus, 
                    participantUserIds = v26.participantUserIds, 
                    osaAcknowledgementStatus = if v6 then v26.osaAcknowledgementStatus else nil, 
                    osaImpressionId = if v6 then v26.osaImpressionId else nil
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
            l_namedStatConfigurationAndFormat_0("chatLandingConversationClickedIndexStat", function(_) --[[ Line: 311 ]]
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