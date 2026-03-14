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
return function() --[[ Line: 23 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useScreenSize_0 (copy), v13 (copy), l_useTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useSelector_0 (copy), l_GridMetrics_0 (copy), v1 (copy), l_dependencyArray_0 (copy), l_getPageMargin_0 (copy)
    local v14 = l_useDesignTokens_0();
    local v15 = l_useScreenSize_0();
    local v16 = if v13 then l_useTokens_0() else nil;
    local v17 = l_useTextSizeOffset_0();
    local v19 = l_useSelector_0(function(v18) --[[ Line: 28 ]]
        return v18.GlobalGuiInset;
    end);
    local l_Space_1000_0 = v14.Global.Space_1000;
    local v21 = nil;
    v21 = if v13 then l_GridMetrics_0.makeCustomMetricsGetter({
        minimumItemsPerRow = math.floor(2 / v16.Config.UI.Scale), 
        minimumItemWidth = 160 * v16.Config.UI.Scale
    }) else l_GridMetrics_0.getMediumMetrics;
    local v23 = v1.useCallback(function(v22) --[[ Line: 44 ]]
        -- upvalues: l_Space_1000_0 (copy), v17 (copy)
        return v22 + l_Space_1000_0 + 3 * v17;
    end, l_dependencyArray_0(l_Space_1000_0, v17));
    local v24 = v14.LuaApps.FriendsLanding.AddFriendsPage.ItemMargin or 12;
    local l_SafeAreaMargin_0 = v14.LuaApps.App.Page.SafeAreaMargin;
    local v26 = if l_SafeAreaMargin_0.X > 0 then l_SafeAreaMargin_0.X else l_getPageMargin_0(v15.X);
    local v27 = v15.X - 2 * v26 - v19.left;
    local v28, v29 = v1.useState(v27);
    local function v31(v30) --[[ Line: 54 ]]
        -- upvalues: v29 (copy)
        v29(v30.X);
    end;
    local v32 = v21(v28, v24);
    return {
        numColumns = v32.itemsPerRow, 
        columnGap = v32.itemsPerRow <= 2 and v24 or nil, 
        getItemHeight = v23, 
        onContainerSizeChanged = v31
    }, v32;
end;