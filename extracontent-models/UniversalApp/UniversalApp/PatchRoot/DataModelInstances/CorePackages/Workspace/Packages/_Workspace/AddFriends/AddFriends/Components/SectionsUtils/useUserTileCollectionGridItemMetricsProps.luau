local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RobloxAppHooks);
local v3 = require(l_Parent_0.RoactUtils);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useScreenSize_0 = v2.useScreenSize;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local v9 = require(l_Parent_0.UIBlox);
local l_useTextSizeOffset_0 = v9.Core.Style.useTextSizeOffset;
local l_GridMetrics_0 = v9.App.Grid.GridMetrics;
local l_getPageMargin_0 = v9.App.Container.getPageMargin;
local v13 = game:DefineFastFlag("AddFriendsScalingFix", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function() --[[ Line: 26 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useScreenSize_0 (copy), v13 (copy), l_useTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useSelector_0 (copy), l_GridMetrics_0 (copy), v1 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_getPageMargin_0 (copy)
    local v15 = l_useDesignTokens_0();
    local v16 = l_useScreenSize_0();
    local v17 = if v13 then l_useTokens_0() else nil;
    local v18 = l_useTextSizeOffset_0();
    local v20 = l_useSelector_0(function(v19) --[[ Line: 31 ]]
        return v19.GlobalGuiInset;
    end);
    local l_Space_1000_0 = v15.Global.Space_1000;
    local v22 = nil;
    v22 = if v13 then l_GridMetrics_0.makeCustomMetricsGetter({
        minimumItemsPerRow = math.floor(2 / v17.Config.UI.Scale), 
        minimumItemWidth = 160 * v17.Config.UI.Scale
    }) else l_GridMetrics_0.getMediumMetrics;
    local v24 = v1.useCallback(function(v23) --[[ Line: 48 ]]
        -- upvalues: l_Space_1000_0 (copy), v18 (copy)
        return v23 + l_Space_1000_0 + 3 * v18;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_Space_1000_0, 
        v18
    } else l_dependencyArray_0(l_Space_1000_0, v18));
    local v25 = v15.LuaApps.FriendsLanding.AddFriendsPage.ItemMargin or 12;
    local l_SafeAreaMargin_0 = v15.LuaApps.App.Page.SafeAreaMargin;
    local v27 = if l_SafeAreaMargin_0.X > 0 then l_SafeAreaMargin_0.X else l_getPageMargin_0(v16.X);
    local v28 = v16.X - 2 * v27 - v20.left;
    local v29, v30 = v1.useState(v28);
    local function v32(v31) --[[ Line: 62 ]]
        -- upvalues: v30 (copy)
        v30(v31.X);
    end;
    local v33 = v22(v29, v25);
    return {
        numColumns = v33.itemsPerRow, 
        columnGap = v33.itemsPerRow <= 2 and v25 or nil, 
        getItemHeight = v24, 
        onContainerSizeChanged = v32
    }, v33;
end;