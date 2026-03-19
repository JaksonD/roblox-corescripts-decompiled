local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v3 = require(script.Parent.InfoCarouselCell);
return function(v4) --[[ Line: 18 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), v3 (copy)
    local v5 = l_useDesignTokens_0();
    local v6 = v4.padding or v5.Global.Space_300;
    local v7, v8 = v1.useBinding(0);
    local function v10(v9) --[[ Line: 24 ]]
        -- upvalues: v8 (copy)
        v8(v9.AbsoluteSize.Y);
    end;
    local v11 = {};
    for v12, v13 in v4.data do
        v11["Cell" .. v12] = v1.createElement(v3, {
            LayoutOrder = v12 * 2, 
            headerText = v13.headerText, 
            bodyText = v13.bodyText, 
            icon = v13.icon, 
            iconSize = v4.iconSize, 
            onActivated = v13.onActivated, 
            padding = v4.cellPadding
        });
        if v12 < #v4.data then
            v11["Divider" .. v12] = v1.createElement("Frame", {
                LayoutOrder = v12 * 2 + 1, 
                Size = v7:map(function(v14) --[[ Line: 42 ]]
                    return UDim2.fromOffset(1, v14 / 2);
                end), 
                BorderColor3 = v5.Semantic.Color.Common.Divider.Color3, 
                BackgroundTransparency = v5.Semantic.Color.Common.Divider.Transparency, 
                BorderSizePixel = 0
            });
        end;
    end;
    return v1.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = v4.LayoutOrder, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ScrollBarThickness = 0, 
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable, 
        [v1.Change.AbsoluteSize] = v10
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v6)
        }), 
        Cells = v1.createElement(v1.Fragment, {}, v11)
    });
end;