local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.SocialLibraries);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v4.useState;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_Parent_0.ReactFocusNavigation);
local v14 = require(l_Parent_0.AppChatNetworking);
local l_ResponseStatus_0 = v14.Constants.ResponseStatus;
local l_ResponseIndicator_0 = v5.Components.ResponseIndicator;
local v17 = require(script.Parent.EditChatGroupNameDialog);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v21 = require(l_script_FirstAncestor_0.Logger);
local v22 = require(l_Parent_0.FocusNavigationUtils);
local l_AppFocusRoot_0 = v22.AppFocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v22.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v22.FocusNavigationEventNameEnum;
local v26 = require(l_Parent_0.InputHandlers);
local v29 = {
    Success = function() --[[ Line: 46 ]] --[[ Name: Success ]]
        return {
            visible = false, 
            isLoading = false, 
            warningTextKey = nil
        };
    end, 
    Moderated = function() --[[ Line: 55 ]] --[[ Name: Moderated ]]
        -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
        return {
            visible = true, 
            isLoading = false, 
            warningTextKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Response.ChatNameFullyModerated.V2" or "Feature.Chat.Response.ChatNameFullyModerated"
        };
    end, 
    Default = function(v27, v28) --[[ Line: 64 ]] --[[ Name: Default ]]
        -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
        return {
            visible = true, 
            isLoading = false, 
            warningTextKey = {
                l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.FailedToRenameConversation.V2" or "Feature.Chat.Message.FailedToRenameConversation"; 
                EXISTING_NAME = v27, 
                NEW_NAME = v28
            }
        };
    end, 
    Waiting = function() --[[ Line: 77 ]] --[[ Name: Waiting ]]
        return {
            visible = true, 
            isLoading = true
        };
    end
};
local v30 = {
    onModalClose = function() --[[ Line: 96 ]] --[[ Name: onModalClose ]]

    end, 
    titleKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.GroupName" or "Feature.Chat.Label.ChatGroupName", 
    cancelTitleKey = "Feature.Chat.Action.Cancel", 
    confirmationTitleKey = "Feature.Chat.Action.Save", 
    placeholderTextKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Description.NameGroup" or "Feature.Chat.Description.NameGroupChat"
};
EditChatGroupNameDialogContainer = function(v31) --[[ Line: 109 ]] --[[ Name: EditChatGroupNameDialogContainer ]]
    -- upvalues: v3 (copy), v30 (copy), l_useState_0 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v14 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v29 (copy), v21 (copy), l_ResponseStatus_0 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v26 (copy), l_useLocalization_0 (copy), l_ResponseIndicator_0 (copy), v17 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_AppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v32 = v3.Dictionary.join(v30, v31);
    local v33, v34 = l_useState_0({
        visible = true, 
        isLoading = false
    });
    local v35 = l_useDispatch_0();
    local v38 = l_useCallback_0(function(v36, v37) --[[ Line: 117 ]]
        -- upvalues: v35 (copy), v14 (ref)
        return v35(v14.rodux.UpdateConversationTitle.API(v36, v37));
    end, l_dependencyArray_0(v35));
    local v43 = l_useSelector_0(function(v39) --[[ Line: 121 ]]
        -- upvalues: v32 (copy)
        local l_conversationId_0 = v32.conversationId;
        local v41 = v39.ChatAppReducer.Conversations[l_conversationId_0];
        local v42 = "";
        if v41 and not v41.isDefaultTitle then
            v42 = v41.title;
        end;
        return v42;
    end);
    local v47 = l_useCallback_0(function(v44) --[[ Line: 136 ]]
        -- upvalues: v32 (copy), v34 (copy), v29 (ref), v38 (copy), v21 (ref), v43 (copy), l_ResponseStatus_0 (ref)
        if v32.conversationId then
            v34(v29.Waiting());
            v38(v32.conversationId, v44.InputBox):andThen(function(v45) --[[ Line: 140 ]]
                -- upvalues: v21 (ref), v34 (ref), v29 (ref), v43 (ref), v44 (copy), l_ResponseStatus_0 (ref), v32 (ref)
                if not v45 or not v45.responseBody or not v45.responseBody.conversations or not v45.responseBody.conversations[1] then
                    v21.error("Conversation rename response is invalid.");
                    v34(v29.Default(v43, v44.InputBox));
                    return;
                elseif v45.responseBody.conversations[1].status == l_ResponseStatus_0.SUCCESS then
                    v34(v29.Success());
                    v32.onModalClose();
                    return;
                elseif v45.responseBody and v45.responseBody.conversations[1].status == l_ResponseStatus_0.MODERATED then
                    v21.error("Conversation rename was moderated.");
                    v34(v29.Moderated());
                    return;
                else
                    v21.error("Conversation rename request failed.");
                    v34(v29.Default(v43, v44.InputBox));
                    return;
                end;
            end):catch(function(_) --[[ Line: 163 ]]
                -- upvalues: v34 (ref), v29 (ref), v43 (ref), v44 (copy)
                v34(v29.Default(v43, v44.InputBox));
            end);
        end;
        return true;
    end, l_dependencyArray_0(v32.conversationId, v43));
    local v49 = v4.useMemo(function() --[[ Line: 171 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v26 (ref), v32 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v26.onRelease(function(v48) --[[ Line: 175 ]]
                    -- upvalues: v32 (ref)
                    v32.onModalClose();
                    v48:cancel();
                end)
            }
        };
    end, {
        v32.onModalClose
    });
    local v50 = l_useLocalization_0({
        titleText = v32.titleKey, 
        placeholderText = v32.placeholderTextKey, 
        cancelText = v32.cancelTitleKey, 
        confirmText = v32.confirmationTitleKey, 
        warningText = v33.warningTextKey
    });
    local v51 = v4.createElement(v4.Fragment, nil, {
        responseIndicator = v33.isLoading and v4.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        dialog = v33.visible and v4.createElement(v17, v3.Dictionary.join(v32, v50, {
            onActivated = v47, 
            inputText = v43, 
            conversationTitle = v43
        }))
    });
    if l_FFlagEnableAppChatFocusableFixes_0 then
        return (v4.createElement(l_AppFocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
            isIsolated = true, 
            isAutoFocusRoot = true, 
            isFocusable = true, 
            customEventHandlers = v49
        }, v51));
    else
        return v51;
    end;
end;
return l_memo_0(EditChatGroupNameDialogContainer);