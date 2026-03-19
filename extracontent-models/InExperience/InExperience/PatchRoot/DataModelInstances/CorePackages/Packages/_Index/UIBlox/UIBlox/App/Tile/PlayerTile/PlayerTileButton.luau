local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_script_FirstAncestor_0.Button.Button);
local v7 = require(l_script_FirstAncestor_0.Button.Enum.ButtonType);
local v8 = require(l_Core_0.Control.Enum.ControlState);
local v9 = v5.PureComponent:extend("PlayerTileButton");
v9.validateProps = v4.strictInterface({
    buttonHeight = v4.optional(v4.number), 
    buttonWidth = v4.optional(v4.number), 
    outerButtonPadding = v4.optional(v4.number), 
    icon = v4.union(v4.string, v4.table), 
    onActivated = v4.optional(v4.callback), 
    isSecondary = v4.optional(v4.boolean), 
    isDisabled = v4.optional(v4.boolean), 
    tileSize = v4.optional(v4.UDim2), 
    mouseEnter = v4.optional(v4.callback), 
    mouseLeave = v4.optional(v4.callback), 
    isRoactGamepadEnabled = v4.optional(v4.boolean)
});
v9.defaultProps = {
    isSecondary = false, 
    isDisabled = false, 
    buttonHeight = 36, 
    outerButtonPadding = 10, 
    tileSize = UDim2.new(0, 150, 0, 150), 
    isRoactGamepadEnabled = true
};
v9.render = function(v10) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v5 (copy), v6 (copy), v8 (copy)
    local l_isSecondary_0 = v10.props.isSecondary;
    local l_onActivated_0 = v10.props.onActivated;
    local l_isDisabled_0 = v10.props.isDisabled;
    local l_icon_0 = v10.props.icon;
    local l_buttonHeight_0 = v10.props.buttonHeight;
    local l_outerButtonPadding_0 = v10.props.outerButtonPadding;
    local v17 = v10.props.tileSize.X.Offset / 2 - l_outerButtonPadding_0 * 1.5;
    local v18 = UDim2.new(0, v17, 0, l_buttonHeight_0);
    local v19 = l_isSecondary_0 and v7.Secondary or v7.PrimarySystem;
    return v5.createElement(v6, {
        buttonType = v19, 
        automaticSize = Enum.AutomaticSize.XY, 
        position = UDim2.new(1, 0, 1, 0), 
        size = v18, 
        anchorPoint = Vector2.new(1, 1), 
        onActivated = l_onActivated_0 or function() --[[ Line: 62 ]]

        end, 
        isDisabled = l_isDisabled_0, 
        icon = l_icon_0, 
        isRoactGamepadEnabled = v10.props.isRoactGamepadEnabled, 
        onStateChanged = function(v20, v21) --[[ Line: 66 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v8 (ref), v10 (copy)
            if v20 == v8.Hover then
                v10.props.mouseEnter();
                return;
            else
                if v21 == v8.Hover then
                    v10.props.mouseLeave();
                end;
                return;
            end;
        end
    });
end;
return v9;