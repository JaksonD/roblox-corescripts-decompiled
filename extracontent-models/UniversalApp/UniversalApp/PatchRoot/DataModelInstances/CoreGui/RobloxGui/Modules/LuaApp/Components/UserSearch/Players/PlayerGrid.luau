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
local l_calculateRowPositionFields_0 = require(l_CorePackages_0.Workspace.Packages.UnifiedLogging).calculateRowPositionFields;
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields;
local l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0 = v6.PLAYER_GRID_TILE_FOOTER_HEIGHT;
local v19 = v3.PureComponent:extend("PlayerGrid");
v19.validateProps = v5.strictInterface({
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
v19.defaultProps = {
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    mappedProfilesInsights = {}
};
v19.renderItem = function(v20, v21, v22, v23) --[[ Line: 67 ]] --[[ Name: renderItem ]]
    -- upvalues: l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (copy), l_calculateRowPositionFields_0 (copy), v3 (copy), v14 (copy), l_getTileRowInSort_0 (copy)
    local v24 = nil;
    if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then
        v24 = l_calculateRowPositionFields_0(v23, v20.props.itemsPerRow, v20.props.startRowNumber);
    end;
    return v3.createElement(v14, {
        index = v23, 
        user = v21, 
        size = UDim2.new(0, v22.X, 0, v22.Y), 
        searchParameters = v20.props.searchParameters, 
        hasEmphasis = v21.featured or false, 
        impressionsTag = v20.props.impressionsTag, 
        profileInsight = v20.props.mappedProfilesInsights[v21.id], 
        Analytics = v20.props.Analytics, 
        shouldUseCompactTiles = v20.props.shouldUseCompactTiles, 
        enablePresenceIndicator = v20.props.enablePresenceIndicator, 
        subpage = v20.props.subpage, 
        rowInSort = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v24.rowInSort else l_getTileRowInSort_0(v23, v20.props.startRowNumber, v20.props.itemsPerRow), 
        positionInRow = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v24.positionInRow else nil, 
        feedRowNumber = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v24.rowOnPage else nil
    });
end;
v19.getCardWidthForCompactTiles = function(v25, v26) --[[ Line: 93 ]] --[[ Name: getCardWidthForCompactTiles ]]
    -- upvalues: l_GridMetrics_0 (copy)
    local l_windowSize_0 = v25.props.windowSize;
    local v28 = l_GridMetrics_0.getSmallMetrics(l_windowSize_0.X, v26);
    if l_windowSize_0.X < l_windowSize_0.Y then
        return v28.itemWidth;
    else
        local v29 = v28.itemsPerRow + 1;
        return (math.floor((l_windowSize_0.X - (v29 - 1) * v26) / v29));
    end;
end;
v19.render = function(v30) --[[ Line: 106 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), l_GridMetrics_0 (copy), l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0 (copy), v4 (copy), l_UiMode_0 (copy), v3 (copy), l_GridView_0 (copy)
    local l_entries_0 = v30.props.entries;
    local l_LayoutOrder_0 = v30.props.LayoutOrder;
    local l_numberOfRowsToShow_0 = v30.props.numberOfRowsToShow;
    local l_windowSize_1 = v30.props.windowSize;
    local l_horizontalAlignment_0 = v30.props.horizontalAlignment;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    if v30.props.shouldUseCompactTiles then
        v39 = v30.props.cellSpacingHorizontal;
        v38 = Vector2.new(v39, v30.props.cellSpacingVertical);
        v37 = v30:getCardWidthForCompactTiles(v39);
        v40 = 60;
    else
        v39 = v13.Constants.GAME_GRID_CHILD_PADDING;
        v38 = Vector2.new(v39, v39 * 2);
        v37 = l_GridMetrics_0.getMediumMetrics(l_windowSize_1.X, v39).itemWidth;
        v40 = l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0;
    end;
    local v41 = math.floor(v37 + v40);
    local v42 = Vector2.new(v37, v41);
    if not v30.props.shouldUseCompactTiles and #l_entries_0 == 1 then
        v36 = {
            v4.Dictionary.join(l_entries_0[1], {
                featured = true
            })
        };
        local l_itemWidth_0 = l_GridMetrics_0.getLargeMetrics(l_windowSize_1.X, v39).itemWidth;
        v42 = Vector2.new(l_itemWidth_0, l_itemWidth_0 + l_PLAYER_GRID_TILE_FOOTER_HEIGHT_0);
    end;
    if v30.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
        v37 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_1.X, v30.props.cellSpacingHorizontal, 6).itemWidth;
        v41 = math.floor(v37 + v30.props.tileHeightOffset);
        v42 = Vector2.new(v37, v41);
        v38 = Vector2.new(v30.props.cellSpacingHorizontal, v30.props.cellSpacingVertical);
    end;
    v42 = Vector2.new(v42.X, v42.Y + v30.props.textSizeOffset * 3);
    return v3.createElement(l_GridView_0, {
        layoutOrder = l_LayoutOrder_0, 
        items = v36 or l_entries_0, 
        renderItem = function(...) --[[ Line: 164 ]] --[[ Name: renderItem ]]
            -- upvalues: v30 (copy)
            return v30:renderItem(...);
        end, 
        windowAbsoluteSize = l_windowSize_1, 
        itemAbsoluteSize = v42, 
        cellPaddingOffset = v38, 
        numberOfRowsToShow = l_numberOfRowsToShow_0, 
        horizontalAlignment = l_horizontalAlignment_0, 
        onItemsPerRowChanged = v30.props.onItemsPerRowChanged
    });
end;
local l_v19_0 = v19;
return function(v45) --[[ Line: 177 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_useTextSizeOffset_0 (copy), v4 (copy), v3 (copy), l_v19_0 (copy)
    local v46 = l_useDesignTokens_0();
    local v47 = l_useUiModeInfo_0();
    local v48 = l_useTextSizeOffset_0();
    local v49 = v4.Dictionary.join(v45, {
        uiModeInfo = v47, 
        cellSpacingHorizontal = v46.Global.Space_300, 
        cellSpacingVertical = if v45.shouldUseCompactTiles then v46.Global.Space_200 else v46.Global.Space_400, 
        tileHeightOffset = v46.Global.Space_800, 
        textSizeOffset = v48
    });
    return v3.createElement(l_v19_0, v49);
end;