local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.LuaApp.Constants);
local l_GridView_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Components.Generic.GridView;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_GridMetrics_0 = v2.App.Grid.GridMetrics;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_useTextSizeOffset_0 = v2.Core.Style.useTextSizeOffset;
local v13 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local v14 = require(l_Modules_0.LuaApp.Components.UserSearch.UserSearchTileUniversalWrapper.Container);
local l_getTileRowInSort_0 = require(l_Modules_0.LuaApp.Components.UserSearch.api).Analytics.getTileRowInSort;
local l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0 = v6.PLAYER_GRID_TILE_FOOTER_HEIGHT;
local v17 = v3.PureComponent:extend("PlayerGrid");
v17.validateProps = v5.strictInterface({
    entries = v5.table, 
    LayoutOrder = v5.optional(v5.integer), 
    numberOfRowsToShow = v5.optional(v5.integer), 
    windowSize = v5.Vector2, 
    horizontalAlignment = v5.optional(v5.enum(Enum.HorizontalAlignment)), 
    searchParameters = v5.table, 
    impressionsTag = v5.string, 
    mappedProfilesInsights = v5.optional(v5.table), 
    uiModeInfo = v5.table, 
    cellSpacingHorizontal = v5.number, 
    cellSpacingVertical = v5.number, 
    tileHeightOffset = v5.number, 
    Analytics = v5.any, 
    shouldUseCompactTiles = v5.optional(v5.boolean), 
    subpage = v5.optional(v5.string), 
    onItemsPerRowChanged = v5.optional(v5.any), 
    startRowNumber = v5.optional(v5.number), 
    itemsPerRow = v5.optional(v5.number), 
    textSizeOffset = v5.number, 
    enablePresenceIndicator = v5.optional(v5.boolean), 
    enableOnlineFrequents = v5.optional(v5.boolean)
});
v17.defaultProps = {
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    mappedProfilesInsights = {}
};
v17.renderItem = function(v18, v19, v20, v21) --[[ Line: 63 ]] --[[ Name: renderItem ]]
    -- upvalues: v3 (copy), v14 (copy), l_getTileRowInSort_0 (copy)
    return v3.createElement(v14, {
        index = v21, 
        user = v19, 
        size = UDim2.new(0, v20.X, 0, v20.Y), 
        searchParameters = v18.props.searchParameters, 
        hasEmphasis = v19.featured or false, 
        impressionsTag = v18.props.impressionsTag, 
        profileInsight = v18.props.mappedProfilesInsights[v19.id], 
        Analytics = v18.props.Analytics, 
        shouldUseCompactTiles = v18.props.shouldUseCompactTiles, 
        enablePresenceIndicator = v18.props.enablePresenceIndicator, 
        subpage = v18.props.subpage, 
        rowInSort = l_getTileRowInSort_0(v21, v18.props.startRowNumber, v18.props.itemsPerRow)
    });
end;
v17.getCardWidthForCompactTiles = function(v22, v23) --[[ Line: 80 ]] --[[ Name: getCardWidthForCompactTiles ]]
    -- upvalues: l_GridMetrics_0 (copy)
    local l_windowSize_0 = v22.props.windowSize;
    local v25 = l_GridMetrics_0.getSmallMetrics(l_windowSize_0.X, v23);
    if l_windowSize_0.X < l_windowSize_0.Y then
        return v25.itemWidth;
    else
        local v26 = v25.itemsPerRow + 1;
        return (math.floor((l_windowSize_0.X - (v26 - 1) * v23) / v26));
    end;
end;
v17.render = function(v27) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), l_GridMetrics_0 (copy), l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0 (copy), v4 (copy), l_UiMode_0 (copy), v3 (copy), l_GridView_0 (copy)
    local l_entries_0 = v27.props.entries;
    local l_LayoutOrder_0 = v27.props.LayoutOrder;
    local l_numberOfRowsToShow_0 = v27.props.numberOfRowsToShow;
    local l_windowSize_1 = v27.props.windowSize;
    local l_horizontalAlignment_0 = v27.props.horizontalAlignment;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    if v27.props.shouldUseCompactTiles then
        v36 = v27.props.cellSpacingHorizontal;
        v35 = Vector2.new(v36, v27.props.cellSpacingVertical);
        v34 = v27:getCardWidthForCompactTiles(v36);
        v37 = 60;
    else
        v36 = v13.Constants.GAME_GRID_CHILD_PADDING;
        v35 = Vector2.new(v36, v36 * 2);
        v34 = l_GridMetrics_0.getMediumMetrics(l_windowSize_1.X, v36).itemWidth;
        v37 = l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0;
    end;
    local v38 = math.floor(v34 + v37);
    local v39 = Vector2.new(v34, v38);
    if not v27.props.shouldUseCompactTiles and #l_entries_0 == 1 then
        v33 = {
            v4.Dictionary.join(l_entries_0[1], {
                featured = true
            })
        };
        local l_itemWidth_0 = l_GridMetrics_0.getLargeMetrics(l_windowSize_1.X, v36).itemWidth;
        v39 = Vector2.new(l_itemWidth_0, l_itemWidth_0 + l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0);
    end;
    if v27.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
        v34 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_1.X, v27.props.cellSpacingHorizontal, 6).itemWidth;
        v38 = math.floor(v34 + v27.props.tileHeightOffset);
        v39 = Vector2.new(v34, v38);
        v35 = Vector2.new(v27.props.cellSpacingHorizontal, v27.props.cellSpacingVertical);
    end;
    v39 = Vector2.new(v39.X, v39.Y + v27.props.textSizeOffset * 3);
    return v3.createElement(l_GridView_0, {
        layoutOrder = l_LayoutOrder_0, 
        items = v33 or l_entries_0, 
        renderItem = function(...) --[[ Line: 151 ]] --[[ Name: renderItem ]]
            -- upvalues: v27 (copy)
            return v27:renderItem(...);
        end, 
        windowAbsoluteSize = l_windowSize_1, 
        itemAbsoluteSize = v39, 
        cellPaddingOffset = v35, 
        numberOfRowsToShow = l_numberOfRowsToShow_0, 
        horizontalAlignment = l_horizontalAlignment_0, 
        onItemsPerRowChanged = v27.props.onItemsPerRowChanged
    });
end;
local l_v17_0 = v17;
return function(v42) --[[ Line: 164 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_useTextSizeOffset_0 (copy), v4 (copy), v3 (copy), l_v17_0 (copy)
    local v43 = l_useDesignTokens_0();
    local v44 = l_useUiModeInfo_0();
    local v45 = l_useTextSizeOffset_0();
    local v46 = v4.Dictionary.join(v42, {
        uiModeInfo = v44, 
        cellSpacingHorizontal = v43.Global.Space_300, 
        cellSpacingVertical = if v42.shouldUseCompactTiles then v43.Global.Space_200 else v43.Global.Space_400, 
        tileHeightOffset = v43.Global.Space_800, 
        textSizeOffset = v45
    });
    return v3.createElement(l_v17_0, v46);
end;