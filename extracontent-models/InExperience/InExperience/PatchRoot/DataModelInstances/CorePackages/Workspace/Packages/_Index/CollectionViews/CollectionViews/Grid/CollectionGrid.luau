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
local l_FFlagSduiV2PaginationSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiV2PaginationSupport;
local v12 = v6.strictInterface({
    testId = v6.optional(v6.string), 
    Position = v6.optional(v6.UDim2), 
    LayoutOrder = v6.optional(v6.number), 
    containerRef = v6.optional(v6.union(v6.table, v6.callback)), 
    verticalPadding = v6.optional(v6.number), 
    maxNumRows = v6.optional(v6.number), 
    verticalScrollingFrameRef = v6.optional(v6.table), 
    numColumns = v6.number, 
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
    thresholdRowsFromBottom = if l_FFlagSduiV2PaginationSupport_0 then v6.optional(v6.number) else nil, 
    onReachedThresholdFromEnd = if l_FFlagSduiV2PaginationSupport_0 then v6.optional(v6.union(v6.table, v6.callback)) else nil
});
local v13 = {
    numColumns = 0, 
    columnGap = 0, 
    sideMargin = 0, 
    verticalPadding = 0
};
return (v2.memo(function(v14) --[[ Line: 156 ]] --[[ Name: CollectionGrid ]]
    -- upvalues: l_validateProps_0 (copy), v12 (copy), v3 (copy), v13 (copy), v4 (copy), l_useDesignTokens_0 (copy), v8 (copy), v2 (copy), v9 (copy), v10 (copy), l_FFlagSduiV2PaginationSupport_0 (copy)
    l_validateProps_0(v12, v14);
    local v15 = v3.Dictionary.join(v13, v14);
    local l_numColumns_0 = v15.numColumns;
    local l_sideMargin_0 = v15.sideMargin;
    local l_columnGap_0 = v15.columnGap;
    local l_verticalPadding_0 = v15.verticalPadding;
    v4.assert(l_numColumns_0 >= 1);
    v4.assert(l_sideMargin_0 >= 0);
    v4.assert(l_verticalPadding_0 >= 0);
    v4.assert(l_columnGap_0 >= 0);
    local l_Size_200_0 = l_useDesignTokens_0().Global.Size_200;
    local v21, _, v23, v24 = v8(l_numColumns_0, l_columnGap_0, l_sideMargin_0, 0, v15.getItemHeight, v15.onContainerSizeChanged);
    local v25 = v15.title and v15.title ~= "";
    local l_createElement_0 = v2.createElement;
    local v27 = "Frame";
    local v28 = {
        ref = v15.containerRef, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v15.Position, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v15.LayoutOrder, 
        [v2.Tag] = if v15.testId then ("data-testid=%*"):format(v15.testId) else nil
    };
    local v29 = {};
    local l_createElement_1 = v2.createElement;
    local v31 = "Frame";
    local v32 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v23, 
        ref = v24
    };
    local v33 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_sideMargin_0), 
            PaddingRight = UDim.new(0, l_sideMargin_0)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, if not not v25 or v15.headerComponent then l_Size_200_0 else nil)
        })
    };
    local v34;
    if v15.headerComponent then
        v34 = v15.headerComponent;
    else
        v34 = v2.createElement;
        local l_v9_0 = v9;
        local v36 = {
            LayoutOrder = 1, 
            title = v15.title, 
            subtitle = v15.subtitle, 
            tooltipInfoText = v15.tooltipInfoText, 
            onActivateInfoIcon = v15.onActivateInfoIcon, 
            tooltipSupportsVR = v15.tooltipSupportsVR, 
            tooltipSupportsTenFootUi = v15.tooltipSupportsTenFootUi
        };
        local v37 = true;
        if #v15.items >= 1 then
            v37 = v15.hideHeaderButton or not v25;
        end;
        v36.hideButton = v37;
        v36.onActivate = v15.onActivateHeader;
        v36.buttonText = v15.headerButtonText;
        v34 = v34(l_v9_0, v36);
    end;
    v33.Header = v34;
    v33.GridOfItems = v2.createElement(v10, {
        verticalScrollingFrameRef = v15.verticalScrollingFrameRef, 
        onViewableItemsChanged = v15.onViewableItemsChanged, 
        itemSizeBinding = v21, 
        maxNumRows = v15.maxNumRows, 
        numColumns = l_numColumns_0, 
        items = v15.items, 
        renderItem = v15.renderItem, 
        columnGap = l_columnGap_0, 
        sideMargin = l_sideMargin_0, 
        verticalPadding = l_verticalPadding_0, 
        bufferRowsBelowScreen = v15.bufferRowsBelowScreen, 
        bufferRowsAboveScreen = v15.bufferRowsAboveScreen, 
        LayoutOrder = 2, 
        disableRelativeGap = v15.disableRelativeGap, 
        thresholdRowsFromBottom = if l_FFlagSduiV2PaginationSupport_0 then v15.thresholdRowsFromBottom else nil, 
        onReachedThresholdFromEnd = if l_FFlagSduiV2PaginationSupport_0 then v15.onReachedThresholdFromEnd else nil
    });
    v29.CollectionContent = l_createElement_1(v31, v32, v33);
    return l_createElement_0(v27, v28, v29);
end));