local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Users.populateUserWithState);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v6.memo;
local l_useCallback_0 = v6.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v6.useState;
local v14 = require(script.Parent.RemoveUserDialogLayout);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v17 = {
    participantId = nil, 
    onModalClose = function() --[[ Line: 43 ]] --[[ Name: onModalClose ]]

    end, 
    titleKey = "Feature.Chat.Action.RemoveUser", 
    messageKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.RemoveUser.V2" or "Feature.Chat.Message.RemoveUser", 
    cancelTitleKey = "Feature.Chat.Action.Cancel", 
    confirmationTitleKey = "Feature.Chat.Action.Remove", 
    failureTitleKey = "Feature.Chat.Heading.FailedToRemoveUser", 
    failureBodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.FailedToRemoveUser.V2" or "Feature.Chat.Message.FailedToRemoveUser", 
    failureButtonKey = "Feature.Chat.Action.Confirm"
};
RemoveUserDialogContainer = function(v18) --[[ Line: 60 ]] --[[ Name: RemoveUserDialogContainer ]]
    -- upvalues: v5 (copy), v17 (copy), l_useState_0 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v4 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v2 (copy), l_useLocalization_0 (copy), v6 (copy), v14 (copy)
    local v19 = v5.Dictionary.join(v17, v18);
    local v20, v21 = l_useState_0(true);
    local v22, v23 = l_useState_0(false);
    local v24, v25 = l_useState_0(false);
    local v26 = l_useDispatch_0();
    local v29 = l_useCallback_0(function(v27, v28) --[[ Line: 67 ]]
        -- upvalues: v26 (copy), v4 (ref)
        return v26(v4.rodux.RemoveUserFromConversation.API(v28, v27));
    end, l_dependencyArray_0(v26));
    local v33 = l_useSelector_0(function(v30) --[[ Line: 71 ]]
        -- upvalues: v19 (copy), v2 (ref)
        local v31 = v30.ChatAppReducer.Conversations[v19.conversationId] or {
            title = nil
        };
        local v32 = v30.Users[v19.participantId];
        return {
            conversationTitle = v31.title, 
            targetUser = v2(v30, v32)
        };
    end);
    local v35 = l_useCallback_0(function() --[[ Line: 83 ]]
        -- upvalues: v23 (copy), v21 (copy), v19 (copy), v29 (copy), v25 (copy)
        v23(true);
        v21(false);
        local l_conversationId_0 = v19.conversationId;
        if l_conversationId_0 then
            v29(v19.participantId, l_conversationId_0):andThen(function() --[[ Line: 90 ]]
                -- upvalues: v19 (ref)
                v19.onModalClose();
            end):catch(function() --[[ Line: 93 ]]
                -- upvalues: v23 (ref), v21 (ref), v25 (ref)
                v23(false);
                v21(true);
                v25(true);
            end);
        end;
        return true;
    end, l_dependencyArray_0(v19.participantId, v19.conversationId));
    local v36 = l_useLocalization_0({
        titleText = v19.titleKey, 
        bodyText = {
            v19.messageKey; 
            USERNAME = v33.targetUser.displayName
        }, 
        cancelText = v19.cancelTitleKey, 
        confirmText = v19.confirmationTitleKey, 
        failureTitleText = "Feature.Chat.Heading.FailedToRemoveUser", 
        failureBodyText = {
            v19.failureBodyKey; 
            USERNAME = v33.targetUser.displayName, 
            CONVERSATION_TITLE = v33.conversationTitle
        }, 
        failureButtonText = "Feature.Chat.Action.Confirm"
    });
    return v6.createElement(v14, v5.Dictionary.join(v19, v36, v33, {
        onActivated = v35, 
        displayFailed = v24, 
        isModalVisible = v20, 
        isLoading = v22
    }));
end;
return l_memo_0(RemoveUserDialogContainer);