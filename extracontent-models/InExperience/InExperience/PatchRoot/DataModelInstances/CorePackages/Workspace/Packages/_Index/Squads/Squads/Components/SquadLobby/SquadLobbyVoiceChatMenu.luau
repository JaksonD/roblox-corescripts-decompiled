local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.CrossExperienceVoice);
local v3 = require(l_Parent_0.UIBlox);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v5 = require(l_script_FirstAncestor_0.dependencies);
local l_Foundation_0 = v5.Foundation;
local l_React_0 = v5.React;
local l_GameSettings_0 = UserSettings().GameSettings;
local l_game_EngineFeature_0 = game:GetEngineFeature("PartyVoiceVolume");
local v10 = require(l_Parent_0.Cryo);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v12 = require(l_Parent_0.SharedFlags);
local l_ContextualSlider_0 = v3.App.Slider.ContextualSlider;
local l_CrossExperienceVoiceManager_0 = v2.CrossExperienceVoiceManager;
local l_PresenceType_0 = v5.RoduxPresence.Enums.PresenceType;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_dependencyArray_0 = v5.Hooks.dependencyArray;
local l_useEnableAudioFocusToggle_0 = v2.Hooks.useEnableAudioFocusToggle;
local l_useIsVoiceFocused_0 = v2.Hooks.useIsVoiceFocused;
local l_useSelector_0 = v5.Hooks.useSelector;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_SquadExternalContractContext_0 = v5.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_useCurrentSquadParentChannelId_0 = v5.SquadsCore.Hooks.useCurrentSquadParentChannelId;
local v26 = require(l_Flags_0.FFlagSquadVoiceMenuFoundationRefactor);
local l_FFlagEnablePartyVoiceChangersInLua_0 = v12.FFlagEnablePartyVoiceChangersInLua;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v12.FFlagRemoveDependencyArrayAntipattern;
local v29 = l_Images_0["component_assets/circle_24_stroke_1"];
local v30 = l_Images_0["component_assets/circle_16"];
local v31 = {
    forceEnableAudioFocusToggle = false, 
    forceShowVoiceChangerSection = false, 
    openSquadVoiceChangers = function() --[[ Line: 58 ]] --[[ Name: openSquadVoiceChangers ]]

    end
};
local function v34(v32) --[[ Line: 68 ]]
    -- upvalues: l_useTokens_0 (copy), l_React_0 (copy), l_Foundation_0 (copy), v26 (copy), l_ContextualSlider_0 (copy)
    local v33 = l_useTokens_0();
    return l_React_0.createElement(l_Foundation_0.View, if v26 then {
        tag = "size-full-0 auto-y padding-y-small col gap-small", 
        LayoutOrder = v32.LayoutOrder
    } else {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        padding = {
            top = UDim.new(0, v33.Padding.Small), 
            bottom = UDim.new(0, v33.Padding.Small)
        }, 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v33.Gap.Small)
        }, 
        LayoutOrder = v32.LayoutOrder
    }, {
        Label = l_React_0.createElement(l_Foundation_0.Text, if v26 then {
            tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left text-label-medium content-emphasis", 
            LayoutOrder = 1, 
            Text = v32.labelText
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            fontStyle = v33.Typography.LabelMedium, 
            textStyle = v33.Color.Content.Emphasis, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1, 
            Text = v32.labelText
        }), 
        SliderWrapper = l_React_0.createElement(l_Foundation_0.View, if v26 then {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 2
        } else {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        }, {
            Slider = l_React_0.createElement(l_ContextualSlider_0, {
                width = UDim.new(1, 0), 
                stepInterval = 0.1, 
                min = 0, 
                max = 1, 
                value = v32.sliderValue, 
                onValueChanged = v32.onValueChanged
            })
        })
    });
end;
local function v39(v35) --[[ Line: 147 ]]
    -- upvalues: l_useTokens_0 (copy), l_React_0 (copy), l_Foundation_0 (copy), v26 (copy), l_ImageSetLabel_0 (copy), v29 (copy), v30 (copy)
    local v36 = l_useTokens_0();
    local l_Color3_0 = v36.Color.Content.Emphasis.Color3;
    local l_Transparency_0 = v36.Color.Content.Emphasis.Transparency;
    return l_React_0.createElement(l_Foundation_0.View, if v26 then {
        tag = "size-full-0 auto-y padding-x-large padding-y-xsmall row align-x-left align-y-center gap-large", 
        LayoutOrder = v35.LayoutOrder, 
        onActivated = v35.onActivated
    } else {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        padding = Vector2.new(v36.Padding.Large, v36.Padding.XSmall), 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v36.Gap.Large)
        }, 
        LayoutOrder = v35.LayoutOrder, 
        onActivated = v35.onActivated
    }, {
        Icon = l_React_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromOffset(24, 24), 
            BackgroundTransparency = 1, 
            Image = v35.icon, 
            ImageColor3 = l_Color3_0, 
            ImageTransparency = l_Transparency_0, 
            LayoutOrder = 1
        }), 
        Label = l_React_0.createElement(l_Foundation_0.Text, if v26 then {
            tag = "auto-xy fill text-truncate-end text-no-wrap text-align-x-left text-label-medium content-emphasis", 
            LayoutOrder = 2, 
            Text = v35.labelText
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            flexItem = {
                FlexMode = Enum.UIFlexMode.Fill
            }, 
            fontStyle = v36.Typography.LabelMedium, 
            textStyle = v36.Color.Content.Emphasis, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2, 
            Text = v35.labelText
        }), 
        RadioButtonContainer = l_React_0.createElement(l_Foundation_0.View, if v26 then {
            tag = "auto-x row align-x-right align-y-center", 
            Size = UDim2.new(0, 0, 0, 40), 
            LayoutOrder = 3
        } else {
            Size = UDim2.new(0, 0, 0, 40), 
            AutomaticSize = Enum.AutomaticSize.X, 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, 
            LayoutOrder = 3
        }, {
            DefaultIcon = l_React_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v29, 
                Size = UDim2.new(0, 24, 0, 24), 
                ImageColor3 = l_Color3_0, 
                ImageTransparency = l_Transparency_0, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }, {
                SelectedIcon = v35.isSelected and l_React_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v30, 
                    Size = UDim2.new(0, 16, 0, 16), 
                    ImageColor3 = l_Color3_0, 
                    ImageTransparency = l_Transparency_0, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                })
            })
        })
    });
end;
return function(v40) --[[ Line: 250 ]]
    -- upvalues: v10 (copy), v31 (copy), l_useTokens_0 (copy), l_useLocalUserId_0 (copy), l_useIsVoiceFocused_0 (copy), l_useEnableAudioFocusToggle_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_game_EngineFeature_0 (copy), l_GameSettings_0 (copy), l_useLocalization_0 (copy), l_Foundation_0 (copy), v26 (copy), v34 (copy), v39 (copy), l_Images_0 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy)
    local v41 = v10.Dictionary.join(v31, v40);
    local v42 = l_useTokens_0();
    local v43 = l_useLocalUserId_0();
    local v44 = l_useIsVoiceFocused_0();
    local v45 = l_useEnableAudioFocusToggle_0();
    local v46 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v48 = l_React_0.useCallback(function(v47) --[[ Line: 258 ]]
        -- upvalues: v43 (copy)
        return v47.Squad.Presence.byUserId[tostring(v43)];
    end, {
        v43
    });
    local v49 = l_useSelector_0(v48);
    local v50 = l_React_0.useMemo(function() --[[ Line: 263 ]]
        -- upvalues: v49 (copy), l_PresenceType_0 (ref)
        return v49 and v49.userPresenceType == l_PresenceType_0.InGame;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v49
    } else l_dependencyArray_0(v49));
    local v51 = l_React_0.useMemo(function() --[[ Line: 268 ]]
        -- upvalues: v49 (copy), v50 (copy)
        if v49 and v50 then
            return v49.lastLocation;
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v49, 
        v50
    } else l_dependencyArray_0(v49, v50));
    local v52 = l_useCurrentSquadParentChannelId_0();
    local v53 = v46.useParentChannelTitleSelector(v52 or "");
    local v54 = l_React_0.useCallback(function() --[[ Line: 280 ]]
        -- upvalues: l_CrossExperienceVoiceManager_0 (ref)
        l_CrossExperienceVoiceManager_0.default:toggleAudioFocus();
    end, {});
    local l_l_game_EngineFeature_0_0 = l_game_EngineFeature_0;
    local v56 = v50 or not l_l_game_EngineFeature_0_0;
    local v57 = l_l_game_EngineFeature_0_0 and v56;
    local v58 = v50 and (v45 or v41.forceEnableAudioFocusToggle);
    local v59, v60 = l_React_0.useState(if l_game_EngineFeature_0 then l_GameSettings_0.PartyVoiceVolume else 0);
    local v61, v62 = l_React_0.useState(l_GameSettings_0.MasterVolume);
    local v63 = l_useLocalization_0({
        volumeLabelText = "Feature.Squads.Label.Volume", 
        partyVolumeLabelText = "Feature.Squads.Label.PartyVolume", 
        experienceLabelText = "Feature.Squads.Label.Experience", 
        voiceChatsLabelText = "Feature.Squads.Label.VoiceChats", 
        partyLabelText = "Feature.Squads.Label.Party"
    });
    local v64 = if v57 then v63.partyLabelText else v63.partyVolumeLabelText;
    local v65 = if l_l_game_EngineFeature_0_0 then v63.experienceLabelText else v63.volumeLabelText;
    local v66 = l_React_0.useCallback(function() --[[ Line: 308 ]]
        -- upvalues: v44 (copy), v54 (copy)
        if not v44 then
            v54();
        end;
    end, {
        v44, 
        v54
    });
    local v67 = l_React_0.useCallback(function() --[[ Line: 314 ]]
        -- upvalues: v44 (copy), v54 (copy)
        if v44 then
            v54();
        end;
    end, {
        v44, 
        v54
    });
    local v68 = nil;
    v68 = l_React_0.useCallback(function() --[[ Line: 322 ]]
        -- upvalues: v41 (copy)
        if v41.openSquadVoiceChangers then
            v41.openSquadVoiceChangers();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v41.openSquadVoiceChangers
    } else l_dependencyArray_0(v41.openSquadVoiceChangers));
    return l_React_0.createElement(l_Foundation_0.View, if v26 then {
        tag = "size-full-0 auto-y padding-y-small radius-medium bg-surface-300 col"
    } else {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        padding = Vector2.new(0, v42.Padding.Small), 
        cornerRadius = UDim.new(0, v42.Radius.Medium), 
        backgroundStyle = v42.Color.Surface.Surface_300, 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }
    }, {
        VolumeSection = l_React_0.createElement(l_Foundation_0.View, if v26 then {
            tag = "size-full-0 auto-y padding-x-large col", 
            LayoutOrder = 1
        } else {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            padding = Vector2.new(v42.Padding.Large, 0), 
            layout = {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }, 
            LayoutOrder = 1
        }, {
            VolumeLabel = v57 and l_React_0.createElement(l_Foundation_0.Text, if v26 then {
                tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-y-xsmall text-title-small content-muted", 
                LayoutOrder = 1, 
                Text = v63.volumeLabelText
            } else {
                AutomaticSize = Enum.AutomaticSize.XY, 
                fontStyle = v42.Typography.TitleSmall, 
                textStyle = v42.Color.Content.Muted, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                padding = Vector2.new(0, v42.Padding.XSmall), 
                Text = v63.volumeLabelText
            }), 
            PartySliderGroup = l_l_game_EngineFeature_0_0 and l_React_0.createElement(v34, {
                LayoutOrder = 2, 
                labelText = v64, 
                sliderValue = v59, 
                onValueChanged = function(v69) --[[ Line: 393 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: l_GameSettings_0 (ref), v60 (copy)
                    l_GameSettings_0.PartyVoiceVolume = v69;
                    v60(v69);
                end
            }), 
            ExperienceSliderGroup = v56 and l_React_0.createElement(v34, {
                LayoutOrder = 3, 
                labelText = v65, 
                sliderValue = v61, 
                onValueChanged = function(v70) --[[ Line: 402 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: l_GameSettings_0 (ref), v62 (copy)
                    l_GameSettings_0.MasterVolume = v70;
                    v62(v70);
                end
            })
        }), 
        Divider = v58 and l_React_0.createElement(l_Foundation_0.View, if v26 then {
            tag = "size-full-0 auto-y padding-y-small", 
            LayoutOrder = 2
        } else {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2, 
            padding = Vector2.new(0, v42.Padding.Small)
        }, {
            Divider = l_React_0.createElement(l_Foundation_0.View, {
                Size = UDim2.new(1, 0, 0, 1), 
                backgroundStyle = v42.Color.Stroke.Default
            })
        }), 
        VoiceChatSection = v58 and l_React_0.createElement(l_Foundation_0.View, if v26 then {
            tag = "size-full-0 auto-y col", 
            LayoutOrder = 3
        } else {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            layout = {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }, 
            LayoutOrder = 3
        }, {
            VoiceChatLabel = l_React_0.createElement(l_Foundation_0.Text, if v26 then {
                tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-x-large padding-y-xsmall text-title-small content-muted", 
                LayoutOrder = 1, 
                Text = v63.voiceChatsLabelText
            } else {
                AutomaticSize = Enum.AutomaticSize.XY, 
                fontStyle = v42.Typography.TitleSmall, 
                textStyle = v42.Color.Content.Muted, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                padding = Vector2.new(v42.Padding.Large, v42.Padding.XSmall), 
                Text = v63.voiceChatsLabelText
            }), 
            PartySelector = l_React_0.createElement(v39, {
                icon = l_Images_0["icons/menu/platformChatOff"], 
                LayoutOrder = 2, 
                labelText = v53 or "", 
                isSelected = v44, 
                onActivated = v66
            }), 
            ExperienceSelector = l_React_0.createElement(v39, {
                icon = l_Images_0["icons/menu/publicChatOff"], 
                LayoutOrder = 3, 
                labelText = v51 or "", 
                isSelected = not v44, 
                onActivated = v67
            })
        }), 
        VoiceChangerSection = if not not l_FFlagEnablePartyVoiceChangersInLua_0 or v41.forceShowVoiceChangerSection then l_React_0.createElement(l_Foundation_0.View, {
            tag = "size-full-0 auto-y col", 
            LayoutOrder = 4
        }, {
            VoiceChangerSectionLabel = l_React_0.createElement(l_Foundation_0.Text, {
                tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-x-large padding-y-xsmall text-title-small content-muted", 
                LayoutOrder = 1, 
                Text = "Voice changers"
            }), 
            OpenVoiceChangerModal = l_React_0.createElement(l_Foundation_0.View, {
                tag = "size-full-0 auto-y row align-x-left align-y-center gap-large padding-x-large padding-y-xsmall", 
                LayoutOrder = 2, 
                onActivated = v68
            }, {
                ChooseVoicePackLabel = l_React_0.createElement(l_Foundation_0.Text, {
                    tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left fill text-label-medium content-emphasis", 
                    Size = UDim2.new(1, 0, 0, 40), 
                    LayoutOrder = 1, 
                    Text = "Choose voice pack"
                }), 
                OpenIcon = l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 2, 
                    name = "chevron-large-right"
                })
            })
        }) else nil
    });
end;