local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = v3.PureComponent:extend("MoreGrid");
v4.defaultProps = {
    layoutOrder = 1, 
    size = UDim2.fromScale(1, 1)
};
v4.validateProps = v1.strictInterface({
    gridCellPadding = v1.integer, 
    gridCellSize = v1.integer, 
    items = v1.table, 
    layoutOrder = v1.optional(v1.integer), 
    renderItem = v1.callback, 
    size = v1.optional(v1.UDim2)
});
v4.render = function(v5) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    local l_gridCellPadding_0 = v5.props.gridCellPadding;
    local l_gridCellSize_0 = v5.props.gridCellSize;
    local l_items_0 = v5.props.items;
    local l_layoutOrder_0 = v5.props.layoutOrder;
    local l_renderItem_0 = v5.props.renderItem;
    local l_size_0 = v5.props.size;
    local v12 = UDim2.fromOffset(l_gridCellPadding_0, l_gridCellPadding_0);
    local v13 = UDim2.fromOffset(l_gridCellSize_0, l_gridCellSize_0);
    local v14 = {};
    for v15, v16 in ipairs(l_items_0) do
        v14[v15] = l_renderItem_0(v16, v15);
    end;
    v14.GridLayout = v3.createElement("UIGridLayout", {
        CellPadding = v12, 
        CellSize = v13, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        Size = l_size_0
    }, v14);
end;
return v4;