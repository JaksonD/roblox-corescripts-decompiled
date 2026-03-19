local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Cryo);
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.ReactOtter);
local _ = require(l_Parent_0.Style.StyleTypes);
local v7 = require(l_Parent_1.Core.Style.useStyle);
local v8 = require(l_Parent_0.Navigation.Enum.NavigationBarAlignment);
local v9 = {
    visible = true, 
    zIndex = 1, 
    animated = false, 
    maxWidth = 600, 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 3
    }
};
return function(v10) --[[ Line: 68 ]] --[[ Name: NavigationBar ]]
    -- upvalues: v3 (copy), v9 (copy), v7 (copy), v4 (copy), v8 (copy), v5 (copy)
    assert(#v10.items > 0, "At least one item should be present!");
    local v11 = v3.Dictionary.join(v9, v10);
    local v12 = v7();
    local v13, v14 = v4.useState(if v11.size then v11.size.Y.Offset else 0);
    local v15 = if v11.paddings and v11.paddings.Top then v11.paddings.Top else v12.Tokens.Global.Space_75;
    local v16 = if v11.paddings and v11.paddings.Bottom then v11.paddings.Bottom else v12.Tokens.Global.Space_75;
    local v17 = if v11.paddings and v11.paddings.Left then v11.paddings.Left else v12.Tokens.Global.Space_75;
    local v18 = if v11.paddings and v11.paddings.Right then v11.paddings.Right else v12.Tokens.Global.Space_75;
    local v19 = nil;
    local v20 = nil;
    if v11.alignment == v8.Left then
        v19 = Enum.HorizontalAlignment.Left;
    elseif v11.alignment == v8.EvenlyDistributed then
        v20 = Enum.UIFlexAlignment.SpaceAround;
        v19 = Enum.HorizontalAlignment.Center;
    else
        error("NavigationBar Alignment type is incorrect!");
    end;
    local v22 = v4.useCallback(function(v21) --[[ Line: 96 ]]
        -- upvalues: v11 (copy), v14 (copy)
        if v11.visibility or v11.animated then
            v14(v21.AbsoluteSize.Y);
        end;
    end, {
        v11.visibility, 
        v11.animated
    });
    local v23, v24 = v5.useAnimatedBinding(0);
    v4.useEffect(function() --[[ Line: 102 ]]
        -- upvalues: v11 (copy), v24 (copy), v5 (ref), v13 (copy)
        if not v11.visibility and v11.animated then
            if v11.isVisible then
                v24(v5.spring(0, v11.animationConfig));
            else
                v24(v5.spring(v13, v11.animationConfig));
            end;
        end;
        return nil;
    end, {
        v11.visibility, 
        v11.animated, 
        v11.isVisible, 
        v13, 
        v11.animationConfig
    });
    local v25 = {
        Constraint = if v11.maxWidth ~= nil then v4.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v11.maxWidth, 1e999)
        }) else nil, 
        UIPadding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v15), 
            PaddingBottom = UDim.new(0, v16), 
            PaddingLeft = UDim.new(0, v17), 
            PaddingRight = UDim.new(0, v18)
        }), 
        Layout = v4.createElement("UIListLayout", {
            Padding = v11.spacing, 
            SortOrder = Enum.SortOrder.Name, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalFlex = v20, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        })
    };
    for v26, v27 in ipairs(v11.items) do
        local v28 = v26 == v11.selection;
        v25[tostring(v26)] = v11.renderItem(v27, v28);
    end;
    local v32 = if v11.visibility then v11.visibility:map(function(v29) --[[ Line: 140 ]]
        -- upvalues: v13 (copy)
        local v30 = (1 - v29) * v13;
        return UDim2.new(0, 0, 0, (math.floor(v30 + 0.5)));
    end) else v23:map(function(v31) --[[ Line: 144 ]]
        return UDim2.new(0, 0, 0, (math.floor(v31 + 0.5)));
    end);
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        ClipsDescendants = v11.clipsDescendants, 
        Size = v11.size, 
        AutomaticSize = v11.automaticSize, 
        Position = v11.position, 
        Visible = v11.visible, 
        [v4.Change.AbsoluteSize] = v22
    }, {
        AnimatedFrame = v4.createElement("Frame", {
            Active = v11.active, 
            Position = v32, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            AutomaticSize = v11.automaticSize, 
            BackgroundColor3 = if v11.backgroundColor then v11.backgroundColor.Color else v12.Theme.NavigationBar.Color, 
            BackgroundTransparency = if v11.backgroundColor then v11.backgroundColor.Transparency else v12.Theme.NavigationBar.Transparency, 
            Selectable = false, 
            Visible = v11.visible, 
            ZIndex = v11.zIndex
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = v19
            }), 
            InnerFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                AutomaticSize = v11.automaticSize
            }, v25)
        })
    });
end;