local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Cryo);
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.ReactOtter);
local _ = require(l_Parent_0.Style.StyleTypes);
local v7 = require(l_Parent_1.Core.Style.useStyle);
local v8 = require(l_Parent_0.Navigation.Enum.NavigationRailAlignment);
local v9 = {
    visible = true, 
    isVisible = true, 
    zIndex = 1, 
    animated = false, 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }
};
return function(v10) --[[ Line: 64 ]] --[[ Name: NavigationRail ]]
    -- upvalues: v3 (copy), v9 (copy), v7 (copy), v8 (copy), v4 (copy), v5 (copy)
    assert(#v10.items > 0, "At least one item should be present!");
    local v11 = v3.Dictionary.join(v9, v10);
    local v12 = v7();
    local v13 = if v11.paddings and v11.paddings.Top then v11.paddings.Top else v12.Tokens.Global.Space_75;
    local v14 = if v11.paddings and v11.paddings.Bottom then v11.paddings.Bottom else v12.Tokens.Global.Space_75;
    local v15 = if v11.paddings and v11.paddings.Left then v11.paddings.Left else v12.Tokens.Global.Space_75;
    local v16 = if v11.paddings and v11.paddings.Right then v11.paddings.Right else v12.Tokens.Global.Space_75;
    local v17 = nil;
    if v11.alignment == v8.Justified then
        v17 = Enum.VerticalAlignment.Top;
    elseif v11.alignment == v8.Centered then
        v17 = Enum.VerticalAlignment.Center;
    else
        error("NavigationRail alignment type is incorrect!");
    end;
    local v18, v19 = v4.useState(if v11.size then v11.size.X.Offset else 0);
    local v21 = v4.useCallback(function(v20) --[[ Line: 90 ]]
        -- upvalues: v11 (copy), v19 (copy)
        if v11.animated then
            v19(v20.AbsoluteSize.X);
        end;
    end, {
        v11.animated
    });
    local v22, v23 = v5.useAnimatedBinding((not v11.animated or v11.isVisible) and 0 or -v18);
    v4.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v11 (copy), v23 (copy), v5 (ref), v18 (copy)
        if v11.animated then
            if v11.isVisible then
                v23(v5.spring(0, v11.animationConfig));
            else
                v23(v5.spring(-v18, v11.animationConfig));
            end;
        end;
        return nil;
    end, {
        v11.animated, 
        v11.isVisible, 
        v18, 
        v11.animationConfig
    });
    local v24 = {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = v11.spacing, 
            SortOrder = Enum.SortOrder.Name
        })
    };
    local v25 = {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = v11.spacing, 
            SortOrder = Enum.SortOrder.Name
        })
    };
    local v26 = false;
    for v27, v28 in ipairs(v11.items) do
        local v29 = v27 == v11.selection;
        if v28.isSecondary then
            v26 = true;
            v25[tostring(v27)] = v11.renderItem(v28, v29);
        else
            v24[tostring(v27)] = v11.renderItem(v28, v29);
        end;
    end;
    local v31 = v22:map(function(v30) --[[ Line: 136 ]]
        return UDim2.new(0, math.floor(v30 + 0.5), 0, 0);
    end);
    if v11.leadingComponent then
        v24["0"] = v11.leadingComponent;
    end;
    if v11.trailingComponent then
        v24[":"] = v11.trailingComponent;
    end;
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        ClipsDescendants = v11.clipsDescendants, 
        Size = v11.size, 
        Position = v11.position, 
        Visible = v11.visible, 
        ZIndex = v11.zIndex, 
        [v4.Change.AbsoluteSize] = v21
    }, {
        AnimatedFrame = v4.createElement("Frame", {
            Position = v31, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = if v11.backgroundColor then v11.backgroundColor.Color else v12.Theme.NavigationBar.Color, 
            BackgroundTransparency = if v11.backgroundColor then v11.backgroundColor.Transparency else v12.Theme.NavigationBar.Transparency
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v13), 
                PaddingBottom = UDim.new(0, v14), 
                PaddingLeft = UDim.new(0, v15), 
                PaddingRight = UDim.new(0, v16)
            }), 
            MainFrame = v4.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = v17, 
                    Padding = UDim.new(0, v12.Tokens.Global.Space_200)
                }), 
                PrimaryItems = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, v24), 
                CenteredSecondaryItems = if v26 and v11.alignment == v8.Centered then v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, v25) else nil
            }), 
            JustifiedSecondaryItems = if v26 and v11.alignment == v8.Justified then v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, v25) else nil
        })
    });
end;