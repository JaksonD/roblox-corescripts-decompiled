local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.ArgCheck);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v6 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local v8 = require(l_script_FirstAncestor_0.useCollectionSizeBindings);
local v9 = require(l_script_FirstAncestor_0.CollectionHeader);
local v10 = require(l_script_FirstAncestor_0.Grid.GridOfCollectionItems);
local _ = require(l_script_FirstAncestor_0.CollectionViewTypes);
local v12 = require(l_script_FirstAncestor_0.CollectionLayoutStore.useCollectionLayout);
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local v14 = v6.strictInterface({
    testId = v6.optional(v6.string), 
    Position = v6.optional(v6.UDim2), 
    LayoutOrder = v6.optional(v6.number), 
    containerRef = v6.optional(v6.union(v6.table, v6.callback)), 
    verticalPadding = v6.optional(v6.number), 
    maxNumRows = v6.optional(v6.number), 
    verticalScrollingFrameRef = v6.optional(v6.table), 
    collectionItemSize = if l_FFlagLuaAppCompositionSupport_0 then v6.optional(v6.string) else nil, 
    numColumns = if l_FFlagLuaAppCompositionSupport_0 then v6.optional(v6.number) else v6.number, 
    items = v6.table, 
    renderItem = v6.callback, 
    getItemHeight = v6.callback, 
    columnGap = v6.optional(v6.number), 
    sideMargin = v6.optional(v6.number), 
    title = v6.optional(v6.union(v6.string, v6.callback)), 
    subtitle = v6.optional(v6.string), 
    tooltipInfoText = v6.optional(v6.string), 
    onActivateInfoIcon = v6.optional(v6.callback), 
    tooltipSupportsVR = v6.optional(v6.boolean), 
    tooltipSupportsTenFootUi = v6.optional(v6.boolean), 
    onActivateHeader = v6.optional(v6.callback), 
    headerButtonText = v6.optional(v6.string), 
    onViewableItemsChanged = v6.optional(v6.callback), 
    onContainerSizeChanged = v6.optional(v6.callback), 
    hideHeaderButton = v6.optional(v6.boolean), 
    bufferRowsBelowScreen = v6.optional(v6.number), 
    bufferRowsAboveScreen = v6.optional(v6.number), 
    disableRelativeGap = v6.optional(v6.boolean), 
    headerComponent = v6.optional(v6.table), 
    thresholdRowsFromBottom = v6.optional(v6.number), 
    onReachedThresholdFromEnd = v6.optional(v6.union(v6.table, v6.callback))
});
local v15 = {
    numColumns = 0, 
    columnGap = 0, 
    sideMargin = 0, 
    verticalPadding = 0
};
return (v2.memo(function(v16) --[[ Line: 166 ]] --[[ Name: CollectionGrid ]]
    -- upvalues: l_validateProps_0 (copy), v14 (copy), v3 (copy), v15 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v12 (copy), v4 (copy), l_useDesignTokens_0 (copy), v8 (copy), v2 (copy), v9 (copy), v10 (copy)
    l_validateProps_0(v14, v16);
    local v17 = v3.Dictionary.join(v15, v16);
    local l_sideMargin_0 = v17.sideMargin;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        local v22 = v12(v17.collectionItemSize);
        v19 = v16.numColumns or v22.itemsPerRow;
        v20 = v16.columnGap or v22.gutter;
        v21 = v16.verticalPadding or v22.verticalGap;
    else
        v19 = v17.numColumns;
        v20 = v17.columnGap;
        v21 = v17.verticalPadding;
    end;
    v4.assert(v19 >= 1);
    v4.assert(l_sideMargin_0 >= 0);
    v4.assert(v21 >= 0);
    v4.assert(v20 >= 0);
    local l_Size_200_0 = l_useDesignTokens_0().Global.Size_200;
    local v24, _, v26, v27 = v8(v19, v20, l_sideMargin_0, 0, v17.getItemHeight, v17.onContainerSizeChanged);
    local v28 = v17.title and v17.title ~= "";
    local l_createElement_0 = v2.createElement;
    local v30 = "Frame";
    local v31 = {
        ref = v17.containerRef, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v17.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v17.LayoutOrder, 
        [v2.Tag] = if v17.testId then ("data-testid=%*"):format(v17.testId) else nil
    };
    local v32 = {};
    local l_createElement_1 = v2.createElement;
    local v34 = "Frame";
    local v35 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v26, 
        ref = v27
    };
    local v36 = {
        UIPadding = if not l_FFlagLuaAppCompositionSupport_0 or l_sideMargin_0 > 0 then v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_sideMargin_0), 
            PaddingRight = UDim.new(0, l_sideMargin_0)
        }) else nil, 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if not not v28 or v17.headerComponent then l_Size_200_0 else nil)
        })
    };
    local v37;
    if v17.headerComponent then
        v37 = v17.headerComponent;
    else
        v37 = v2.createElement;
        local l_v9_0 = v9;
        local v39 = {
            LayoutOrder = 1, 
            title = v17.title, 
            subtitle = v17.subtitle, 
            tooltipInfoText = v17.tooltipInfoText, 
            onActivateInfoIcon = v17.onActivateInfoIcon, 
            tooltipSupportsVR = v17.tooltipSupportsVR, 
            tooltipSupportsTenFootUi = v17.tooltipSupportsTenFootUi
        };
        local v40 = true;
        if #v17.items >= 1 then
            v40 = v17.hideHeaderButton or not v28;
        end;
        v39.hideButton = v40;
        v39.onActivate = v17.onActivateHeader;
        v39.buttonText = v17.headerButtonText;
        v37 = v37(l_v9_0, v39);
    end;
    v36.Header = v37;
    v36.GridOfItems = v2.createElement(v10, {
        verticalScrollingFrameRef = v17.verticalScrollingFrameRef, 
        onViewableItemsChanged = v17.onViewableItemsChanged, 
        itemSizeBinding = v24, 
        maxNumRows = v17.maxNumRows, 
        numColumns = v19, 
        items = v17.items, 
        renderItem = v17.renderItem, 
        columnGap = v20, 
        sideMargin = l_sideMargin_0, 
        verticalPadding = v21, 
        bufferRowsBelowScreen = v17.bufferRowsBelowScreen, 
        bufferRowsAboveScreen = v17.bufferRowsAboveScreen, 
        LayoutOrder = 2, 
        disableRelativeGap = v17.disableRelativeGap, 
        thresholdRowsFromBottom = v17.thresholdRowsFromBottom, 
        onReachedThresholdFromEnd = v17.onReachedThresholdFromEnd
    });
    v32.CollectionContent = l_createElement_1(v34, v35, v36);
    return l_createElement_0(v30, v31, v32);
end));