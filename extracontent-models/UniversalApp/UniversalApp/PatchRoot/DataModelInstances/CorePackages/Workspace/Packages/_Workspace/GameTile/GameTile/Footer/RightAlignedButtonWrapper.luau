local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    if not v2.Button then
        return v2.Content;
    else
        return v1.createElement(v1.Fragment, nil, {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = v2.Padding
            }), 
            FooterContentWrapper = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = -1
            }, {
                v1.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Shrink
                }); 
                Content = v2.Content
            }), 
            Button = v2.Button
        });
    end;
end;