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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useScreenSize_0 = v7.useScreenSize;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v8.App.Dialog.Alert.InteractiveAlert;
local v27 = {
    hideCancelButton = false, 
    bodyTextLocalizationProps = nil
};
local function _() --[[ Line: 44 ]] --[[ Name: getFFlagRenameFriendsToConnectionsPartyLobby ]]
    -- upvalues: v13 (copy)
    return v13.getAppFeaturePolicies().getRenameFriendsToConnections();
end;
return function(v29) --[[ Line: 48 ]]
    -- upvalues: v9 (copy), v27 (copy), v6 (copy), v2 (copy), l_useDispatch_0 (copy), v5 (copy), l_useScreenSize_0 (copy), v4 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v21 (copy), v3 (copy), v13 (copy), l_FFlagEnableScheduledSquads_0 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v15 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_InteractiveAlert_0 (copy)
    local v30 = v9.Dictionary.join(v27, v29);
    local v31 = v6.useContext(v2);
    local v32 = l_useDispatch_0();
    local v33 = v5() or "";
    local v34 = if v30.screenSize then v30.screenSize else l_useScreenSize_0();
    local v36 = v6.useCallback(function(v35) --[[ Line: 57 ]]
        -- upvalues: v31 (copy), v4 (ref), v30 (copy), v33 (copy)
        v31.fireSquadAnalytics(v4.SquadPromptResponded, {
            promptType = v30.promptType, 
            squadId = v33 or "", 
            responseType = v35
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v30.promptType, 
        v33, 
        v31.fireSquadAnalytics
    } else l_dependencyArray_0(v30.promptType, v33, v31.fireSquadAnalytics));
    local v37 = v6.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v21 (ref), v36 (copy), v32 (copy), v31 (copy), v30 (copy)
        if v21 then
            v36("cancel");
        end;
        v32(v31.closeSquadPrompt());
        if v30.onCancel then
            v30.onCancel();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v32, 
        v30.onCancel, 
        v31.closeSquadPrompt, 
        v36
    } else l_dependencyArray_0(v32, v30.onCancel, v31.closeSquadPrompt, v36));
    local v38 = v6.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: v21 (ref), v36 (copy), v32 (copy), v31 (copy), v30 (copy)
        if v21 then
            v36("confirm");
        end;
        v32(v31.closeSquadPrompt());
        if v30.onConfirm then
            v30.onConfirm();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v32, 
        v30.onConfirm, 
        v31.closeSquadPrompt, 
        v36
    } else l_dependencyArray_0(v32, v30.onConfirm, v31.closeSquadPrompt, v36));
    local v46 = v6.useCallback(function(v39) --[[ Line: 103 ]]
        -- upvalues: v3 (ref), v13 (ref), l_FFlagEnableScheduledSquads_0 (ref), v30 (copy)
        local v40 = nil;
        local v41 = nil;
        local v42 = nil;
        local v43 = "CommonUI.Controls.Action.Cancel";
        if v39 == v3.AlreadyJoined then
            v40 = "Feature.Squads.Label.Error";
            v41 = "Feature.Squads.Description.AlreadyJoined";
            v42 = "Feature.Squads.Action.Ok";
        elseif v39 == v3.ConfirmInviteToSquad then
            v40 = v13.getAppFeaturePolicies().getRenameFriendsToConnections() and "Feature.Squads.Label.InviteConnectionsConfirmation" or "Feature.Squads.Label.InviteFriendsConfirmation";
            v41 = v13.getAppFeaturePolicies().getRenameFriendsToConnections() and "Feature.Squads.Description.InviteConnectionsToParty" or "Feature.Squads.Description.InviteFriendsToParty";
            v42 = "Feature.Squads.Action.Yes";
        elseif v39 == v3.AddFriends then
            v40 = "Feature.Squads.Label.AddFriends";
            v41 = "Feature.Squads.Description.AddFriends";
            v42 = "Feature.Squads.Action.Ok";
        elseif v39 == v3.FailedToJoin then
            v40 = "Feature.Squads.Label.FailedToJoin";
            v41 = "Feature.Squads.Description.FailedToJoin";
            v42 = "Feature.Squads.Action.Join";
        elseif v39 == v3.JoinAnotherSquad then
            v40 = "Feature.Squads.Label.JoinAnotherParty";
            v41 = "Feature.Squads.Description.JoinAnotherParty";
            v42 = "Feature.Squads.Action.Switch";
        elseif v39 == v3.SquadEnded then
            v40 = "Feature.Squads.Label.PartyEnded";
            v41 = "Feature.Squads.Description.PartyEnded";
            v42 = "Feature.Squads.Action.Start";
        elseif v39 == v3.SquadFull then
            v40 = "Feature.Squads.Label.PartyFull";
            v41 = "Feature.Squads.Description.PartyFull";
            v42 = "Feature.Squads.Action.Join";
        elseif v39 == v3.InvitedToExperience then
            v40 = "Feature.Squads.Label.InvitedToExperience";
            v41 = "Feature.Squads.Description.InvitedToExperience";
            v42 = "Feature.Squads.Action.Retry";
        elseif v39 == v3.RemoveFromChat then
            v40 = "Feature.Squads.Label.RemoveFromChat";
            v41 = "Feature.Squads.Description.RemoveFromChat";
            v42 = "Feature.Squads.Action.Remove";
        elseif v39 == v3.RemoveFromParty then
            v40 = "Feature.Squads.Label.RemoveFromParty";
            v41 = "Feature.Squads.Description.RemoveFromParty";
            v42 = "Feature.Squads.Action.Ok";
        elseif v39 == v3.JoinWithLowMemory then
            v40 = "Feature.Squads.Label.LowMemory";
            v41 = "Feature.Squads.Description.JoinWithLowMemory";
            v42 = "Feature.Squads.Action.ContinueWithoutVoice";
            v43 = "Feature.Squads.Action.ConnectToVoice";
        elseif v39 == v3.ConnectVoiceWithLowMemory then
            v40 = "Feature.Squads.Label.LowMemory";
            v41 = "Feature.Squads.Description.ConnectVoiceWithLowMemory";
            v42 = "Feature.Squads.Action.ContinueWithoutVoice";
            v43 = "Feature.Squads.Action.ConnectToVoice";
        elseif v39 == v3.DisconnectVoiceDueToLowMemory then
            v40 = "Feature.Squads.Label.LowMemory";
            v41 = "Feature.Squads.Description.DisconnectVoiceDueToLowMemory";
            v42 = "Feature.Squads.Action.DisconnectFromVoice";
            v43 = "Feature.Chat.Action.Continue";
        elseif v39 == v3.ParticipantChatDisabled then
            v40 = "Feature.Squads.Label.Error";
            v41 = "Feature.Chat.Toast.Error.InvalidUserSelected";
            v42 = "Feature.Squads.Action.Ok";
        elseif v39 == v3.EuVoiceConsentPrompt then
            v40 = "Feature.Squads.Label.VoiceRecordedTitle";
            v41 = "Feature.Squads.Description.VoiceRecordedDisclosure";
            v42 = "Feature.Chat.Action.Continue";
            v43 = "Feature.Squads.Action.JoinWithoutVoice";
        elseif l_FFlagEnableScheduledSquads_0 and v39 == v3.ConfirmDeleteScheduledSquad then
            v40 = "Feature.Squads.Label.DeleteScheduledParty";
            v41 = "Feature.Squads.Description.DeleteScheduledSquad";
            v42 = "CommonUI.Controls.Action.Yes";
        elseif l_FFlagEnableScheduledSquads_0 and v39 == v3.ScheduledSquadConflict then
            v40 = "Feature.Squads.Label.PartyOperationFailed";
            v41 = "Feature.Squads.Description.ScheduledPartyAlreadyExists";
            v42 = "Feature.Squads.Action.Ok";
        else
            v40 = "Feature.Squads.Label.PartyOperationFailed";
            v41 = "Feature.Squads.Description.PleaseTryAgain";
            v42 = "Feature.Squads.Action.Ok";
        end;
        if v30.bodyTextLocalizationProps then
            v41 = {
                v41
            };
            for v44, v45 in pairs(v30.bodyTextLocalizationProps) do
                v41[v44] = v45;
            end;
        end;
        return {
            title = v40, 
            bodyText = v41, 
            confirmText = v42, 
            cancelButtonText = v43
        };
    end, {});
    local v47 = v6.useMemo(function() --[[ Line: 200 ]]
        -- upvalues: v46 (copy), v30 (copy)
        return v46(v30.promptType);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v30.promptType
    } else l_dependencyArray_0(v30.promptType));
    local v48 = l_useLocalization_0({
        title = v47.title, 
        bodyText = v47.bodyText, 
        confirmText = v47.confirmText, 
        cancelButtonText = v47.cancelButtonText
    });
    local v50 = v6.useCallback(function() --[[ Line: 212 ]]
        -- upvalues: v30 (copy), v37 (copy), v48 (copy), l_ButtonType_0 (ref), v38 (copy)
        local v49 = {};
        if not v30.hideCancelButton then
            table.insert(v49, {
                props = {
                    onActivated = v37, 
                    text = v48.cancelButtonText
                }
            });
        end;
        table.insert(v49, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v38, 
                text = v48.confirmText
            }
        });
        return v49;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v48.cancelButtonText, 
        v48.confirmText, 
        v30.hideCancelButton, 
        v38, 
        v37
    } else l_dependencyArray_0(v48.cancelButtonText, v48.confirmText, v30.hideCancelButton, v38, v37));
    local v52 = if l_FFlagEnableAppChatFocusableFixes_0 then v6.useMemo(function() --[[ Line: 251 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v15 (ref), v37 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v15.onRelease(function(v51) --[[ Line: 254 ]]
                    -- upvalues: v37 (ref)
                    v37();
                    v51:cancel();
                end)
            }
        };
    end, {
        v37
    }) else nil;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        return (v6.createElement(l_FocusRoot_0, {
            eventHandlers = v52, 
            isAutoFocusRoot = true, 
            isIsolated = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp
        }, {
            v6.createElement(l_InteractiveAlert_0, {
                screenSize = v34, 
                title = v48.title, 
                bodyText = v48.bodyText, 
                buttonStackInfo = {
                    buttons = v50()
                }
            })
        }));
    else
        return (v6.createElement(l_InteractiveAlert_0, {
            screenSize = v34, 
            title = v48.title, 
            bodyText = v48.bodyText, 
            buttonStackInfo = {
                buttons = v50()
            }
        }));
    end;
end;