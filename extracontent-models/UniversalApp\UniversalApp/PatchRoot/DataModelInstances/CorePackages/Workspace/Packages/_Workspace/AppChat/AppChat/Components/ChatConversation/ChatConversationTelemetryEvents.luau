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
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseSwipeForReplies);
local l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatTelemetryCounterWithEmittedInfo;
local l_namedCounterConfigurationNoEmittedInfo_0 = v6.namedCounterConfigurationNoEmittedInfo;
local l_namedCounterConfigurationAndFormat_0 = v6.namedCounterConfigurationAndFormat;
local l_EVENT_INGEST_NO_EMITTED_INFO_0 = v6.EVENT_INGEST_NO_EMITTED_INFO;
local function v16() --[[ Line: 26 ]] --[[ Name: targetMessageFormatFunction ]]
    -- upvalues: v6 (copy), v9 (copy)
    return v6.eventIngestWithFormatFunction(function(v15) --[[ Line: 27 ]]
        -- upvalues: v9 (ref)
        return {
            targetMessageId = v15.targetMessageId, 
            targetMessageSenderId = v15.targetMessageSenderId, 
            targetMessageSentAt = v15.targetMessageSentAt, 
            targetMessageLength = v15.targetMessageLength, 
            targetMessageVisibility = if v9 then v15.targetMessageVisibility else nil
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
            v6.eventIngestWithFormatFunction(function(v17) --[[ Line: 53 ]]
                return {
                    loadedMessageCount = v17.loadedMessageCount
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Exit", function(v18) --[[ Line: 66 ]]
                return {
                    conversationExitType = v18.conversationExitType
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Exit"), 
            v6.eventIngestWithFormatFunction(function(v19) --[[ Line: 75 ]]
                return {
                    conversationExitType = v19.conversationExitType
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Message.Sent", function(v20) --[[ Line: 98 ]]
                return {
                    messageSentResult = v20.messageSentResult
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.Sent"), 
            v6.eventIngestWithFormatFunction(function(v21) --[[ Line: 114 ]]
                return {
                    messageSentResult = v21.messageSentResult, 
                    messageId = v21.messageId, 
                    recipientIds = v21.recipientIds, 
                    targetMessageId = v21.targetMessageId, 
                    targetMessageSenderId = v21.targetMessageSenderId, 
                    targetMessageSentAt = v21.targetMessageSentAt, 
                    targetMessageLength = v21.targetMessageLength
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Button.MoreMenu", function(v22) --[[ Line: 143 ]]
                return {
                    action = v22.action
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Button.MoreMenu"), 
            v6.eventIngestWithFormatFunction(function(v23) --[[ Line: 153 ]]
                return {
                    action = v23.action
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Button.Send", function(v24) --[[ Line: 167 ]]
                return {
                    sendBtnClickResult = v24.sendBtnClickResult
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Button.Send"), 
            v6.eventIngestWithFormatFunction(function(v25) --[[ Line: 177 ]]
                return {
                    sendBtnClickResult = v25.sendBtnClickResult
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
            v16()
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
            v16()
        }
    }) else nil, 
    ConversationMessageSwiped = if v7() and v10 then v2.new({
        name = "chatMessageSwiped", 
        description = "", 
        lastUpdated = {
            2025, 
            11, 
            25
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.Swiped"), 
            v16()
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
            v16()
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
            v16()
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
            v16()
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
            v16()
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
            v16()
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Message.FtuxTooltip.Impression", function(v26) --[[ Line: 281 ]]
                return {
                    tooltipVariant = v26.tooltipVariant
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.FtuxTooltip.Impression"), 
            v6.eventIngestWithFormatFunction(function(v27) --[[ Line: 292 ]]
                return {
                    tooltipVariant = v27.tooltipVariant
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
            if l_FFlagAppChatTelemetryCounterWithEmittedInfo_0 then l_namedCounterConfigurationAndFormat_0("AppChat.ChatConversation.Message.FtuxTooltip.Dismissed", function(v28) --[[ Line: 311 ]]
                return {
                    tooltipVariant = v28.tooltipVariant
                };
            end) else l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.Message.FtuxTooltip.Dismissed"), 
            v6.eventIngestWithFormatFunction(function(v29) --[[ Line: 322 ]]
                return {
                    tooltipVariant = v29.tooltipVariant
                };
            end)
        }
    }) else nil, 
    GameCardThumbnailClicked = v2.new({
        name = "gameCardThumbnailClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            11, 
            18
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.GameCard.Thumbnail.Clicked"), 
            v6.eventIngestWithFormatFunction(function(v30) --[[ Line: 338 ]]
                return {
                    universeId = v30.universeId, 
                    placeId = v30.placeId
                };
            end)
        }
    }), 
    GameCardPlayButtonClicked = v2.new({
        name = "gameCardPlayButtonClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            11, 
            18
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.GameCard.Button.Play"), 
            v6.eventIngestWithFormatFunction(function(v31) --[[ Line: 355 ]]
                return {
                    universeId = v31.universeId, 
                    placeId = v31.placeId
                };
            end)
        }
    }), 
    GameCardMetadataClicked = v2.new({
        name = "gameCardMetadataClicked", 
        description = "", 
        lastUpdated = {
            2025, 
            11, 
            19
        }, 
        backendsList = {
            l_namedCounterConfigurationNoEmittedInfo_0("AppChat.ChatConversation.GameCard.Metadata.Clicked"), 
            v6.eventIngestWithFormatFunction(function(v32) --[[ Line: 372 ]]
                return {
                    universeId = v32.universeId, 
                    placeId = v32.placeId
                };
            end)
        }
    })
};