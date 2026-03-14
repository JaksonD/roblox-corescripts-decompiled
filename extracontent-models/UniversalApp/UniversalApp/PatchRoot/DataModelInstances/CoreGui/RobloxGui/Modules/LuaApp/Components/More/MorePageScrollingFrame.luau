local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local l_FFlagAppIaScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway;
local v7 = v2.PureComponent:extend("MorePageScrollingFrame");
v7.defaultProps = {
    maxWidth = 1e999
};
v7.render = function(v8) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), v2 (copy), v5 (copy), v4 (copy)
    local l_Position_0 = v8.props.Position;
    local l_Size_0 = v8.props.Size;
    local l_maxWidth_0 = v8.props.maxWidth;
    local v12 = if l_FFlagAppIaScrollAway_0 then v8.props.topBarHeight else nil;
    return v2.createElement(v5.FitScrollingFrame, {
        Position = l_Position_0, 
        Size = l_Size_0, 
        CanvasSize = UDim2.new(1, 0, 0, 0), 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ScrollBarThickness = 0, 
        Selectable = false, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        fitFields = {
            CanvasSize = v5.FitAxis.Height
        }
    }, {
        v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = if l_FFlagAppIaScrollAway_0 and v4.getScrollAwayEnabled() then UDim2.new(0.5, 0, 0, v12) else UDim2.fromScale(0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(l_maxWidth_0, 1e999)
            }); 
            v2.createFragment(v8.props[v2.Children])
        })
    });
end;
if l_FFlagAppIaScrollAway_0 and v4.getScrollAwayEnabled() then
    v7 = v3.connect(function(v13, _) --[[ Line: 58 ]]
        return {
            topBarHeight = v13.TopBar.topBarHeight
        };
    end)(v7);
end;
return v7;