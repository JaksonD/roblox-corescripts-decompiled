local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = {
    itemPadding = UDim.new(0, 12), 
    numItemsShown = 1e999
};
return function(v4) --[[ Line: 19 ]] --[[ Name: EventsGridLayout ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v5 = v1.Dictionary.join(v3, v4);
    local v9 = v2.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: v5 (copy), v2 (ref)
        local v6 = {};
        for v7 = 1, v5.numItemsShown do
            local v8 = v5.items[v7];
            v6[v7] = v2.createElement("Frame", {
                LayoutOrder = v7, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Content = v8
            });
        end;
        return v6;
    end, {
        v5.items, 
        v5.numItemsShown
    });
    local v15 = v2.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v9 (copy), v2 (ref), v5 (copy)
        local v10 = {};
        for v11 = 1, #v9, 2 do
            local v12 = v9[v11];
            local v13 = v9[v11 + 1];
            local v14 = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = v11
            }, {
                Layout = v2.createElement("UIListLayout", {
                    Padding = v5.itemPadding, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }), 
                CellFrame1 = v2.createElement("Frame", {
                    Size = UDim2.new(0.5, -v5.itemPadding.Offset / 2, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    Item = v2.createElement(v2.Fragment, nil, v12)
                }), 
                CellFrame2 = v13 and v2.createElement("Frame", {
                    Size = UDim2.new(0.5, -v5.itemPadding.Offset / 2, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    Item = v2.createElement(v2.Fragment, nil, v13)
                })
            });
            v10["Row" .. math.ceil(v11 / 2)] = v14;
        end;
        return v10;
    end, {
        v5.items, 
        v9
    });
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            Padding = v5.itemPadding, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        Rows = v2.createElement(v2.Fragment, nil, v15)
    });
end;