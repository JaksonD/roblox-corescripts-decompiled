local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_DefaultMetricsGridView_0 = v4.App.Grid.DefaultMetricsGridView;
local l_GridMetrics_0 = v4.App.Grid.GridMetrics;
local l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v12 = v3.PureComponent:extend("LoadableGridView");
v12.validateProps = v5.strictInterface({
    getItemMetrics = v5.callback, 
    items = v5.optional(v5.table), 
    totalNumItems = v5.optional(v5.number), 
    renderItem = v5.callback, 
    getItemHeight = v5.callback, 
    windowHeight = v5.optional(v5.number), 
    LayoutOrder = v5.optional(v5.number), 
    onNumItemsPerRowChanged = v5.optional(v5.callback), 
    onAbsoluteSizeChanged = v5.optional(v5.callback), 
    NextSelectionDown = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    forwardRef = v5.optional(v5.table), 
    onFocusGained = v5.optional(v5.callback), 
    restorePreviousChildFocus = v5.optional(v5.boolean)
});
v12.defaultProps = {
    getItemMetrics = l_GridMetrics_0.getSmallMetrics
};
v12.render = function(v13) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_DefaultMetricsGridView_0 (copy), v7 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy)
    local l_items_0 = v13.props.items;
    local l_totalNumItems_0 = v13.props.totalNumItems;
    local l_LayoutOrder_0 = v13.props.LayoutOrder;
    local l_getItemHeight_0 = v13.props.getItemHeight;
    local l_windowHeight_0 = v13.props.windowHeight;
    local l_getItemMetrics_0 = v13.props.getItemMetrics;
    if not l_items_0 then
        l_items_0 = {};
        for v20 = 1, l_totalNumItems_0 do
            l_items_0[v20] = {};
        end;
    end;
    local l_forwardRef_0 = v13.props.forwardRef;
    local v22 = v3.createElement(l_DefaultMetricsGridView_0, {
        renderItem = v13.props.renderItem, 
        windowHeight = l_windowHeight_0, 
        getItemHeight = l_getItemHeight_0, 
        getItemMetrics = l_getItemMetrics_0, 
        itemPadding = Vector2.new(v7.LoadableGridViewCellPadding, v7.LoadableGridViewCellPadding), 
        items = l_items_0, 
        maxHeight = 1e999, 
        LayoutOrder = l_LayoutOrder_0, 
        NextSelectionUp = v13.props.NextSelectionUp, 
        NextSelectionDown = v13.props.NextSelectionDown, 
        NextSelectionRight = v13.props.NextSelectionRight, 
        NextSelectionLeft = v13.props.NextSelectionLeft, 
        [v3.Ref] = l_forwardRef_0, 
        defaultChildIndex = 1, 
        restorePreviousChildFocus = v13.props.restorePreviousChildFocus, 
        onFocusGained = v13.props.onFocusGained, 
        onNumItemsPerRowChanged = v13.props.onNumItemsPerRowChanged, 
        isRoactGamepadEnabled = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
    });
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        SelectionGroup = l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 and true or nil, 
        [v3.Change.AbsoluteSize] = v13.props.onAbsoluteSizeChanged
    }, {
        DefaultMetricsGridView = v22
    });
end;
return v3.forwardRef(function(v23, v24) --[[ Line: 97 ]]
    -- upvalues: v3 (copy), v12 (copy), v2 (copy)
    return v3.createElement(v12, v2.Dictionary.join(v23, {
        forwardRef = v24
    }));
end);