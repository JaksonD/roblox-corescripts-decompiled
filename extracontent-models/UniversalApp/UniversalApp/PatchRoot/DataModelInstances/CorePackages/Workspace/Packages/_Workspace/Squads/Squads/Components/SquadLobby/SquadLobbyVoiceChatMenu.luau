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
local v28 = l_Images_0["component_assets/circle_24_stroke_1"];
local v29 = l_Images_0["component_assets/circle_16"];
local v30 = {
    forceEnableAudioFocusToggle = false, 
    forceShowVoiceChangerSection = false, 
    openSquadVoiceChangers = function() --[[ Line: 56 ]] --[[ Name: openSquadVoiceChangers ]]

    end
};
local function v33(v31) --[[ Line: 66 ]]
    -- upvalues: l_useTokens_0 (copy), l_React_0 (copy), l_Foundation_0 (copy), v26 (copy), l_ContextualSlider_0 (copy)
    local v32 = l_useTokens_0();
    return l_React_0.createElement(l_Foundation_0.View, if v26 then {
        tag = "size-full-0 auto-y padding-y-small col gap-small", 
        LayoutOrder = v31.LayoutOrder
    } else {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        padding = {
            top = UDim.new(0, v32.Padding.Small), 
            bottom = UDim.new(0, v32.Padding.Small)
        }, 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v32.Gap.Small)
        }, 
        LayoutOrder = v31.LayoutOrder
    }, {
        Label = l_React_0.createElement(l_Foundation_0.Text, if v26 then {
            tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left text-label-medium content-emphasis", 
            LayoutOrder = 1, 
            Text = v31.labelText
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            fontStyle = v32.Typography.LabelMedium, 
            textStyle = v32.Color.Content.Emphasis, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1, 
            Text = v31.labelText
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
                value = v31.sliderValue, 
                onValueChanged = v31.onValueChanged
            })
        })
    });
end;
local function v38(v34) --[[ Line: 145 ]]
    -- upvalues: l_useTokens_0 (copy), l_React_0 (copy), l_Foundation_0 (copy), v26 (copy), l_ImageSetLabel_0 (copy), v28 (copy), v29 (copy)
    local v35 = l_useTokens_0();
    local l_Color3_0 = v35.Color.Content.Emphasis.Color3;
    local l_Transparency_0 = v35.Color.Content.Emphasis.Transparency;
    return l_React_0.createElement(l_Foundation_0.View, if v26 then {
        tag = "size-full-0 auto-y padding-x-large padding-y-xsmall row align-x-left align-y-center gap-large", 
        LayoutOrder = v34.LayoutOrder, 
        onActivated = v34.onActivated
    } else {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        padding = Vector2.new(v35.Padding.Large, v35.Padding.XSmall), 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v35.Gap.Large)
        }, 
        LayoutOrder = v34.LayoutOrder, 
        onActivated = v34.onActivated
    }, {
        Icon = l_React_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromOffset(24, 24), 
            BackgroundTransparency = 1, 
            Image = v34.icon, 
            ImageColor3 = l_Color3_0, 
            ImageTransparency = l_Transparency_0, 
            LayoutOrder = 1
        }), 
        Label = l_React_0.createElement(l_Foundation_0.Text, if v26 then {
            tag = "auto-xy fill text-truncate-end text-no-wrap text-align-x-left text-label-medium content-emphasis", 
            LayoutOrder = 2, 
            Text = v34.labelText
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            flexItem = {
                FlexMode = Enum.UIFlexMode.Fill
            }, 
            fontStyle = v35.Typography.LabelMedium, 
            textStyle = v35.Color.Content.Emphasis, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = false, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2, 
            Text = v34.labelText
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
                Image = v28, 
                Size = UDim2.new(0, 24, 0, 24), 
                ImageColor3 = l_Color3_0, 
                ImageTransparency = l_Transparency_0, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }, {
                SelectedIcon = v34.isSelected and l_React_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v29, 
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
return function(v39) --[[ Line: 248 ]]
    -- upvalues: v10 (copy), v30 (copy), l_useTokens_0 (copy), l_useLocalUserId_0 (copy), l_useIsVoiceFocused_0 (copy), l_useEnableAudioFocusToggle_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_dependencyArray_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_CrossExperienceVoiceManager_0 (copy), l_game_EngineFeature_0 (copy), l_GameSettings_0 (copy), l_useLocalization_0 (copy), l_Foundation_0 (copy), v26 (copy), v33 (copy), v38 (copy), l_Images_0 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy)
    local v40 = v10.Dictionary.join(v30, v39);
    local v41 = l_useTokens_0();
    local v42 = l_useLocalUserId_0();
    local v43 = l_useIsVoiceFocused_0();
    local v44 = l_useEnableAudioFocusToggle_0();
    local v45 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v47 = l_React_0.useCallback(function(v46) --[[ Line: 256 ]]
        -- upvalues: v42 (copy)
        return v46.Squad.Presence.byUserId[tostring(v42)];
    end, {
        v42
    });
    local v48 = l_useSelector_0(v47);
    local v49 = l_React_0.useMemo(function() --[[ Line: 261 ]]
        -- upvalues: v48 (copy), l_PresenceType_0 (ref)
        return v48 and v48.userPresenceType == l_PresenceType_0.InGame;
    end, l_dependencyArray_0(v48));
    local v50 = l_React_0.useMemo(function() --[[ Line: 265 ]]
        -- upvalues: v48 (copy), v49 (copy)
        if v48 and v49 then
            return v48.lastLocation;
        else
            return nil;
        end;
    end, l_dependencyArray_0(v48, v49));
    local v51 = l_useCurrentSquadParentChannelId_0();
    local v52 = v45.useParentChannelTitleSelector(v51 or "");
    local v53 = l_React_0.useCallback(function() --[[ Line: 273 ]]
        -- upvalues: l_CrossExperienceVoiceManager_0 (ref)
        l_CrossExperienceVoiceManager_0.default:toggleAudioFocus();
    end, {});
    local l_l_game_EngineFeature_0_0 = l_game_EngineFeature_0;
    local v55 = v49 or not l_l_game_EngineFeature_0_0;
    local v56 = l_l_game_EngineFeature_0_0 and v55;
    local v57 = v49 and (v44 or v40.forceEnableAudioFocusToggle);
    local v58, v59 = l_React_0.useState(if l_game_EngineFeature_0 then l_GameSettings_0.PartyVoiceVolume else 0);
    local v60, v61 = l_React_0.useState(l_GameSettings_0.MasterVolume);
    local v62 = l_useLocalization_0({
        volumeLabelText = "Feature.Squads.Label.Volume", 
        partyVolumeLabelText = "Feature.Squads.Label.PartyVolume", 
        experienceLabelText = "Feature.Squads.Label.Experience", 
        voiceChatsLabelText = "Feature.Squads.Label.VoiceChats", 
        partyLabelText = "Feature.Squads.Label.Party"
    });
    local v63 = if v56 then v62.partyLabelText else v62.partyVolumeLabelText;
    local v64 = if l_l_game_EngineFeature_0_0 then v62.experienceLabelText else v62.volumeLabelText;
    local v65 = l_React_0.useCallback(function() --[[ Line: 301 ]]
        -- upvalues: v43 (copy), v53 (copy)
        if not v43 then
            v53();
        end;
    end, {
        v43, 
        v53
    });
    local v66 = l_React_0.useCallback(function() --[[ Line: 307 ]]
        -- upvalues: v43 (copy), v53 (copy)
        if v43 then
            v53();
        end;
    end, {
        v43, 
        v53
    });
    local v67 = nil;
    v67 = l_React_0.useCallback(function() --[[ Line: 314 ]]
        -- upvalues: v40 (copy)
        if v40.openSquadVoiceChangers then
            v40.openSquadVoiceChangers();
        end;
    end, l_dependencyArray_0(v40.openSquadVoiceChangers));
    return l_React_0.createElement(l_Foundation_0.View, if v26 then {
        tag = "size-full-0 auto-y padding-y-small radius-medium bg-surface-300 col"
    } else {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        padding = Vector2.new(0, v41.Padding.Small), 
        cornerRadius = UDim.new(0, v41.Radius.Medium), 
        backgroundStyle = v41.Color.Surface.Surface_300, 
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
            padding = Vector2.new(v41.Padding.Large, 0), 
            layout = {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }, 
            LayoutOrder = 1
        }, {
            VolumeLabel = v56 and l_React_0.createElement(l_Foundation_0.Text, if v26 then {
                tag = "auto-xy text-truncate-end text-no-wrap text-align-x-left padding-y-xsmall text-title-small content-muted", 
                LayoutOrder = 1, 
                Text = v62.volumeLabelText
            } else {
                AutomaticSize = Enum.AutomaticSize.XY, 
                fontStyle = v41.Typography.TitleSmall, 
                textStyle = v41.Color.Content.Muted, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                padding = Vector2.new(0, v41.Padding.XSmall), 
                Text = v62.volumeLabelText
            }), 
            PartySliderGroup = l_l_game_EngineFeature_0_0 and l_React_0.createElement(v33, {
                LayoutOrder = 2, 
                labelText = v63, 
                sliderValue = v58, 
                onValueChanged = function(v68) --[[ Line: 381 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: l_GameSettings_0 (ref), v59 (copy)
                    l_GameSettings_0.PartyVoiceVolume = v68;
                    v59(v68);
                end
            }), 
            ExperienceSliderGroup = v55 and l_React_0.createElement(v33, {
                LayoutOrder = 3, 
                labelText = v64, 
                sliderValue = v60, 
                onValueChanged = function(v69) --[[ Line: 390 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: l_GameSettings_0 (ref), v61 (copy)
                    l_GameSettings_0.MasterVolume = v69;
                    v61(v69);
                end
            })
        }), 
        Divider = v57 and l_React_0.createElement(l_Foundation_0.View, if v26 then {
            tag = "size-full-0 auto-y padding-y-small", 
            LayoutOrder = 2
        } else {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2, 
            padding = Vector2.new(0, v41.Padding.Small)
        }, {
            Divider = l_React_0.createElement(l_Foundation_0.View, {
                Size = UDim2.new(1, 0, 0, 1), 
                backgroundStyle = v41.Color.Stroke.Default
            })
        }), 
        VoiceChatSection = v57 and l_React_0.createElement(l_Foundation_0.View, if v26 then {
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
                Text = v62.voiceChatsLabelText
            } else {
                AutomaticSize = Enum.AutomaticSize.XY, 
                fontStyle = v41.Typography.TitleSmall, 
                textStyle = v41.Color.Content.Muted, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                padding = Vector2.new(v41.Padding.Large, v41.Padding.XSmall), 
                Text = v62.voiceChatsLabelText
            }), 
            PartySelector = l_React_0.createElement(v38, {
                icon = l_Images_0["icons/menu/platformChatOff"], 
                LayoutOrder = 2, 
                labelText = v52 or "", 
                isSelected = v43, 
                onActivated = v65
            }), 
            ExperienceSelector = l_React_0.createElement(v38, {
                icon = l_Images_0["icons/menu/publicChatOff"], 
                LayoutOrder = 3, 
                labelText = v50 or "", 
                isSelected = not v43, 
                onActivated = v66
            })
        }), 
        VoiceChangerSection = if not not l_FFlagEnablePartyVoiceChangersInLua_0 or v40.forceShowVoiceChangerSection then l_React_0.createElement(l_Foundation_0.View, {
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
                onActivated = v67
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