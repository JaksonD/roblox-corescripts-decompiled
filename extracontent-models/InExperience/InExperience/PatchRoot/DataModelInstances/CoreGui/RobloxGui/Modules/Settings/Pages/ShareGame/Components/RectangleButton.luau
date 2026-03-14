local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Settings.Theme);
local v4 = v1.PureComponent:extend("RectangleButton");
v4.defaultProps = {
    visible = true
};
v4.init = function(v5) --[[ Line: 12 ]] --[[ Name: init ]]
    v5.state = {
        isHovering = false
    };
end;
v4.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_size_0 = v6.props.size;
    local l_position_0 = v6.props.position;
    local l_anchorPoint_0 = v6.props.anchorPoint;
    local l_layoutOrder_0 = v6.props.layoutOrder;
    local l_zIndex_0 = v6.props.zIndex;
    local l_onClick_0 = v6.props.onClick;
    local l_visible_0 = v6.props.visible;
    local v14 = v6.props[v1.Children] or {};
    v14.Border = v1.createElement("UIStroke", {
        Color = v3.color("DefaultButtonStroke"), 
        Transparency = v3.transparency("DefaultButtonStroke"), 
        Thickness = v3.DefaultStokeThickness
    });
    v14.UICorner = v1.createElement("UICorner", {
        CornerRadius = v3.DefaultCornerRadius
    });
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Image = "", 
        Selectable = false, 
        Size = l_size_0, 
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        LayoutOrder = l_layoutOrder_0, 
        ZIndex = l_zIndex_0, 
        Visible = l_visible_0, 
        [v1.Event.InputBegan] = function() --[[ Line: 51 ]]
            -- upvalues: v6 (copy)
            v6:setState({
                isHovering = true
            });
        end, 
        [v1.Event.InputEnded] = function() --[[ Line: 54 ]]
            -- upvalues: v6 (copy)
            v6:setState({
                isHovering = false
            });
        end, 
        [v1.Event.Activated] = function() --[[ Line: 58 ]]
            -- upvalues: l_onClick_0 (copy), v6 (copy)
            if l_onClick_0 then
                v6:setState({
                    isHovering = false
                });
                l_onClick_0();
            end;
        end
    }, {
        ButtonBackgroundUIBlox = v1.createElement("ImageLabel", {
            BackgroundColor3 = v3.color(v6.state.isHovering and "DefaultButtonHover" or "DefaultButton"), 
            BackgroundTransparency = v3.transparency(v6.state.isHovering and "DefaultButtonHover" or "DefaultButton"), 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = l_zIndex_0
        }, v14)
    });
end;
return v4;