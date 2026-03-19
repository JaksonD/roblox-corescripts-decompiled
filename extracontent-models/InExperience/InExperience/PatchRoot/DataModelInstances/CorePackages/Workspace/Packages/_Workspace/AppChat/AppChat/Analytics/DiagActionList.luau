local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(script.Parent.EventNames);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_DiagEventTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
return {
    [v1.ChatLandingScreenRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingScreenRenderedCounter", "ChatLandingScreenRendered")
    }, 
    [v1.AppChatVisible] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("AppChatVisibleCounter", "AppChatVisible")
    }, 
    [v1.AppChatClosed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("AppChatClosedCounter", "AppChatClosed")
    }, 
    [v1.ChatLandingSearchBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingSearchBtnClickedCounter", "ChatLandingSearchBtnClicked")
    }, 
    [v1.ChatLandingComposeBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingComposeBtnClickedCounter", "ChatLandingComposeBtnClicked")
    }, 
    [v1.ChatLandingNotifBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingNotifBtnClickedCounter", "ChatLandingNotifBtnClicked")
    }, 
    [v1.ChatLandingConversationClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingConversationClickedCounter", "ChatLandingConversationClicked")
    }, 
    [v1.ChatLandingGroupsBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingGroupsBtnClicked", "ChatLandingGroupsBtnClicked")
    }, 
    [v1.ChatLandingPvUpsellRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingPvUpsellRenderedCounter", "ChatLandingPvUpsellRendered")
    }, 
    [v1.ChatLandingPvUpsellDismissed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingPvUpsellDismissedCounter", "ChatLandingPvUpsellDismissed")
    }, 
    [v1.ChatLandingPvUpsellContinueClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingPvUpsellContinueClickedCounter", "ChatLandingPvUpsellContinueClicked")
    }, 
    [v1.ChatLandingPvUpsellSucceeded] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingPvUpsellSucceededCounter", "ChatLandingPvUpsellSucceeded")
    }, 
    [v1.ChatLandingPvUpsellFailed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingPvUpsellFailedCounter", "ChatLandingPvUpsellFailed")
    }, 
    [v1.ChatLandingUnfilteredThreadsFtuxRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingUnfilteredThreadsFtuxRenderedCounter", "ChatLandingUnfilteredThreadsFtuxRendered")
    }, 
    [v1.ChatLandingUnfilteredThreadsFtuxDismissed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingUnfilteredThreadsFtuxDismissedCounter", "ChatLandingUnfilteredThreadsFtuxDismissed")
    }, 
    [v1.ChatLandingUnfilteredThreadsFtuxLearnMoreClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatLandingUnfilteredThreadsFtuxLearnMoreClickedCounter", "ChatLandingUnfilteredThreadsFtuxLearnMoreClicked")
    }, 
    [v1.ConversationScreenRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationScreenRenderedCounter", "ConversationScreenRendered")
    }, 
    [v1.ConversationSendBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationSendBtnClickedCounter", "ConversationSendBtnClicked")
    }, 
    [v1.ConversationScreenExit] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationScreenExitCounter", "ConversationScreenExit")
    }, 
    [v1.ConversationInfoBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationInfoBtnClickedCounter", "ConversationInfoBtnClicked")
    }, 
    [v1.ConversationMessageSent] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationMessageSentCounter", "ConversationMessageSent")
    }, 
    [v1.ConversationPvUpsellRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvUpsellRenderedCounter", "ConversationPvUpsellRendered")
    }, 
    [v1.ConversationPvUpsellLeftGroup] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvUpsellLeftGroupCounter", "ConversationPvUpsellLeftGroup")
    }, 
    [v1.ConversationPvUpsellContinueClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvUpsellContinueClickedCounter", "ConversationPvUpsellContinueClicked")
    }, 
    [v1.ConversationPvUpsellSucceeded] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvUpsellSucceededCounter", "ConversationPvUpsellSucceeded")
    }, 
    [v1.ConversationPvUpsellFailed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvUpsellFailedCounter", "ConversationPvUpsellFailed")
    }, 
    [v1.ConversationIneligibleModalRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationIneligibleModalRenderedCounter", "ConversationIneligibleModalRendered")
    }, 
    [v1.ConversationIneligibleModalLeftGroup] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationIneligibleModalLeftGroupCounter", "ConversationIneligibleModalLeftGroup")
    }, 
    [v1.ConversationIneligibleModalLearnMoreClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationIneligibleModalLearnMoreClickedCounter", "ConversationIneligibleModalLearnMoreClicked")
    }, 
    [v1.ConversationPvBannerRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvBannerRenderedCounter", "ConversationPvBannerRendered")
    }, 
    [v1.ConversationPvBannerActionClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvBannerActionClickedCounter", "ConversationPvBannerActionClicked")
    }, 
    [v1.ConversationUpgradeBannerRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationUpgradeBannerRenderedCounter", "ConversationUpgradeBannerRendered")
    }, 
    [v1.ConversationUpgradeBannerActionClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationUpgradeBannerActionClickedCounter", "ConversationUpgradeBannerActionClicked")
    }, 
    [v1.ConversationLearnMoreBannerRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationLearnMoreBannerRenderedCounter", "ConversationLearnMoreBannerRendered")
    }, 
    [v1.ConversationLearnMoreBannerActionClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationLearnMoreBannerActionClickedCounter", "ConversationLearnMoreBannerActionClicked")
    }, 
    [v1.ConversationPvDialogRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvDialogRenderedCounter", "ConversationPvDialogRendered")
    }, 
    [v1.ConversationPvDialogActionClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvDialogActionClickedCounter", "ConversationPvDialogActionClicked")
    }, 
    [v1.ConversationPvDialogDismissed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvDialogDismissedCounter", "ConversationPvDialogDismissed")
    }, 
    [v1.ConversationPvDialogSucceeded] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvDialogSucceededCounter", "ConversationPvDialogSucceeded")
    }, 
    [v1.ConversationPvDialogFailed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationPvDialogFailedCounter", "ConversationPvDialogFailed")
    }, 
    [v1.ConversationUpgradeDialogRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationUpgradeDialogRenderedCounter", "ConversationUpgradeDialogRendered")
    }, 
    [v1.ConversationUpgradeDialogActionClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationUpgradeDialogActionClickedCounter", "ConversationUpgradeDialogActionClicked")
    }, 
    [v1.ConversationUpgradeDialogDismissed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationUpgradeDialogDismissedCounter", "ConversationUpgradeDialogDismissed")
    }, 
    [v1.ConversationLearnMoreDialogRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationLearnMoreDialogRenderedCounter", "ConversationLearnMoreDialogRendered")
    }, 
    [v1.ConversationLearnMoreDialogDismissed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ConversationLearnMoreDialogDismissedCounter", "ConversationLearnMoreDialogDismissed")
    }, 
    [v1.NewConversationCreated] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("NewConversationCreatedCounter", "NewConversationCreated")
    }, 
    [v1.ChatMessagePressed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatMessagePressedCounter", "ChatMessagePressed")
    }, 
    [v1.ChatMessageLongPressed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatMessageLongPressedCounter", "ChatMessageLongPressed")
    }, 
    [v1.ChatMessageOpenMenuIconClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatMessageOpenMenuIconClickedCounter", "ChatMessageOpenMenuIconClicked")
    }, 
    [v1.ChatMessageReplyIconClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatMessageReplyIconClickedCounter", "ChatMessageReplyIconClicked")
    }, 
    [v1.ChatMessageMenuOpened] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatMessageMenuOpenedCounter", "ChatMessageMenuOpened")
    }, 
    [v1.ChatMessageMenuReplyBtnActivated] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatMessageMenuReplyBtnActivatedCounter", "ChatMessageMenuReplyBtnActivated")
    }, 
    [v1.ChatMessageMenuCopyBtnActivated] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatMessageMenuCopyBtnActivatedCounter", "ChatMessageMenuCopyBtnActivated")
    }, 
    [v1.ChatInputBarReplyComposeRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatInputBarReplyComposeRenderedCounter", "ChatInputBarReplyComposeRendered")
    }, 
    [v1.ChatInputBarReplyComposeCancelBtnActivated] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatInputBarReplyComposeCancelBtnActivatedCounter", "ChatInputBarReplyComposeCancelBtnActivated")
    }, 
    [v1.ChatDetailsRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsRenderedCounter", "ChatDetailsRendered")
    }, 
    [v1.ChatEmptyStateScreenRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatEmptyStateScreenRenderedCounter", "ChatEmptyStateScreenRendered")
    }, 
    [v1.ChatAddFriendsBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatAddFriendsBtnClickedCounter", "ChatAddFriendsBtnClicked")
    }, 
    [v1.ChatDetailsAddFriendsBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsAddFriendsBtnClickedCounter", "ChatDetailsAddFriendsBtnClicked")
    }, 
    [v1.ChatDetailsLeaveGroupBtnClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsLeaveGroupBtnClickedCounter", "ChatDetailsLeaveGroupBtnClicked")
    }, 
    [v1.ChatDetailsLeaveGroupDialogRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsLeaveGroupDialogRenderedCounter", "ChatDetailsLeaveGroupDialogRendered")
    }, 
    [v1.ChatDetailsLeaveGroupDialogStayClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsLeaveGroupDialogStayClickedCounter", "ChatDetailsLeaveGroupDialogStayClicked")
    }, 
    [v1.ChatDetailsLeaveGroupDialogLeaveClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsLeaveGroupDialogLeaveClickedCounter", "ChatDetailsLeaveGroupDialogLeaveClicked")
    }, 
    [v1.ChatDetailsReportUserClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsReportUserClickedCounter", "ChatDetailsReportUserClicked")
    }, 
    [v1.ChatDetailsCreateUnfilteredChatCellRendered] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsCreateUnfilteredChatCellRenderedCounter", "ChatDetailsCreateUnfilteredChatCellRendered")
    }, 
    [v1.ChatDetailsCreateUnfilteredChatCellClicked] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ChatDetailsCreateUnfilteredChatCellClickedCounter", "ChatDetailsCreateUnfilteredChatCellClicked")
    }
};