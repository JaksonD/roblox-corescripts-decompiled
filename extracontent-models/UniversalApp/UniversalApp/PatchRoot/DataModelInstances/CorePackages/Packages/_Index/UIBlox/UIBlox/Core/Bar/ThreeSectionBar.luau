local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.t);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.Roact);
local v5 = require(l_Parent_1.FitFrame);
local v6 = require(l_Parent_0.Utility.bindingValidator);
local v7 = v4.PureComponent:extend("ThreeSectionBar");
v7.validateProps = v2.strictInterface({
    BackgroundColor3 = v2.optional(v2.Color3), 
    BackgroundTransparency = v2.optional(v2.union(v2.number, v6(v2.number))), 
    barHeight = v2.optional(v2.number), 
    contentPaddingLeft = v2.optional(v2.UDim), 
    contentPaddingRight = v2.optional(v2.UDim), 
    estimatedCenterWidth = v2.optional(v2.number), 
    marginLeft = v2.optional(v2.number), 
    marginRight = v2.optional(v2.number), 
    onWidthChange = v2.optional(v2.callback), 
    renderCenter = v2.optional(v2.callback), 
    renderLeft = v2.optional(v2.callback), 
    renderRight = v2.optional(v2.callback), 
    automaticHeight = v2.optional(v2.boolean), 
    sectionSpacing = v2.optional(v2.number)
});
v7.defaultProps = {
    barHeight = 32, 
    BackgroundTransparency = 0, 
    marginLeft = 0, 
    marginRight = 0, 
    contentPaddingLeft = UDim.new(0, 0), 
    contentPaddingRight = UDim.new(0, 0), 
    renderLeft = nil, 
    renderRight = nil, 
    renderCenter = nil, 
    onWidthChange = function() --[[ Line: 46 ]] --[[ Name: onWidthChange ]]
        return nil;
    end, 
    estimatedCenterWidth = 1e999, 
    automaticHeight = false, 
    sectionSpacing = 8
};
v7.init = function(v8) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    local v9, v10 = v4.createBinding(0);
    v8.leftWidth = v9;
    v8.updateLeftWidth = v10;
    v9, v10 = v4.createBinding(0);
    v8.rightWidth = v9;
    v8.updateRightWidth = v10;
    v9, v10 = v4.createBinding(0);
    v8.fullWidth = v9;
    v8.updateFullWidth = v10;
    v8.computeCenteredSize = function(v11) --[[ Line: 60 ]]
        -- upvalues: v8 (copy)
        local v12 = v11[1];
        local v13 = v11[2];
        local v14 = v11[3];
        local v15 = math.max(v12, v13);
        local l_magnitude_0 = (Vector2.new(v14 / 2, 0) - Vector2.new(v15, 0)).magnitude;
        if not v8.props.renderLeft or not v8.props.renderRight then
            return UDim2.new(1, -v15, 1, 0);
        else
            return UDim2.new(0, l_magnitude_0 * 2, 1, 0);
        end;
    end;
    v8.computeBumpedPosition = function(v17) --[[ Line: 78 ]]
        local v18 = v17[1];
        local v19 = v17[2];
        local v20 = (v17[3] - v18 - v19) / 2;
        return UDim2.new(0, v18 + v20, 0.5, 0);
    end;
    v8.computeBumpedSize = function(v21) --[[ Line: 86 ]]
        local v22 = v21[1];
        local v23 = v21[2];
        return UDim2.new(1, -v22 - v23, 1, 0);
    end;
end;
v7.didUpdate = function(v24) --[[ Line: 93 ]] --[[ Name: didUpdate ]]
    if not v24.props.renderLeft then
        v24.updateLeftWidth(0);
    end;
    if not v24.props.renderRight then
        v24.updateRightWidth(0);
    end;
end;
v7.render = function(v25) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy)
    local v26 = Vector2.new(0.5, 0.5);
    local v27 = nil;
    v27 = if not v25.props.renderLeft and v25.props.renderRight then UDim2.fromScale(0, 0.5) else if not v25.props.renderLeft or v25.props.renderRight then UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(1, 0.5);
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v25.props.barHeight), 
        BackgroundColor3 = v25.props.BackgroundColor3, 
        BackgroundTransparency = v25.props.BackgroundTransparency, 
        BorderSizePixel = 0, 
        AutomaticSize = if v25.props.automaticHeight then Enum.AutomaticSize.Y else nil, 
        [v4.Change.AbsoluteSize] = function(v28) --[[ Line: 123 ]]
            -- upvalues: v25 (copy)
            v25.props.onWidthChange(v28.AbsoluteSize.X);
            v25.updateFullWidth(v28.AbsoluteSize.X);
        end
    }, {
        leftFrame = v25.props.renderLeft and v4.createElement(v5.FitFrameHorizontal, {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.fromScale(0, 0), 
            BackgroundTransparency = 1, 
            minimumSize = UDim.new(0, 200), 
            height = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            contentPadding = v25.props.contentPaddingLeft, 
            margin = {
                top = 0, 
                left = v25.props.marginLeft, 
                right = v25.props.sectionSpacing, 
                bottom = 0
            }, 
            [v4.Change.AbsoluteSize] = function(v29) --[[ Line: 144 ]]
                -- upvalues: v25 (copy)
                v25.updateLeftWidth(v29.AbsoluteSize.X);
            end
        }, {
            leftContent = v25.props.renderLeft(v3.Dictionary.join(v25.props, {
                [v4.Children] = {
                    sizeConstraint = v4.createElement("UISizeConstraint", {
                        MaxSize = v4.joinBindings({
                            v25.leftWidth, 
                            v25.rightWidth, 
                            v25.fullWidth
                        }):map(function(v30) --[[ Line: 153 ]]
                            -- upvalues: v25 (copy)
                            local _ = v30[1];
                            local v32 = v30[2];
                            local v33 = math.max(0, v30[3] - v32 - v25.props.marginLeft);
                            return Vector2.new(v33, 1e999);
                        end)
                    })
                }
            }))
        }), 
        centerFrame = v25.props.renderCenter and v4.createElement("Frame", {
            AnchorPoint = v26, 
            BackgroundTransparency = 1, 
            Position = v4.joinBindings({
                v25.leftWidth, 
                v25.rightWidth, 
                v25.fullWidth
            }):map(function(v34) --[[ Line: 169 ]]
                -- upvalues: v25 (copy), v27 (ref)
                if math.abs(v25.computeCenteredSize(v34).X.Offset) <= v25.props.estimatedCenterWidth then
                    return v25.computeBumpedPosition(v34);
                else
                    return v27;
                end;
            end), 
            Size = v4.joinBindings({
                v25.leftWidth, 
                v25.rightWidth, 
                v25.fullWidth
            }):map(function(v35) --[[ Line: 178 ]]
                -- upvalues: v25 (copy)
                local v36 = v25.computeCenteredSize(v35);
                if math.abs(v36.X.Offset) <= v25.props.estimatedCenterWidth then
                    return v25.computeBumpedSize(v35);
                else
                    return v36;
                end;
            end)
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = v25.props.renderLeft and UDim.new(0, 0) or UDim.new(0, v25.props.marginLeft), 
                PaddingRight = v25.props.renderRight and UDim.new(0, 0) or UDim.new(0, v25.props.marginRight)
            }), 
            ["$layout"] = v4.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            centerContent = v25.props.renderCenter(v25.props)
        }), 
        rightFrame = v25.props.renderRight and v4.createElement(v5.FitFrameHorizontal, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            minimumSize = UDim.new(0, 200), 
            height = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            contentPadding = v25.props.contentPaddingRight, 
            margin = {
                top = 0, 
                left = v25.props.sectionSpacing, 
                right = v25.props.marginRight, 
                bottom = 0
            }, 
            [v4.Change.AbsoluteSize] = function(v37) --[[ Line: 216 ]]
                -- upvalues: v25 (copy)
                v25.updateRightWidth(v37.AbsoluteSize.X);
            end
        }, {
            rightContent = v25.props.renderRight(v25.props)
        })
    });
end;
return v7;