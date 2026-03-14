local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Otter);
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v8 = require(script.Parent.BaseMenu);
local v9 = require(script.Parent.MenuDirection);
local v10 = require(script.Parent.validateButtonProps);
local v11 = require(script.Parent.validateMotorOptionProps);
local v12 = {
    frequency = 4, 
    dampingRatio = 1
};
local v13 = {
    frequency = 2.6, 
    dampingRatio = 1
};
local v14 = {
    open = {
        targetValue = 1, 
        springParams = v12
    }, 
    close = {
        targetValue = 0, 
        springParams = v13
    }
};
local v15 = v3.PureComponent:extend("ContextualMenu");
v15.validateProps = v4.strictInterface({
    buttonProps = v10, 
    zIndex = v4.optional(v4.integer), 
    open = v4.boolean, 
    menuDirection = v4.optional(v9.isEnumValue), 
    openPositionY = v4.UDim, 
    closeBackgroundVisible = v4.optional(v4.boolean), 
    screenSize = v4.Vector2, 
    stayOnActivated = v4.optional(v4.boolean), 
    onDismiss = v4.optional(v4.callback), 
    setFrameRef = v4.optional(v4.union(v4.callback, v4.table)), 
    setFirstItemRef = v4.optional(v4.union(v4.callback, v4.table)), 
    motorOverrideOptions = v4.optional(v4.strictInterface({
        motorCallback = v4.callback, 
        open = v11, 
        close = v11
    })), 
    horizontalAlignment = v4.optional(v4.enum(Enum.HorizontalAlignment)), 
    openPositionX = v4.optional(v4.UDim), 
    contextMenuWidthOverride = v4.optional(v4.UDim), 
    anchorPointOverride = v4.optional(v4.Vector2), 
    topElementRounded = v4.optional(v4.boolean), 
    bottomElementRounded = v4.optional(v4.boolean), 
    isElementBackgroundVisible = v4.optional(v4.boolean), 
    isElementDividerVisible = v4.optional(v4.boolean), 
    elementHeight = v4.optional(v4.number), 
    borderCornerRadius = v4.optional(v4.integer), 
    background = v4.optional(v7), 
    enableTokenOverride = v4.optional(v4.boolean), 
    renderHeader = v4.optional(v4.callback), 
    headerHeight = v4.optional(v4.number), 
    showDropShadow = v4.optional(v4.boolean), 
    isRoactGamepadEnabled = v4.optional(v4.boolean)
});
v15.defaultProps = {
    menuDirection = v9.Up, 
    zIndex = 2, 
    closeBackgroundVisible = true, 
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    openPositionX = UDim.new(0, 0)
};
v15.init = function(v16) --[[ Line: 118 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v5 (copy), v14 (copy)
    v16.wasDismissed = false;
    local v17, v18 = v3.createBinding(0);
    v16.positionPercentBinding = v17;
    v16.positionPercentBindingUpdate = v18;
    v16.motor = v5.createSingleMotor(0);
    v16.motor:onStep(v16.positionPercentBindingUpdate);
    v16.motor:onComplete(function() --[[ Line: 125 ]]
        -- upvalues: v16 (copy)
        if v16.wasDismissed then
            v16.wasDismissed = false;
            if v16.props.onDismiss then
                v16.props.onDismiss();
            end;
        end;
    end);
    v16.motorType = v5.spring;
    v16.motorOptions = v14;
    if v16.props.motorOverrideOptions then
        v16.motorType = v16.props.motorOverrideOptions.motorCallback;
        v16.motorOptions = v16.props.motorOverrideOptions;
    end;
    v16.state = {
        absoluteSize = Vector2.new(0, 0), 
        absolutePosition = Vector2.new(0, 0)
    };
    v16.visibleBinding = v16.positionPercentBinding:map(function(v19) --[[ Line: 145 ]]
        return v19 ~= 0;
    end);
end;
v15.render = function(v20) --[[ Line: 150 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v9 (copy), l_GuiService_0 (copy), v3 (copy), v8 (copy)
    return v6(function(v21) --[[ Line: 151 ]]
        -- upvalues: v20 (copy), v9 (ref), l_GuiService_0 (ref), v3 (ref), v8 (ref)
        local v22 = 0.5;
        local v23 = UDim.new(1, -24);
        local v24 = UDim.new(0, 0);
        local v25 = v20.state.absoluteSize.X > 640;
        if v25 then
            v23 = UDim.new(0, 300);
            v24 = v20.props.openPositionX;
            if v20.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
                v22 = 0;
            elseif v20.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
                v22 = 1;
            end;
        end;
        local v26 = 0;
        if v20.props.menuDirection == v9.Up then
            v26 = 1;
        end;
        local l_Transparency_0 = v21.Theme.Overlay.Transparency;
        if not v20.props.closeBackgroundVisible then
            l_Transparency_0 = 1;
        end;
        v23 = v20.props.contextMenuWidthOverride or v23;
        local v28 = v20.props.anchorPointOverride or Vector2.new(v22, v26);
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        local v31 = v20.state.absolutePosition + l_l_GuiService_0_GuiInset_0;
        return v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Visible = v20.visibleBinding, 
            ZIndex = v20.props.zIndex, 
            [v3.Change.AbsoluteSize] = function(v32) --[[ Line: 192 ]]
                -- upvalues: v20 (ref)
                v20:setState({
                    absoluteSize = v32.AbsoluteSize
                });
            end, 
            [v3.Change.AbsolutePosition] = function(v33) --[[ Line: 198 ]]
                -- upvalues: v20 (ref)
                v20:setState({
                    absolutePosition = v33.AbsolutePosition
                });
            end
        }, {
            Background = v3.createElement("TextButton", {
                ZIndex = 1, 
                Text = "", 
                BorderSizePixel = 0, 
                BackgroundColor3 = v21.Theme.Overlay.Color, 
                BackgroundTransparency = l_Transparency_0, 
                AutoButtonColor = false, 
                Selectable = false, 
                Position = UDim2.fromOffset(-v31.X, -v31.Y), 
                Size = UDim2.fromOffset(v20.props.screenSize.X, v20.props.screenSize.Y), 
                [v3.Event.Activated] = function() --[[ Line: 216 ]]
                    -- upvalues: v20 (ref)
                    if not v20.wasDismissed then
                        v20.wasDismissed = true;
                        v20.motor:setGoal(v20.motorType(v20.motorOptions.close.targetValue, v20.motorOptions.close.springParams));
                    end;
                end
            }), 
            PositionFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.new(v24.Scale, v24.Offset, v20.props.openPositionY.Scale, v20.props.openPositionY.Offset), 
                ZIndex = 2
            }, {
                BaseMenu = v3.createElement(v8, {
                    buttonProps = v20.props.buttonProps, 
                    setFirstItemRef = v20.props.setFirstItemRef, 
                    setFrameRef = v20.props.setFrameRef, 
                    width = v23, 
                    position = v20.positionPercentBinding:map(function(v34) --[[ Line: 243 ]]
                        -- upvalues: v25 (copy), v20 (ref), v9 (ref)
                        local v35 = 0.5;
                        if v25 or v20.props.anchorPointOverride then
                            if v20.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
                                v35 = 0;
                            elseif v20.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
                                v35 = 1;
                            end;
                        end;
                        if v20.props.menuDirection == v9.Down then
                            return UDim2.fromScale(v35, v34 - 1);
                        else
                            return UDim2.fromScale(v35, 1 - v34);
                        end;
                    end), 
                    anchorPoint = v28, 
                    topElementRounded = v20.props.topElementRounded, 
                    bottomElementRounded = v20.props.bottomElementRounded, 
                    isElementBackgroundVisible = v20.props.isElementBackgroundVisible, 
                    isElementDividerVisible = v20.props.isElementDividerVisible, 
                    elementHeight = v20.props.elementHeight, 
                    borderCornerRadius = v20.props.borderCornerRadius, 
                    background = v20.props.background, 
                    enableTokenOverride = v20.props.enableTokenOverride, 
                    renderHeader = v20.props.renderHeader, 
                    headerHeight = v20.props.headerHeight, 
                    showDropShadow = v20.props.showDropShadow, 
                    isRoactGamepadEnabled = v20.props.isRoactGamepadEnabled
                })
            })
        });
    end);
end;
v15.didMount = function(v36) --[[ Line: 278 ]] --[[ Name: didMount ]]
    if v36.props.open then
        v36.wasDismissed = false;
        v36.motor:setGoal(v36.motorType(v36.motorOptions.open.targetValue, v36.motorOptions.open.springParams));
    end;
end;
v15.didUpdate = function(v37, v38, _) --[[ Line: 285 ]] --[[ Name: didUpdate ]]
    if v37.props.open ~= v38.open then
        if v37.props.open then
            v37.wasDismissed = false;
            v37.motor:setGoal(v37.motorType(v37.motorOptions.open.targetValue, v37.motorOptions.open.springParams));
            return;
        else
            v37.motor:setGoal(v37.motorType(v37.motorOptions.close.targetValue, v37.motorOptions.close.springParams));
        end;
    end;
end;
v15.willUnmount = function(v40) --[[ Line: 298 ]] --[[ Name: willUnmount ]]
    v40.motor:destroy();
end;
return v15;