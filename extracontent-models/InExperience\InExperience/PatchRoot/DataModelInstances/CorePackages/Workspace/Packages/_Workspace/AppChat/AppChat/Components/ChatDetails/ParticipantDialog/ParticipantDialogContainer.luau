local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local v5 = require(l_script_FirstAncestor_0.Hooks.useIsExternalNavigationAvailable);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.FocusNavigationUtils);
local v8 = require(l_Parent_0.InputHandlers);
local v9 = require(l_Parent_0.React);
local _ = require(l_Parent_0.ReactFocusNavigation);
local v11 = require(l_Parent_0.SharedFlags);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigableSurfaceWrapper_0 = v7.FocusNavigableSurfaceWrapper;
local l_AppFocusRoot_0 = v7.AppFocusRoot;
local l_FocusNavigationEventNameEnum_0 = v7.FocusNavigationEventNameEnum;
local l_FFlagEnableAppChatFocusableFixes_0 = v11.FFlagEnableAppChatFocusableFixes;
local l_memo_0 = v9.memo;
local v19 = require(script.Parent.ParticipantDialog);
local v20 = require(script.Parent.PlayerContextualMenuWrapper);
local v21 = {
    conversationId = nil, 
    participantId = nil, 
    showRemoveUserButton = false, 
    viewProfileText = "Feature.Chat.Label.ViewProfile", 
    reportUserText = "Feature.Chat.Action.ReportUser", 
    removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup", 
    cancelText = "Feature.Chat.Action.Cancel", 
    openViewProfile = nil, 
    openReportUser = nil, 
    openRemoveUserDialog = nil, 
    onDismiss = function() --[[ Line: 61 ]] --[[ Name: onDismiss ]]

    end
};
ParticipantDialogContainer = function(v22) --[[ Line: 65 ]] --[[ Name: ParticipantDialogContainer ]]
    -- upvalues: v6 (copy), v21 (copy), v4 (copy), l_useLocalization_0 (copy), v5 (copy), v2 (copy), v9 (copy), l_FocusNavigationEventNameEnum_0 (copy), v8 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_AppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v20 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), v19 (copy)
    local v23 = v6.Dictionary.join(v21, v22);
    local v25 = v4(function(v24) --[[ Line: 67 ]]
        return v24.getChatViewProfileOption();
    end);
    local v26 = l_useLocalization_0({
        viewProfileText = v23.viewProfileText, 
        reportUserText = v23.reportUserText, 
        removeFromGroupText = v23.removeFromGroupText, 
        cancelText = v23.cancelText
    });
    local v27 = v5({
        v2.ViewUserProfile
    });
    local v29 = v9.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v8 (ref), v23 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v8.onRelease(function(v28) --[[ Line: 84 ]]
                    -- upvalues: v23 (ref)
                    v23.onDismiss();
                    v28:cancel();
                end)
            }
        };
    end, {
        v23.onDismiss
    });
    if not v27[v2.ViewUserProfile] then
        if l_FFlagEnableAppChatFocusableFixes_0 then
            return (v9.createElement(l_AppFocusRoot_0, {
                customEventHandlers = v29, 
                isAutoFocusRoot = true, 
                isFocusable = true, 
                isIsolated = true, 
                shouldRestoreFocus = false, 
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp
            }, {
                v9.createElement(v20, {
                    conversationId = v23.conversationId, 
                    participantId = v23.participantId, 
                    onDismiss = v23.onDismiss, 
                    openRemoveUserDialog = v23.openRemoveUserDialog, 
                    removeFromGroupText = v26.removeFromGroupText, 
                    openReportUser = v23.openReportUser, 
                    showRemoveUserButton = v23.showRemoveUserButton, 
                    openBlockingModal = v23.openBlockingModal
                })
            }));
        else
            return (v9.createElement(v20, {
                conversationId = v23.conversationId, 
                participantId = v23.participantId, 
                onDismiss = v23.onDismiss, 
                openRemoveUserDialog = v23.openRemoveUserDialog, 
                removeFromGroupText = v26.removeFromGroupText, 
                openReportUser = v23.openReportUser, 
                showRemoveUserButton = v23.showRemoveUserButton, 
                openBlockingModal = v23.openBlockingModal
            }));
        end;
    elseif l_FFlagEnableAppChatFocusableFixes_0 then
        return (v9.createElement(l_FocusNavigableSurfaceWrapper_0, {
            customEventHandlers = v29, 
            isAutoFocusRoot = true, 
            isFocusable = true, 
            isIsolated = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp
        }, {
            v9.createElement(v19, v6.Dictionary.join(v23, v26, {
                showViewProfileButton = v25
            }))
        }));
    else
        return (v9.createElement(v19, v6.Dictionary.join(v23, v26, {
            showViewProfileButton = v25
        })));
    end;
end;
return l_memo_0(ParticipantDialogContainer);