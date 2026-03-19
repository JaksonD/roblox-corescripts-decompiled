local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_Connection_0 = script.Parent.Parent.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v8 = v1.PureComponent:extend("IconButton");
v8.validateProps = v2.strictInterface({
    size = v2.UDim2, 
    position = v2.UDim2, 
    backgroundColor = v2.Color3, 
    icon = v2.union(v2.string, v2.table), 
    showBackground = v2.boolean, 
    onActivated = v2.optional(v2.callback)
});
v8.init = function(v9) --[[ Line: 28 ]] --[[ Name: init ]]
    v9.state = {
        isHovered = false, 
        isPressed = false
    };
end;
v8.render = function(v10) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy)
    return l_WithLayoutValues_0(function(v11) --[[ Line: 36 ]]
        -- upvalues: l_withStyle_0 (ref), v10 (copy), v1 (ref), l_ImageSetLabel_0 (ref)
        return l_withStyle_0(function(v12) --[[ Line: 37 ]]
            -- upvalues: v10 (ref), v1 (ref), v11 (copy), l_ImageSetLabel_0 (ref)
            local v13 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if v10.props.onActivated then
                if v10.state.isPressed then
                    v13 = v12.Theme.BackgroundOnPress;
                elseif v10.state.isHovered then
                    v13 = v12.Theme.BackgroundOnHover;
                end;
            end;
            return v1.createElement("TextButton", {
                Text = "", 
                BorderSizePixel = 0, 
                BackgroundTransparency = v10.props.showBackground and v11.IconButtonBackgroundTransparency or 1, 
                BackgroundColor3 = v10.props.backgroundColor, 
                Position = v10.props.position, 
                Size = v10.props.size, 
                [v1.Event.Activated] = v10.props.onActivated, 
                [v1.Event.MouseButton1Down] = function() --[[ Line: 61 ]]
                    -- upvalues: v10 (ref)
                    v10:setState({
                        isPressed = true
                    });
                end, 
                [v1.Event.MouseButton1Up] = function() --[[ Line: 66 ]]
                    -- upvalues: v10 (ref)
                    v10:setState({
                        isPressed = false
                    });
                end, 
                [v1.Event.MouseEnter] = function() --[[ Line: 72 ]]
                    -- upvalues: v10 (ref)
                    v10:setState({
                        isHovered = true
                    });
                end, 
                [v1.Event.MouseLeave] = function() --[[ Line: 78 ]]
                    -- upvalues: v10 (ref)
                    v10:setState({
                        isHovered = false, 
                        isPressed = false
                    });
                end
            }, {
                HoverBackground = v1.createElement("Frame", {
                    ZIndex = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v13.Transparency, 
                    BackgroundColor3 = v13.Color, 
                    BorderSizePixel = 0
                }), 
                ImageButton = v1.createElement(l_ImageSetLabel_0, {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, v11.DropDownIconSize, 0, v11.DropDownIconSize), 
                    Image = v10.props.icon, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                })
            });
        end);
    end);
end;
return v8;