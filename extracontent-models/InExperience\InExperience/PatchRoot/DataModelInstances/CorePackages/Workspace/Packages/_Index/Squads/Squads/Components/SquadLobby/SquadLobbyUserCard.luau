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
local l_FFlagEnableBlackbirdCheckDev_0 = l_SharedFlags_0.FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = v5.Hooks.useIsRobloxSubscriber;
return function(v43) --[[ Line: 79 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), l_useAnimatedTransparency_0 (copy), v39 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v5 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_React_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_useLocalUserId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useIsVoiceConnected_0 (copy), l_SharedFlags_0 (copy), l_useIsMicPermissionsError_0 (copy), l_useParticipant_0 (copy), l_useIsVoiceConnecting_0 (copy), l_useIsActiveParticipant_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useIsParticipantMutedLocally_0 (copy), l_useIsParticipantMuted_0 (copy), v36 (copy), l_useIsParticipantInOtherAudioContext_0 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v3 (copy), v38 (copy), v35 (copy), v37 (copy), l_Foundation_0 (copy), l_IconSize_0 (copy), v8 (copy), l_dependencyArray_0 (copy), l_FFlagEnableSquadUserCardHoverFix_0 (copy), v26 (copy), l_ImageSetLabel_0 (copy)
    local v44 = l_useLocalization_0({
        connectingText = "Feature.Squads.Label.Connecting", 
        inExperiencePresenceText = "Common.Presence.Label.InExperience", 
        invitedText = "Feature.Squads.Description.Invited", 
        noResponseText = "Feature.Squads.Description.NoResponse", 
        onlinePresenceText = "Common.Presence.Label.Online"
    });
    local v45 = l_useTokens_0();
    local v46, v47 = l_useAnimatedTransparency_0(1, v39, Enum.EasingStyle.Cubic);
    local v48 = l_useIsRobloxSubscriber_0(if l_FFlagEnableBlackbirdCheckDev_0 then tostring(v43.user.userId) else nil);
    local v49 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v43.user.userId))
        }, 
        query = v5.Queries.userProfilesCombinedNameByUserIds
    });
    local v50 = "";
    if v49.data then
        v50 = v5.Selectors.getCombinedNameFromId(v49.data, v43.user.userId);
    end;
    local v51 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v43.user.userId)));
    local v53 = l_React_0.useCallback(function(v52) --[[ Line: 106 ]]
        -- upvalues: v43 (copy)
        return v52.Squad.Presence.byUserId[tostring(v43.user.userId)];
    end, {
        v43.user.userId
    });
    local v54 = l_useSelector_0(v53);
    local v55 = v54 and v54.userPresenceType == l_PresenceType_0.InGame;
    local v56 = nil;
    v56 = if v55 then if v54.lastLocation and v54.lastLocation ~= "" then v54.lastLocation else v44.inExperiencePresenceText else v44.onlinePresenceText;
    local l_isConnecting_0 = v43.isConnecting;
    local v58 = tonumber(l_useLocalUserId_0()) or 0;
    local v59 = v58 == v43.user.userId;
    local v60 = nil;
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
    local v73 = false;
    if l_GetFFlagEnableCrossExpVoice_0() then
        v62 = l_useIsVoiceConnected_0();
        if l_SharedFlags_0.FFlagPartyVoiceEnableMicPermissionsBanner then
            v72 = l_useIsMicPermissionsError_0();
        end;
        v60 = l_useParticipant_0(v43.user.userId);
        v70 = l_useIsVoiceConnecting_0() and v59;
        v61 = l_useIsActiveParticipant_0(v43.user.userId);
        v63 = l_useIsLocalPlayerPartyVoiceEligible_0();
        v64 = l_useIsUserPartyVoiceEligible_0(v43.user.userId);
        v65 = l_useIsCurrentSquadPartyVoiceEligible_0() == true;
        local v74 = l_useIsParticipantMutedLocally_0(v43.user.userId) == true;
        v71 = v64 and v65 and not v59 and v74;
        v69 = l_useIsParticipantMuted_0(v43.user.userId) and not v71;
        if v36 then
            v68 = l_useIsParticipantInOtherAudioContext_0(v58, v43.user.userId) == true;
        end;
        v66 = v65 and v63 and v64 and (not v62 or not v60 or v68 or v72);
        v67 = v65 and v63 and not v64;
        v73 = if l_FFlagEnablePartyVoiceChangersInLua_0 and v60 then v60.isVoiceChangerActive else false;
    end;
    local v76 = l_React_0.useMemo(function() --[[ Line: 178 ]]
        -- upvalues: v3 (ref), v47 (copy), v38 (ref)
        return v3.Utils.debounce(function(v75) --[[ Line: 179 ]]
            -- upvalues: v47 (ref)
            v47(v75);
        end, v38);
    end, {});
    l_React_0.useEffect(function() --[[ Line: 184 ]]
        -- upvalues: l_GetFFlagEnableCrossExpVoice_0 (ref), v61 (ref), v76 (copy), v47 (copy)
        if l_GetFFlagEnableCrossExpVoice_0() then
            if v61 then
                v76.cancel();
                v47(0);
                return;
            else
                v76.call(1);
            end;
        end;
    end, {
        v61
    });
    local v77 = l_React_0.useMemo(function() --[[ Line: 196 ]]
        -- upvalues: v43 (copy), v35 (ref), v44 (copy), l_isConnecting_0 (copy), v37 (ref), v70 (ref), v56 (ref)
        if v43.user.partyStatus == v35.NoResponse then
            return v44.noResponseText;
        elseif v43.user.partyStatus == v35.Invited then
            return v44.invitedText;
        elseif l_isConnecting_0 or v37 and v70 then
            return v44.connectingText;
        else
            return v56;
        end;
    end, {
        v43.user and v43.user.partyStatus, 
        v56, 
        l_isConnecting_0, 
        v70, 
        v44.noResponse, 
        v44.invitedText, 
        v44.connectingText
    });
    local v78 = l_React_0.useMemo(function() --[[ Line: 218 ]]
        -- upvalues: v43 (copy), v35 (ref), l_React_0 (ref), l_Foundation_0 (ref), l_IconSize_0 (ref), v45 (copy), l_isConnecting_0 (copy), v37 (ref), v70 (ref), v55 (copy)
        if v43.user.partyStatus == v35.Invited then
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-xy"
            }, {
                LoadingIcon = l_React_0.createElement(l_Foundation_0.Loading, {
                    LayoutOrder = 1, 
                    size = l_IconSize_0.Small, 
                    Padding = v45.Padding.XSmall
                })
            });
        elseif v43.user.partyStatus == v35.NoResponse then
            return nil;
        elseif l_isConnecting_0 or v37 and v70 then
            return l_React_0.createElement(l_Foundation_0.View, {
                tag = "auto-xy"
            }, {
                LoadingIcon = l_React_0.createElement(l_Foundation_0.Loading, {
                    LayoutOrder = 1, 
                    size = l_IconSize_0.Small, 
                    Padding = v45.Padding.XSmall
                })
            });
        elseif v55 then
            return l_React_0.createElement(l_Foundation_0.Icon, {
                LayoutOrder = 1, 
                name = "icons/common/play", 
                size = l_IconSize_0.Small, 
                style = v45.Color.Content.Emphasis
            });
        else
            return nil;
        end;
    end, {
        v43.user and v43.user.partyStatus, 
        l_isConnecting_0, 
        v70, 
        v55
    });
    local v79 = l_React_0.useMemo(function() --[[ Line: 251 ]]
        -- upvalues: v50 (ref), l_React_0 (ref), v45 (copy), v43 (copy), l_Foundation_0 (ref), l_IconSize_0 (ref), v71 (ref), v69 (ref), v66 (ref), v67 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v73 (ref), v8 (ref), l_FFlagEnableBlackbirdCheckDev_0 (ref), v48 (copy)
        if v50 ~= "" then
            return (l_React_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, v45.Gap.XSmall + 2), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                BlockedIcon = if v43.isBlocked then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 1, 
                    name = "icons/status/unavailable_small", 
                    size = l_IconSize_0.Small, 
                    style = v45.Color.Extended.Red.Red_800
                }) else nil, 
                MutedLocallyIcon = if v71 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 2, 
                    name = "icons/controls/voice/microphone_off_small_dark", 
                    size = l_IconSize_0.Small, 
                    style = v45.Color.Extended.Red.Red_800
                }) else nil, 
                MutedIcon = if v69 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 3, 
                    name = "icons/controls/microphoneMute_small", 
                    size = l_IconSize_0.Small, 
                    style = v45.Color.Content.Emphasis
                }) else nil, 
                NotVoiceParticipantIcon = if v66 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 4, 
                    name = "icons/controls/headphoneDeafen_small", 
                    size = l_IconSize_0.Small, 
                    style = v45.Color.Content.Emphasis
                }) else nil, 
                NotEligibleVoiceParticipant = if v67 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 5, 
                    name = "icons/controls/headphoneDeafen_small", 
                    size = l_IconSize_0.Small, 
                    style = v45.Color.System.Warning
                }) else nil, 
                VoiceChangerActiveIcon = if l_FFlagEnablePartyVoiceChangersInLua_0 and v73 then l_React_0.createElement(l_Foundation_0.Icon, {
                    LayoutOrder = 6, 
                    size = l_IconSize_0.Small, 
                    name = v8.Icon.DiamondSimplified, 
                    style = v45.Color.Content.Emphasis
                }) else nil, 
                NameTextLabel = if not l_FFlagEnableBlackbirdCheckDev_0 then l_React_0.createElement(l_Foundation_0.Text, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    backgroundStyle = v45.Color.None, 
                    colorstyle = v45.Color.Content.Emphasis, 
                    fontStyle = v45.Typography.TitleMedium, 
                    LayoutOrder = l_FFlagEnablePartyVoiceChangersInLua_0 and 7 or 6, 
                    Text = v50, 
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
                        Padding = UDim.new(0, v45.Gap.XSmall), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    FlexFill = l_React_0.createElement("UIFlexItem", {
                        FlexMode = Enum.UIFlexMode.Fill
                    }), 
                    NameText = l_React_0.createElement(l_Foundation_0.Text, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        backgroundStyle = v45.Color.None, 
                        colorstyle = v45.Color.Content.Emphasis, 
                        fontStyle = v45.Typography.TitleMedium, 
                        LayoutOrder = 1, 
                        Text = v50, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = false
                    }, {
                        UIFlexItem = l_React_0.createElement("UIFlexItem", {
                            FlexMode = Enum.UIFlexMode.Shrink
                        })
                    }), 
                    SubscriptionBadge = if v48 then l_React_0.createElement(l_Foundation_0.Icon, {
                        LayoutOrder = 2, 
                        size = l_IconSize_0.Small, 
                        name = l_Foundation_0.Enums.IconName.PaperAirplane, 
                        style = v45.Color.Content.Emphasis
                    }) else nil
                }) else nil
            }));
        else
            return nil;
        end;
    end, l_dependencyArray_0(v50, v69, v71, v43.isBlocked, v45, v66, v67, if l_FFlagEnablePartyVoiceChangersInLua_0 then v73 else nil, if l_FFlagEnableBlackbirdCheckDev_0 then v48 else nil));
    local v80 = l_React_0.useMemo(function() --[[ Line: 391 ]]
        -- upvalues: l_React_0 (ref), v45 (copy), v78 (copy), l_Foundation_0 (ref), v77 (copy)
        return l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v45.Gap.XSmall), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            PresenceIcon = v78, 
            PresenceTextLabel = l_React_0.createElement(l_Foundation_0.Text, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                backgroundStyle = v45.Color.None, 
                colorstyle = v45.Color.Content.Default, 
                fontStyle = v45.Typography.BodyMedium, 
                LayoutOrder = 2, 
                Text = v77, 
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
    end, l_dependencyArray_0(l_isConnecting_0, v70, v55, v44.connectingText, v56, v45, v78, v77));
    local v81 = nil;
    if l_FFlagEnableSquadUserCardHoverFix_0 then
        local v82 = #v26(v43.user.userId, v43.isInExperience) < 1;
        v81 = not v59 and not v82;
    else
        v81 = not v59;
    end;
    local v83 = l_React_0.useCallback(function() --[[ Line: 446 ]]
        -- upvalues: v43 (copy)
        if v43.onActivated then
            v43.onActivated((tostring(v43.user.userId)));
        end;
    end, l_dependencyArray_0(v43.onActivated, v43.user.userId));
    return l_React_0.createElement(l_Foundation_0.View, {
        LayoutOrder = v43.layoutOrder, 
        Size = v43.size, 
        backgroundStyle = v45.Color.Surface.Surface_200, 
        cornerRadius = UDim.new(0, v45.Radius.Medium), 
        isDisabled = l_isConnecting_0 or v37 and v70 or v43.user.partyStatus == v35.Invited or v43.user.partyStatus == v35.NoResponse, 
        onActivated = if v43.onActivated and v81 then v83 else nil
    }, {
        AvatarImage = l_React_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(96, 96), 
            BackgroundColor3 = v45.Color.Shift.Shift_300.Color3, 
            BackgroundTransparency = v45.Color.Shift.Shift_300.Transparency, 
            Image = v51, 
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
            BackgroundColor3 = v45.Color.Surface.Surface_100.Color3, 
            BackgroundTransparency = v45.Color.Surface.Surface_100.Transparency, 
            ZIndex = 1
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v45.Radius.Medium)
            }), 
            UIGradient = l_React_0.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            }, {})
        }), 
        InactiveOverlay = if not (not (not not l_isConnecting_0 or v66 or v37 and v70) and v43.user.partyStatus ~= v35.Invited) or v43.user.partyStatus == v35.NoResponse then l_React_0.createElement(l_Foundation_0.View, {
            tag = "size-full radius-medium", 
            backgroundStyle = {
                Color3 = v45.Color.Surface.Surface_100.Color3, 
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
                PaddingBottom = UDim.new(0, v45.Padding.Medium), 
                PaddingLeft = UDim.new(0, v45.Padding.Medium), 
                PaddingRight = UDim.new(0, v45.Padding.Medium), 
                PaddingTop = UDim.new(0, v45.Padding.Medium)
            }), 
            Name = v79, 
            Presence = if not v43.isBlocked then v80 else nil
        }), 
        ActiveBorder = l_React_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, -8, 1, -8), 
            BackgroundTransparency = 1, 
            ZIndex = 4
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, v45.Radius.Medium - 4)
            }), 
            UIStroke = l_React_0.createElement("UIStroke", {
                Thickness = 4, 
                Color = v45.Color.Extended.Green.Green_800.Color3, 
                Transparency = v46
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
                CornerRadius = UDim.new(0, v45.Radius.Medium - 1)
            }), 
            UIStroke = l_React_0.createElement("UIStroke", {
                Thickness = 1, 
                Color = v45.Color.Stroke.Default.Color3, 
                Transparency = v46:map(function(v84) --[[ Line: 570 ]]
                    -- upvalues: v45 (copy)
                    if v84 < 0.9 then
                        return 1;
                    else
                        return v45.Color.Stroke.Default.Transparency;
                    end;
                end)
            })
        })
    });
end;