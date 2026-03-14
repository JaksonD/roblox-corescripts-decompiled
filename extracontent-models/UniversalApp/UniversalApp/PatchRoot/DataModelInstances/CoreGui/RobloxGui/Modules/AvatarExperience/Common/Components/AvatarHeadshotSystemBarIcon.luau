local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_withAnimation_0 = v4.Core.Animation.withAnimation;
local l_Placement_0 = v4.App.Navigation.Enum.Placement;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarHeadshotLocalIcon);
local v10 = {
    frequency = 3
};
local v11 = v2.PureComponent:extend("AvatarHeadshotSystemBarIcon");
v11.validateProps = v3.strictInterface({
    placement = l_Placement_0.isEnumValue, 
    hovered = v3.boolean, 
    selected = v3.boolean, 
    pressed = v3.boolean, 
    badgeValue = v3.optional(v3.union(v3.number, v3.string)), 
    size = v3.optional(v3.number)
});
v11.render = function(v12) --[[ Line: 36 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Placement_0 (copy), l_withAnimation_0 (copy), v2 (copy), v9 (copy), v10 (copy)
    local v13 = v12.props.size or 42;
    return l_withStyle_0(function(_) --[[ Line: 39 ]]
        -- upvalues: v12 (copy), l_Placement_0 (ref), l_withAnimation_0 (ref), v2 (ref), v9 (ref), v13 (copy), v10 (ref)
        local v15 = 0;
        local v16 = 0;
        if v12.props.hovered then
            if v12.props.placement == l_Placement_0.Bottom then
                v16 = -4;
            else
                v15 = 4;
            end;
        end;
        return l_withAnimation_0({
            hoverOffsetX = v15, 
            hoverOffsetY = v16
        }, function(v17) --[[ Line: 53 ]]
            -- upvalues: v2 (ref), v9 (ref), v13 (ref)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, math.floor(v17.hoverOffsetX + 0.5), 0.5, (math.floor(v17.hoverOffsetY + 0.5))), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(42, 42)
            }, {
                AvatarHeadshotLocalIcon = v2.createElement(v9, {
                    ZIndex = 2, 
                    Size = v13
                })
            });
        end, v10);
    end);
end;
return v11;