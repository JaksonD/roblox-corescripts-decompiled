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
local v61 = game:DefineFastFlag("EnableSquadPageChatBadgeFix", false);
local v62 = l_SquadCoordinationExperienceJoinExperimentation_0.getIsSearchIconOnExpPickerEnabled() and "size-800-800" or "size-600-600";
local v63 = {
    ["icons/menu/platformChatOff"] = "speech-bubble-align-center", 
    ["icons/common/play"] = "play-large", 
    ["icons/common/search"] = "magnifying-glass", 
    ["icons/navigation/close"] = "x", 
    ["icons/controls/headphone"] = "headphones", 
    ["icons/actions/truncationCollapse_small"] = "chevron-large-up", 
    ["icons/status/player/developer"] = "hammer-code"
};
local v64 = l_SquadCoordinationExperienceJoinExperimentation_0.getIsSearchIconOnExpPickerEnabled() and "icons/common/search" or "icons/common/play";
local function _(v65) --[[ Line: 152 ]] --[[ Name: getTooltipWasShownFromAppStorage ]]
    -- upvalues: l_AppStorageService_0 (copy), v59 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 153 ]]
        -- upvalues: l_AppStorageService_0 (ref), v65 (copy)
        return l_AppStorageService_0:GetItem(v65);
    end);
    if not l_status_0 or l_result_0 == nil then
        return false;
    else
        return l_result_0 == v59;
    end;
end;
local function _(v69) --[[ Line: 164 ]] --[[ Name: setTooltipWasShownFromAppStorage ]]
    -- upvalues: l_AppStorageService_0 (copy), v59 (copy)
    pcall(function() --[[ Line: 165 ]]
        -- upvalues: l_AppStorageService_0 (ref), v69 (copy), v59 (ref)
        l_AppStorageService_0:SetItem(v69, v59);
        l_AppStorageService_0:Flush();
    end);
end;
local function v100(v71) --[[ Line: 171 ]]
    -- upvalues: v11 (copy), l_ControlState_0 (copy), l_useTokens_0 (copy), l_useLastInputMethod_0 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), l_AppStorageService_0 (copy), v59 (copy), l_dependencyArray_0 (copy), l_InputUtilities_0 (copy), l_CoreGui_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy), v10 (copy), l_withTooltip_0 (copy), l_withHoverTooltip_0 (copy)
    local v72, v73 = v11.useBinding(l_ControlState_0.Initialize);
    local v74 = l_useTokens_0();
    local v75 = l_useLastInputMethod_0();
    local v76 = {
        headerText = v71.tooltipText
    };
    local v77, v78 = v11.useState(false);
    v11.useEffect(function() --[[ Line: 184 ]]
        -- upvalues: l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v71 (copy), l_AppStorageService_0 (ref), v59 (ref), v78 (copy)
        local v79 = false;
        if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then
            if v71.enableFirstTimeTooltip and v71.showFtuxCustomConditionsMet and (v71.currentHoveredButton == "" or v71.currentHoveredButton == v71.triggerPointName) then
                local l_ftuxAppStorageKey_0 = v71.ftuxAppStorageKey;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 153 ]]
                    -- upvalues: l_AppStorageService_0 (ref), l_ftuxAppStorageKey_0 (copy)
                    return l_AppStorageService_0:GetItem(l_ftuxAppStorageKey_0);
                end);
                if not if l_status_1 then l_result_1 ~= nil and l_result_1 == v59 else false then
                    local l_ftuxAppStorageKey_1 = v71.ftuxAppStorageKey;
                    pcall(function() --[[ Line: 165 ]]
                        -- upvalues: l_AppStorageService_0 (ref), l_ftuxAppStorageKey_1 (copy), v59 (ref)
                        l_AppStorageService_0:SetItem(l_ftuxAppStorageKey_1, v59);
                        l_AppStorageService_0:Flush();
                    end);
                    if v71.currentHoveredButton == "" then
                        v78(true);
                        return;
                    else
                        v79 = true;
                    end;
                end;
            end;
            if not v79 then
                if not v71.enableFirstTimeTooltip or v71.currentHoveredButton ~= "" and v71.currentHoveredButton ~= v71.triggerPointName then
                    v78(false);
                end;
            end;
        end;
        v79 = false;
    end, l_dependencyArray_0(v71.currentHoveredButton, v71.enableFirstTimeTooltip, v71.ftuxAppStorageKey, v71.showFtuxCustomConditionsMet, v71.triggerPointName));
    local v85 = v11.useCallback(function(v84) --[[ Line: 217 ]]
        -- upvalues: l_InputUtilities_0 (ref), v75 (copy), v78 (copy)
        if l_InputUtilities_0.isActivationInput(v84) or v75 == "Gamepad" then
            v78(false);
        end;
    end, {
        v75
    });
    local v86 = {
        DisplayOrder = 6, 
        disabled = false, 
        guiTarget = l_CoreGui_0, 
        active = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v77 else nil, 
        triggerPointName = v71.triggerPointName
    };
    local function v94(v87, v88, v89) --[[ Line: 233 ]]
        -- upvalues: v11 (ref), l_ControlState_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v71 (copy), v72 (copy), v73 (copy), l_dependencyArray_0 (ref), v77 (copy), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref), v85 (copy), v10 (ref), v74 (copy)
        local v92 = v11.useCallback(function(v90) --[[ Line: 234 ]]
            -- upvalues: l_ControlState_0 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v71 (ref), v89 (copy), v72 (ref), v73 (ref)
            local v91 = l_ControlState_0.fromRawValue(v90);
            if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then
                if v91 == l_ControlState_0.Hover then
                    v71.onHoverCalled(v71.triggerPointName);
                elseif v91 == l_ControlState_0.Default then
                    v71.onHoverCalled("");
                end;
            end;
            if v89 then
                v89(v72:getValue(), v91);
            end;
            v73(v91);
        end, l_dependencyArray_0(v72, v71.onHoverCalled, v71.triggerPointName, v73));
        local v93 = v11.useCallback(function() --[[ Line: 251 ]]
            -- upvalues: v71 (ref), v77 (ref)
            if v71.onActivated then
                v71.onActivated(v77);
            end;
        end, l_dependencyArray_0(v77, v71.onActivated));
        return v11.createElement("Frame", {
            AutomaticSize = v71.automaticSize, 
            LayoutOrder = v71.layoutOrder, 
            Size = UDim2.fromOffset(40, 40), 
            BackgroundTransparency = 1, 
            [v11.Change.AbsolutePosition] = v87, 
            [v11.Change.AbsoluteSize] = v88
        }, {
            InputEndedConnection = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and v77 then v11.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.InputEnded, 
                callback = v85
            }) else nil; 
            v11.createElement(v10.View, {
                Size = UDim2.fromScale(1, 1), 
                backgroundStyle = v71.backgroundStyle, 
                cornerRadius = UDim.new(0, v74.Radius.Circle), 
                isDisabled = v71.isDisabled, 
                onActivated = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v93 else v71.onActivated, 
                onStateChanged = v92
            }, v71.children)
        });
    end;
    local function v96(v95) --[[ Line: 285 ]]
        -- upvalues: v94 (copy)
        return v94(v95, v95, nil);
    end;
    local function v99(v97, v98) --[[ Line: 289 ]]
        -- upvalues: v94 (copy)
        return v94(v97, v97, v98);
    end;
    if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and v77 then
        return (l_withTooltip_0(v76, v86, v96));
    else
        return (l_withHoverTooltip_0(v76, v86, v99));
    end;
end;
local function _(v101) --[[ Line: 299 ]] --[[ Name: tagToSize ]]
    return {
        ["size-600-600"] = v101.Size.Size_600, 
        ["size-800-800"] = v101.Size.Size_800
    };
end;
local function v109(v103, v104, v105, v106) --[[ Line: 306 ]] --[[ Name: renderStandardImage ]]
    -- upvalues: v63 (copy), v11 (copy), v10 (copy)
    local v107 = v63[v104];
    if v107 then
        local v108 = {
            ["size-600-600"] = v106.Size.Size_600, 
            ["size-800-800"] = v106.Size.Size_800
        };
        return v11.createElement(v10.Icon, {
            name = v107, 
            style = if v103 then v106.Color.Content.Muted else v106.Color.Content.Emphasis, 
            size = v108[v105] or v108["size-600-600"], 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        });
    else
        return v11.createElement(v10.Image, {
            Image = v104, 
            tag = {
                ["content-emphasis"] = not v103, 
                ["content-muted"] = v103, 
                ["anchor-center-center position-center-center " .. v105] = true
            }
        });
    end;
end;
local function v116(v110, v111, v112, v113, v114) --[[ Line: 329 ]] --[[ Name: getLoadingIndicatorIcon ]]
    -- upvalues: v16 (copy)
    local v115 = v110.Config.ColorMode.IsLight == "true" and "MicDark" or "MicLight";
    if not v112 or not v111 or v111.isMuted then
        return v16.Utils.GetIcon("Muted", v115);
    elseif v113 then
        return v16.Utils.GetIcon("Unmuted", v115, v114);
    else
        return v16.Utils.GetIcon("Unmuted0", v115);
    end;
end;
local function v122(v117, v118, v119, v120, v121) --[[ Line: 347 ]] --[[ Name: renderToggleAudioFocusButton ]]
    -- upvalues: v11 (copy), v100 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), v10 (copy)
    return v11.createElement(v100, {
        automaticSize = Enum.AutomaticSize.X, 
        currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v120 else nil, 
        enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
        ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
        isDisabled = false, 
        layoutOrder = 0, 
        onActivated = v119, 
        onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v121 else nil, 
        showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
        tooltipText = v118, 
        triggerPointName = "ToggleAudioFocusButton"
    }, {
        UIListLayout = v11.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v11.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v117.Padding.Small), 
            PaddingRight = UDim.new(0, v117.Padding.Small)
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
return function(v123) --[[ Line: 397 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_SquadCoordinationExperienceJoinExperimentation_0 (copy), l_useTokens_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useVoiceStatus_0 (copy), v11 (copy), l_useAppPolicy_0 (copy), l_HttpService_0 (copy), l_SquadLobbySessionProvider_0 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_EventNames_0 (copy), v21 (copy), v22 (copy), l_dependencyArray_0 (copy), l_SessionType_0 (copy), l_leaveSquad_0 (copy), l_SquadState_0 (copy), v100 (copy), l_Badge_0 (copy), v61 (copy), l_BadgeVariant_0 (copy), v109 (copy), v64 (copy), v62 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useLocalUserId_0 (copy), l_useBackgroundExperience_0 (copy), l_useParticipant_0 (copy), l_useIsVoiceConnected_0 (copy), l_useIsVoiceDisconnected_0 (copy), l_useIsVoiceFocused_0 (copy), l_useParticipants_0 (copy), l_useIsActiveParticipant_0 (copy), l_game_EngineFeature_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_RunService_0 (copy), v122 (copy), v56 (copy), v116 (copy), v57 (copy), v10 (copy), v19 (copy)
    local v124 = l_useDispatch_0();
    local v125 = l_useLocalization_0({
        audioText = "Feature.Squads.Label.Audio", 
        findExperiencesText = l_SquadCoordinationExperienceJoinExperimentation_0.getIsNewTooltipCopyEnabled() and "Feature.Squads.Label.FindExperiencesPlayTogether" or "Feature.Squads.Label.FindExperiences", 
        leavePartyText = "Feature.Squads.Label.LeaveParty", 
        muteMicText = "Feature.Squads.Label.MuteMic", 
        unmuteMicText = "Feature.Squads.Label.UnmuteMic", 
        viewChatText = "Feature.Squads.Label.ViewChat"
    });
    local v126 = l_useTokens_0();
    local v127 = l_useCurrentSquadParentChannelId_0();
    local v128 = l_useCurrentSquadSelector_0();
    local v129 = l_useVoiceStatus_0();
    local v130, v131 = v11.useState("");
    local v133 = v11.useCallback(function(v132) --[[ Line: 418 ]]
        -- upvalues: v131 (copy)
        v131(v132);
    end, {});
    local v134 = if v128 and v128.members then #v128.members else 0;
    local v136 = v11.useCallback(function(v135) --[[ Line: 425 ]]
        return v135.getCanUsePlatformChat();
    end, {});
    local v137 = l_useAppPolicy_0(v136);
    local v138 = v11.useMemo(function() --[[ Line: 430 ]]
        -- upvalues: l_HttpService_0 (ref)
        return l_HttpService_0:GenerateGUID();
    end, {});
    local v139 = if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v11.useContext(l_SquadLobbySessionProvider_0.Context) else nil;
    local v140 = v11.useContext(l_SquadExternalContractContext_0);
    local v141 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v140.useIsChatEnabled();
    local v143 = v11.useCallback(function(v142) --[[ Line: 443 ]]
        -- upvalues: v140 (copy), l_EventNames_0 (ref), v127 (copy), v21 (ref), v22 (ref), v129 (copy), v123 (copy)
        v140.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v127, 
            actionType = v21.ChatButtonClicked, 
            isFtuxTooltipShown = v142, 
            voiceStatus = if v22 then v129 else nil
        });
        v123.navigateAwayFromSquad();
    end, l_dependencyArray_0(v123.navigateAwayFromSquad, v127, v140.fireSquadAnalytics, if v22 then v129 else nil));
    local v145 = v11.useCallback(function(v144) --[[ Line: 461 ]]
        -- upvalues: l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v139 (copy), l_SessionType_0 (ref), l_HttpService_0 (ref), v140 (copy), l_EventNames_0 (ref), v127 (copy), v21 (ref), v22 (ref), v129 (copy), v124 (copy), v123 (copy)
        if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then
            v139.updateMetadata(l_SessionType_0.Metadata.SquadLobbyPage.ExperiencePickerUuid, l_HttpService_0:GenerateGUID(false));
        end;
        v140.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v127, 
            actionType = v21.PickExperienceButtonClicked, 
            isFtuxTooltipShown = v144, 
            voiceStatus = if v22 then v129 else nil
        });
        if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldOpenSLPFromExpPickerEnabled() then
            v140.showSearchOverlay(v124);
            return;
        else
            v123.navigateToHomePage();
            return;
        end;
    end, {
        v127, 
        v123.navigateToHomePage, 
        v140.fireSquadAnalytics, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldOpenSLPFromExpPickerEnabled() then v124 else nil, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldOpenSLPFromExpPickerEnabled() then v140.showSearchOverlay else nil, 
        if l_SquadCoordinationExperienceJoinExperimentation_0.getIsSquadLobbySessionEnabled() then v139.updateMetadata else nil, 
        if v22 then v129 else nil
    });
    local v147 = v11.useCallback(function(v146) --[[ Line: 495 ]]
        -- upvalues: v140 (copy), l_EventNames_0 (ref), v127 (copy), v21 (ref), v22 (ref), v129 (copy), v124 (copy), l_leaveSquad_0 (ref), v123 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v141 (copy)
        v140.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v127, 
            actionType = v21.EndCallButtonClicked, 
            isFtuxTooltipShown = v146, 
            voiceStatus = if v22 then v129 else nil
        });
        v124(l_leaveSquad_0(nil, v140.setSquadPrompt, function() --[[ Line: 507 ]]
            -- upvalues: v123 (ref)
            v123.navigateAwayFromSquad();
        end, v140.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v141));
    end, l_dependencyArray_0(v124, v123.navigateAwayFromSquad, v127, v140.fireSquadAnalytics, v140.setSquadPrompt, v140.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v141 else nil, if v22 then v129 else nil));
    local v148 = v123.squadState ~= l_SquadState_0.Active;
    local v149 = v11.useMemo(function() --[[ Line: 530 ]]
        -- upvalues: v11 (ref), v100 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v130 (copy), v148 (copy), v143 (copy), v133 (copy), v125 (copy), v123 (copy), l_Badge_0 (ref), v126 (copy), v61 (ref), l_BadgeVariant_0 (ref), v109 (ref)
        return v11.createElement(v100, {
            currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, 
            enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
            ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
            isDisabled = v148, 
            layoutOrder = 2, 
            onActivated = v143, 
            onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil, 
            showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
            tooltipText = v125.viewChatText, 
            triggerPointName = "ChatButton"
        }, {
            UnreadMessagesBadge = if v123.hasUnreadMessages then v11.createElement(l_Badge_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(1, -v126.Size.Size_250, 0, v126.Size.Size_250), 
                badgeVariant = if v61 then nil else l_BadgeVariant_0.Alert, 
                variant = if v61 then l_BadgeVariant_0.Alert else nil
            }) else nil; 
            v109(v148, "icons/menu/platformChatOff", "size-800-800", v126)
        });
    end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, v126, v148, v125.viewChatText, v143, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil, v123.hasUnreadMessages));
    local v150 = v11.useMemo(function() --[[ Line: 580 ]]
        -- upvalues: v123 (copy), v11 (ref), v100 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v130 (copy), v148 (copy), v145 (copy), v133 (copy), v134 (copy), v125 (copy), v109 (ref), v64 (ref), v62 (ref), v126 (copy)
        if v123.isInExperience then
            return nil;
        else
            return (v11.createElement(v100, {
                currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, 
                enableFirstTimeTooltip = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and true or nil, 
                ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "SquadExperiencePickerTooltipSeen" or nil, 
                isDisabled = v148, 
                layoutOrder = 3, 
                onActivated = v145, 
                onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil, 
                showFtuxCustomConditionsMet = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v134 >= 2 else nil, 
                tooltipText = v125.findExperiencesText, 
                triggerPointName = "PickExperienceButton"
            }, v109(v148, v64, v62, v126)));
        end;
    end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, v126, v148, v125.findExperiencesText, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v134 else nil, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil, v123.isInExperience, v123.navigateToHomePage));
    local v152 = v11.useMemo(function() --[[ Line: 625 ]]
        -- upvalues: v148 (copy), v126 (copy), v11 (ref), v100 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v130 (copy), v147 (copy), v133 (copy), v125 (copy), v109 (ref)
        local v151 = if v148 then v126.Color.ActionStandard.Background else v126.Color.System.Alert;
        return v11.createElement(v100, {
            backgroundStyle = v151, 
            currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, 
            enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
            ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
            isDisabled = v148, 
            layoutOrder = 4, 
            onActivated = v147, 
            onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil, 
            showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
            tooltipText = v125.leavePartyText, 
            triggerPointName = "EndCallButton"
        }, v109(v148, "icons/navigation/close", "size-600-600", v126));
    end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, v126, v148, v125.leavePartyText, v147, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil));
    local v153 = nil;
    local v154 = nil;
    local v155 = nil;
    if l_GetFFlagEnableCrossExpVoice_0() then
        local v156 = tonumber(l_useLocalUserId_0()) or -1;
        local v157 = v11.useRef(0);
        local v158 = l_useBackgroundExperience_0();
        local v159 = l_useParticipant_0(v156);
        local v160 = l_useIsVoiceConnected_0();
        local v161 = l_useIsVoiceDisconnected_0();
        local v162 = l_useIsVoiceFocused_0() or v123.forceIsVoiceFocused;
        local v163 = l_useParticipants_0();
        local v164 = l_useIsActiveParticipant_0(v156);
        local v165, v166 = v11.useState(0);
        local l_l_game_EngineFeature_0_0 = l_game_EngineFeature_0;
        local v169 = v11.useCallback(function(_) --[[ Line: 683 ]]
            -- upvalues: l_HttpService_0 (ref), v158 (copy), v159 (copy), v163 (copy), l_CrossExperienceVoiceManager_0 (ref)
            print("----------- CEV FOREGROUND -----------");
            print("Experience info", l_HttpService_0:JSONEncode(v158));
            print("Current Voice Participant", l_HttpService_0:JSONEncode(v159));
            print("Squads Store Participants", l_HttpService_0:JSONEncode(v163 or {}));
            print("--------------------------------------");
            l_CrossExperienceVoiceManager_0.default:dumpDebugData();
        end, l_dependencyArray_0(v163, v159));
        local v171 = v11.useCallback(function(_) --[[ Line: 692 ]]
            -- upvalues: v159 (copy), l_CrossExperienceVoiceManager_0 (ref)
            if v159 then
                if v159.isMuted then
                    l_CrossExperienceVoiceManager_0.default:unmuteVoiceParticipant(v159.userId);
                    return;
                else
                    l_CrossExperienceVoiceManager_0.default:muteVoiceParticipant(v159.userId);
                end;
            end;
        end, {
            v159
        });
        v11.useEffect(function() --[[ Line: 702 ]]
            -- upvalues: l_RunService_0 (ref), v138 (copy), v157 (copy), v166 (copy)
            l_RunService_0:BindToRenderStep(v138, 1, function() --[[ Line: 703 ]]
                -- upvalues: v157 (ref), v166 (ref)
                if v157.current > 3 then
                    v166(math.random());
                    v157.current = 0;
                    return;
                else
                    v157.current = v157.current + 1;
                    return;
                end;
            end);
            return function() --[[ Line: 712 ]]
                -- upvalues: l_RunService_0 (ref), v138 (ref)
                l_RunService_0:UnbindFromRenderStep(v138);
            end;
        end, {});
        v153 = v11.useMemo(function() --[[ Line: 718 ]]
            -- upvalues: v148 (copy), l_l_game_EngineFeature_0_0 (copy), v160 (copy), v122 (ref), v126 (copy), v125 (copy), v123 (copy), v130 (copy), v133 (copy)
            if not v148 and l_l_game_EngineFeature_0_0 and v160 then
                return v122(v126, v125.audioText, v123.toggleVoiceChatMenu, v130, v133);
            else
                return nil;
            end;
        end, l_dependencyArray_0(v126, l_l_game_EngineFeature_0_0, v130, v148, v160, v125.audioText, v133, v123.toggleVoiceChatMenu));
        if v56 then
            v154 = v11.useMemo(function() --[[ Line: 744 ]]
                -- upvalues: v11 (ref), v100 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v130 (copy), v148 (copy), v169 (copy), v133 (copy), v109 (ref), v126 (copy)
                return v11.createElement(v100, {
                    currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, 
                    enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
                    ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
                    isDisabled = v148, 
                    layoutOrder = 5, 
                    onActivated = v169, 
                    onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil, 
                    showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
                    tooltipText = "Debug voice", 
                    triggerPointName = "DebugVoiceButton"
                }, v109(v148, "icons/status/player/developer", "size-600-600", v126));
            end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, v126, v148, v169, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil));
        end;
        local v172 = v11.useMemo(function() --[[ Line: 782 ]]
            -- upvalues: v116 (ref), v126 (copy), v159 (copy), v160 (copy), v148 (copy), v164 (copy), v165 (copy)
            return v116(v126, v159, v160, not v148 and v164, v165);
        end, l_dependencyArray_0(v164, v148, v160, v165, v159, v126));
        v155 = v11.useMemo(function() --[[ Line: 793 ]]
            -- upvalues: v57 (ref), v161 (copy), v148 (copy), l_game_EngineFeature_0 (ref), v162 (copy), v160 (copy), v159 (copy), v11 (ref), v100 (ref), l_SquadCoordinationExperienceJoinExperimentation_0 (ref), v130 (copy), v171 (copy), v133 (copy), v125 (copy), v109 (ref), v172 (copy), v126 (copy)
            if v57 and v161 then
                return nil;
            elseif v148 or not l_game_EngineFeature_0 or v162 then
                local v173 = not v160 or v159 == nil or v148;
                local v174 = not v160 or not v159 or v159.isMuted;
                return v11.createElement(v100, {
                    currentHoveredButton = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, 
                    enableFirstTimeTooltip = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
                    ftuxAppStorageKey = l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and "" or nil, 
                    isDisabled = v173, 
                    layoutOrder = 1, 
                    onActivated = v171, 
                    onHoverCalled = if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil, 
                    showFtuxCustomConditionsMet = not l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() and nil, 
                    tooltipText = if v174 then v125.unmuteMicText else v125.muteMicText, 
                    triggerPointName = "ToggleMicButton"
                }, v109(v173, v172, "size-800-800", v126));
            else
                return nil;
            end;
        end, l_dependencyArray_0(if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v130 else nil, v126, v172, v148, v162, v160, v125.muteMicText, v125.unmuteMicText, if l_SquadCoordinationExperienceJoinExperimentation_0.getShouldShowFTUXOnExpPickerEnabled() then v133 else nil, v171, v159, v161));
    end;
    return v11.createElement(v10.View, {
        AutomaticSize = Enum.AutomaticSize.X, 
        AnchorPoint = v123.anchorPoint, 
        Position = v123.position, 
        Size = UDim2.fromOffset(0, v19.SQUAD_LOBBY_ACTION_BAR_HEIGHT), 
        backgroundStyle = v126.Color.OverMedia.OverMedia_0, 
        cornerRadius = UDim.new(0, v126.Radius.Circle), 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v126.Gap.Large), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        padding = v126.Padding.Small
    }, {
        ToggleAudioFocusButton = v153, 
        ToggleMicButton = v155, 
        ChatButton = if v137 then v149 else nil, 
        PickExperienceButton = v150, 
        EndCallButton = v152, 
        DebugVoiceButton = v154
    });
end;