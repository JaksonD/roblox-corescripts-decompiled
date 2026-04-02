local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.VerifiedBadges);
local v5 = require(l_Parent_0.UIBlox);
local l_HorizontalPageMargin_0 = v5.App.Container.HorizontalPageMargin;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local l_Images_0 = v5.App.ImageSet.Images;
local l_Tooltip_0 = v5.App.Dialog.Tooltip;
local l_TooltipOrientation_0 = v5.App.Dialog.Enum.TooltipOrientation;
local l_OpenTypeSupport_0 = v5.Utility.OpenTypeSupport;
local v13 = require(l_Parent_0.Foundation);
local l_Text_0 = v13.Text;
local l_useTokens_0 = v13.Hooks.useTokens;
local l_StateLayerAffordance_0 = v13.Enums.StateLayerAffordance;
local v17 = require(l_Parent_0.RoactUtils);
local l_dependencyArray_0 = v17.Hooks.dependencyArray;
local l_useDispatch_0 = v17.Hooks.RoactRodux.useDispatch;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local v21 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v22 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v25 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_FFlagFriendRequestNicknames_0 = require(l_Parent_0.SharedFlags).FFlagFriendRequestNicknames;
local v27 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableClickToCopyUsername);
local l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 = require(l_Parent_0.SharedFlags).FFlagEnableFontStylisticAlternativesOnSocialScreens;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_FFlagLegacyProfileTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagLegacyProfileTCIndicator;
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableRobloxAdminBadge);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v34 = if v27 then l_Images_0["icons/actions/edit/copy"] else nil;
return function(v35) --[[ Line: 73 ]] --[[ Name: SocialIdentity ]]
    -- upvalues: l_useTokens_0 (copy), l_Images_0 (copy), v27 (copy), l_useDispatch_0 (copy), v22 (copy), v4 (copy), l_useLocalization_0 (copy), v25 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v2 (copy), l_HorizontalPageMargin_0 (copy), v31 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Tooltip_0 (copy), l_TooltipOrientation_0 (copy), l_Text_0 (copy), l_FFlagFriendRequestNicknames_0 (copy), v13 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), l_default_0 (copy), l_Contexts_0 (copy), v21 (copy), l_SetCurrentToastMessage_0 (copy), v34 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_StateLayerAffordance_0 (copy)
    local v36 = l_useTokens_0();
    local v37 = if v35.isEdited then l_Images_0["icons/actions/edit/editOn_small"] else l_Images_0["icons/actions/edit/edit_small"];
    local v38 = if v27 then l_useDispatch_0() else nil;
    local v39 = if v27 then v22() else nil;
    local v40 = (v35.primaryName .. if v35.isPremium then v4.emoji.premium else "") .. if v35.isVerified then v4.emoji.verified else "";
    local v41 = ("@%*"):format(v35.username);
    local v42 = l_useLocalization_0({
        tooltipTitle = if v35.isLocalUser then nil else v25.AliasTooltipHeader, 
        tooltipBody = if v35.isLocalUser then v25.DisplayNameTooltipBody else v25.AliasTooltipBody, 
        usernameCopied = if v27 then v25.UsernameCopied else nil, 
        trustedLabel = if l_FFlagLegacyProfileTCIndicator_0 then v25.TrustedLabel else nil
    });
    local v43 = if l_FFlagLegacyProfileTCIndicator_0 and v35.isTrustedConnection then (" \226\128\162 %*"):format(v42.trustedLabel) else "";
    local v44 = v2.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v35 (copy)
        if v35.openEditName then
            v35.openEditName();
        end;
        v35.dismissTooltip();
    end);
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = v35.size, 
        layoutOrder = v35.layoutOrder, 
        useAutomaticSizing = true, 
        backgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PrimaryNameFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            PrimaryNameFrameTouchable = v2.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = "", 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                [v2.Event.Activated] = v44, 
                Selectable = false
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = if v31 and v35.isRobloxAdmin then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Bottom, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                EditNameButton = if v35.openEditName then v2.createElement(l_IconButton_0, {
                    icon = v37, 
                    iconSize = l_IconSize_0.Small, 
                    size = UDim2.fromOffset(26, 26), 
                    layoutOrder = 1, 
                    onActivated = v44
                }, {
                    tooltip = if v35.isTooltipActive then v2.createElement(l_Tooltip_0, {
                        triggerPosition = Vector2.new(16, 0), 
                        triggerSize = Vector2.new(0, 0), 
                        headerText = v42.tooltipTitle, 
                        bodyText = v42.tooltipBody, 
                        orientation = l_TooltipOrientation_0.Top, 
                        forceClickTriggerPoint = true, 
                        isDirectChild = true
                    }) else nil
                }) else nil, 
                PrimaryName = v2.createElement(l_Text_0, {
                    Text = v40, 
                    tag = "auto-xy text-align-x-left text-align-y-bottom content-emphasis", 
                    fontStyle = v36.Typography.HeadingSmall, 
                    LayoutOrder = 2, 
                    Size = if l_FFlagFriendRequestNicknames_0 then UDim2.new(1, 0, 1, 0) else nil, 
                    TextWrapped = l_FFlagFriendRequestNicknames_0 and true or nil, 
                    FluidSizing = not l_FFlagFriendRequestNicknames_0 and nil, 
                    LineHeight = l_FFlagFriendRequestNicknames_0 and 1 or nil
                }), 
                AdminTiltIcon = if v31 and v35.isRobloxAdmin then v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v36.Gap.XXSmall), 
                        PaddingBottom = UDim.new(0, v36.Gap.XXSmall)
                    }), 
                    Icon = v2.createElement(v13.Icon, {
                        name = v13.Enums.IconName.Tilt, 
                        size = v13.Enums.IconSize.Large
                    })
                }) else nil, 
                SubscriptionBadge = if l_FFlagEnableBlackbirdCheckDev_0 and v35.isRobloxSubscriber then v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v36.Gap.XXSmall), 
                        PaddingBottom = UDim.new(0, v36.Gap.XXSmall)
                    }), 
                    Icon = v2.createElement(v13.Icon, {
                        name = v13.Enums.IconName.PaperAirplane, 
                        size = v13.Enums.IconSize.Small
                    })
                }) else nil
            })
        }), 
        Username = v2.createElement(l_Text_0, {
            RichText = l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 and true or nil, 
            Text = if l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 then ("<font features=\"zero, ss03\">%*</font>"):format(v41) .. if l_FFlagLegacyProfileTCIndicator_0 then v43 else "" else v41 .. if l_FFlagLegacyProfileTCIndicator_0 then v43 else "", 
            tag = "auto-xy text-align-x-left text-align-y-top", 
            fontStyle = v36.Typography.CaptionMedium, 
            Size = if l_FFlagFriendRequestNicknames_0 then UDim2.new(1, 0, 1, 0) else nil, 
            OpenTypeFeatures = if l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 then nil else if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil, 
            LayoutOrder = 2, 
            onActivated = if v27 then v2.useCallback(function() --[[ Line: 226 ]]
                -- upvalues: l_default_0 (ref), l_Contexts_0 (ref), v35 (copy), v39 (copy), v21 (ref), v38 (copy), l_SetCurrentToastMessage_0 (ref), v42 (copy), v34 (ref)
                l_default_0:setClipboardText({
                    context = l_Contexts_0.ProfileCard, 
                    text = v35.username
                });
                v39.fireAnalyticsEvent(v21.UsernameCopied);
                v38(l_SetCurrentToastMessage_0({
                    toastMessage = v42.usernameCopied, 
                    isLocalized = true, 
                    toastIcon = v34
                }));
            end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
                v35.username, 
                v39, 
                v42.usernameCopied
            } else l_dependencyArray_0(v35.username, v39, v42.usernameCopied)) else nil, 
            stateLayer = if v27 then {
                affordance = l_StateLayerAffordance_0.None
            } else nil
        })
    });
end;