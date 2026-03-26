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
local v19 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableAppChatFocusableFixes_0 = v19.FFlagEnableAppChatFocusableFixes;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v22 = require(l_script_FirstAncestor_0.Logger);
local v23 = require(l_Parent_0.FocusNavigationUtils);
local l_AppFocusRoot_0 = v23.AppFocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v23.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v23.FocusNavigationEventNameEnum;
local v27 = require(l_Parent_0.InputHandlers);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v19.FFlagRemoveDependencyArrayAntipattern;
local v31 = {
    Success = function() --[[ Line: 48 ]] --[[ Name: Success ]]
        return {
            visible = false, 
            isLoading = false, 
            warningTextKey = nil
        };
    end, 
    Moderated = function() --[[ Line: 57 ]] --[[ Name: Moderated ]]
        -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
        return {
            visible = true, 
            isLoading = false, 
            warningTextKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Response.ChatNameFullyModerated.V2" or "Feature.Chat.Response.ChatNameFullyModerated"
        };
    end, 
    Default = function(v29, v30) --[[ Line: 66 ]] --[[ Name: Default ]]
        -- upvalues: l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
        return {
            visible = true, 
            isLoading = false, 
            warningTextKey = {
                l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.FailedToRenameConversation.V2" or "Feature.Chat.Message.FailedToRenameConversation"; 
                EXISTING_NAME = v29, 
                NEW_NAME = v30
            }
        };
    end, 
    Waiting = function() --[[ Line: 79 ]] --[[ Name: Waiting ]]
        return {
            visible = true, 
            isLoading = true
        };
    end
};
local v32 = {
    onModalClose = function() --[[ Line: 98 ]] --[[ Name: onModalClose ]]

    end, 
    titleKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.GroupName" or "Feature.Chat.Label.ChatGroupName", 
    cancelTitleKey = "Feature.Chat.Action.Cancel", 
    confirmationTitleKey = "Feature.Chat.Action.Save", 
    placeholderTextKey = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Description.NameGroup" or "Feature.Chat.Description.NameGroupChat"
};
EditChatGroupNameDialogContainer = function(v33) --[[ Line: 111 ]] --[[ Name: EditChatGroupNameDialogContainer ]]
    -- upvalues: v3 (copy), v32 (copy), l_useState_0 (copy), l_useDispatch_0 (copy), l_useCallback_0 (copy), v14 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v31 (copy), v22 (copy), l_ResponseStatus_0 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v27 (copy), l_useLocalization_0 (copy), l_ResponseIndicator_0 (copy), v17 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_AppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v34 = v3.Dictionary.join(v32, v33);
    local v35, v36 = l_useState_0({
        visible = true, 
        isLoading = false
    });
    local v37 = l_useDispatch_0();
    local v40 = l_useCallback_0(function(v38, v39) --[[ Line: 119 ]]
        -- upvalues: v37 (copy), v14 (ref)
        return v37(v14.rodux.UpdateConversationTitle.API(v38, v39));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v37
    } else l_dependencyArray_0(v37));
    local v45 = l_useSelector_0(function(v41) --[[ Line: 123 ]]
        -- upvalues: v34 (copy)
        local l_conversationId_0 = v34.conversationId;
        local v43 = v41.ChatAppReducer.Conversations[l_conversationId_0];
        local v44 = "";
        if v43 and not v43.isDefaultTitle then
            v44 = v43.title;
        end;
        return v44;
    end);
    local v49 = l_useCallback_0(function(v46) --[[ Line: 139 ]]
        -- upvalues: v34 (copy), v36 (copy), v31 (ref), v40 (copy), v22 (ref), v45 (copy), l_ResponseStatus_0 (ref)
        if v34.conversationId then
            v36(v31.Waiting());
            v40(v34.conversationId, v46.InputBox):andThen(function(v47) --[[ Line: 143 ]]
                -- upvalues: v22 (ref), v36 (ref), v31 (ref), v45 (ref), v46 (copy), l_ResponseStatus_0 (ref), v34 (ref)
                if not v47 or not v47.responseBody or not v47.responseBody.conversations or not v47.responseBody.conversations[1] then
                    v22.error("Conversation rename response is invalid.");
                    v36(v31.Default(v45, v46.InputBox));
                    return;
                elseif v47.responseBody.conversations[1].status == l_ResponseStatus_0.SUCCESS then
                    v36(v31.Success());
                    v34.onModalClose();
                    return;
                elseif v47.responseBody and v47.responseBody.conversations[1].status == l_ResponseStatus_0.MODERATED then
                    v22.error("Conversation rename was moderated.");
                    v36(v31.Moderated());
                    return;
                else
                    v22.error("Conversation rename request failed.");
                    v36(v31.Default(v45, v46.InputBox));
                    return;
                end;
            end):catch(function(_) --[[ Line: 166 ]]
                -- upvalues: v36 (ref), v31 (ref), v45 (ref), v46 (copy)
                v36(v31.Default(v45, v46.InputBox));
            end);
        end;
        return true;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v34.conversationId, 
        v45
    } else l_dependencyArray_0(v34.conversationId, v45));
    local v51 = v4.useMemo(function() --[[ Line: 178 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v27 (ref), v34 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v27.onRelease(function(v50) --[[ Line: 182 ]]
                    -- upvalues: v34 (ref)
                    v34.onModalClose();
                    v50:cancel();
                end)
            }
        };
    end, {
        v34.onModalClose
    });
    local v52 = l_useLocalization_0({
        titleText = v34.titleKey, 
        placeholderText = v34.placeholderTextKey, 
        cancelText = v34.cancelTitleKey, 
        confirmText = v34.confirmationTitleKey, 
        warningText = v35.warningTextKey
    });
    local v53 = v4.createElement(v4.Fragment, nil, {
        responseIndicator = v35.isLoading and v4.createElement(l_ResponseIndicator_0, {
            soakAreaColor3 = Color3.fromRGB(25, 25, 25), 
            soakAreaTransparency = 0.8
        }), 
        dialog = v35.visible and v4.createElement(v17, v3.Dictionary.join(v34, v52, {
            onActivated = v49, 
            inputText = v45, 
            conversationTitle = v45
        }))
    });
    if l_FFlagEnableAppChatFocusableFixes_0 then
        return (v4.createElement(l_AppFocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
            isIsolated = true, 
            isAutoFocusRoot = true, 
            isFocusable = true, 
            customEventHandlers = v51
        }, v53));
    else
        return v53;
    end;
end;
return l_memo_0(EditChatGroupNameDialogContainer);