local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.CrossExperience);
local v8 = require(l_Parent_0.CrossExperienceVoice);
local v9 = require(l_Parent_0.FocusNavigationUtils);
local v10 = require(l_Parent_0.Foundation);
local v11 = require(l_Parent_0.React);
local v12 = require(l_Parent_0.RoactUtils);
local v13 = require(l_Parent_0.RobloxAppSessionization);
local v14 = require(l_Parent_0.SocialCommon);
local v15 = require(l_Parent_0.UIBlox);
local v16 = require(l_Parent_0.VoiceChat);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v19 = require(l_script_FirstAncestor_0.Common.Constants);
local v20 = require(l_script_FirstAncestor_0.dependencies);
local v21 = require(l_script_FirstAncestor_0.Enums.SquadPartySheetActionEnum);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagRecordVoiceStatusOnPartyAction);
local l_SharedFlags_0 = v20.SharedFlags;
local l_SquadsCore_0 = v20.SquadsCore;
local l_SquadCoordinationExperienceJoinExperimentation_0 = v20.SocialExperiments.SquadCoordinationExperienceJoinExperimentation;
local l_SquadLobbySessionProvider_0 = l_SquadsCore_0.SquadSessionProvider.SquadLobbySessionProvider;
local l_SquadState_0 = l_SquadsCore_0.Enums.SquadState;
local l_dependencyArray_0 = v20.Hooks.dependencyArray;
local l_leaveSquad_0 = v20.SquadsCore.Thunks.leaveSquad;
local l_useCurrentSquadParentChannelId_0 = l_SquadsCore_0.Hooks.useCurrentSquadParentChannelId;
local l_useCurrentSquadSelector_0 = v20.Hooks.useCurrentSquadSelector;
local l_useDispatch_0 = v20.Hooks.useDispatch;
local l_useLocalization_0 = v20.Hooks.useLocalization;
local l_Badge_0 = v10.Badge;
local l_BadgeVariant_0 = v10.Enums.BadgeVariant;
local l_useTokens_0 = v10.Hooks.useTokens;
local l_useLastInputMethod_0 = v9.useLastInputMethod;
local l_ExternalEventConnection_0 = v12.ExternalEventConnection;
local l_EventNames_0 = l_SquadsCore_0.Analytics.EventNames;
local l_SquadExternalContractContext_0 = l_SquadsCore_0.SquadExternalContractProvider.SquadExternalContractContext;
local l_InputUtilities_0 = v14.Utils.InputUtilities;
local l_SessionType_0 = v13.SessionType;
local l_ControlState_0 = v15.Core.Control.Enum.ControlState;
local l_withHoverTooltip_0 = v15.App.Dialog.TooltipV2.withHoverTooltip;
local l_withTooltip_0 = v15.App.Dialog.TooltipV2.withTooltip;
local l_useParticipant_0 = v8.Hooks.useParticipant;
local l_useParticipants_0 = v8.Hooks.useParticipants;
local l_useIsVoiceConnected_0 = v8.Hooks.useIsVoiceConnected;
local l_useIsVoiceFocused_0 = v8.Hooks.useIsVoiceFocused;
local l_useIsVoiceDisconnected_0 = v8.Hooks.useIsVoiceDisconnected;
local l_useBackgroundExperience_0 = v8.Hooks.useBackgroundExperience;
local l_useIsActiveParticipant_0 = v8.Hooks.useIsActiveParticipant;
local l_useVoiceStatus_0 = v8.Hooks.useVoiceStatus;
local l_CrossExperienceVoiceManager_0 = v8.CrossExperienceVoiceManager;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local v56 = game:DefineFastFlag("EnableCrossExpVoiceDebug", false);
local v57 = game:DefineFastFlag("HidePartyVoiceLobbyMicWhenDisconnected", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local v59 = game:DefineFastString("SquadExperiencePickerTooltipSeenStorageValue", "True");
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = l_SharedFlags_0.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local v61 = l_SquadCoordinationExperienceJoinExperimentation_0.getIsSearchIconOnExpPickerEnabled() and "size-800-800" or "size-600-600";
local v62 = {
    ["icons/menu/platformChatOff"] = "speech-bubble-align-center", 
    ["icons/common/play"] = "play-large", 
    ["icons/common/search"] = "magnifying-glass", 
    ["icons/navigation/close"] = "x", 
    ["icons/controls/headphone"] = "headphones", 
    ["icons/actions/truncationCollapse_small"] = "chevron-large-up", 
    ["icons/status/player/developer"] = "hammer-code"
};
local v63 = l_SquadCoordinationExperienceJoinExperimentation_0.getIsSearchIconOnExpPickerEnabled() and "icons/common/search" or "icons/common/play";
local function _(v64) --[[ Line: 151 ]] --[[ Name: getTooltipWasShownFromAppStorage ]]
    -- upvalues: l_AppStorageService_0 (copy), v59 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 152 ]]
        -- upvalues: l_AppStorageService_0 (ref), v64 (copy)
        return l_AppStorageService_0:GetItem(v64);
    end);
    if not l_status_0 or l_result_0 == nil then
        return false;
    else
        return l_result_0 == v59;
    end;
end;
local function _(v68) --[[ Line: 163 ]] --[[ Name: setTooltipWasShownFromAppStorage ]]
    -- upvalues: l_AppStorageService_0 (copy), v59 (copy)
    pcall(function() --[[ Line: 164 ]]
        -- upvalues: l_AppStorageService_0 (ref), v68 (copy), v59 (ref)
        l_AppStorageService_0:SetItem(v68, v59);
        l_AppStorageService_0:Flush();
    end);
end;
local function v99(v70) --[[ Line: 170 ]]
    -- upvalues: v11 (copy), l_ControlState_0 (copy), l_useTokens_0 (copy), l_useLastInputMethod_0 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), l_AppStorageService_0 (copy), v59 (copy), l_dependencyArray_0 (copy), l_InputUtilities_0 (copy), l_CoreGui_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v10 (copy), l_withTooltip_0 (copy), l_withHoverTooltip_0 (copy)
    local v71, v72 = v11.useBinding(l_ControlState_0.Initialize);
    local v73 = l_useTokens_0();
    local v74 = l_useLastInputMethod_0();
    local v75 = {
        headerText = v70.tooltipText
    };
    local v76, v77 = v11.useState(false);
    v11.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v70 (copy), l_AppStorageService_0 (ref), v59 (ref), v77 (copy)
        local v78 = false;
        if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then
            if v70.enableFirstTimeTooltip and v70.showFtuxCustomConditionsMet and (v70.currentHoveredButton == "" or v70.currentHoveredButton == v70.triggerPointName) then
                local l_ftuxAppStorageKey_0 = v70.ftuxAppStorageKey;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 152 ]]
                    -- upvalues: l_AppStorageService_0 (ref), l_ftuxAppStorageKey_0 (copy)
                    return l_AppStorageService_0:GetItem(l_ftuxAppStorageKey_0);
                end);
                if not if l_status_1 then l_result_1 ~= nil and l_result_1 == v59 else false then
                    local l_ftuxAppStorageKey_1 = v70.ftuxAppStorageKey;
                    pcall(function() --[[ Line: 164 ]]
                        -- upvalues: l_AppStorageService_0 (ref), l_ftuxAppStorageKey_1 (copy), v59 (ref)
                        l_AppStorageService_0:SetItem(l_ftuxAppStorageKey_1, v59);
                        l_AppStorageService_0:Flush();
                    end);
                    if v70.currentHoveredButton == "" then
                        v77(true);
                        return;
                    else
                        v78 = true;
                    end;
                end;
            end;
            if not v78 then
                if not v70.enableFirstTimeTooltip or v70.currentHoveredButton ~= "" and v70.currentHoveredButton ~= v70.triggerPointName then
                    v77(false);
                end;
            end;
        end;
        v78 = false;
    end, l_dependencyArray_0(v70.currentHoveredButton, v70.enableFirstTimeTooltip, v70.ftuxAppStorageKey, v70.showFtuxCustomConditionsMet, v70.triggerPointName));
    local v84 = v11.useCallback(function(v83) --[[ Line: 216 ]]
        -- upvalues: l_InputUtilities_0 (ref), v74 (copy), v77 (copy)
        if l_InputUtilities_0.isActivationInput(v83) or v74 == "Gamepad" then
            v77(false);
        end;
    end, {
        v74
    });
    local v85 = {
        DisplayOrder = 6, 
        disabled = false, 
        guiTarget = l_CoreGui_0, 
        active = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v76 else nil, 
        triggerPointName = v70.triggerPointName
    };
    local function v93(v86, v87, v88) --[[ Line: 232 ]]
        -- upvalues: v11 (ref), l_ControlState_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v70 (copy), v71 (copy), v72 (copy), l_dependencyArray_0 (ref), v76 (copy), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), v84 (copy), v10 (ref), v73 (copy)
        local v91 = v11.useCallback(function(v89) --[[ Line: 233 ]]
            -- upvalues: l_ControlState_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v70 (ref), v88 (copy), v71 (ref), v72 (ref)
            local v90 = l_ControlState_0.fromRawValue(v89);
            if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then
                if v90 == l_ControlState_0.Hover then
                    v70.onHoverCalled(v70.triggerPointName);
                elseif v90 == l_ControlState_0.Default then
                    v70.onHoverCalled("");
                end;
            end;
            if v88 then
                v88(v71:getValue(), v90);
            end;
            v72(v90);
        end, l_dependencyArray_0(v71, v70.onHoverCalled, v70.triggerPointName, v72));
        local v92 = v11.useCallback(function() --[[ Line: 250 ]]
            -- upvalues: v70 (ref), v76 (ref)
            if v70.onActivated then
                v70.onActivated(v76);
            end;
        end, l_dependencyArray_0(v76, v70.onActivated));
        return v11.createElement("Frame", {
            AutomaticSize = v70.automaticSize, 
            LayoutOrder = v70.layoutOrder, 
            Size = UDim2.fromOffset(40, 40), 
            BackgroundTransparency = 1, 
            [v11.Change.AbsolutePosition] = v86, 
            [v11.Change.AbsoluteSize] = v87
        }, {
            InputEndedConnection = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and v76 then v11.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.InputEnded, 
                callback = v84
            }) else nil; 
            v11.createElement(v10.View, {
                Size = UDim2.fromScale(1, 1), 
                backgroundStyle = v70.backgroundStyle, 
                cornerRadius = UDim.new(0, v73.Radius.Circle), 
                isDisabled = v70.isDisabled, 
                onActivated = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v92 else v70.onActivated, 
                onStateChanged = v91
            }, v70.children)
        });
    end;
    local function v95(v94) --[[ Line: 284 ]]
        -- upvalues: v93 (copy)
        return v93(v94, v94, nil);
    end;
    local function v98(v96, v97) --[[ Line: 288 ]]
        -- upvalues: v93 (copy)
        return v93(v96, v96, v97);
    end;
    if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and v76 then
        return (l_withTooltip_0(v75, v85, v95));
    else
        return (l_withHoverTooltip_0(v75, v85, v98));
    end;
end;
local function _(v100) --[[ Line: 298 ]] --[[ Name: tagToSize ]]
    return {
        ["size-600-600"] = v100.Size.Size_600, 
        ["size-800-800"] = v100.Size.Size_800
    };
end;
local function v108(v102, v103, v104, v105) --[[ Line: 305 ]] --[[ Name: renderStandardImage ]]
    -- upvalues: v62 (copy), v11 (copy), v10 (copy)
    local v106 = v62[v103];
    if v106 then
        local v107 = {
            ["size-600-600"] = v105.Size.Size_600, 
            ["size-800-800"] = v105.Size.Size_800
        };
        return v11.createElement(v10.Icon, {
            name = v106, 
            style = if v102 then v105.Color.Content.Muted else v105.Color.Content.Emphasis, 
            size = v107[v104] or v107["size-600-600"], 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        });
    else
        return v11.createElement(v10.Image, {
            Image = v103, 
            tag = {
                ["content-emphasis"] = not v102, 
                ["content-muted"] = v102, 
                ["anchor-center-center position-center-center " .. v104] = true
            }
        });
    end;
end;
local function v115(v109, v110, v111, v112, v113) --[[ Line: 328 ]] --[[ Name: getLoadingIndicatorIcon ]]
    -- upvalues: v16 (copy)
    local v114 = v109.Config.ColorMode.IsLight == "true" and "MicDark" or "MicLight";
    if not v111 or not v110 or v110.isMuted then
        return v16.Utils.GetIcon("Muted", v114);
    elseif v112 then
        return v16.Utils.GetIcon("Unmuted", v114, v113);
    else
        return v16.Utils.GetIcon("Unmuted0", v114);
    end;
end;
local function v121(v116, v117, v118, v119, v120) --[[ Line: 346 ]] --[[ Name: renderToggleAudioFocusButton ]]
    -- upvalues: v11 (copy), v99 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), v10 (copy)
    return v11.createElement(v99, {
        automaticSize = Enum.AutomaticSize.X, 
        currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v119 else nil, 
        enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
        ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
        isDisabled = false, 
        layoutOrder = 0, 
        onActivated = v118, 
        onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v120 else nil, 
        showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
        tooltipText = v117, 
        triggerPointName = "ToggleAudioFocusButton"
    }, {
        UIListLayout = v11.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v11.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v116.Padding.Small), 
            PaddingRight = UDim.new(0, v116.Padding.Small)
        }), 
        ToggleFocusButtonIcon = v11.createElement(v10.Image, {
            Image = "icons/controls/headphone", 
            tag = "anchor-center-center position-center-center size-900 content-emphasis"
        }), 
        CaretIcon = v11.createElement(v10.Image, {
            Image = "icons/actions/truncationCollapse_small", 
            tag = "anchor-center-center position-center-center size-300-300 content-emphasis"
        })
    });
end;
return function(v122) --[[ Line: 396 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), l_useTokens_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useVoiceStatus_0 (copy), v11 (copy), l_useAppPolicy_0 (copy), l_HttpService_0 (copy), l_SquadLobbySessionProvider_0 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_EventNames_0 (copy), v21 (copy), v22 (copy), l_dependencyArray_0 (copy), l_SessionType_0 (copy), l_leaveSquad_0 (copy), l_SquadState_0 (copy), v99 (copy), l_Badge_0 (copy), l_BadgeVariant_0 (copy), v108 (copy), v63 (copy), v61 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useLocalUserId_0 (copy), l_useBackgroundExperience_0 (copy), l_useParticipant_0 (copy), l_useIsVoiceConnected_0 (copy), l_useIsVoiceDisconnected_0 (copy), l_useIsVoiceFocused_0 (copy), l_useParticipants_0 (copy), l_useIsActiveParticipant_0 (copy), l_game_EngineFeature_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_RunService_0 (copy), v121 (copy), v56 (copy), v115 (copy), v57 (copy), v10 (copy), v19 (copy)
    local v123 = l_useDispatch_0();
    local v124 = l_useLocalization_0({
        audioText = "Feature.Squads.Label.Audio", 
        findExperiencesText = l_SquadCoordinationExperienceJoinExperimentation_0.getIsNewTooltipCopyEnabled() and "Feature.Squads.Label.FindExperiencesPlayTogether" or "Feature.Squads.Label.FindExperiences", 
        leavePartyText = "Feature.Squads.Label.LeaveParty", 
        muteMicText = "Feature.Squads.Label.MuteMic", 
        unmuteMicText = "Feature.Squads.Label.UnmuteMic", 
        viewChatText = "Feature.Squads.Label.ViewChat"
    });
    local v125 = l_useTokens_0();
    local v126 = l_useCurrentSquadParentChannelId_0();
    local v127 = l_useCurrentSquadSelector_0();
    local v128 = l_useVoiceStatus_0();
    local v129, v130 = v11.useState("");
    local v132 = v11.useCallback(function(v131) --[[ Line: 417 ]]
        -- upvalues: v130 (copy)
        v130(v131);
    end, {});
    local v133 = if v127 and v127.members then #v127.members else 0;
    local v135 = v11.useCallback(function(v134) --[[ Line: 424 ]]
        return v134.getCanUsePlatformChat();
    end, {});
    local v136 = l_useAppPolicy_0(v135);
    local v137 = v11.useMemo(function() --[[ Line: 429 ]]
        -- upvalues: l_HttpService_0 (ref)
        return l_HttpService_0:GenerateGUID();
    end, {});
    local v138 = if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v11.useContext(l_SquadLobbySessionProvider_0.Context) else nil;
    local v139 = v11.useContext(l_SquadExternalContractContext_0);
    local v140 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v139.useIsChatEnabled();
    local v142 = v11.useCallback(function(v141) --[[ Line: 442 ]]
        -- upvalues: v139 (copy), l_EventNames_0 (ref), v126 (copy), v21 (ref), v22 (ref), v128 (copy), v122 (copy)
        v139.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v126, 
            actionType = v21.ChatButtonClicked, 
            isFtuxTooltipShown = v141, 
            voiceStatus = if v22 then v128 else nil
        });
        v122.navigateAwayFromSquad();
    end, l_dependencyArray_0(v122.navigateAwayFromSquad, v126, v139.fireSquadAnalytics, if v22 then v128 else nil));
    local v144 = v11.useCallback(function(v143) --[[ Line: 460 ]]
        -- upvalues: l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v138 (copy), l_SessionType_0 (ref), l_HttpService_0 (ref), v139 (copy), l_EventNames_0 (ref), v126 (copy), v21 (ref), v22 (ref), v128 (copy), v123 (copy), v122 (copy)
        if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
            v138.updateMetadata(l_SessionType_0.Metadata.SquadLobbyPage.ExperiencePickerUuid, l_HttpService_0:GenerateGUID(false));
        end;
        v139.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v126, 
            actionType = v21.PickExperienceButtonClicked, 
            isFtuxTooltipShown = v143, 
            voiceStatus = if v22 then v128 else nil
        });
        if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldOpenSLPFromExpPickerEnabled() then
            v139.showSearchOverlay(v123);
            return;
        else
            v122.navigateToHomePage();
            return;
        end;
    end, {
        v126, 
        v122.navigateToHomePage, 
        v139.fireSquadAnalytics, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldOpenSLPFromExpPickerEnabled() then v123 else nil, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldOpenSLPFromExpPickerEnabled() then v139.showSearchOverlay else nil, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v138.updateMetadata else nil, 
        if v22 then v128 else nil
    });
    local v146 = v11.useCallback(function(v145) --[[ Line: 494 ]]
        -- upvalues: v139 (copy), l_EventNames_0 (ref), v126 (copy), v21 (ref), v22 (ref), v128 (copy), v123 (copy), l_leaveSquad_0 (ref), v122 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v140 (copy)
        v139.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v126, 
            actionType = v21.EndCallButtonClicked, 
            isFtuxTooltipShown = v145, 
            voiceStatus = if v22 then v128 else nil
        });
        v123(l_leaveSquad_0(nil, v139.setSquadPrompt, function() --[[ Line: 506 ]]
            -- upvalues: v122 (ref)
            v122.navigateAwayFromSquad();
        end, v139.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v140));
    end, l_dependencyArray_0(v123, v122.navigateAwayFromSquad, v126, v139.fireSquadAnalytics, v139.setSquadPrompt, v139.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v140 else nil, if v22 then v128 else nil));
    local v147 = v122.squadState ~= l_SquadState_0.Active;
    local v148 = v11.useMemo(function() --[[ Line: 529 ]]
        -- upvalues: v11 (ref), v99 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v129 (copy), v147 (copy), v142 (copy), v132 (copy), v124 (copy), v122 (copy), l_Badge_0 (ref), v125 (copy), l_BadgeVariant_0 (ref), v108 (ref)
        return v11.createElement(v99, {
            currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, 
            enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
            ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
            isDisabled = v147, 
            layoutOrder = 2, 
            onActivated = v142, 
            onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil, 
            showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
            tooltipText = v124.viewChatText, 
            triggerPointName = "ChatButton"
        }, {
            UnreadMessagesBadge = if v122.hasUnreadMessages then v11.createElement(l_Badge_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(1, -v125.Size.Size_250, 0, v125.Size.Size_250), 
                badgeVariant = l_BadgeVariant_0.Alert
            }) else nil; 
            v108(v147, "icons/menu/platformChatOff", "size-800-800", v125)
        });
    end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, v125, v147, v124.viewChatText, v142, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil, v122.hasUnreadMessages));
    local v149 = v11.useMemo(function() --[[ Line: 578 ]]
        -- upvalues: v122 (copy), v11 (ref), v99 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v129 (copy), v147 (copy), v144 (copy), v132 (copy), v133 (copy), v124 (copy), v108 (ref), v63 (ref), v61 (ref), v125 (copy)
        if v122.isInExperience then
            return nil;
        else
            return (v11.createElement(v99, {
                currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, 
                enableFirstTimeTooltip = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and true or nil, 
                ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "SquadExperiencePickerTooltipSeen" or nil, 
                isDisabled = v147, 
                layoutOrder = 3, 
                onActivated = v144, 
                onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil, 
                showFtuxCustomConditionsMet = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 >= 2 else nil, 
                tooltipText = v124.findExperiencesText, 
                triggerPointName = "PickExperienceButton"
            }, v108(v147, v63, v61, v125)));
        end;
    end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, v125, v147, v124.findExperiencesText, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil, v122.isInExperience, v122.navigateToHomePage));
    local v151 = v11.useMemo(function() --[[ Line: 623 ]]
        -- upvalues: v147 (copy), v125 (copy), v11 (ref), v99 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v129 (copy), v146 (copy), v132 (copy), v124 (copy), v108 (ref)
        local v150 = if v147 then v125.Color.ActionStandard.Background else v125.Color.System.Alert;
        return v11.createElement(v99, {
            backgroundStyle = v150, 
            currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, 
            enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
            ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
            isDisabled = v147, 
            layoutOrder = 4, 
            onActivated = v146, 
            onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil, 
            showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
            tooltipText = v124.leavePartyText, 
            triggerPointName = "EndCallButton"
        }, v108(v147, "icons/navigation/close", "size-600-600", v125));
    end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, v125, v147, v124.leavePartyText, v146, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil));
    local v152 = nil;
    local v153 = nil;
    local v154 = nil;
    if l_GetFFlagEnableCrossExpVoice_0() then
        local v155 = tonumber(l_useLocalUserId_0()) or -1;
        local v156 = v11.useRef(0);
        local v157 = l_useBackgroundExperience_0();
        local v158 = l_useParticipant_0(v155);
        local v159 = l_useIsVoiceConnected_0();
        local v160 = l_useIsVoiceDisconnected_0();
        local v161 = l_useIsVoiceFocused_0() or v122.forceIsVoiceFocused;
        local v162 = l_useParticipants_0();
        local v163 = l_useIsActiveParticipant_0(v155);
        local v164, v165 = v11.useState(0);
        local l_l_game_EngineFeature_0_0 = l_game_EngineFeature_0;
        local v168 = v11.useCallback(function(_) --[[ Line: 681 ]]
            -- upvalues: l_HttpService_0 (ref), v157 (copy), v158 (copy), v162 (copy), l_CrossExperienceVoiceManager_0 (ref)
            print("----------- CEV FOREGROUND -----------");
            print("Experience info", l_HttpService_0:JSONEncode(v157));
            print("Current Voice Participant", l_HttpService_0:JSONEncode(v158));
            print("Squads Store Participants", l_HttpService_0:JSONEncode(v162 or {}));
            print("--------------------------------------");
            l_CrossExperienceVoiceManager_0.default:dumpDebugData();
        end, l_dependencyArray_0(v162, v158));
        local v170 = v11.useCallback(function(_) --[[ Line: 690 ]]
            -- upvalues: v158 (copy), l_CrossExperienceVoiceManager_0 (ref)
            if v158 then
                if v158.isMuted then
                    l_CrossExperienceVoiceManager_0.default:unmuteVoiceParticipant(v158.userId);
                    return;
                else
                    l_CrossExperienceVoiceManager_0.default:muteVoiceParticipant(v158.userId);
                end;
            end;
        end, {
            v158
        });
        v11.useEffect(function() --[[ Line: 700 ]]
            -- upvalues: l_RunService_0 (ref), v137 (copy), v156 (copy), v165 (copy)
            l_RunService_0:BindToRenderStep(v137, 1, function() --[[ Line: 701 ]]
                -- upvalues: v156 (ref), v165 (ref)
                if v156.current > 3 then
                    v165(math.random());
                    v156.current = 0;
                    return;
                else
                    v156.current = v156.current + 1;
                    return;
                end;
            end);
            return function() --[[ Line: 710 ]]
                -- upvalues: l_RunService_0 (ref), v137 (ref)
                l_RunService_0:UnbindFromRenderStep(v137);
            end;
        end, {});
        v152 = v11.useMemo(function() --[[ Line: 716 ]]
            -- upvalues: v147 (copy), l_l_game_EngineFeature_0_0 (copy), v159 (copy), v121 (ref), v125 (copy), v124 (copy), v122 (copy), v129 (copy), v132 (copy)
            if not v147 and l_l_game_EngineFeature_0_0 and v159 then
                return v121(v125, v124.audioText, v122.toggleVoiceChatMenu, v129, v132);
            else
                return nil;
            end;
        end, l_dependencyArray_0(v125, l_l_game_EngineFeature_0_0, v129, v147, v159, v124.audioText, v132, v122.toggleVoiceChatMenu));
        if v56 then
            v153 = v11.useMemo(function() --[[ Line: 742 ]]
                -- upvalues: v11 (ref), v99 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v129 (copy), v147 (copy), v168 (copy), v132 (copy), v108 (ref), v125 (copy)
                return v11.createElement(v99, {
                    currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, 
                    enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
                    ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
                    isDisabled = v147, 
                    layoutOrder = 5, 
                    onActivated = v168, 
                    onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil, 
                    showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
                    tooltipText = "Debug voice", 
                    triggerPointName = "DebugVoiceButton"
                }, v108(v147, "icons/status/player/developer", "size-600-600", v125));
            end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, v125, v147, v168, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil));
        end;
        local v171 = v11.useMemo(function() --[[ Line: 780 ]]
            -- upvalues: v115 (ref), v125 (copy), v158 (copy), v159 (copy), v147 (copy), v163 (copy), v164 (copy)
            return v115(v125, v158, v159, not v147 and v163, v164);
        end, l_dependencyArray_0(v163, v147, v159, v164, v158, v125));
        v154 = v11.useMemo(function() --[[ Line: 791 ]]
            -- upvalues: v57 (ref), v160 (copy), v147 (copy), l_game_EngineFeature_0 (ref), v161 (copy), v159 (copy), v158 (copy), v11 (ref), v99 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v129 (copy), v170 (copy), v132 (copy), v124 (copy), v108 (ref), v171 (copy), v125 (copy)
            if v57 and v160 then
                return nil;
            elseif v147 or not l_game_EngineFeature_0 or v161 then
                local v172 = not v159 or v158 == nil or v147;
                local v173 = not v159 or not v158 or v158.isMuted;
                return v11.createElement(v99, {
                    currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, 
                    enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
                    ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
                    isDisabled = v172, 
                    layoutOrder = 1, 
                    onActivated = v170, 
                    onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil, 
                    showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
                    tooltipText = if v173 then v124.unmuteMicText else v124.muteMicText, 
                    triggerPointName = "ToggleMicButton"
                }, v108(v172, v171, "size-800-800", v125));
            else
                return nil;
            end;
        end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v129 else nil, v125, v171, v147, v161, v159, v124.muteMicText, v124.unmuteMicText, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v132 else nil, v170, v158, v160));
    end;
    return v11.createElement(v10.View, {
        AutomaticSize = Enum.AutomaticSize.X, 
        AnchorPoint = v122.anchorPoint, 
        Position = v122.position, 
        Size = UDim2.fromOffset(0, v19.SQUAD_LOBBY_ACTION_BAR_HEIGHT), 
        backgroundStyle = v125.Color.OverMedia.OverMedia_0, 
        cornerRadius = UDim.new(0, v125.Radius.Circle), 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v125.Gap.Large), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        padding = v125.Padding.Small
    }, {
        ToggleAudioFocusButton = v152, 
        ToggleMicButton = v154, 
        ChatButton = if v136 then v148 else nil, 
        PickExperienceButton = v149, 
        EndCallButton = v151, 
        DebugVoiceButton = v153
    });
end;