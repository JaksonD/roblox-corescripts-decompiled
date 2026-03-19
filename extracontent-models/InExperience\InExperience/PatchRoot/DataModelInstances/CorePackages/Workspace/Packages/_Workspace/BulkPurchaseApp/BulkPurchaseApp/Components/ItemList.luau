local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v3 = require(script.Parent.Item);
return function(v4) --[[ Line: 20 ]] --[[ Name: ItemList ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), v3 (copy)
    local v5 = l_useDesignTokens_0();
    local v6 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, v5.Global.Space_150)
        })
    };
    for v7, v8 in v4.items do
        v6[v8.id] = v1.createElement(v3, {
            name = v8.name, 
            image = v8.image, 
            endSlot = v8.endSlot, 
            LayoutOrder = v7
        });
    end;
    return v1.createElement("Frame", {
        LayoutOrder = v4.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v6);
end;