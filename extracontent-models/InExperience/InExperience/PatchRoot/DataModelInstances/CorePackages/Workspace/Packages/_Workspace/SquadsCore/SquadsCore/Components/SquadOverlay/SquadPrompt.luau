local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v3 = require(l_script_FirstAncestor_0.Enums.SquadPromptType);
local v4 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v5 = require(l_script_FirstAncestor_0.Hooks.useCurrentSquadId);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RobloxAppHooks);
local v8 = require(l_Parent_0.UIBlox);
local v9 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = require(l_Parent_0.UniversalAppPolicy);
local _ = require(l_Parent_0.ReactFocusNavigation);
local v15 = require(l_Parent_0.InputHandlers);
local v16 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v16.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v16.FocusNavigationEventNameEnum;
local l_FocusRoot_0 = v16.FocusRoot;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v21 = game:DefineFastFlag("EnableSquadPromptAnalytics", false);
local l_FFlagEnableScheduledSquads_0 = require(l_Parent_0.SharedFlags).FFlagEnableScheduledSquads;
local l_useScreenSize_0 = v7.useScreenSize;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local v26 = {
    hideCancelButton = false, 
    bodyTextLocalizationProps = nil
};
local function _() --[[ Line: 43 ]] --[[ Name: getFFlagRenameFriendsToConnectionsPartyLobby ]]
    -- upvalues: v13 (copy)
    return v13.getAppFeaturePolicies().getRenameFriendsToConnections();
end;
return function(v28) --[[ Line: 47 ]]
    -- upvalues: v9 (copy), v26 (copy), v6 (copy), v2 (copy), l_useDispatch_0 (copy), v5 (copy), l_useScreenSize_0 (copy), v4 (copy), l_dependencyArray_0 (copy), v21 (copy), v3 (copy), v13 (copy), l_FFlagEnableScheduledSquads_0 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v15 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_InteractiveAlert_0 (copy)
    local v29 = v9.Dictionary.join(v26, v28);
    local v30 = v6.useContext(v2);
    local v31 = l_useDispatch_0();
    local v32 = v5() or "";
    local v33 = if v29.screenSize then v29.screenSize else l_useScreenSize_0();
    local v35 = v6.useCallback(function(v34) --[[ Line: 55 ]]
        -- upvalues: v30 (copy), v4 (ref), v29 (copy), v32 (copy)
        v30.fireSquadAnalytics(v4.SquadPromptResponded, {
            promptType = v29.promptType, 
            squadId = v32 or "", 
            responseType = v34
        });
    end, l_dependencyArray_0(v29.promptType, v32, v30.fireSquadAnalytics));
    local v36 = v6.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v21 (ref), v35 (copy), v31 (copy), v30 (copy), v29 (copy)
        if v21 then
            v35("cancel");
        end;
        v31(v30.closeSquadPrompt());
        if v29.onCancel then
            v29.onCancel();
        end;
    end, l_dependencyArray_0(v31, v29.onCancel, v30.closeSquadPrompt, v35));
    local v37 = v6.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: v21 (ref), v35 (copy), v31 (copy), v30 (copy), v29 (copy)
        if v21 then
            v35("confirm");
        end;
        v31(v30.closeSquadPrompt());
        if v29.onConfirm then
            v29.onConfirm();
        end;
    end, l_dependencyArray_0(v31, v29.onConfirm, v30.closeSquadPrompt, v35));
    local v45 = v6.useCallback(function(v38) --[[ Line: 87 ]]
        -- upvalues: v3 (ref), v13 (ref), l_FFlagEnableScheduledSquads_0 (ref), v29 (copy)
        local v39 = nil;
        local v40 = nil;
        local v41 = nil;
        local v42 = "CommonUI.Controls.Action.Cancel";
        if v38 == v3.AlreadyJoined then
            v39 = "Feature.Squads.Label.Error";
            v40 = "Feature.Squads.Description.AlreadyJoined";
            v41 = "Feature.Squads.Action.Ok";
        elseif v38 == v3.ConfirmInviteToSquad then
            v39 = v13.getAppFeaturePolicies().getRenameFriendsToConnections() and "Feature.Squads.Label.InviteConnectionsConfirmation" or "Feature.Squads.Label.InviteFriendsConfirmation";
            v40 = v13.getAppFeaturePolicies().getRenameFriendsToConnections() and "Feature.Squads.Description.InviteConnectionsToParty" or "Feature.Squads.Description.InviteFriendsToParty";
            v41 = "Feature.Squads.Action.Yes";
        elseif v38 == v3.AddFriends then
            v39 = "Feature.Squads.Label.AddFriends";
            v40 = "Feature.Squads.Description.AddFriends";
            v41 = "Feature.Squads.Action.Ok";
        elseif v38 == v3.FailedToJoin then
            v39 = "Feature.Squads.Label.FailedToJoin";
            v40 = "Feature.Squads.Description.FailedToJoin";
            v41 = "Feature.Squads.Action.Join";
        elseif v38 == v3.JoinAnotherSquad then
            v39 = "Feature.Squads.Label.JoinAnotherParty";
            v40 = "Feature.Squads.Description.JoinAnotherParty";
            v41 = "Feature.Squads.Action.Switch";
        elseif v38 == v3.SquadEnded then
            v39 = "Feature.Squads.Label.PartyEnded";
            v40 = "Feature.Squads.Description.PartyEnded";
            v41 = "Feature.Squads.Action.Start";
        elseif v38 == v3.SquadFull then
            v39 = "Feature.Squads.Label.PartyFull";
            v40 = "Feature.Squads.Description.PartyFull";
            v41 = "Feature.Squads.Action.Join";
        elseif v38 == v3.InvitedToExperience then
            v39 = "Feature.Squads.Label.InvitedToExperience";
            v40 = "Feature.Squads.Description.InvitedToExperience";
            v41 = "Feature.Squads.Action.Retry";
        elseif v38 == v3.RemoveFromChat then
            v39 = "Feature.Squads.Label.RemoveFromChat";
            v40 = "Feature.Squads.Description.RemoveFromChat";
            v41 = "Feature.Squads.Action.Remove";
        elseif v38 == v3.RemoveFromParty then
            v39 = "Feature.Squads.Label.RemoveFromParty";
            v40 = "Feature.Squads.Description.RemoveFromParty";
            v41 = "Feature.Squads.Action.Ok";
        elseif v38 == v3.JoinWithLowMemory then
            v39 = "Feature.Squads.Label.LowMemory";
            v40 = "Feature.Squads.Description.JoinWithLowMemory";
            v41 = "Feature.Squads.Action.ContinueWithoutVoice";
            v42 = "Feature.Squads.Action.ConnectToVoice";
        elseif v38 == v3.ConnectVoiceWithLowMemory then
            v39 = "Feature.Squads.Label.LowMemory";
            v40 = "Feature.Squads.Description.ConnectVoiceWithLowMemory";
            v41 = "Feature.Squads.Action.ContinueWithoutVoice";
            v42 = "Feature.Squads.Action.ConnectToVoice";
        elseif v38 == v3.DisconnectVoiceDueToLowMemory then
            v39 = "Feature.Squads.Label.LowMemory";
            v40 = "Feature.Squads.Description.DisconnectVoiceDueToLowMemory";
            v41 = "Feature.Squads.Action.DisconnectFromVoice";
            v42 = "Feature.Chat.Action.Continue";
        elseif v38 == v3.ParticipantChatDisabled then
            v39 = "Feature.Squads.Label.Error";
            v40 = "Feature.Chat.Toast.Error.InvalidUserSelected";
            v41 = "Feature.Squads.Action.Ok";
        elseif v38 == v3.EuVoiceConsentPrompt then
            v39 = "Feature.Squads.Label.VoiceRecordedTitle";
            v40 = "Feature.Squads.Description.VoiceRecordedDisclosure";
            v41 = "Feature.Chat.Action.Continue";
            v42 = "Feature.Squads.Action.JoinWithoutVoice";
        elseif l_FFlagEnableScheduledSquads_0 and v38 == v3.ConfirmDeleteScheduledSquad then
            v39 = "Feature.Squads.Label.DeleteScheduledParty";
            v40 = "Feature.Squads.Description.DeleteScheduledSquad";
            v41 = "CommonUI.Controls.Action.Yes";
        elseif l_FFlagEnableScheduledSquads_0 and v38 == v3.ScheduledSquadConflict then
            v39 = "Feature.Squads.Label.PartyOperationFailed";
            v40 = "Feature.Squads.Description.ScheduledPartyAlreadyExists";
            v41 = "Feature.Squads.Action.Ok";
        else
            v39 = "Feature.Squads.Label.PartyOperationFailed";
            v40 = "Feature.Squads.Description.PleaseTryAgain";
            v41 = "Feature.Squads.Action.Ok";
        end;
        if v29.bodyTextLocalizationProps then
            v40 = {
                v40
            };
            for v43, v44 in pairs(v29.bodyTextLocalizationProps) do
                v40[v43] = v44;
            end;
        end;
        return {
            title = v39, 
            bodyText = v40, 
            confirmText = v41, 
            cancelButtonText = v42
        };
    end, {});
    local v46 = v6.useMemo(function() --[[ Line: 184 ]]
        -- upvalues: v45 (copy), v29 (copy)
        return v45(v29.promptType);
    end, l_dependencyArray_0(v29.promptType));
    local v47 = l_useLocalization_0({
        title = v46.title, 
        bodyText = v46.bodyText, 
        confirmText = v46.confirmText, 
        cancelButtonText = v46.cancelButtonText
    });
    local v49 = v6.useCallback(function() --[[ Line: 196 ]]
        -- upvalues: v29 (copy), v36 (copy), v47 (copy), l_ButtonType_0 (ref), v37 (copy)
        local v48 = {};
        if not v29.hideCancelButton then
            table.insert(v48, {
                props = {
                    onActivated = v36, 
                    text = v47.cancelButtonText
                }
            });
        end;
        table.insert(v48, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v37, 
                text = v47.confirmText
            }
        });
        return v48;
    end, l_dependencyArray_0(v47.cancelButtonText, v47.confirmText, v29.hideCancelButton, v37, v36));
    local v51 = if l_FFlagEnableAppChatFocusableFixes_0 then v6.useMemo(function() --[[ Line: 221 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v15 (ref), v36 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v15.onRelease(function(v50) --[[ Line: 224 ]]
                    -- upvalues: v36 (ref)
                    v36();
                    v50:cancel();
                end)
            }
        };
    end, {
        v36
    }) else nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        return (v6.createElement(l_FocusRoot_0, {
            eventHandlers = v51, 
            isAutoFocusRoot = true, 
            isIsolated = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp
        }, {
            v6.createElement(l_InteractiveAlert_0, {
                screenSize = v33, 
                title = v47.title, 
                bodyText = v47.bodyText, 
                buttonStackInfo = {
                    buttons = v49()
                }
            })
        }));
    else
        return (v6.createElement(l_InteractiveAlert_0, {
            screenSize = v33, 
            title = v47.title, 
            bodyText = v47.bodyText, 
            buttonStackInfo = {
                buttons = v49()
            }
        }));
    end;
end;