local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v6.memo;
local l_useCallback_0 = v6.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v6.useState;
local v15 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v16 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsTelemetryEvents);
local v17 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatDialogTelemetryLayer);
local l_ResponseIndicator_0 = v2.Components.ResponseIndicator;
local v19 = require(script.Parent.LeaveGroupDialog);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v22 = {
    onModalClose = function() --[[ Line: 47 ]] --[[ Name: onModalClose ]]

    end, 
    onLeaveSuccess = function() --[[ Line: 48 ]] --[[ Name: onLeaveSuccess ]]

    end, 
    titleKey = "Feature.Chat.Heading.LeaveGroup", 
    cancelKey = "Feature.Chat.Action.Stay", 
    confirmKey = "Feature.Chat.Action.Leave", 
    bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.LeaveGroup.V2" or "Feature.Chat.Message.LeaveGroup", 
    failureTitleKey = "Feature.Chat.Heading.FailedToLeaveGroup", 
    failureBodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.FailedToLeaveGroup.V2" or "Feature.Chat.Message.FailedToLeaveGroup", 
    failureButtonKey = "Feature.Chat.Action.Confirm"
};
LeaveGroupDialogContainer = function(v23) --[[ Line: 65 ]] --[[ Name: LeaveGroupDialogContainer ]]
    -- upvalues: v5 (copy), v22 (copy), l_useState_0 (copy), v15 (copy), v17 (copy), l_useEffectOnMount_0 (copy), v16 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v4 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_useLocalization_0 (copy), v6 (copy), v19 (copy), l_ResponseIndicator_0 (copy)
    local v24 = v5.Dictionary.join(v22, v23);
    local v25, v26 = l_useState_0(true);
    local v27, v28 = l_useState_0(false);
    local v29, v30 = l_useState_0(false);
    local v31 = v15(v17.Context);
    l_useEffectOnMount_0(function() --[[ Line: 72 ]]
        -- upvalues: v31 (copy), v16 (ref)
        v31.emit(v16.LeaveGroupDialogRendered, {});
    end);
    local v32 = l_useDispatch_0();
    local v35 = l_useCallback_0(function(v33, v34) --[[ Line: 77 ]]
        -- upvalues: v32 (copy), v4 (ref)
        return v32(v4.rodux.RemoveUserFromConversation.API(v34, v33));
    end, l_dependencyArray_0(v32));
    local v38 = l_useSelector_0(function(v36) --[[ Line: 81 ]]
        -- upvalues: v24 (copy), l_GetFFlagIsSquadEnabled_0 (ref)
        local v37 = v36.ChatAppReducer.Conversations[v24.conversationId] or {
            title = nil, 
            hasGroupUp = nil
        };
        return {
            localUserId = v36.LocalUserId, 
            conversationTitle = v37.title, 
            hasGroupUp = if l_GetFFlagIsSquadEnabled_0() then v37.hasGroupUp else nil
        };
    end);
    local v39 = l_useCallback_0(function() --[[ Line: 96 ]]
        -- upvalues: v28 (copy), v26 (copy), v31 (copy), v16 (ref), v24 (copy), v35 (copy), v38 (copy), v30 (copy)
        v28(true);
        v26(false);
        v31.emit(v16.LeaveGroupDialogLeaveClicked, {});
        if v24.conversationId then
            v35(v38.localUserId, v24.conversationId):andThen(function() --[[ Line: 103 ]]
                -- upvalues: v24 (ref)
                v24.onModalClose();
                v24.onLeaveSuccess();
            end):catch(function() --[[ Line: 107 ]]
                -- upvalues: v28 (ref), v26 (ref), v30 (ref)
                v28(false);
                v26(true);
                v30(true);
            end);
        end;
        return true;
    end, l_dependencyArray_0(v38.localUserId, v38.hasGroupUp, v24.conversationId, v35, v31));
    local v40 = l_useCallback_0(function(...) --[[ Line: 125 ]]
        -- upvalues: v31 (copy), v16 (ref), v24 (copy)
        v31.emit(v16.LeaveGroupDialogStayClicked, {});
        v24.onModalClose(...);
    end, l_dependencyArray_0(v24.onModalClose, v24.conversationId, v31));
    local v41 = l_useLocalization_0({
        titleText = v24.titleKey, 
        cancelText = v24.cancelKey, 
        confirmText = v24.confirmKey, 
        bodyText = v24.bodyKey, 
        failureTitleText = v24.failureTitleKey, 
        failureBodyText = {
            v24.failureBodyKey; 
            CONVERSATION_TITLE = v38.conversationTitle
        }, 
        failureButtonText = v24.failureButtonKey
    });
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        LeaveGroupDialog = v25 and v6.createElement(v19, v5.Dictionary.join(v24, v41, v38, {
            onActivated = v39, 
            displayFailed = v29, 
            onModalClose = v40
        })), 
        ResponseIndicator = v27 and v6.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        })
    });
end;
return l_memo_0(LeaveGroupDialogContainer);