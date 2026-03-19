local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Telemetry.Telemetry);
local _ = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local _ = require(l_script_FirstAncestor_0.Analytics.Enums.ConversationActionType);
local _ = require(l_Parent_0.SocialLuaAnalytics);
local v6 = require(l_script_FirstAncestor_0.Telemetry.DefaultTelemetryEvents);
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableMessageContextMenu);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableHiddenMessages);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewGameCardUI);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseSwipeForReplies);
local l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatTelemetryCounterWithEmittedInfo;
local l_namedCounterConfigurationNoEmittedInfo_0 = v6.namedCounterConfigurationNoEmittedInfo;
local l_namedCounterConfigurationAndFormat_0 = v6.namedCounterConfigurationAndFormat;
local l_EVENT_INGEST_NO_EMITTED_INFO_0 = v6.EVENT_INGEST_NO_EMITTED_INFO;
local function v17() --[[ Line: 27 ]] --[[ Name: targetMessageFormatFunction ]]
    -- upvalues: v6 (copy), v9 (copy)
    return v6.eventIngestWithFormatFunction(function(v16) --[[ Line: 28 ]]
        -- upvalues: v9 (ref)
        return {
            targetMessageId = v16.targetMessageId, 
            targetMessageSenderId = v16.targetMessageSenderId, 
            targetMessageSentAt = v16.targetMessageSentAt, 
            targetMessageLength = v16.targetMessageLength, 
            targetMessageVisibility = if v9 then v16.targetMessageVisibility else nil
        };
    end);
end;
return {
    ScreenRendered = v2.new({
        name = "conversationScreenRendered", 
        description = "", 
        lastUpdated = {
            2025, 
            7, 
            31
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Rendered"), 
            v6.eventIngestWithFormatFunction(function(v18) --[[ Line: 54 ]]
                return {
                    loadedMessageCount = v18.loadedMessageCount
                };
            end)
        }
    }), 
    ScreenExit = v2.new({
        name = "conversationScreenExit", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Exit", function(v19) --[[ Line: 67 ]]
                return {
                    conversationExitType = v19.conversationExitType
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Exit"), 
            v6.eventIngestWithFormatFunction(function(v20) --[[ Line: 76 ]]
                return {
                    conversationExitType = v20.conversationExitType
                };
            end)
        }
    }), 
    ConversationInfoBtnClicked = v2.new({
        name = "conversationInfoBtnClicked", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Button.Info"), 
            l_EVENT_INGEST_NO_EMITTED_INFO_0
        }
    }), 
    ConversationMessageSent = v2.new({
        name = "conversationMessageSent", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Message.Sent", function(v21) --[[ Line: 99 ]]
                return {
                    messageSentResult = v21.messageSentResult
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.Sent"), 
            v6.eventIngestWithFormatFunction(function(v22) --[[ Line: 115 ]]
                return {
                    messageSentResult = v22.messageSentResult, 
                    messageId = v22.messageId, 
                    recipientIds = v22.recipientIds, 
                    targetMessageId = v22.targetMessageId, 
                    targetMessageSenderId = v22.targetMessageSenderId, 
                    targetMessageSentAt = v22.targetMessageSentAt, 
                    targetMessageLength = v22.targetMessageLength
                };
            end)
        }
    }), 
    ConversationMoreMenuBtnClicked = v2.new({
        name = "conversationMoreMenuBtnClicked", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Button.MoreMenu", function(v23) --[[ Line: 144 ]]
                return {
                    action = v23.action
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Button.MoreMenu"), 
            v6.eventIngestWithFormatFunction(function(v24) --[[ Line: 154 ]]
                return {
                    action = v24.action
                };
            end)
        }
    }), 
    ConversationSendBtnClicked = v2.new({
        name = "conversationSendBtnClicked", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Button.Send", function(v25) --[[ Line: 168 ]]
                return {
                    sendBtnClickResult = v25.sendBtnClickResult
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Button.Send"), 
            v6.eventIngestWithFormatFunction(function(v26) --[[ Line: 178 ]]
                return {
                    sendBtnClickResult = v26.sendBtnClickResult
                };
            end)
        }
    }), 
    ConversationMessagePressed = if v7() then v2.new({
        name = "chatMessagePressed", 
        description = "", 
        lastUpdated = {
            2025, 
            9, 
            9
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.Pressed"), 
            v17()
        }
    }) else nil, 
    ConversationMessageLongPressed = if v7() then v2.new({
        name = "chatMessageLongPressed", 
        description = "", 
        lastUpdated = {
            2025, 
            9, 
            9
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.LongPressed"), 
            v17()
        }
    }) else nil, 
    ConversationMessageSwiped = if v7() and v11 then v2.new({
        name = "chatMessageSwiped", 
        description = "", 
        lastUpdated = {
            2025, 
            11, 
            25
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.Swiped"), 
            v17()
        }
    }) else nil, 
    ConversationMessageReplyIconImpression = if v7() then v2.new({
        name = "chatMessageReplyIconImpression", 
        description = "", 
        lastUpdated = {
            2025, 
            9, 
            9
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.ReplyIcon.Impression"), 
            v17()
        }
    }) else nil, 
    ConversationMessageReplyIconClicked = if v7() then v2.new({
        name = "chatMessageReplyIconClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            9, 
            9
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.ReplyIcon.Clicked"), 
            v17()
        }
    }) else nil, 
    ConversationMessageOpenMenuIconClicked = if v8 then v2.new({
        name = "chatMessageOpenMenuIconClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            9, 
            9
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.OpenMenuIcon.Clicked"), 
            v17()
        }
    }) else nil, 
    ConversationInputBarReplyComposeRendered = if v7() then v2.new({
        name = "chatInputBarReplyComposeRendered", 
        description = "", 
        lastUpdated = {
            2025, 
            9, 
            17
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.ReplyComposeBar.Rendered"), 
            v17()
        }
    }) else nil, 
    ConversationInputBarReplyComposeCancelBtnActivated = if v7() then v2.new({
        name = "chatInputBarReplyComposeCancelBtnActivated", 
        description = "", 
        lastUpdated = {
            2025, 
            9, 
            17
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.ReplyComposeBar.Button.Cancel"), 
            v17()
        }
    }) else nil, 
    ConversationMessageFtuxTooltipImpression = if v7() then v2.new({
        name = "chatMessageFtuxTooltipImpression", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Message.FtuxTooltip.Impression", function(v27) --[[ Line: 282 ]]
                return {
                    tooltipVariant = v27.tooltipVariant
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.FtuxTooltip.Impression"), 
            v6.eventIngestWithFormatFunction(function(v28) --[[ Line: 293 ]]
                return {
                    tooltipVariant = v28.tooltipVariant
                };
            end)
        }
    }) else nil, 
    ConversationMessageFtuxTooltipDismissed = if v7() then v2.new({
        name = "chatMessageFtuxTooltipDismissed", 
        description = "", 
        lastUpdated = {
            2026, 
            1, 
            27
        }, 
        backendsList = {
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Message.FtuxTooltip.Dismissed", function(v29) --[[ Line: 312 ]]
                return {
                    tooltipVariant = v29.tooltipVariant
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.FtuxTooltip.Dismissed"), 
            v6.eventIngestWithFormatFunction(function(v30) --[[ Line: 323 ]]
                return {
                    tooltipVariant = v30.tooltipVariant
                };
            end)
        }
    }) else nil, 
    GameCardThumbnailClicked = if v10 then v2.new({
        name = "gameCardThumbnailClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            11, 
            18
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.GameCard.Thumbnail.Clicked"), 
            v6.eventIngestWithFormatFunction(function(v31) --[[ Line: 340 ]]
                return {
                    universeId = v31.universeId, 
                    placeId = v31.placeId
                };
            end)
        }
    }) else nil, 
    GameCardPlayButtonClicked = if v10 then v2.new({
        name = "gameCardPlayButtonClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            11, 
            18
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.GameCard.Button.Play"), 
            v6.eventIngestWithFormatFunction(function(v32) --[[ Line: 359 ]]
                return {
                    universeId = v32.universeId, 
                    placeId = v32.placeId
                };
            end)
        }
    }) else nil, 
    GameCardMetadataClicked = if v10 then v2.new({
        name = "gameCardMetadataClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            11, 
            19
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.GameCard.Metadata.Clicked"), 
            v6.eventIngestWithFormatFunction(function(v33) --[[ Line: 378 ]]
                return {
                    universeId = v33.universeId, 
                    placeId = v33.placeId
                };
            end)
        }
    }) else nil
};