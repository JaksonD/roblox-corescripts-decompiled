local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useIsLocalPlayerPartyVoiceEligible_0 = require(l_Parent_0.SquadsCore).Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useState_0 = v4.useState;
local v14 = require(l_Parent_0.AppChatNetworking);
local v15 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v16 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v16.Core.Style.useStyle;
local l_useLayerCollector_0 = v16.Core.Layout.LayerCollector.useLayerCollector;
local v19 = require(script.Parent.PartialModal);
local v22 = {
    conversationId = "", 
    onDismissed = function() --[[ Line: 41 ]] --[[ Name: onDismissed ]]

    end, 
    navigateToConversation = function(_) --[[ Line: 42 ]] --[[ Name: navigateToConversation ]]

    end, 
    navigateToToast = function(_) --[[ Line: 43 ]] --[[ Name: navigateToToast ]]

    end, 
    titleKey = "Feature.Chat.Heading.CreateUnfilteredChatDialog", 
    bodyKey = "Feature.Chat.Description.CreateUnfilteredChatDialog", 
    bodyKeyWithVoice = "Feature.Chat.Description.CreateUnfilteredChatWithVoice", 
    networkErrorTextKey = "Feature.Toast.NetworkingError.SomethingIsWrong", 
    actionKey = "Feature.Chat.Action.Create", 
    cancelAlertKey = "Feature.Chat.Action.Cancel"
};
return l_memo_0(function(v23) --[[ Line: 53 ]] --[[ Name: CreateUnfilteredChatPartialModalContainer ]]
    -- upvalues: v3 (copy), v22 (copy), l_useStyle_0 (copy), l_useScreenSize_0 (copy), l_useLayerCollector_0 (copy), l_useState_0 (copy), l_useDispatch_0 (copy), v6 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useEffectOnMount_0 (copy), v15 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v14 (copy), v4 (copy), v19 (copy)
    local v24 = v3.Dictionary.union(v22, v23);
    local v25 = l_useStyle_0();
    local v26 = l_useScreenSize_0();
    local v27 = l_useLayerCollector_0();
    if v27 and v27.absoluteSize then
        v26 = v27.absoluteSize;
    end;
    local v28, v29 = l_useState_0(false);
    local v30 = l_useDispatch_0();
    local v31 = v6();
    local v32 = l_useIsLocalPlayerPartyVoiceEligible_0();
    l_useEffectOnMount_0(function() --[[ Line: 66 ]]
        -- upvalues: v31 (copy), v15 (ref), v24 (copy)
        if v31 then
            v31.fireAnalyticsEvent(v15.ConversationUpgradeDialogRendered, {
                conversationId = v24.conversationId
            });
        end;
    end);
    local v33 = l_useLocalization_0({
        networkErrorText = v24.networkErrorTextKey, 
        titleText = v24.titleKey, 
        bodyText = v24.bodyKey, 
        bodyTextWithVoice = v24.bodyKeyWithVoice, 
        actionText = v24.actionKey, 
        cancelAlertText = v24.cancelAlertKey
    });
    local v34 = l_useCallback_0(function() --[[ Line: 83 ]]
        -- upvalues: v24 (copy), v33 (copy)
        v24.navigateToToast(v33.networkErrorText);
    end, {
        v24.navigateToToast, 
        v33.networkErrorText
    });
    local v38 = l_useCallback_0(function() --[[ Line: 88 ]]
        -- upvalues: v31 (copy), v15 (ref), v24 (copy), v29 (copy), v30 (copy), v14 (ref), v34 (copy)
        if v31 then
            v31.fireAnalyticsEvent(v15.ConversationUpgradeDialogActionClicked, {
                conversationId = v24.conversationId
            });
        end;
        v29(true);
        v30(v14.rodux.DuplicateConversation.API(v24.conversationId, "trusted_comms")):andThen(function(v35) --[[ Line: 96 ]]
            -- upvalues: v24 (ref), v34 (ref)
            local l_responseBody_0 = v35.responseBody;
            local v37 = l_responseBody_0 and l_responseBody_0.conversations and l_responseBody_0.conversations[1] and l_responseBody_0.conversations[1].id;
            if v37 then
                v24.navigateToConversation(v37);
                return;
            else
                v34();
                return;
            end;
        end):catch(function() --[[ Line: 108 ]]
            -- upvalues: v34 (ref)
            v34();
        end):finally(function() --[[ Line: 111 ]]
            -- upvalues: v29 (ref)
            v29(false);
        end);
    end, {
        v30, 
        v29, 
        v34, 
        v24.navigateToConversation, 
        v24.conversationId, 
        v31
    });
    local v39 = l_useCallback_0(function() --[[ Line: 117 ]]
        -- upvalues: v31 (copy), v15 (ref), v24 (copy)
        if v31 then
            v31.fireAnalyticsEvent(v15.ConversationUpgradeDialogDismissed, {
                conversationId = v24.conversationId
            });
        end;
        v24.onDismissed();
    end, {
        v24.onDismissed, 
        v31, 
        v24.conversationId
    });
    return v4.createElement(v19, {
        titleText = v33.titleText, 
        bodyText = if v32 then v33.bodyTextWithVoice else v33.bodyText, 
        actionText = v33.actionText, 
        cancelAlertText = v33.cancelAlertText, 
        isButtonDisabled = v28, 
        screenSize = v26, 
        onActivated = v38, 
        onDismissed = v39, 
        style = v25
    });
end);