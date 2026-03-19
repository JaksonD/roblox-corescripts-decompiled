local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_0.Core.Style.withStyle);
local v6 = require(script.Parent.BaseMenu);
local v7 = require(script.Parent.validateButtonProps);
local v8 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v9 = v3.PureComponent:extend("DropdownMenuList");
v9.validateProps = v4.strictInterface({
    buttonProps = v7, 
    zIndex = v4.optional(v4.integer), 
    open = v4.boolean, 
    showDropShadow = v4.boolean, 
    fixedListHeight = v4.optional(v4.number), 
    openPositionY = v4.UDim, 
    closeBackgroundVisible = v4.optional(v4.boolean), 
    screenSize = v4.Vector2, 
    onDismiss = v4.optional(v4.callback), 
    buttonSize = v4.UDim2, 
    menuListBackground = v4.optional(v8), 
    enableTokenOverride = v4.optional(v4.boolean), 
    selectionOrder = v4.optional(v4.number), 
    menuPositionFixed = v4.optional(v4.boolean)
});
v9.defaultProps = {
    zIndex = 2, 
    closeBackgroundVisible = false, 
    showDropShadow = false, 
    fixedListHeight = nil, 
    menuListBackground = nil, 
    enableTokenOverride = false, 
    menuPositionFixed = false
};
v9.init = function(v10) --[[ Line: 50 ]] --[[ Name: init ]]
    v10:setState({
        absolutePosition = Vector2.new(0, 0), 
        visible = false
    });
    v10.setAbsolutePosition = function(v11) --[[ Line: 56 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            absolutePosition = v11.AbsolutePosition
        });
    end;
    v10.dismissMenu = function() --[[ Line: 62 ]]
        -- upvalues: v10 (copy)
        if v10.state.visible then
            v10:setState({
                visible = false
            });
            v10.props.onDismiss();
        end;
    end;
end;
v9.render = function(v12) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_GuiService_0 (copy), v3 (copy), v6 (copy)
    return v5(function(v13) --[[ Line: 73 ]]
        -- upvalues: l_GuiService_0 (ref), v12 (copy), v3 (ref), v6 (ref)
        local l_l_GuiService_0_GuiInset_0, v15 = l_GuiService_0:GetGuiInset();
        local v16 = v12.state.absolutePosition + l_l_GuiService_0_GuiInset_0;
        local v17 = 0;
        local v18 = 1;
        local l_Y_0 = v12.props.buttonSize.Y;
        local l_X_0 = v12.props.buttonSize.X;
        if v12.state.absolutePosition.Y > v12.props.screenSize.Y / 2 then
            v17 = 1;
            v18 = -1;
            l_Y_0 = UDim.new(0, 0);
        end;
        local v21 = nil;
        v21 = if v18 == 1 then l_Y_0 + v12.props.openPositionY else l_Y_0 - v12.props.openPositionY;
        local v22 = UDim2.new(0, 0, v21.Scale, v21.Offset);
        if v12.props.screenSize.X < 640 and not v12.props.menuPositionFixed then
            v17 = 1;
            v22 = UDim2.new(-v12.props.buttonSize.X.Scale / 2, -v16.X + v12.props.screenSize.X / 2 - v12.props.buttonSize.X.Offset / 2, 0, v12.props.screenSize.Y - v16.Y - v15.Y - 24);
        end;
        local l_Transparency_0 = v13.Theme.Overlay.Transparency;
        if not v12.props.closeBackgroundVisible then
            l_Transparency_0 = 1;
        end;
        return v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            Visible = v12.state.visible, 
            ZIndex = v12.props.zIndex, 
            [v3.Change.AbsolutePosition] = v12.setAbsolutePosition
        }, {
            Background = v3.createElement("TextButton", {
                ZIndex = 1, 
                Text = "", 
                BorderSizePixel = 0, 
                BackgroundColor3 = v13.Theme.Overlay.Color, 
                BackgroundTransparency = l_Transparency_0, 
                AutoButtonColor = false, 
                Selectable = false, 
                Position = UDim2.fromOffset(-v16.X, -v16.Y), 
                Size = UDim2.fromOffset(v12.props.screenSize.X, v12.props.screenSize.Y), 
                [v3.Event.Activated] = v12.dismissMenu
            }), 
            PositionFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                Position = v22, 
                ZIndex = 2
            }, {
                BaseMenu = v3.createElement(v6, {
                    buttonProps = v12.props.buttonProps, 
                    showDropShadow = v12.props.showDropShadow, 
                    fixedListHeight = v12.props.fixedListHeight, 
                    width = l_X_0, 
                    position = UDim2.fromScale(0, 0), 
                    anchorPoint = Vector2.new(0, v17), 
                    background = v12.props.menuListBackground, 
                    enableTokenOverride = v12.props.enableTokenOverride, 
                    selectionOrder = v12.props.selectionOrder
                })
            })
        });
    end);
end;
v9.didMount = function(v24) --[[ Line: 155 ]] --[[ Name: didMount ]]
    if v24.props.open then
        v24:setState({
            visible = true
        });
    end;
end;
v9.didUpdate = function(v25, v26, _) --[[ Line: 163 ]] --[[ Name: didUpdate ]]
    if v25.props.open ~= v26.open then
        if v25.props.open then
            v25:setState({
                visible = true
            });
            return;
        else
            v25:setState({
                visible = false
            });
        end;
    end;
end;
return v9;