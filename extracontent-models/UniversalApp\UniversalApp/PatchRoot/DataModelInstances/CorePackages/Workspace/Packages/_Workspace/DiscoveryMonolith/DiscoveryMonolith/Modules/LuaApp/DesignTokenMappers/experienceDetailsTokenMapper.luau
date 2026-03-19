local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local _ = require(l_Parent_0.RobloxAppHooks);
local _ = require(l_Parent_0.Style);
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v4 = require(l_Parent_0.SharedFlags);
local l_GetFFlagConsoleApplyTokenizationEdp_0 = v4.GetFFlagConsoleApplyTokenizationEdp;
local l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 = v4.FFlagLuaAppUnifyPlayButtonNonMobileEdp;
return function(v7, v8) --[[ Line: 15 ]] --[[ Name: makeExperienceDetailsTokenMapper ]]
    -- upvalues: l_UiMode_0 (copy), l_GetFFlagConsoleApplyTokenizationEdp_0 (copy), l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 (copy)
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local l_Medium_0 = v8.Semantic.Radius.Medium;
    local l_Size_200_0 = v8.Global.Size_200;
    local v28 = 1;
    local l_Size_300_0 = v8.Global.Size_300;
    local v30 = nil;
    if v7.uiMode == l_UiMode_0.TenFoot then
        if l_GetFFlagConsoleApplyTokenizationEdp_0() then
            v25 = v8.Global.Size_100 * 49;
            v9 = v8.Global.Size_100 * 33;
        else
            v9 = 400;
        end;
        v10 = 0;
        v17 = 0;
        v13 = 0;
        v14 = 4;
        v11 = v8.Global.Space_400;
        v12 = v8.Global.Space_100;
        v15 = v8.Global.LineHeight_300;
        v16 = 0;
        v18 = v8.Global.Space_500;
        v19 = v8.Semantic.Color.BackgroundUi.Default;
        v20 = Vector2.new(v8.Global.Size_200, v8.Global.Size_100);
        v21 = {
            dampingRatio = 1, 
            frequency = 3
        };
        v22 = v8.Global.Space_300;
        v23 = Vector2.new(v8.Global.Size_800, v8.Global.Size_1200);
        v24 = 3000;
        v28 = 0.6;
        v30 = if l_FFlagLuaAppUnifyPlayButtonNonMobileEdp_0 then v8.Global.Size_500 else nil;
    else
        v30 = v8.Global.Size_600;
    end;
    return {
        ThumbnailSize = v9, 
        ThumbnailMargin = v11, 
        SideMargin = v10, 
        HeaderItemPadding = v12, 
        HeaderDescriptionMaxRows = v14, 
        HeaderDescriptionLineHeight = v15, 
        ThumbnailShadowHeight = v16, 
        HeaderGradientHeight = v17, 
        HeaderBarBackgroundHeight = v13, 
        HeaderBottomMargin = v18, 
        ActionBarButtonBackgroundColor = v19, 
        ActionBarTextButtonPadding = v20, 
        AnimationConfig = v21, 
        ItemPadding = v22, 
        SafeAreaSize = v23, 
        TrailingWhitespace = v24, 
        PanelRadius = l_Medium_0, 
        PanelHeaderMargin = l_Size_200_0, 
        PanelWidthScale = v28, 
        PanelInnerPadding = l_Size_300_0, 
        IconSize = v8.Semantic.Icon.Size.Medium, 
        ExpandableAreaHeightOffset = if l_GetFFlagConsoleApplyTokenizationEdp_0() then v25 else nil, 
        actionBarHeight = v30
    };
end;