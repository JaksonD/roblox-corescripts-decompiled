local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.CrossExperience);
local v5 = require(l_Parent_0.CrossExperienceVoice);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v7 = require(l_Parent_0.VoiceChat);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v9 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v9.React;
local l_Foundation_0 = v9.Foundation;
local l_SharedFlags_0 = v9.SharedFlags;
local l_default_0 = v5.CrossExperienceVoiceManager.default;
local l_VoiceStatus_0 = v4.Utils.VoiceStatus;
local l_VoiceStatusChanged_0 = v4.Actions.VoiceStatusChanged;
local l_useVoiceStatus_0 = v5.Hooks.useVoiceStatus;
local l_useLocalization_0 = v9.Hooks.useLocalization;
local l_useDispatch_0 = v9.Hooks.useDispatch;
local l_dependencyArray_0 = v9.Hooks.dependencyArray;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_useNavigation_0 = v9.useNavigation;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local l_useCurrentSquadId_0 = v9.SquadsCore.Hooks.useCurrentSquadId;
local l_useCurrentSquadParentChannelId_0 = v9.SquadsCore.Hooks.useCurrentSquadParentChannelId;
local l_useStore_0 = v9.Hooks.useStore;
local l_SquadPromptType_0 = v9.SquadsCore.Enums.SquadPromptType;
local l_SquadExternalContractContext_0 = v9.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_getFFlagEnableCrossExpVoiceMemoryCheck_0 = l_SharedFlags_0.getFFlagEnableCrossExpVoiceMemoryCheck;
local l_FFlagEnableVoiceEuConsentPrompt_0 = l_SharedFlags_0.FFlagEnableVoiceEuConsentPrompt;
local v30 = require(l_script_FirstAncestor_0.Hooks.useIsAnyOtherUserPartyVoiceEligible);
local l_useIsLocalPlayerPartyVoiceEligible_0 = v9.SquadsCore.Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useIsCurrentSquadPartyVoiceEligible_0 = v9.SquadsCore.Hooks.useIsCurrentSquadPartyVoiceEligible;
local l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 = v9.SquadsCore.Common.Constants.SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY;
local l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 = v9.SquadsCore.Common.Constants.SQUAD_VOICE_EU_MODAL_SEEN_KEY;
local l_getTableAppStorageKey_0 = v9.SquadsCore.Utils.appStorageAccess.getTableAppStorageKey;
local l_displayEuConsentPrompt_0 = v9.SquadsCore.Utils.displayEuConsentPrompt;
local v37 = game:DefineFastString("PartyVoiceBannerErrorUserNotEligibleURL", "");
local v38 = game:DefineFastFlag("DisallowSquadLobbyBannersInlineButtons", false);
local v39 = game:DefineFastFlag("DisablePartyVoiceEligibilityBanner", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v9.SharedFlags.FFlagRemoveDependencyArrayAntipattern;
openWebview = function(v41, v42) --[[ Line: 69 ]] --[[ Name: openWebview ]]
    -- upvalues: l_HttpService_0 (copy), l_GuiService_0 (copy)
    local v43 = l_HttpService_0:JSONEncode({
        title = if game:GetEngineFeature("SetWebViewTitle") then v41 else nil, 
        presentationStyle = 0, 
        visible = true, 
        url = v42
    });
    l_GuiService_0:BroadcastNotification(v43, 20);
end;
local function v51(v44) --[[ Line: 82 ]]
    -- upvalues: l_useTokens_0 (copy), v38 (copy), l_React_0 (copy), l_Foundation_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v45 = l_useTokens_0();
    local v46 = v44.isButtonInline and not v38;
    local v50 = l_React_0.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: l_React_0 (ref), l_Foundation_0 (ref), v45 (copy), v44 (copy)
        local v47 = {
            l_React_0.createElement(l_Foundation_0.Text, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                backgroundStyle = v45.Color.None, 
                colorstyle = v45.Color.Content.Emphasis, 
                fontStyle = v45.Typography.BodySmall, 
                LayoutOrder = 1, 
                Text = v44.label, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.None, 
                TextWrapped = true
            })
        };
        if v44.sublabels then
            for v48, v49 in ipairs(v44.sublabels) do
                if v49 and v49 ~= "" then
                    table.insert(v47, l_React_0.createElement(l_Foundation_0.Text, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        backgroundStyle = v45.Color.None, 
                        colorstyle = v45.Color.Content.Emphasis, 
                        fontStyle = v45.Typography.BodySmall, 
                        LayoutOrder = v48 + 1, 
                        Text = v49, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextTruncate = Enum.TextTruncate.None, 
                        TextWrapped = true, 
                        RichText = true
                    }));
                end;
            end;
        end;
        return v47;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v44.label, 
        v44.sublabels
    } else l_dependencyArray_0(v44.label, v44.sublabels));
    return l_React_0.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundColor3 = v45.Color.Surface.Surface_200.Color3, 
        BackgroundTransparency = v45.Color.Surface.Surface_200.Transparency, 
        LayoutOrder = v44.LayoutOrder
    }, {
        UICorner = l_React_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, v45.Radius.Small)
        }), 
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v45.Gap.XLarge), 
            PaddingRight = UDim.new(0, v45.Gap.XLarge), 
            PaddingTop = UDim.new(0, v45.Gap.Medium), 
            PaddingBottom = UDim.new(0, v45.Gap.Medium)
        }), 
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = if v46 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
            Padding = if v46 then UDim.new(0, v45.Gap.XSmall) else UDim.new(0, v45.Gap.Medium), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Wraps = not v46, 
            HorizontalFlex = if v46 then Enum.UIFlexAlignment.SpaceBetween else Enum.UIFlexAlignment.Fill, 
            VerticalFlex = if v46 then Enum.UIFlexAlignment.Fill else Enum.UIFlexAlignment.None
        }), 
        TextFrame = l_React_0.createElement(l_Foundation_0.View, {
            tag = "col auto-xy gap-small wrap", 
            LayoutOrder = 1
        }, v50), 
        InlineButton = if v44.onActivated and v46 then l_React_0.createElement(l_Foundation_0.Button, {
            LayoutOrder = 2, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            text = v44.buttonLabel, 
            variant = l_Foundation_0.Enums.ButtonVariant.Link, 
            onActivated = v44.onActivated
        }) else nil, 
        BottomButton = if not v44.onActivated or v46 then nil else l_React_0.createElement(l_Foundation_0.Button, {
            LayoutOrder = 2, 
            text = v44.buttonLabel, 
            variant = l_Foundation_0.Enums.ButtonVariant.Standard, 
            size = l_Foundation_0.Enums.ButtonSize.Small, 
            onActivated = v44.onActivated, 
            fillBehavior = l_Foundation_0.Enums.FillBehavior.Fill
        })
    });
end;
local function v62(v52) --[[ Line: 186 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_getTableAppStorageKey_0 (copy), l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0 (copy), l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_HttpService_0 (copy), l_dependencyArray_0 (copy), l_default_0 (copy), v51 (copy), l_displayEuConsentPrompt_0 (copy)
    local v53 = l_useLocalUserId_0();
    local v54 = l_useDispatch_0();
    local v55 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v56, v57 = l_React_0.useState(false);
    local v58 = l_getTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_SEEN_KEY_0);
    local v59 = l_getTableAppStorageKey_0(l_SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY_0);
    l_React_0.useEffect(function() --[[ Line: 196 ]]
        -- upvalues: v58 (copy), v53 (copy), v59 (copy), v57 (copy)
        if v58[tostring(v53)] and not v59[tostring(v53)] then
            v57(true);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_HttpService_0:JSONEncode(v58), 
        l_HttpService_0:JSONEncode(v59)
    } else l_dependencyArray_0(l_HttpService_0:JSONEncode(v58), l_HttpService_0:JSONEncode(v59)));
    l_React_0.useEffect(function() --[[ Line: 210 ]]
        -- upvalues: l_default_0 (ref), v57 (copy)
        local v60 = l_default_0.VoiceEuModalConsented.Event:Connect(function() --[[ Line: 211 ]]
            -- upvalues: v57 (ref)
            v57(false);
        end);
        local v61 = l_default_0.VoiceEuModalRefused.Event:Connect(function() --[[ Line: 216 ]]
            -- upvalues: v57 (ref)
            v57(true);
        end);
        return function() --[[ Line: 220 ]]
            -- upvalues: v60 (copy), v61 (copy)
            v60:Disconnect();
            v61:Disconnect();
        end;
    end, {});
    if v56 then
        return (l_React_0.createElement(v51, {
            LayoutOrder = v52.LayoutOrder, 
            label = "Give consent to the voice recording policy in order to access voice chat.", 
            buttonLabel = "Connect", 
            isButtonInline = true, 
            onActivated = function() --[[ Line: 232 ]] --[[ Name: onActivated ]]
                -- upvalues: v54 (copy), l_displayEuConsentPrompt_0 (ref), v55 (copy), v53 (copy), v58 (copy), v59 (copy)
                v54(l_displayEuConsentPrompt_0(v55.setSquadPrompt, tostring(v53), v58, v59));
            end
        }));
    else
        return nil;
    end;
end;
local function v75(v63) --[[ Line: 246 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useStore_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), l_useVoiceStatus_0 (copy), v4 (copy), l_VoiceStatus_0 (copy), l_useLocalization_0 (copy), l_VoiceStatusChanged_0 (copy), l_default_0 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (copy), l_SquadPromptType_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v51 (copy)
    local v64 = l_useDispatch_0();
    local v65 = l_useStore_0();
    local v66 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v67 = l_useCurrentSquadId_0() or "";
    local v68 = l_useVoiceStatus_0();
    local v69 = v68 == v4.Constants.VOICE_STATUS.ERROR_JOIN_FEASIBILITY_CHECK_FAILED;
    local v70 = l_VoiceStatus_0.isVoiceRetriableErrorByGameJoin(v68) or l_VoiceStatus_0.isVoiceRetriableErrorByVoiceJoin(v68);
    local v71 = l_useLocalization_0({
        errorText = "Feature.Squads.Label.VoiceErrorGeneral", 
        errorButton = "Feature.Squads.Action.VoiceErrorGeneral"
    });
    local v74 = l_React_0.useCallback(function() --[[ Line: 262 ]]
        -- upvalues: v64 (copy), l_VoiceStatusChanged_0 (ref), v4 (ref), l_default_0 (ref), v67 (copy), l_getFFlagEnableCrossExpVoiceMemoryCheck_0 (ref), v69 (copy), v66 (copy), v65 (copy), l_SquadPromptType_0 (ref), l_VoiceStatus_0 (ref), v68 (copy)
        local function v73(v72) --[[ Line: 263 ]]
            -- upvalues: v64 (ref), l_VoiceStatusChanged_0 (ref), v4 (ref), l_default_0 (ref), v67 (ref)
            v64(l_VoiceStatusChanged_0({
                status = v4.Constants.VOICE_STATUS.RCC_CONNECTING
            }));
            l_default_0:join({
                partyId = v67, 
                force = true, 
                shouldIgnoreMemoryWarning = v72
            });
        end;
        if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() and v69 then
            if l_default_0:performJoinFeasibilityCheck() then
                v73();
                return;
            else
                v66.setSquadPrompt(v65, {
                    hideCancelButton = false, 
                    promptType = l_SquadPromptType_0.ConnectVoiceWithLowMemory, 
                    onConfirm = function() --[[ Line: 284 ]] --[[ Name: onConfirm ]]

                    end, 
                    onCancel = function() --[[ Line: 285 ]] --[[ Name: onCancel ]]
                        -- upvalues: v73 (copy)
                        v73(true);
                    end
                });
                return;
            end;
        elseif l_VoiceStatus_0.isVoiceRetriableErrorByGameJoin(v68) then
            if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() then
                v73();
                return;
            else
                v64(l_VoiceStatusChanged_0({
                    status = v4.Constants.VOICE_STATUS.RCC_CONNECTING
                }));
                l_default_0:join({
                    partyId = v67, 
                    force = true
                });
                return;
            end;
        else
            if l_VoiceStatus_0.isVoiceRetriableErrorByVoiceJoin(v68) then
                l_default_0:rejoinVoice();
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v68, 
        v67, 
        v69
    } else l_dependencyArray_0(v68, v67, v69));
    if l_getFFlagEnableCrossExpVoiceMemoryCheck_0() and v69 or v70 then
        return (l_React_0.createElement(v51, {
            LayoutOrder = v63.LayoutOrder, 
            label = v71.errorText, 
            buttonLabel = v71.errorButton, 
            isButtonInline = true, 
            onActivated = if v67 ~= "" then v74 else nil
        }));
    else
        return nil;
    end;
end;
local function v85(v76) --[[ Line: 329 ]]
    -- upvalues: l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), v30 (copy), l_useLocalization_0 (copy), l_useAppPolicy_0 (copy), l_React_0 (copy), v37 (copy), v51 (copy)
    local v77 = l_useIsCurrentSquadPartyVoiceEligible_0();
    local v78 = l_useIsLocalPlayerPartyVoiceEligible_0();
    local v79 = v30();
    local v80 = l_useLocalization_0({
        errorText = "Feature.Squads.Label.VoiceErrorUserIneligible", 
        errorButton = "Feature.Squads.Action.VoiceErrorUserIneligible"
    });
    local v82 = l_useAppPolicy_0(function(v81) --[[ Line: 337 ]]
        return v81.getWebViewSupport();
    end);
    local v83 = v77 and not v78 and v79;
    local v84 = l_React_0.useCallback(function() --[[ Line: 345 ]]
        -- upvalues: v37 (ref), v80 (copy)
        if v37 ~= "" then
            openWebview(v80.errorButton, v37);
        end;
    end, {
        v80.errorButton
    });
    if not v83 then
        return nil;
    else
        return l_React_0.createElement(v51, {
            LayoutOrder = v76.LayoutOrder, 
            label = v80.errorText, 
            buttonLabel = v80.errorButton, 
            isButtonInline = false, 
            onActivated = if v82 and v37 ~= "" then v84 else nil
        });
    end;
end;
local function v97(v86) --[[ Line: 366 ]]
    -- upvalues: l_useVoiceStatus_0 (copy), l_useCurrentSquadId_0 (copy), l_React_0 (copy), v7 (copy), l_useAppPolicy_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useLocalization_0 (copy), l_VoiceStatus_0 (copy), v51 (copy)
    local v87 = l_useVoiceStatus_0();
    local v88 = l_useCurrentSquadId_0() or "";
    local v89 = l_React_0.useMemo(function() --[[ Line: 369 ]]
        -- upvalues: v7 (ref)
        return v7.Utils.GetSettingsAppAvailable();
    end, {});
    local v91 = l_useAppPolicy_0(function(v90) --[[ Line: 373 ]]
        return v90;
    end);
    local v92 = l_React_0.useMemo(function() --[[ Line: 378 ]]
        -- upvalues: v89 (copy), v91 (copy)
        return (if v89 then v91.getMicSettingsDeeplinkDirectionsLocaleKey() else v91.getMicSettingsDirectionsLocaleKey()) or nil;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v91, 
        v89
    } else l_dependencyArray_0(v91, v89));
    local v93 = l_React_0.useMemo(function() --[[ Line: 390 ]]
        -- upvalues: v91 (copy)
        if v91.getRequiresAppRestartOnMicAccessChange() then
            return "Feature.SettingsHub.Prompt.RestartOnMicAccessChange";
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v91, 
        v89
    } else l_dependencyArray_0(v91, v89));
    local v94 = l_useLocalization_0({
        errorText = "Feature.SettingsHub.Prompt.Subtitle.AllowMicrophoneAccess", 
        errorSubtext1 = v92, 
        errorSubtext2 = v93, 
        errorButton = "Feature.SettingsHub.Action.OpenSettings"
    });
    local v95 = l_VoiceStatus_0.isMicPermissionsError(v87);
    local v96 = l_React_0.useCallback(function() --[[ Line: 410 ]]
        -- upvalues: v7 (ref)
        pcall(function() --[[ Line: 411 ]]
            -- upvalues: v7 (ref)
            v7.Utils.SwitchToMicrophoneSettings();
        end);
    end, {});
    if v95 then
        return (l_React_0.createElement(v51, {
            LayoutOrder = v86.LayoutOrder, 
            label = v94.errorText, 
            sublabels = {
                v94.errorSubtext1, 
                v94.errorSubtext2
            }, 
            buttonLabel = v94.errorButton, 
            isButtonInline = true, 
            onActivated = if v88 ~= "" and v89 then v96 else nil
        }));
    else
        return nil;
    end;
end;
local function v106(v98) --[[ Line: 432 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useLocalization_0 (copy), l_React_0 (copy), v51 (copy)
    local v99 = l_useNavigation_0();
    local v100 = l_useCurrentSquadParentChannelId_0() or "";
    local v101 = l_useIsCurrentSquadPartyVoiceEligible_0();
    local v102 = l_useIsLocalPlayerPartyVoiceEligible_0();
    local v103 = false;
    if v101 == false then
        v103 = v102;
    end;
    local v104 = l_useLocalization_0({
        errorText = "Feature.Squads.Label.VoiceErrorPartyNotVoiceEligible", 
        errorButton = "Feature.Squads.Action.VoiceErrorPartyNotVoiceEligible"
    });
    local v105 = l_React_0.useCallback(function() --[[ Line: 443 ]]
        -- upvalues: v100 (copy), v99 (copy)
        if v100 ~= "" then
            pcall(function() --[[ Line: 445 ]]
                -- upvalues: v99 (ref), v100 (ref)
                v99.navigate("CreateUnfilteredChatPartialModal", {
                    conversationId = v100
                });
            end);
        end;
    end, {
        v100, 
        v99
    });
    if not v103 then
        return nil;
    else
        return l_React_0.createElement(v51, {
            LayoutOrder = v98.LayoutOrder, 
            label = v104.errorText, 
            buttonLabel = v104.errorButton, 
            isButtonInline = false, 
            onActivated = v105
        });
    end;
end;
return function(v107) --[[ Line: 470 ]]
    -- upvalues: l_useTokens_0 (copy), l_React_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v75 (copy), v39 (copy), v106 (copy), v85 (copy), v97 (copy), l_FFlagEnableVoiceEuConsentPrompt_0 (copy), v62 (copy)
    local v108 = l_useTokens_0();
    local v110 = l_React_0.useCallback(function(v109) --[[ Line: 472 ]]
        -- upvalues: v107 (copy)
        if v109 then
            v107.onAbsoluteSizeChanged(v109.AbsoluteSize);
        end;
    end, {
        v107.onAbsoluteSizeChanged
    });
    return l_React_0.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        [l_React_0.Change.AbsoluteSize] = v110
    }, {
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v108.Padding.XLarge), 
            PaddingRight = UDim.new(0, v108.Padding.XLarge)
        }), 
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v108.Gap.Medium)
        }), 
        VoiceErrorBanner = if l_GetFFlagEnableCrossExpVoice_0() then l_React_0.createElement(v75, {
            LayoutOrder = 1
        }) else nil, 
        PartyVoiceEligibilityBanner = if not l_GetFFlagEnableCrossExpVoice_0() or v39 then nil else l_React_0.createElement(v106, {
            LayoutOrder = 2
        }), 
        PartyVoiceUserEligibilityBanner = if l_GetFFlagEnableCrossExpVoice_0() then l_React_0.createElement(v85, {
            LayoutOrder = 3
        }) else nil, 
        VoiceMicPermissionsBanner = if l_GetFFlagEnableCrossExpVoice_0() then l_React_0.createElement(v97, {
            LayoutOrder = 4
        }) else nil, 
        VoiceEuModalConnectBanner = if l_GetFFlagEnableCrossExpVoice_0() and l_FFlagEnableVoiceEuConsentPrompt_0 then l_React_0.createElement(v62, {
            LayoutOrder = 5
        }) else nil
    });
end;