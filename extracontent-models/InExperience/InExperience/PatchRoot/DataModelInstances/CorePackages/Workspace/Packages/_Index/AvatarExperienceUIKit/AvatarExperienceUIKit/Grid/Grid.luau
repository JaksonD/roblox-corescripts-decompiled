local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = game:DefineFastFlag("AXDebugGridShouldErrorOnInvalidRowCount", false);
local function v8(v4) --[[ Line: 21 ]] --[[ Name: GridRow ]]
    -- upvalues: v1 (copy)
    local v5 = {
        GridRowLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v6, v7 in v4.items do
        v5[("item-%*-%*"):format(v4.getItemId(v7), v6)] = v1.createElement("Frame", {
            Size = UDim2.new(UDim.new(1 / v4.itemsPerRow, 0), UDim.new(0, 0)), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v6
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v4.gapHorizontal / 2), 
                PaddingRight = UDim.new(0, v4.gapHorizontal / 2)
            }), 
            Content = v4.renderItem({
                item = v7, 
                index = (v4.rowIndex - 1) * v4.itemsPerRow + v6, 
                gridInformation = {
                    row = v4.rowIndex, 
                    column = (v6 - 1) % v4.itemsPerRow + 1
                }
            })
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v4.LayoutOrder
    }, v5);
end;
return (v1.forwardRef(function(v9, v10) --[[ Line: 80 ]]
    -- upvalues: v3 (copy), l_mutedError_0 (copy), v1 (copy), v8 (copy)
    local v11 = v9.itemsPerRow <= 0 and 1 or v9.itemsPerRow;
    if v3 and v9.itemsPerRow <= 0 then
        l_mutedError_0((("itemsPerRow must be a positive number greater than 0, received %*"):format(v11)));
    end;
    local v12 = v9.gapVertical or 0;
    local v13 = v9.gapHorizontal or 0;
    local v14 = math.ceil(#v9.items / v11);
    local v15 = {
        GridLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v12)
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, -v13 / 2), 
            PaddingRight = UDim.new(0, -v13 / 2)
        })
    };
    for v16 = 1, v14 do
        local v17 = (v16 - 1) * v11 + 1;
        local v18 = {};
        table.move(v9.items, v17, v17 + v11 - 1, v17, v18);
        v15["row-" .. tostring(v16)] = v1.createElement(v8, {
            items = v18, 
            itemsPerRow = v11, 
            renderItem = v9.renderItem, 
            getItemId = v9.getItemId, 
            LayoutOrder = v16, 
            gapHorizontal = v13, 
            rowIndex = v16
        });
    end;
    return v1.createElement("Frame", {
        Size = v9.Size or UDim2.fromScale(1, 1), 
        AutomaticSize = v9.AutomaticSize, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v9.LayoutOrder, 
        ref = v10
    }, v15);
end));