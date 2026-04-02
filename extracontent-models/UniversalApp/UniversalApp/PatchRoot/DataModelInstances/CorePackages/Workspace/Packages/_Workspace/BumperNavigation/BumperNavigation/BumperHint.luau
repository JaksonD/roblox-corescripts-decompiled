local l_Parent_0 = script:FindFirstAncestor("BumperNavigation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Responsive);
local l_Icon_0 = v3.Icon;
local l_Enums_0 = v3.Enums;
BumperHint = function(v7) --[[ Line: 20 ]] --[[ Name: BumperHint ]]
    -- upvalues: v4 (copy), l_Enums_0 (copy), v2 (copy), v1 (copy), l_Icon_0 (copy)
    local v8 = v4.usePreferredInput() == v4.Input.Directional;
    local v9 = v7.isPersistent and true or v8;
    local v10 = {
        name = if v7.isLeftBumper then l_Enums_0.IconName.XboxLb else l_Enums_0.IconName.XboxRb, 
        size = l_Enums_0.IconSize.Large, 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Visible = v9
    };
    if v7.overrideIconProps then
        v10 = v2.Dictionary.join(v10, v7.overrideIconProps);
    end;
    if v7.squareSize then
        return v1.createElement("Frame", {
            Size = UDim2.fromOffset(v7.squareSize, v7.squareSize), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }, {
            Icon = v1.createElement(l_Icon_0, v10)
        });
    else
        return v1.createElement(l_Icon_0, v10);
    end;
end;
return BumperHint;