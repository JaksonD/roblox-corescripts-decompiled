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
local v36 = game:DefineFastInt("PartyVoiceActivityIndicatorDebounceMs", 100);
local v37 = game:DefineFastInt("PartyVoiceActivityIndicatorAnimationMs", 100);
local l_FFlagEnablePartyVoiceChangersInLua_0 = l_SharedFlags_0.FFlagEnablePartyVoiceChangersInLua;
local l_FFlagEnableBlackbirdCheckDev_0 = l_SharedFlags_0.FFlagEnableBlackbirdCheckDev;
local l_FFlagRemoveDependencyArrayAntipattern_0 = l_SharedFlags_0.FFlagRemoveDependencyArrayAntipattern;
local l_useIsRobloxSubscriber_0 = v5.Hooks.useIsRobloxSubscriber;
return function(v42) --[[ Line: 77 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), l_useAnimatedTransparency_0 (copy), v37 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v5 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_React_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_useLocalUserId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useIsVoiceConnected_0 (copy), l_useIsMicPermissionsError_0 (copy), l_useParticipant_0 (copy), l_useIsVoiceConnecting_0 (copy), l_useIsActiveParticipant_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useIsParticipantMutedLocally_0 (copy), l_useIsParticipantMuted_0 (copy), l_useIsParticipantInOtherAudioContext_0 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v3 (copy), v36 (copy), v35 (copy), l_Foundation_0 (copy), l_IconSize_0 (copy), v8 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_FFlagEnableSquadUserCardHoverFix_0 (copy), v26 (copy), l_ImageSetLabel_0 (copy)
    local v43 = l_useLocalization_0({
        connectingText = "Feature.Squads.Label.Connecting", 
        inExperiencePresenceText = "Common.Presence.Label.InExperience", 
        invitedText = "Feature.Squads.Description.Invited", 
        noResponseText = "Feature.Squads.Description.NoResponse", 
        onlinePresenceText = "Common.Presence.Label.Online"
    });
    local v44 = l_useTokens_0();
    local v45, v46 = l_useAnimatedTransparency_0(1, v37, Enum.EasingStyle.Cubic);
    local v47 = l_useIsRobloxSubscriber_0(if l_FFlagEnableBlackbirdCheckDev_0 then tostring(v42.user.userId) else nil);
    local v48 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v42.user.userId))
        }, 
        query = v5.Queries.userProfilesCombinedNameByUserIds
    });
    local v49 = "";
    if v48.data then
        v49 = v5.Selectors.getCombinedNameFromId(v48.data, v42.user.userId);
    end;
    local v50 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v42.user.userId)));
    local v52 = l_React_0.useCallback(function(v51) --[[ Line: 104 ]]
        -- upvalues: v42 (copy)
        return v51.Squad.Presence.byUserId[tostring(v42.user.userId)];
    end, {
        v42.user.userId
    });
    local v53 = l_useSelector_0(v52);
    local v54 = v53 and v53.userPresenceType == l_PresenceType_0.InGame;
    local v55 = nil;
    v55 = if v54 then if v53.lastLocation and v53.lastLocation ~= "" then v53.lastLocation else v43.inExperiencePresenceText else v43.onlinePresenceText;
    local l_isConnecting_0 = v42.isConnecting;
    local v57 = tonumber(l_useLocalUserId_0()) or 0;
    local v58 = v57 == v42.user.userId;
    local v59 = nil;
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
    local v71 = false;
    local v72 = false;
    if l_GetFFlagEnableCrossExpVoice_0() then
        v61 = l_useIsVoiceConnected_0();
        v71 = l_useIsMicPermissionsError_0();
        v59 = l_useParticipant_0(v42.user.userId);
        v69 = l_useIsVoiceConnecting_0() and v58;
        v60 = l_useIsActiveParticipant_0(v42.user.userId);
        v62 = l_useIsLocalPlayerPartyVoiceEligible_0();
        v63 = l_useIsUserPartyVoiceEligible_0(v42.user.userId);
        v64 = l_useIsCurrentSquadPartyVoiceEligible_0() == true;
        local v73 = l_useIsParticipantMutedLocally_0(v42.user.userId) == true;
        v70 = v63 and v64 and not v58 and v73;
        v68 = l_useIsParticipantMuted_0(v42.user.userId) and not v70;
        v67 = l_useIsParticipantInOtherAudioContext_0(v57, v42.user.userId) == true;
        v65 = v64 and v62 and v63 and (not v61 or not v59 or v67 or v71);
        v66 = v64 and v62 and not v63;
        v72 = if l_FFlagEnablePartyVoiceChangersInLua_0 and v59 then v59.isVoiceChangerActive else false;
    end;
    local v75 = l_React_0.useMemo(function() --[[ Line: 171 ]]
        -- upvalues: v3 (ref), v46 (copy), v36 (ref)
        return v3.Utils.debounce(function(v74) --[[ Line: 172 ]]
            -- upvalues: v46 (ref)
            v46(v74);
        end, v36);
    end, {});
    l_React_0.useEffect(function() --[[ Line: 177 ]]
        -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (ref), v60 (ref), v75 (copy), v46 (copy)
        if l_GetFFlagEnableCrossExpVoice_0() then
            if v60 then
                v75.cancel();
                v46(0);
                return;
            else
                v75.call(1);
            end;
        end;
    end, {
        v60
    });
    local v76 = l_React_0.useMemo(function() --[[ Line: 189 ]]
        -- upvalues: v42 (copy), v35 (ref), v43 (copy), l_isConnecting_0 (copy), v69 (ref), v55 (ref)
        if v42.user.partyStatus == v35.NoResponse then
            return v43.noResponseText;
        elseif v42.user.partyStatus == v35.Invited then
            return v43.invitedText;
        elseif l_isConnecting_0 or v69 then
            return v43.connectingText;
        else
            return v55;
        end;
    end, {
        v42.user and v42.user.partyStatus, 
        v55, 
        l_isConnecting_0, 
        v69, 
        v43.noResponse, 
        v43.invitedText, 
        v43.connectingText
    });
    local v77 = l_React_0.useMemo(function() --[[ Line: 211 ]]
        -- upvalues: v42 (copy), v35 (ref), l_React_0 (ref), l_Foundation_0 (ref), l_IconSize_0 (ref), v44 (copy), l_isConnecting_0 (copy), v69 (ref), v54 (copy)
        if v42.user.partyStatus == v35.Invited then
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-xy"
            }, {
                LoadingIcon = l_React_0.createElement(l_Foundation_0.Loading, {
                    LayoutOrder = 1, 
                    size = l_IconSize_0.Small, 
                    Padding = v44.Padding.XSmall
                })
            });
        elseif v42.user.partyStatus == v35.NoResponse then
            return nil;
        elseif l_isConnecting_0 or v69 then
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-xy"
            }, {
                LoadingIcon = l_React_0.createElement(l_Foundation_0.Loading, {
                    LayoutOrder = 1, 
                    size = l_IconSize_0.Small, 
                    Padding = v44.Padding.XSmall
                })
            });
        elseif v54 then
            return l_React_0.createElement(l_Foundation_0.Icon, {
                LayoutOrder = 1, 
                name = "icons/common/play", 
                size = l_IconSize_0.Small, 
                style = v44.Color.Content.Emphasis
            });
        else
            return nil;
        end;
    end, {
        v42.user and v42.user.partyStatus, 
        l_isConnecting_0, 
        v69, 
        v54
    });
    local v78 = l_React_0.useMemo(function() --[[ Line: 244 ]]
        -- upvalues: v49 (ref), l_React_0 (ref), v44 (copy), v42 (copy), l_Foundation_0 (ref), l_IconSize_0 (ref), v70 (ref), v68 (ref), v65 (ref), v66 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v72 (ref), v8 (ref), l_FFlagEnableBlackbirdCheckDev_0 (ref), v47 (copy)
        if v49 ~= "" then
            return (l_React_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, v44.Gap.XSmall + 2), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                BlockedIcon = if v42.isBlocked then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 1, 
                    name = "icons/status/unavailable_small", 
                    size = l_IconSize_0.Small, 
                    style = v44.Color.Extended.Red.Red_800
                }) else nil, 
                MutedLocallyIcon = if v70 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 2, 
                    name = "icons/controls/voice/microphone_off_small_dark", 
                    size = l_IconSize_0.Small, 
                    style = v44.Color.Extended.Red.Red_800
                }) else nil, 
                MutedIcon = if v68 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 3, 
                    name = "icons/controls/microphoneMute_small", 
                    size = l_IconSize_0.Small, 
                    style = v44.Color.Content.Emphasis
                }) else nil, 
                NotVoiceParticipantIcon = if v65 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 4, 
                    name = "icons/controls/headphoneDeafen_small", 
                    size = l_IconSize_0.Small, 
                    style = v44.Color.Content.Emphasis
                }) else nil, 
                NotEligibleVoiceParticipant = if v66 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 5, 
                    name = "icons/controls/headphoneDeafen_small", 
                    size = l_IconSize_0.Small, 
                    style = v44.Color.System.Warning
                }) else nil, 
                VoiceChangerActiveIcon = if l_FFlagEnablePartyVoiceChangersInLua_0 and v72 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 6, 
                    size = l_IconSize_0.Small, 
                    name = v8.Icon.DiamondSimplified, 
                    style = v44.Color.Content.Emphasis
                }) else nil, 
                NameTextLabel = if not l_FFlagEnableBlackbirdCheckDev_0 then l_React_0.createElement(l_Foundation_0.Text, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    backgroundStyle = v44.Color.None, 
                    colorstyle = v44.Color.Content.Emphasis, 
                    fontStyle = v44.Typography.TitleMedium, 
                    LayoutOrder = l_FFlagEnablePartyVoiceChangersInLua_0 and 7 or 6, 
                    Text = v49, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = false
                }, {
                    UIFlexItem = l_React_0.createElement("UIFlexItem", {
                        FlexMode = Enum.UIFlexMode.Fill
                    })
                }) else nil, 
                NameAndBadge = if l_FFlagEnableBlackbirdCheckDev_0 then l_React_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_FFlagEnablePartyVoiceChangersInLua_0 and 7 or 6
                }, {
                    Layout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        Padding = UDim.new(0, v44.Gap.XSmall), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    FlexFill = l_React_0.createElement("UIFlexItem", {
                        FlexMode = Enum.UIFlexMode.Fill
                    }), 
                    NameText = l_React_0.createElement(l_Foundation_0.Text, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        backgroundStyle = v44.Color.None, 
                        colorstyle = v44.Color.Content.Emphasis, 
                        fontStyle = v44.Typography.TitleMedium, 
                        LayoutOrder = 1, 
                        Text = v49, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = false
                    }, {
                        UIFlexItem = l_React_0.createElement("UIFlexItem", {
                            FlexMode = Enum.UIFlexMode.Shrink
                        })
                    }), 
                    SubscriptionBadge = if v47 then l_React_0.createElement(l_Foundation_0.Icon, {
                        LayoutOrder = 2, 
                        size = l_IconSize_0.Small, 
                        name = l_Foundation_0.Enums.IconName.PaperAirplane, 
                        style = v44.Color.Content.Emphasis
                    }) else nil
                }) else nil
            }));
        else
            return nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v49, 
        v68, 
        v70, 
        v42.isBlocked, 
        v44, 
        v65, 
        v66, 
        if l_FFlagEnablePartyVoiceChangersInLua_0 then v72 else nil, 
        if l_FFlagEnableBlackbirdCheckDev_0 then v47 else nil
    } else l_dependencyArray_0(v49, v68, v70, v42.isBlocked, v44, v65, v66, if l_FFlagEnablePartyVoiceChangersInLua_0 then v72 else nil, if l_FFlagEnableBlackbirdCheckDev_0 then v47 else nil));
    local v79 = l_React_0.useMemo(function() --[[ Line: 396 ]]
        -- upvalues: l_React_0 (ref), v44 (copy), v77 (copy), l_Foundation_0 (ref), v76 (copy)
        return l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v44.Gap.XSmall), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            PresenceIcon = v77, 
            PresenceTextLabel = l_React_0.createElement(l_Foundation_0.Text, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                backgroundStyle = v44.Color.None, 
                colorstyle = v44.Color.Content.Default, 
                fontStyle = v44.Typography.BodyMedium, 
                LayoutOrder = 2, 
                Text = v76, 
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
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_isConnecting_0, 
        v69, 
        v54, 
        v43.connectingText, 
        v55, 
        v44, 
        v77, 
        v76
    } else l_dependencyArray_0(l_isConnecting_0, v69, v54, v43.connectingText, v55, v44, v77, v76));
    local v80 = nil;
    if l_FFlagEnableSquadUserCardHoverFix_0 then
        local v81 = #v26(v42.user.userId, v42.isInExperience) < 1;
        v80 = not v58 and not v81;
    else
        v80 = not v58;
    end;
    local v82 = l_React_0.useCallback(function() --[[ Line: 463 ]]
        -- upvalues: v42 (copy)
        if v42.onActivated then
            v42.onActivated((tostring(v42.user.userId)));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v42.onActivated, 
        v42.user.userId
    } else l_dependencyArray_0(v42.onActivated, v42.user.userId));
    return l_React_0.createElement(l_Foundation_0.View, {
        LayoutOrder = v42.layoutOrder, 
        Size = v42.size, 
        backgroundStyle = v44.Color.Surface.Surface_200, 
        cornerRadius = UDim.new(0, v44.Radius.Medium), 
        isDisabled = l_isConnecting_0 or v69 or v42.user.partyStatus == v35.Invited or v42.user.partyStatus == v35.NoResponse, 
        onActivated = if v42.onActivated and v80 then v82 else nil
    }, {
        AvatarImage = l_React_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(96, 96), 
            BackgroundColor3 = v44.Color.Shift.Shift_300.Color3, 
            BackgroundTransparency = v44.Color.Shift.Shift_300.Transparency, 
            Image = v50, 
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
            BackgroundColor3 = v44.Color.Surface.Surface_100.Color3, 
            BackgroundTransparency = v44.Color.Surface.Surface_100.Transparency, 
            ZIndex = 1
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v44.Radius.Medium)
            }), 
            UIGradient = l_React_0.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            }, {})
        }), 
        InactiveOverlay = if not (not (not not l_isConnecting_0 or v65 or v69) and v42.user.partyStatus ~= v35.Invited) or v42.user.partyStatus == v35.NoResponse then l_React_0.createElement(l_Foundation_0.View, {
            tag = "size-full radius-medium", 
            backgroundStyle = {
                Color3 = v44.Color.Surface.Surface_100.Color3, 
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
                PaddingBottom = UDim.new(0, v44.Padding.Medium), 
                PaddingLeft = UDim.new(0, v44.Padding.Medium), 
                PaddingRight = UDim.new(0, v44.Padding.Medium), 
                PaddingTop = UDim.new(0, v44.Padding.Medium)
            }), 
            Name = v78, 
            Presence = if not v42.isBlocked then v79 else nil
        }), 
        ActiveBorder = l_React_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -8, 1, -8), 
            BackgroundTransparency = 1, 
            ZIndex = 4
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v44.Radius.Medium - 4)
            }), 
            UIStroke = l_React_0.createElement("UIStroke", {
                Thickness = 4, 
                Color = v44.Color.Extended.Green.Green_800.Color3, 
                Transparency = v45
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
                CornerRadius = UDim.new(0, v44.Radius.Medium - 1)
            }), 
            UIStroke = l_React_0.createElement("UIStroke", {
                Thickness = 1, 
                Color = v44.Color.Stroke.Default.Color3, 
                Transparency = v45:map(function(v83) --[[ Line: 591 ]]
                    -- upvalues: v44 (copy)
                    if v83 < 0.9 then
                        return 1;
                    else
                        return v44.Color.Stroke.Default.Transparency;
                    end;
                end)
            })
        })
    });
end;