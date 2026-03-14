local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.ArrowNav);
local l_ArrowNavV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.ArrowNavV2;
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_Images_0 = v4.App.ImageSet.Images;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMoveCatalogFilterToL1Navigation;
local v11 = l_Images_0["icons/actions/cycleLeft"];
local v12 = l_Images_0["icons/actions/cycleRight"];
return v3.memo(function(v13) --[[ Line: 45 ]] --[[ Name: ArrowFrame ]]
    -- upvalues: l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), l_useTokens_0 (copy), v3 (copy), l_ArrowNavV2_0 (copy), v5 (copy), v11 (copy), v7 (copy), v12 (copy)
    local v14 = v13.ZIndex or 1;
    local v15 = v13.isVisibleRight == nil or v13.isVisibleRight or true;
    local v16 = v13.isVisibleLeft == nil or v13.isVisibleLeft or true;
    local l_defaultUseProps_0 = v13.defaultUseProps;
    local l_onPressHoldInputBegan_0 = v13.onPressHoldInputBegan;
    local l_onPressHoldInputEnded_0 = v13.onPressHoldInputEnded;
    local v20 = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v13.supportFilterButton else nil;
    local v21 = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v20 then v13.isFilterButtonVisible else nil;
    local v22 = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 then l_useTokens_0() else nil;
    local v23, v24 = v3.useState(false);
    local v25 = v3.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v24 (copy)
        v24(true);
    end, {});
    local v26 = v3.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v24 (copy)
        v24(false);
    end, {});
    local v27 = l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v20 and 0 or -6;
    local v28 = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v21 then -(v13.filterButtonWidth or 0) else -30;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = v14, 
        [v3.Event.MouseEnter] = v25, 
        [v3.Event.MouseLeave] = v26
    }, {
        ArrowLeft = v3.createElement(if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v20 then l_ArrowNavV2_0 else v5, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v27, 0.5, 0), 
            Image = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v20 then nil else v11, 
            Visible = v23 and v16, 
            navDirection = v7.NavigationDirection.IS_LEFT, 
            defaultUseProps = l_defaultUseProps_0, 
            onPressHoldInputBegan = l_onPressHoldInputBegan_0, 
            onPressHoldInputEnded = l_onPressHoldInputEnded_0, 
            tokens = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v20 then v22 else nil
        }), 
        ArrowRight = v3.createElement(if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v20 then l_ArrowNavV2_0 else v5, {
            AnchorPoint = Vector2.new(l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v20 and 1 or 0, 0.5), 
            Position = UDim2.new(1, v28, 0.5, 0), 
            Image = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v20 then nil else v12, 
            Visible = v23 and v15, 
            navDirection = v7.NavigationDirection.IS_RIGHT, 
            defaultUseProps = l_defaultUseProps_0, 
            onPressHoldInputBegan = l_onPressHoldInputBegan_0, 
            onPressHoldInputEnded = l_onPressHoldInputEnded_0, 
            tokens = if l_FFlagAXMoveCatalogFilterToL1Navigation_0 and v20 then v22 else nil
        })
    });
end);