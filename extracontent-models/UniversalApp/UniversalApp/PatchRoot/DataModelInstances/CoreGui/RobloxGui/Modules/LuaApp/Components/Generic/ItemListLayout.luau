local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = v3.PureComponent:extend("ItemListLayout");
local v6 = {
    [v4.FitAxis.Height] = UDim2.new(1, 0, 0, 0), 
    [v4.FitAxis.Width] = UDim2.new(0, 0, 1, 0), 
    [v4.FitAxis.Both] = UDim2.new(0, 0, 0, 0)
};
local function v12(v7) --[[ Line: 18 ]] --[[ Name: WrappedItem ]]
    -- upvalues: v3 (copy), v4 (copy)
    local l_layoutOrder_0 = v7.layoutOrder;
    local l_fitAxis_0 = v7.fitAxis;
    local l_size_0 = v7.size;
    local l_renderItem_0 = v7.renderItem;
    return v3.createElement(v4.FitFrame, {
        Size = l_size_0, 
        LayoutOrder = l_layoutOrder_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        fitAxis = l_fitAxis_0
    }, {
        RenderedItem = l_renderItem_0
    });
end;
v5.render = function(v13) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v2 (copy), v3 (copy), v12 (copy), v4 (copy)
    local v14 = v13.props.renderItemList or {};
    local l_fitAxis_1 = v13.props.fitAxis;
    local v16 = v13.props.size or v6[l_fitAxis_1];
    local v17 = v2.Dictionary.join(v13.props, {
        renderItemList = v2.None, 
        fitAxis = v2.None, 
        size = v2.None, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local v18 = {
        ListLayout = v3.createElement("UIListLayout", v17)
    };
    for v19, v20 in ipairs(v14) do
        v18["Item" .. v19] = v12({
            layoutOrder = v19, 
            fitAxis = l_fitAxis_1, 
            size = v16, 
            renderItem = v20
        });
    end;
    return v3.createElement(v4.FitFrame, {
        Size = v16, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        fitAxis = l_fitAxis_1
    }, v18);
end;
return v5;