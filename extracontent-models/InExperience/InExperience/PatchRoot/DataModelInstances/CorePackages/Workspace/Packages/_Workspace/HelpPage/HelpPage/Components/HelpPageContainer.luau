local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_0.Enums.InputTypesEnum);
local v5 = require(l_Parent_1.Responsive);
local v6 = require(l_Parent_0.Components.Keyboard.KeyboardHelpPage);
local v7 = require(l_Parent_0.Components.Gamepad.GamepadHelpPage);
local v8 = require(l_Parent_0.Components.Touch.TouchHelpPage);
local v9 = require(l_Parent_0.Telemetry.HelpPageTelemetry);
local v10 = require(l_Parent_1.RobloxAppHooks);
local _ = require(l_Parent_1.RobloxAppEnums);
local l_View_0 = v3.View;
local l_useDeviceOrientation_0 = v10.useDeviceOrientation;
local function _(v14, v15, v16) --[[ Line: 22 ]]
    -- upvalues: v4 (copy), v5 (copy)
    if v15 then
        return v4.InputType.SPATIAL_GAMEPAD;
    else
        if v14 == nil then
            v14 = v16;
        end;
        if v14 == v5.Input.Pointer then
            return v4.InputType.KEYBOARD;
        elseif v14 == v5.Input.Directional then
            return v4.InputType.GAMEPAD;
        elseif v14 == v5.Input.Touch then
            return v4.InputType.TOUCH;
        else
            return v4.InputType.KEYBOARD;
        end;
    end;
end;
return v2.memo(function() --[[ Line: 43 ]] --[[ Name: HelpPageContainer ]]
    -- upvalues: v5 (copy), v4 (copy), l_useDeviceOrientation_0 (copy), v2 (copy), v9 (copy), v6 (copy), v7 (copy), v8 (copy), l_View_0 (copy)
    local v18 = v5.useLastInput();
    local v19 = v5.useIsSpatial();
    local v20 = v5.usePreferredInput();
    local l_v18_0 = v18;
    local v22;
    if v19 then
        v22 = v4.InputType.SPATIAL_GAMEPAD;
    else
        if l_v18_0 == nil then
            l_v18_0 = v20;
        end;
        v22 = if l_v18_0 == v5.Input.Pointer then v4.InputType.KEYBOARD else if l_v18_0 == v5.Input.Directional then v4.InputType.GAMEPAD else if l_v18_0 == v5.Input.Touch then v4.InputType.TOUCH else v4.InputType.KEYBOARD;
    end;
    l_v18_0 = l_useDeviceOrientation_0();
    v2.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v9 (ref), l_v18_0 (copy), v22 (copy)
        v9.default:logHelpPageInteraction("Help_Interaction", {
            orientation = l_v18_0, 
            last_input_type = v22
        });
    end, {
        l_v18_0, 
        v22
    });
    if v22 == v4.InputType.KEYBOARD then
        return v2.createElement(v6);
    elseif v22 == v4.InputType.GAMEPAD or v22 == v4.InputType.SPATIAL_GAMEPAD then
        return v2.createElement(v7, {
            isSpatial = v22 == v4.InputType.SPATIAL_GAMEPAD
        });
    elseif v22 == v4.InputType.TOUCH then
        return v2.createElement(v8);
    else
        return v2.createElement(l_View_0, nil, {});
    end;
end);