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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v23 = {
    onModalClose = function() --[[ Line: 49 ]] --[[ Name: onModalClose ]]

    end, 
    onLeaveSuccess = function() --[[ Line: 50 ]] --[[ Name: onLeaveSuccess ]]

    end, 
    titleKey = "Feature.Chat.Heading.LeaveGroup", 
    cancelKey = "Feature.Chat.Action.Stay", 
    confirmKey = "Feature.Chat.Action.Leave", 
    bodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.LeaveGroup.V2" or "Feature.Chat.Message.LeaveGroup", 
    failureTitleKey = "Feature.Chat.Heading.FailedToLeaveGroup", 
    failureBodyKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.FailedToLeaveGroup.V2" or "Feature.Chat.Message.FailedToLeaveGroup", 
    failureButtonKey = "Feature.Chat.Action.Confirm"
};
LeaveGroupDialogContainer = function(v24) --[[ Line: 67 ]] --[[ Name: LeaveGroupDialogContainer ]]
    -- upvalues: v5 (copy), v23 (copy), l_useState_0 (copy), v15 (copy), v17 (copy), l_useEffectOnMount_0 (copy), v16 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v4 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_useLocalization_0 (copy), v6 (copy), v19 (copy), l_ResponseIndicator_0 (copy)
    local v25 = v5.Dictionary.join(v23, v24);
    local v26, v27 = l_useState_0(true);
    local v28, v29 = l_useState_0(false);
    local v30, v31 = l_useState_0(false);
    local v32 = v15(v17.Context);
    l_useEffectOnMount_0(function() --[[ Line: 74 ]]
        -- upvalues: v32 (copy), v16 (ref)
        v32.emit(v16.LeaveGroupDialogRendered, {});
    end);
    local v33 = l_useDispatch_0();
    local v36 = l_useCallback_0(function(v34, v35) --[[ Line: 79 ]]
        -- upvalues: v33 (copy), v4 (ref)
        return v33(v4.rodux.RemoveUserFromConversation.API(v35, v34));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33
    } else l_dependencyArray_0(v33));
    local v39 = l_useSelector_0(function(v37) --[[ Line: 83 ]]
        -- upvalues: v25 (copy), l_GetFFlagIsSquadEnabled_0 (ref)
        local v38 = v37.ChatAppReducer.Conversations[v25.conversationId] or {
            title = nil, 
            hasGroupUp = nil
        };
        return {
            localUserId = v37.LocalUserId, 
            conversationTitle = v38.title, 
            hasGroupUp = if l_GetFFlagIsSquadEnabled_0() then v38.hasGroupUp else nil
        };
    end);
    local v40 = l_useCallback_0(function() --[[ Line: 98 ]]
        -- upvalues: v29 (copy), v27 (copy), v32 (copy), v16 (ref), v25 (copy), v36 (copy), v39 (copy), v31 (copy)
        v29(true);
        v27(false);
        v32.emit(v16.LeaveGroupDialogLeaveClicked, {});
        if v25.conversationId then
            v36(v39.localUserId, v25.conversationId):andThen(function() --[[ Line: 105 ]]
                -- upvalues: v25 (ref)
                v25.onModalClose();
                v25.onLeaveSuccess();
            end):catch(function() --[[ Line: 109 ]]
                -- upvalues: v29 (ref), v27 (ref), v31 (ref)
                v29(false);
                v27(true);
                v31(true);
            end);
        end;
        return true;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v39.localUserId, 
        v39.hasGroupUp, 
        v25.conversationId, 
        v36, 
        v32
    } else l_dependencyArray_0(v39.localUserId, v39.hasGroupUp, v25.conversationId, v36, v32));
    local v41 = l_useCallback_0(function(...) --[[ Line: 136 ]]
        -- upvalues: v32 (copy), v16 (ref), v25 (copy)
        v32.emit(v16.LeaveGroupDialogStayClicked, {});
        v25.onModalClose(...);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v25.onModalClose, 
        v25.conversationId, 
        v32
    } else l_dependencyArray_0(v25.onModalClose, v25.conversationId, v32));
    local v42 = l_useLocalization_0({
        titleText = v25.titleKey, 
        cancelText = v25.cancelKey, 
        confirmText = v25.confirmKey, 
        bodyText = v25.bodyKey, 
        failureTitleText = v25.failureTitleKey, 
        failureBodyText = {
            v25.failureBodyKey; 
            CONVERSATION_TITLE = v39.conversationTitle
        }, 
        failureButtonText = v25.failureButtonKey
    });
    return v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        LeaveGroupDialog = v26 and v6.createElement(v19, v5.Dictionary.join(v25, v42, v39, {
            onActivated = v40, 
            displayFailed = v30, 
            onModalClose = v41
        })), 
        ResponseIndicator = v28 and v6.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        })
    });
end;
return l_memo_0(LeaveGroupDialogContainer);