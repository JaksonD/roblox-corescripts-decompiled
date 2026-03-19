local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local l_Contexts_0 = l_Enums_0.Contexts;
local v6 = require(script.Parent.EventNames);
local l_SendButtonClickActionResult_0 = require(script.Parent.Enums).SendButtonClickActionResult;
local l_ConversationExitType_0 = require(script.Parent.Enums).ConversationExitType;
local l_EmptyStateType_0 = require(script.Parent.Enums).EmptyStateType;
return {
    [v6.AppChatVisible] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.AppChatVisible, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            isChatEnabled = v2.identity, 
            isChatLoading = v2.identity, 
            chatLandingListCount = v2.identity
        }
    }, 
    [v6.AppChatClosed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.AppChatClosed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            isChatEnabled = v2.identity, 
            isChatLoading = v2.identity, 
            chatLandingListCount = v2.identity
        }
    }, 
    [v6.ChatLandingScreenRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingScreenRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            isChatEnabled = v2.identity
        }
    }, 
    [v6.ChatLandingSearchBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingSearchBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingComposeBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingComposeBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingNotifBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingNotifBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingSnoozeBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingSnoozeBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId, 
            isChatNotificationsMuted = v2.identity
        }
    }, 
    [v6.ChatLandingConversationClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingConversationClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            isFiltered = v2.identity, 
            conversationListCount = v2.identity, 
            selectedConversationId = v2.identity, 
            selectedIndex = v2.identity, 
            hasUnreadMessages = v2.identity, 
            selectedConversationModerationType = v2.identity, 
            selectedConversationUserPendingStatus = v2.identity
        }
    }, 
    [v6.ChatLandingGroupsBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingGroupsBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {}
    }, 
    [v6.ChatLandingPartyQuickStartButtonClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingPartyQuickStartButtonClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            clickLocation = v2.identity, 
            partyAttemptId = v2.identity, 
            placeId = v2.identity, 
            universeId = v2.identity
        }
    }, 
    [v6.ChatLandingPvUpsellRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingPvUpsellRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingPvUpsellDismissed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingPvUpsellDismissed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingPvUpsellContinueClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingPvUpsellContinueClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingPvUpsellSucceeded] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingPvUpsellSucceeded, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingPvUpsellFailed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingPvUpsellFailed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingUnfilteredThreadsFtuxRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingUnfilteredThreadsFtuxRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingUnfilteredThreadsFtuxDismissed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingUnfilteredThreadsFtuxDismissed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }, 
    [v6.ConversationScreenRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationScreenRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            loadedMessageCount = v2.identity
        }
    }, 
    [v6.ConversationSendBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationSendBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            sendBtnClickResult = l_SendButtonClickActionResult_0
        }
    }, 
    [v6.ConversationScreenExit] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationScreenExit, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            conversationExitType = l_ConversationExitType_0
        }
    }, 
    [v6.ConversationInfoBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationInfoBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.NewConversationCreated] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.NewConversationCreated, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            createConversationResult = v2.identity, 
            participantsCount = v2.identity, 
            createdReason = v2.identity
        }
    }, 
    [v6.ChatMessagePressed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatMessagePressed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatMessageLongPressed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatMessageLongPressed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatMessageOpenMenuIconClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatMessageOpenMenuIconClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatMessageReplyIconClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatMessageReplyIconClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatMessageMenuOpened] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatMessageMenuOpened, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatMessageMenuReplyBtnActivated] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatMessageMenuReplyBtnActivated, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatMessageMenuCopyBtnActivated] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatMessageMenuCopyBtnActivated, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatInputBarReplyComposeRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatInputBarReplyComposeRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatInputBarReplyComposeCancelBtnActivated] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatInputBarReplyComposeCancelBtnActivated, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatDetailsRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            participantsCount = v2.identity, 
            isGroupOwner = v2.identity, 
            isGroupConversation = v2.identity
        }
    }, 
    [v6.ConversationMessageSent] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationMessageSent, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            messageSentResult = v2.identity, 
            messageId = v2.identity, 
            recipientIds = v2.identity, 
            targetMessageId = v2.identity, 
            targetMessageSenderId = v2.identity, 
            targetMessageSentAt = v2.identity, 
            targetMessageLength = v2.identity
        }
    }, 
    [v6.ChatEmptyStateScreenRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatEmptyStateScreenRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            emptyStateType = l_EmptyStateType_0
        }
    }, 
    [v6.ChatAddFriendsBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatAddFriendsBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {}
    }, 
    [v6.ChatDetailsAddFriendsBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsAddFriendsBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            participantsCount = v2.identity, 
            isGroupOwner = v2.identity, 
            isGroupConversation = v2.identity
        }
    }, 
    [v6.ChatDetailsLeaveGroupBtnClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsLeaveGroupBtnClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            participantsCount = v2.identity, 
            isGroupOwner = v2.identity
        }
    }, 
    [v6.ChatDetailsLeaveGroupDialogRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsLeaveGroupDialogRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ChatDetailsLeaveGroupDialogStayClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsLeaveGroupDialogStayClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ChatDetailsLeaveGroupDialogLeaveClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsLeaveGroupDialogLeaveClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            selectedConversationHasGroupUp = v2.identity
        }
    }, 
    [v6.ChatDetailsReportUserClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsReportUserClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ChatDetailsCreateUnfilteredChatCellRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsCreateUnfilteredChatCellRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ChatDetailsCreateUnfilteredChatCellClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ChatDetailsCreateUnfilteredChatCellClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity, 
            participantsCount = v2.identity, 
            isGroupOwner = v2.identity
        }
    }, 
    [v6.ConversationPvUpsellRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvUpsellRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvUpsellLeftGroup] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvUpsellLeftGroup, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvUpsellContinueClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvUpsellContinueClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvUpsellSucceeded] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvUpsellSucceeded, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvUpsellFailed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvUpsellFailed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationIneligibleModalRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationIneligibleModalRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationIneligibleModalLeftGroup] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationIneligibleModalLeftGroup, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationIneligibleModalLearnMoreClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationIneligibleModalLearnMoreClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvBannerRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvBannerRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvBannerActionClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvBannerActionClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationUpgradeBannerRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationUpgradeBannerRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationUpgradeBannerActionClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationUpgradeBannerActionClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationLearnMoreBannerRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationLearnMoreBannerRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationLearnMoreBannerActionClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationLearnMoreBannerActionClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvDialogRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvDialogRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvDialogActionClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvDialogActionClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvDialogDismissed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvDialogDismissed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvDialogSucceeded] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvDialogSucceeded, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationPvDialogFailed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationPvDialogFailed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationUpgradeDialogRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationUpgradeDialogRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationUpgradeDialogActionClicked] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationUpgradeDialogActionClicked, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationUpgradeDialogDismissed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationUpgradeDialogDismissed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationLearnMoreDialogRendered] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationLearnMoreDialogRendered, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.ConversationLearnMoreDialogDismissed] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.ConversationLearnMoreDialogDismissed, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            conversationId = v2.identity
        }
    }, 
    [v6.preloadSocialTabDataEvent] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.preloadSocialTabDataEvent, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, 
        formatRulesForAdditionalInfo = {
            unreadConversationCount = v2.identity
        }
    }, 
    [v6.preloadSocialTabDataFailedEvent] = {
        context = l_Contexts_0.PlatformChat, 
        eventType = l_EventTypes_0.preloadSocialTabDataFailedEvent, 
        additionalInfo = {
            locale = l_LocalizationService_0.RobloxLocaleId
        }
    }
};