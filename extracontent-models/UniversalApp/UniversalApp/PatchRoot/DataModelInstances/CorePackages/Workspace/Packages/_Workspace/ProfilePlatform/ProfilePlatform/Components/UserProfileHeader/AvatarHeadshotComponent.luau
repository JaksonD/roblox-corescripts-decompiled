local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local v6 = require(l_Parent_0.FoundationImages).Images["icons/actions/edit/copy"];
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local l_convertToFoundationPresenceEnum_0 = require(l_Parent_0.SocialCommon).Utils.convertToFoundationPresenceEnum;
local v9 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v17 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 = require(l_Parent_0.SharedFlags).FFlagEnableFontStylisticAlternativesOnSocialScreens;
local l_FFlagUserTileTextTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagUserTileTextTCIndicator;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
return function(v22) --[[ Line: 42 ]] --[[ Name: AvatarHeadshotComponent ]]
    -- upvalues: l_useTokens_0 (copy), v9 (copy), l_useLocalUserId_0 (copy), l_convertToFoundationPresenceEnum_0 (copy), l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v17 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useIsRobloxSubscriber_0 (copy), v2 (copy), l_default_0 (copy), l_Contexts_0 (copy), l_SetCurrentToastMessage_0 (copy), v6 (copy), v7 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), l_FFlagUserTileTextTCIndicator_0 (copy)
    local v23 = l_useTokens_0();
    local v24, v25 = v9();
    local v26 = l_useLocalUserId_0();
    local l_userId_0 = v22.userId;
    local v28 = if not (l_userId_0 == tostring(v26)) and v22.userPresenceType then l_convertToFoundationPresenceEnum_0(v22.userPresenceType) else nil;
    local v29 = if v22.username and v22.username ~= "" then if l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 then ("<font features=\"zero, ss03\">@%*</font>"):format(v22.username) else "@" .. v22.username else "";
    local v30 = l_useDispatch_0();
    local v31 = l_useLocalization_0({
        usernameCopied = v17.UsernameCopied
    });
    local v32 = nil;
    if l_FFlagEnableBlackbirdCheckDev_0 then
        v32 = l_useIsRobloxSubscriber_0(l_userId_0);
    end;
    local v33 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: l_default_0 (ref), l_Contexts_0 (ref), v22 (copy), v30 (copy), l_SetCurrentToastMessage_0 (ref), v31 (copy), v6 (ref)
        l_default_0:setClipboardText({
            context = l_Contexts_0.ProfileCard, 
            text = v22.username
        });
        v30(l_SetCurrentToastMessage_0({
            toastMessage = v31.usernameCopied, 
            isLocalized = true, 
            toastIcon = v6
        }));
    end);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v7.AVATAR_HEADSHOT_HEIGHT), 
        Position = UDim2.new(0, 0, 0, -(v7.AVATAR_HEADSHOT_HEIGHT / 2) - v23.Gap.Large), 
        LayoutOrder = v22.layoutOrder, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v25
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v24), 
            PaddingRight = UDim.new(0, v24)
        }), 
        UserTile = v2.createElement(l_UserTile_0, {
            layoutOrder = 1, 
            userId = v22.userId, 
            title = v22.primaryName, 
            isVerified = v22.isVerified, 
            isPremium = v22.isPremium, 
            isRobloxAdmin = v22.isRobloxAdmin, 
            subtitle = v29, 
            layoutMode = l_LayoutMode_0.wide, 
            userPresenceType = v28, 
            titleStyle = v23.Typography.HeadingSmall, 
            subtitleStyle = v23.Typography.BodyMedium, 
            onSubtitleClicked = v33, 
            trustedConnectionIndicatorEnabled = l_FFlagUserTileTextTCIndicator_0 and true or nil, 
            isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v32 else nil
        })
    });
end;