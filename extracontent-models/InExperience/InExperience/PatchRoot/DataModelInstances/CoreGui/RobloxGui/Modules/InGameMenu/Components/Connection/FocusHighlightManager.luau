local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_InputType_0 = require(l_Parent_0.Resources.Constants).InputType;
local v8 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v9 = require(script.Parent.FocusHandler);
local v10 = l_Roact_0.PureComponent:extend("FocusHighlightManager");
v10.validateProps = l_t_0.strictInterface({
    menuOpen = l_t_0.boolean, 
    inputType = l_t_0.string
});
v10.render = function(v11) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_Roact_0 (copy), v9 (copy), l_InputType_0 (copy), l_GuiService_0 (copy)
    if v8() then
        return l_Roact_0.createElement(v9, {
            isFocused = not v11.props.menuOpen or v11.props.inputType ~= l_InputType_0.Gamepad, 
            didFocus = function() --[[ Line: 26 ]] --[[ Name: didFocus ]]
                -- upvalues: l_GuiService_0 (ref)
                l_GuiService_0.SelectedCoreObject = nil;
            end
        });
    else
        return l_Roact_0.createElement(v9, {
            isFocused = v11.props.menuOpen and v11.props.inputType == l_InputType_0.Gamepad, 
            didBlur = function() --[[ Line: 33 ]] --[[ Name: didBlur ]]
                -- upvalues: l_GuiService_0 (ref)
                l_GuiService_0.SelectedCoreObject = nil;
            end
        });
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v12) --[[ Line: 40 ]]
    return {
        menuOpen = v12.isMenuOpen, 
        inputType = v12.displayOptions.inputType
    };
end)(v10);