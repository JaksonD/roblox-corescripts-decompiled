local l_script_FirstAncestor_0 = script:FindFirstAncestor("UiShellEvents");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Analytics.logInputTypeChanged);
local l_useInputType_0 = require(l_Parent_0.RoactUtils).Hooks.useInputType;
return function(v6, v7) --[[ Line: 8 ]] --[[ Name: useLogInputTypeChanged ]]
    -- upvalues: l_useInputType_0 (copy), v3 (copy), l_UserInputService_0 (copy), v4 (copy)
    local v8 = l_useInputType_0();
    v3.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: l_UserInputService_0 (ref), v4 (ref), v6 (copy), v8 (copy), v7 (copy)
        local l_l_UserInputService_0_GamepadConnected_0 = l_UserInputService_0:GetGamepadConnected(Enum.UserInputType.Gamepad1);
        v4(v6, "inputTypeChanged", {
            inputType = v8, 
            gamepadConnected = l_l_UserInputService_0_GamepadConnected_0, 
            playSessionId = v7
        });
    end, {
        v8
    });
end;