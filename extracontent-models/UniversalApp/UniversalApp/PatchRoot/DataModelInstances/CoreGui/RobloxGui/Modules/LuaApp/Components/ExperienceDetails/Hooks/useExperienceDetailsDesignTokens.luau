local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local _ = require(l_CorePackages_0.Packages.ReactOtter);
local l_GetFFlagConsoleApplyTokenizationEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagConsoleApplyTokenizationEdp;
local function v6(v5) --[[ Line: 10 ]] --[[ Name: tokenSelector ]]
    return v5.LuaApps.ExperienceDetails or {};
end;
return function() --[[ Line: 36 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v6 (copy), l_GetFFlagConsoleApplyTokenizationEdp_0 (copy), v1 (copy)
    local v7 = l_useDesignTokens_0(v6);
    local l_ThumbnailSize_0 = v7.ThumbnailSize;
    local l_ThumbnailMargin_0 = v7.ThumbnailMargin;
    local l_SideMargin_0 = v7.SideMargin;
    local l_HeaderItemPadding_0 = v7.HeaderItemPadding;
    local l_HeaderDescriptionMaxRows_0 = v7.HeaderDescriptionMaxRows;
    local l_HeaderDescriptionLineHeight_0 = v7.HeaderDescriptionLineHeight;
    local l_ThumbnailShadowHeight_0 = v7.ThumbnailShadowHeight;
    local l_HeaderGradientHeight_0 = v7.HeaderGradientHeight;
    local l_HeaderBarBackgroundHeight_0 = v7.HeaderBarBackgroundHeight;
    local l_HeaderBottomMargin_0 = v7.HeaderBottomMargin;
    local l_ActionBarButtonBackgroundColor_0 = v7.ActionBarButtonBackgroundColor;
    local l_ActionBarTextButtonPadding_0 = v7.ActionBarTextButtonPadding;
    local l_AnimationConfig_0 = v7.AnimationConfig;
    local l_ItemPadding_0 = v7.ItemPadding;
    local l_SafeAreaSize_0 = v7.SafeAreaSize;
    local l_TrailingWhitespace_0 = v7.TrailingWhitespace;
    local l_IconSize_0 = v7.IconSize;
    local v25 = if l_GetFFlagConsoleApplyTokenizationEdp_0() then v7.ExpandableAreaHeightOffset else nil;
    local l_actionBarHeight_0 = v7.actionBarHeight;
    return v1.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: l_ThumbnailSize_0 (copy), l_ThumbnailMargin_0 (copy), l_SideMargin_0 (copy), l_HeaderItemPadding_0 (copy), l_HeaderDescriptionMaxRows_0 (copy), l_HeaderDescriptionLineHeight_0 (copy), l_ThumbnailShadowHeight_0 (copy), l_HeaderGradientHeight_0 (copy), l_HeaderBarBackgroundHeight_0 (copy), l_HeaderBottomMargin_0 (copy), l_ActionBarButtonBackgroundColor_0 (copy), l_ActionBarTextButtonPadding_0 (copy), l_AnimationConfig_0 (copy), l_ItemPadding_0 (copy), l_SafeAreaSize_0 (copy), l_TrailingWhitespace_0 (copy), l_IconSize_0 (copy), v25 (copy), l_actionBarHeight_0 (copy)
        return {
            thumbnailSize = l_ThumbnailSize_0, 
            thumbnailMargin = l_ThumbnailMargin_0, 
            sideMargin = l_SideMargin_0, 
            headerItemPadding = l_HeaderItemPadding_0, 
            headerDescriptionMaxRows = l_HeaderDescriptionMaxRows_0, 
            headerDescriptionLineHeight = l_HeaderDescriptionLineHeight_0, 
            thumbnailShadowHeight = l_ThumbnailShadowHeight_0, 
            headerGradientHeight = l_HeaderGradientHeight_0, 
            headerBarBackgroundHeight = l_HeaderBarBackgroundHeight_0, 
            headerBottomMargin = l_HeaderBottomMargin_0, 
            actionBarButtonBackgroundColor = if l_ActionBarButtonBackgroundColor_0 then {
                Color = l_ActionBarButtonBackgroundColor_0.Color3, 
                Transparency = l_ActionBarButtonBackgroundColor_0.Transparency
            } else nil, 
            actionBarTextButtonPadding = l_ActionBarTextButtonPadding_0, 
            animationConfig = l_AnimationConfig_0, 
            itemPadding = l_ItemPadding_0, 
            safeAreaSize = l_SafeAreaSize_0, 
            trailingWhitespace = l_TrailingWhitespace_0, 
            iconSize = l_IconSize_0, 
            expandableAreaHeightOffset = v25, 
            actionBarHeight = l_actionBarHeight_0
        };
    end, {
        l_ThumbnailSize_0, 
        l_ThumbnailMargin_0, 
        l_SideMargin_0, 
        l_HeaderItemPadding_0, 
        l_HeaderDescriptionLineHeight_0, 
        l_ActionBarButtonBackgroundColor_0, 
        l_ActionBarTextButtonPadding_0, 
        l_ThumbnailShadowHeight_0, 
        l_HeaderBarBackgroundHeight_0, 
        l_HeaderGradientHeight_0, 
        l_HeaderBottomMargin_0, 
        l_AnimationConfig_0, 
        l_ItemPadding_0, 
        l_SafeAreaSize_0, 
        l_TrailingWhitespace_0, 
        l_IconSize_0, 
        v25, 
        l_actionBarHeight_0
    });
end;