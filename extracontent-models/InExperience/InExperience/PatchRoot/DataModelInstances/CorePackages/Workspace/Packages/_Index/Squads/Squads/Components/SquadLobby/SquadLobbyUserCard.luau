local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.CrossExperienceVoice);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.UserProfiles);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v8 = require(l_Parent_0.BuilderIcons);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_Foundation_0 = v1.Foundation;
local l_React_0 = v1.React;
local l_SharedFlags_0 = v1.SharedFlags;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useParticipant_0 = v3.Hooks.useParticipant;
local l_useIsVoiceConnected_0 = v3.Hooks.useIsVoiceConnected;
local l_useIsActiveParticipant_0 = v3.Hooks.useIsActiveParticipant;
local l_useAnimatedTransparency_0 = v3.Hooks.useAnimatedTransparency;
local l_useIsParticipantMuted_0 = v3.Hooks.useIsParticipantMuted;
local l_useIsVoiceConnecting_0 = v3.Hooks.useIsVoiceConnecting;
local l_useIsMicPermissionsError_0 = v3.Hooks.useIsMicPermissionsError;
local l_useIsParticipantInOtherAudioContext_0 = v3.Hooks.useIsParticipantInOtherAudioContext;
local l_useIsParticipantMutedLocally_0 = v3.Hooks.useIsParticipantMutedLocally;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local v26 = require(l_script_FirstAncestor_0.Hooks.useSquadUserDropdownMenuButtons);
local l_useIsLocalPlayerPartyVoiceEligible_0 = v1.SquadsCore.Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useIsUserPartyVoiceEligible_0 = v1.SquadsCore.Hooks.useIsUserPartyVoiceEligible;
local l_useIsCurrentSquadPartyVoiceEligible_0 = v1.SquadsCore.Hooks.useIsCurrentSquadPartyVoiceEligible;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local l_FFlagEnableSquadUserCardHoverFix_0 = l_SharedFlags_0.FFlagEnableSquadUserCardHoverFix;
local l_IconSize_0 = l_Foundation_0.Enums.IconSize;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v35 = require(l_script_FirstAncestor_0.Enums.SquadUserPartyStatus);
local v36 = game:DefineFastFlag("EnablePartyVoiceCrossContextIdValidation", false);
local v37 = game:DefineFastFlag("ApplyVoiceConnectingStatusInPartySheet", false);
local v38 = game:DefineFastInt("PartyVoiceActivityIndicatorDebounceMs", 100);
local v39 = game:DefineFastInt("PartyVoiceActivityIndicatorAnimationMs", 100);
local l_FFlagEnablePartyVoiceChangersInLua_0 = l_SharedFlags_0.FFlagEnablePartyVoiceChangersInLua;
return function(v41) --[[ Line: 77 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), l_useAnimatedTransparency_0 (copy), v39 (copy), v5 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_React_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_useLocalUserId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useIsVoiceConnected_0 (copy), l_SharedFlags_0 (copy), l_useIsMicPermissionsError_0 (copy), l_useParticipant_0 (copy), l_useIsVoiceConnecting_0 (copy), l_useIsActiveParticipant_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useIsParticipantMutedLocally_0 (copy), l_useIsParticipantMuted_0 (copy), v36 (copy), l_useIsParticipantInOtherAudioContext_0 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v3 (copy), v38 (copy), v35 (copy), v37 (copy), l_Foundation_0 (copy), l_IconSize_0 (copy), v8 (copy), l_dependencyArray_0 (copy), l_FFlagEnableSquadUserCardHoverFix_0 (copy), v26 (copy), l_ImageSetLabel_0 (copy)
    local v42 = l_useLocalization_0({
        connectingText = "Feature.Squads.Label.Connecting", 
        inExperiencePresenceText = "Common.Presence.Label.InExperience", 
        invitedText = "Feature.Squads.Description.Invited", 
        noResponseText = "Feature.Squads.Description.NoResponse", 
        onlinePresenceText = "Common.Presence.Label.Online"
    });
    local v43 = l_useTokens_0();
    local v44, v45 = l_useAnimatedTransparency_0(1, v39, Enum.EasingStyle.Cubic);
    local v46 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v41.user.userId))
        }, 
        query = v5.Queries.userProfilesCombinedNameByUserIds
    });
    local v47 = "";
    if v46.data then
        v47 = v5.Selectors.getCombinedNameFromId(v46.data, v41.user.userId);
    end;
    local v48 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v41.user.userId)));
    local v50 = l_React_0.useCallback(function(v49) --[[ Line: 101 ]]
        -- upvalues: v41 (copy)
        return v49.Squad.Presence.byUserId[tostring(v41.user.userId)];
    end, {
        v41.user.userId
    });
    local v51 = l_useSelector_0(v50);
    local v52 = v51 and v51.userPresenceType == l_PresenceType_0.InGame;
    local v53 = nil;
    v53 = if v52 then if v51.lastLocation and v51.lastLocation ~= "" then v51.lastLocation else v42.inExperiencePresenceText else v42.onlinePresenceText;
    local l_isConnecting_0 = v41.isConnecting;
    local v55 = tonumber(l_useLocalUserId_0()) or 0;
    local v56 = v55 == v41.user.userId;
    local v57 = nil;
    local v58 = false;
    local v59 = false;
    local v60 = false;
    local v61 = false;
    local v62 = false;
    local v63 = false;
    local v64 = false;
    local v65 = false;
    local v66 = false;
    local v67 = false;
    local v68 = false;
    local v69 = false;
    local v70 = false;
    if l_GetFFlagEnableCrossExpVoice_0() then
        v59 = l_useIsVoiceConnected_0();
        if l_SharedFlags_0.FFlagPartyVoiceEnableMicPermissionsBanner then
            v69 = l_useIsMicPermissionsError_0();
        end;
        v57 = l_useParticipant_0(v41.user.userId);
        v67 = l_useIsVoiceConnecting_0() and v56;
        v58 = l_useIsActiveParticipant_0(v41.user.userId);
        v60 = l_useIsLocalPlayerPartyVoiceEligible_0();
        v61 = l_useIsUserPartyVoiceEligible_0(v41.user.userId);
        v62 = l_useIsCurrentSquadPartyVoiceEligible_0() == true;
        local v71 = l_useIsParticipantMutedLocally_0(v41.user.userId) == true;
        v68 = v61 and v62 and not v56 and v71;
        v66 = l_useIsParticipantMuted_0(v41.user.userId) and not v68;
        if v36 then
            v65 = l_useIsParticipantInOtherAudioContext_0(v55, v41.user.userId) == true;
        end;
        v63 = v62 and v60 and v61 and (not v59 or not v57 or v65 or v69);
        v64 = v62 and v60 and not v61;
        v70 = if l_FFlagEnablePartyVoiceChangersInLua_0 and v57 then v57.isVoiceChangerActive else false;
    end;
    local v73 = l_React_0.useMemo(function() --[[ Line: 173 ]]
        -- upvalues: v3 (ref), v45 (copy), v38 (ref)
        return v3.Utils.debounce(function(v72) --[[ Line: 174 ]]
            -- upvalues: v45 (ref)
            v45(v72);
        end, v38);
    end, {});
    l_React_0.useEffect(function() --[[ Line: 179 ]]
        -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (ref), v58 (ref), v73 (copy), v45 (copy)
        if l_GetFFlagEnableCrossExpVoice_0() then
            if v58 then
                v73.cancel();
                v45(0);
                return;
            else
                v73.call(1);
            end;
        end;
    end, {
        v58
    });
    local v74 = l_React_0.useMemo(function() --[[ Line: 191 ]]
        -- upvalues: v41 (copy), v35 (ref), v42 (copy), l_isConnecting_0 (copy), v37 (ref), v67 (ref), v53 (ref)
        if v41.user.partyStatus == v35.NoResponse then
            return v42.noResponseText;
        elseif v41.user.partyStatus == v35.Invited then
            return v42.invitedText;
        elseif l_isConnecting_0 or v37 and v67 then
            return v42.connectingText;
        else
            return v53;
        end;
    end, {
        v41.user and v41.user.partyStatus, 
        v53, 
        l_isConnecting_0, 
        v67, 
        v42.noResponse, 
        v42.invitedText, 
        v42.connectingText
    });
    local v75 = l_React_0.useMemo(function() --[[ Line: 213 ]]
        -- upvalues: v41 (copy), v35 (ref), l_React_0 (ref), l_Foundation_0 (ref), l_IconSize_0 (ref), v43 (copy), l_isConnecting_0 (copy), v37 (ref), v67 (ref), v52 (copy)
        if v41.user.partyStatus == v35.Invited then
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-xy"
            }, {
                LoadingIcon = l_React_0.createElement(l_Foundation_0.Loading, {
                    LayoutOrder = 1, 
                    size = l_IconSize_0.Small, 
                    Padding = v43.Padding.XSmall
                })
            });
        elseif v41.user.partyStatus == v35.NoResponse then
            return nil;
        elseif l_isConnecting_0 or v37 and v67 then
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-xy"
            }, {
                LoadingIcon = l_React_0.createElement(l_Foundation_0.Loading, {
                    LayoutOrder = 1, 
                    size = l_IconSize_0.Small, 
                    Padding = v43.Padding.XSmall
                })
            });
        elseif v52 then
            return l_React_0.createElement(l_Foundation_0.Icon, {
                LayoutOrder = 1, 
                name = "icons/common/play", 
                size = l_IconSize_0.Small, 
                style = v43.Color.Content.Emphasis
            });
        else
            return nil;
        end;
    end, {
        v41.user and v41.user.partyStatus, 
        l_isConnecting_0, 
        v67, 
        v52
    });
    local v76 = l_React_0.useMemo(function() --[[ Line: 246 ]]
        -- upvalues: v47 (ref), l_React_0 (ref), v43 (copy), v41 (copy), l_Foundation_0 (ref), l_IconSize_0 (ref), v68 (ref), v66 (ref), v63 (ref), v64 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v70 (ref), v8 (ref)
        if v47 ~= "" then
            return (l_React_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, v43.Gap.XSmall + 2), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                BlockedIcon = if v41.isBlocked then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 1, 
                    name = "icons/status/unavailable_small", 
                    size = l_IconSize_0.Small, 
                    style = v43.Color.Extended.Red.Red_800
                }) else nil, 
                MutedLocallyIcon = if v68 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 2, 
                    name = "icons/controls/voice/microphone_off_small_dark", 
                    size = l_IconSize_0.Small, 
                    style = v43.Color.Extended.Red.Red_800
                }) else nil, 
                MutedIcon = if v66 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 3, 
                    name = "icons/controls/microphoneMute_small", 
                    size = l_IconSize_0.Small, 
                    style = v43.Color.Content.Emphasis
                }) else nil, 
                NotVoiceParticipantIcon = if v63 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 4, 
                    name = "icons/controls/headphoneDeafen_small", 
                    size = l_IconSize_0.Small, 
                    style = v43.Color.Content.Emphasis
                }) else nil, 
                NotEligibleVoiceParticipant = if v64 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 5, 
                    name = "icons/controls/headphoneDeafen_small", 
                    size = l_IconSize_0.Small, 
                    style = v43.Color.System.Warning
                }) else nil, 
                VoiceChangerActiveIcon = if l_FFlagEnablePartyVoiceChangersInLua_0 and v70 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 6, 
                    size = l_IconSize_0.Small, 
                    name = v8.Icon.DiamondSimplified, 
                    style = v43.Color.Content.Emphasis
                }) else nil, 
                NameTextLabel = l_React_0.createElement(l_Foundation_0.Text, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    backgroundStyle = v43.Color.None, 
                    colorstyle = v43.Color.Content.Emphasis, 
                    fontStyle = v43.Typography.TitleMedium, 
                    LayoutOrder = l_FFlagEnablePartyVoiceChangersInLua_0 and 7 or 6, 
                    Text = v47, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = false
                }, {
                    UIFlexItem = l_React_0.createElement("UIFlexItem", {
                        FlexMode = Enum.UIFlexMode.Fill
                    })
                })
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v47, v66, v68, v41.isBlocked, v43, v63, v64, if l_FFlagEnablePartyVoiceChangersInLua_0 then v70 else nil));
    local v77 = l_React_0.useMemo(function() --[[ Line: 340 ]]
        -- upvalues: l_React_0 (ref), v43 (copy), v75 (copy), l_Foundation_0 (ref), v74 (copy)
        return l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v43.Gap.XSmall), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            PresenceIcon = v75, 
            PresenceTextLabel = l_React_0.createElement(l_Foundation_0.Text, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                backgroundStyle = v43.Color.None, 
                colorstyle = v43.Color.Content.Default, 
                fontStyle = v43.Typography.BodyMedium, 
                LayoutOrder = 2, 
                Text = v74, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = false
            }, {
                UIFlexItem = l_React_0.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Fill
                })
            })
        });
    end, l_dependencyArray_0(l_isConnecting_0, v67, v52, v42.connectingText, v53, v43, v75, v74));
    local v78 = nil;
    if l_FFlagEnableSquadUserCardHoverFix_0 then
        local v79 = #v26(v41.user.userId, v41.isInExperience) < 1;
        v78 = not v56 and not v79;
    else
        v78 = not v56;
    end;
    local v80 = l_React_0.useCallback(function() --[[ Line: 395 ]]
        -- upvalues: v41 (copy)
        if v41.onActivated then
            v41.onActivated((tostring(v41.user.userId)));
        end;
    end, l_dependencyArray_0(v41.onActivated, v41.user.userId));
    return l_React_0.createElement(l_Foundation_0.View, {
        LayoutOrder = v41.layoutOrder, 
        Size = v41.size, 
        backgroundStyle = v43.Color.Surface.Surface_200, 
        cornerRadius = UDim.new(0, v43.Radius.Medium), 
        isDisabled = l_isConnecting_0 or v37 and v67 or v41.user.partyStatus == v35.Invited or v41.user.partyStatus == v35.NoResponse, 
        onActivated = if v41.onActivated and v78 then v80 else nil
    }, {
        AvatarImage = l_React_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(96, 96), 
            BackgroundColor3 = v43.Color.Shift.Shift_300.Color3, 
            BackgroundTransparency = v43.Color.Shift.Shift_300.Transparency, 
            Image = v48, 
            ZIndex = 0
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        GradientFrame = l_React_0.createElement("Frame", {
            Size = UDim2.fromScale(1, 0.5), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundColor3 = v43.Color.Surface.Surface_100.Color3, 
            BackgroundTransparency = v43.Color.Surface.Surface_100.Transparency, 
            ZIndex = 1
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v43.Radius.Medium)
            }), 
            UIGradient = l_React_0.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            }, {})
        }), 
        InactiveOverlay = if not (not (not not l_isConnecting_0 or v63 or v37 and v67) and v41.user.partyStatus ~= v35.Invited) or v41.user.partyStatus == v35.NoResponse then l_React_0.createElement(l_Foundation_0.View, {
            tag = "size-full radius-medium", 
            backgroundStyle = {
                Color3 = v43.Color.Surface.Surface_100.Color3, 
                Transparency = 0.25
            }
        }, {}) else nil, 
        TextContainer = l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v43.Padding.Medium), 
                PaddingLeft = UDim.new(0, v43.Padding.Medium), 
                PaddingRight = UDim.new(0, v43.Padding.Medium), 
                PaddingTop = UDim.new(0, v43.Padding.Medium)
            }), 
            Name = v76, 
            Presence = if not v41.isBlocked then v77 else nil
        }), 
        ActiveBorder = l_React_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -8, 1, -8), 
            BackgroundTransparency = 1, 
            ZIndex = 4
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v43.Radius.Medium - 4)
            }), 
            UIStroke = l_React_0.createElement("UIStroke", {
                Thickness = 4, 
                Color = v43.Color.Extended.Green.Green_800.Color3, 
                Transparency = v44
            })
        }), 
        DefaultBorder = l_React_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -2, 1, -2), 
            BackgroundTransparency = 1, 
            ZIndex = 3
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v43.Radius.Medium - 1)
            }), 
            UIStroke = l_React_0.createElement("UIStroke", {
                Thickness = 1, 
                Color = v43.Color.Stroke.Default.Color3, 
                Transparency = v44:map(function(v81) --[[ Line: 519 ]]
                    -- upvalues: v43 (copy)
                    if v81 < 0.9 then
                        return 1;
                    else
                        return v43.Color.Stroke.Default.Transparency;
                    end;
                end)
            })
        })
    });
end;