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
return function(v20) --[[ Line: 39 ]] --[[ Name: AvatarHeadshotComponent ]]
    -- upvalues: l_useTokens_0 (copy), v9 (copy), l_useLocalUserId_0 (copy), l_convertToFoundationPresenceEnum_0 (copy), l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v17 (copy), v2 (copy), l_default_0 (copy), l_Contexts_0 (copy), l_SetCurrentToastMessage_0 (copy), v6 (copy), v7 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), l_FFlagUserTileTextTCIndicator_0 (copy)
    local v21 = l_useTokens_0();
    local v22, v23 = v9();
    local v24 = l_useLocalUserId_0();
    local v25 = if not (v20.userId == tostring(v24)) and v20.userPresenceType then l_convertToFoundationPresenceEnum_0(v20.userPresenceType) else nil;
    local v26 = if v20.username and v20.username ~= "" then if l_FFlagEnableFontStylisticAlternativesOnSocialScreens_0 then ("<font features=\"zero, ss03\">@%*</font>"):format(v20.username) else "@" .. v20.username else "";
    local v27 = l_useDispatch_0();
    local v28 = l_useLocalization_0({
        usernameCopied = v17.UsernameCopied
    });
    local v29 = v2.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: l_default_0 (ref), l_Contexts_0 (ref), v20 (copy), v27 (copy), l_SetCurrentToastMessage_0 (ref), v28 (copy), v6 (ref)
        l_default_0:setClipboardText({
            context = l_Contexts_0.ProfileCard, 
            text = v20.username
        });
        v27(l_SetCurrentToastMessage_0({
            toastMessage = v28.usernameCopied, 
            isLocalized = true, 
            toastIcon = v6
        }));
    end);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v7.AVATAR_HEADSHOT_HEIGHT), 
        Position = UDim2.new(0, 0, 0, -(v7.AVATAR_HEADSHOT_HEIGHT / 2) - v21.Gap.Large), 
        LayoutOrder = v20.layoutOrder, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v23
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v22), 
            PaddingRight = UDim.new(0, v22)
        }), 
        UserTile = v2.createElement(l_UserTile_0, {
            layoutOrder = 1, 
            userId = v20.userId, 
            title = v20.primaryName, 
            isVerified = v20.isVerified, 
            isPremium = v20.isPremium, 
            isRobloxAdmin = v20.isRobloxAdmin, 
            subtitle = v26, 
            layoutMode = l_LayoutMode_0.wide, 
            userPresenceType = v25, 
            titleStyle = v21.Typography.HeadingSmall, 
            subtitleStyle = v21.Typography.BodyMedium, 
            onSubtitleClicked = v29, 
            trustedConnectionIndicatorEnabled = l_FFlagUserTileTextTCIndicator_0 and true or nil
        })
    });
end;