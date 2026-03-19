local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactIs);
local v3 = require(l_Parent_0.Foundation);
local l_ControlState_0 = v3.Enums.ControlState;
local l_IconSize_0 = v3.Enums.IconSize;
local l_Icon_0 = v3.Icon;
local l_View_0 = v3.View;
local l_useTokens_0 = v3.Hooks.useTokens;
local function v13(v9) --[[ Line: 41 ]] --[[ Name: ScrollButton ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_ControlState_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v10 = l_useTokens_0();
    local v12 = v1.useCallback(function(v11) --[[ Line: 43 ]]
        -- upvalues: l_ControlState_0 (ref), v9 (copy)
        if v11 == l_ControlState_0.Hover or v11 == l_ControlState_0.Pressed then
            if v9.onScrollButtonEnter then
                v9.onScrollButtonEnter();
                return;
            end;
        elseif v9.onScrollButtonLeave then
            v9.onScrollButtonLeave();
        end;
    end, {
        v9.onScrollButtonEnter, 
        v9.onScrollButtonLeave
    });
    return v1.createElement(l_View_0, {
        AnchorPoint = v9.AnchorPoint, 
        Position = v9.Position, 
        Visible = v9.Visible, 
        onStateChanged = v12, 
        onActivated = v9.onActivated, 
        tag = "size-1000 radius-circle bg-over-media-100"
    }, {
        Icon = v1.createElement(l_Icon_0, {
            name = v9.icon, 
            size = l_IconSize_0.Large, 
            style = v10.Color.Content.Emphasis, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5)
        })
    });
end;
return function(v14) --[[ Line: 73 ]] --[[ Name: CarouselScrollButtons ]]
    -- upvalues: v1 (copy), v2 (copy), v13 (copy)
    local v15 = v14.buttonOffsetFromEdge or 0;
    local v16, v17 = v1.useState(false);
    local v18 = nil;
    v18 = if v2.isBinding(v14.leftScrollingEnabled) then v14.leftScrollingEnabled:map(function(v19) --[[ Line: 81 ]]
        -- upvalues: v16 (copy)
        return v16 and v19;
    end) else v16 and v14.leftScrollingEnabled;
    local v20 = nil;
    v20 = if v2.isBinding(v14.rightScrollingEnabled) then v14.rightScrollingEnabled:map(function(v21) --[[ Line: 92 ]]
        -- upvalues: v16 (copy)
        return v16 and v21;
    end) else v16 and v14.rightScrollingEnabled;
    local v22 = v1.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v17 (copy)
        v17(true);
    end, {});
    local v23 = v1.useCallback(function() --[[ Line: 103 ]]
        -- upvalues: v17 (copy)
        v17(false);
    end, {});
    return v1.createElement("Frame", {
        AnchorPoint = v14.AnchorPoint, 
        Position = v14.Position, 
        Size = v14.Size, 
        ZIndex = v14.ZIndex or 10, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v1.Event.MouseEnter] = v22, 
        [v1.Event.MouseLeave] = v23
    }, {
        LeftScrollButton = v1.createElement(v13, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v15, 0.5, 0), 
            Visible = v18, 
            icon = "chevron-large-left", 
            onScrollButtonEnter = v14.onScrollButtonEnter, 
            onScrollButtonLeave = v14.onScrollButtonLeave, 
            onActivated = v14.handleScrollLeft
        }), 
        RightScrollButton = v1.createElement(v13, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, -v15, 0.5, 0), 
            Visible = v20, 
            icon = "chevron-large-right", 
            onScrollButtonEnter = v14.onScrollButtonEnter, 
            onScrollButtonLeave = v14.onScrollButtonLeave, 
            onActivated = v14.handleScrollRight
        })
    });
end;