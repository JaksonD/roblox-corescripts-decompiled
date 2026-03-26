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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v18 = {
    participantId = nil, 
    onModalClose = function() --[[ Line: 44 ]] --[[ Name: onModalClose ]]

    end, 
    titleKey = "Feature.Chat.Action.RemoveUser", 
    messageKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.RemoveUser.V2" or "Feature.Chat.Message.RemoveUser", 
    cancelTitleKey = "Feature.Chat.Action.Cancel", 
    confirmationTitleKey = "Feature.Chat.Action.Remove", 
    failureTitleKey = "Feature.Chat.Heading.FailedToRemoveUser", 
    failureBodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.FailedToRemoveUser.V2" or "Feature.Chat.Message.FailedToRemoveUser", 
    failureButtonKey = "Feature.Chat.Action.Confirm"
};
RemoveUserDialogContainer = function(v19) --[[ Line: 61 ]] --[[ Name: RemoveUserDialogContainer ]]
    -- upvalues: v5 (copy), v18 (copy), l_useState_0 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v4 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v2 (copy), l_useLocalization_0 (copy), v6 (copy), v14 (copy)
    local v20 = v5.Dictionary.join(v18, v19);
    local v21, v22 = l_useState_0(true);
    local v23, v24 = l_useState_0(false);
    local v25, v26 = l_useState_0(false);
    local v27 = l_useDispatch_0();
    local v30 = l_useCallback_0(function(v28, v29) --[[ Line: 68 ]]
        -- upvalues: v27 (copy), v4 (ref)
        return v27(v4.rodux.RemoveUserFromConversation.API(v29, v28));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v27
    } else l_dependencyArray_0(v27));
    local v34 = l_useSelector_0(function(v31) --[[ Line: 72 ]]
        -- upvalues: v20 (copy), v2 (ref)
        local v32 = v31.ChatAppReducer.Conversations[v20.conversationId] or {
            title = nil
        };
        local v33 = v31.Users[v20.participantId];
        return {
            conversationTitle = v32.title, 
            targetUser = v2(v31, v33)
        };
    end);
    local v36 = l_useCallback_0(function() --[[ Line: 85 ]]
        -- upvalues: v24 (copy), v22 (copy), v20 (copy), v30 (copy), v26 (copy)
        v24(true);
        v22(false);
        local l_conversationId_0 = v20.conversationId;
        if l_conversationId_0 then
            v30(v20.participantId, l_conversationId_0):andThen(function() --[[ Line: 92 ]]
                -- upvalues: v20 (ref)
                v20.onModalClose();
            end):catch(function() --[[ Line: 95 ]]
                -- upvalues: v24 (ref), v22 (ref), v26 (ref)
                v24(false);
                v22(true);
                v26(true);
            end);
        end;
        return true;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v20.participantId, 
        v20.conversationId
    } else l_dependencyArray_0(v20.participantId, v20.conversationId));
    local v37 = l_useLocalization_0({
        titleText = v20.titleKey, 
        bodyText = {
            v20.messageKey; 
            USERNAME = v34.targetUser.displayName
        }, 
        cancelText = v20.cancelTitleKey, 
        confirmText = v20.confirmationTitleKey, 
        failureTitleText = "Feature.Chat.Heading.FailedToRemoveUser", 
        failureBodyText = {
            v20.failureBodyKey; 
            USERNAME = v34.targetUser.displayName, 
            CONVERSATION_TITLE = v34.conversationTitle
        }, 
        failureButtonText = "Feature.Chat.Action.Confirm"
    });
    return v6.createElement(v14, v5.Dictionary.join(v20, v37, v34, {
        onActivated = v36, 
        displayFailed = v25, 
        isModalVisible = v21, 
        isLoading = v23
    }));
end;
return l_memo_0(RemoveUserDialogContainer);