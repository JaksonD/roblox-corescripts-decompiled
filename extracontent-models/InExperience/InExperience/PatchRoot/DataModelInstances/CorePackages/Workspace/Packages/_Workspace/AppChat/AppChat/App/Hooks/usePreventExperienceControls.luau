local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_useEffect_0 = require(l_Parent_0.React).useEffect;
local v3 = {
    Enum.PlayerActions.CharacterForward, 
    Enum.PlayerActions.CharacterBackward, 
    Enum.PlayerActions.CharacterLeft, 
    Enum.PlayerActions.CharacterRight, 
    Enum.PlayerActions.CharacterJump, 
    Enum.KeyCode.LeftShift, 
    Enum.KeyCode.RightShift, 
    Enum.KeyCode.Tab, 
    Enum.UserInputType.Gamepad1, 
    Enum.UserInputType.Gamepad2, 
    Enum.UserInputType.Gamepad3, 
    Enum.UserInputType.Gamepad4, 
    Enum.UserInputType.Touch, 
    Enum.UserInputType.Keyboard, 
    Enum.UserInputType.MouseButton1, 
    Enum.UserInputType.MouseButton2
};
return function(v4) --[[ Line: 31 ]]
    -- upvalues: l_useEffect_0 (copy), l_ContextActionService_0 (copy), v3 (copy)
    l_useEffect_0(function() --[[ Line: 32 ]]
        -- upvalues: v4 (copy), l_ContextActionService_0 (ref), v3 (ref)
        if v4 then
            l_ContextActionService_0:BindCoreActionAtPriority("AppChatDisableGameControls", function(_, _, v7) --[[ Line: 34 ]]
                if v7.KeyCode == Enum.KeyCode.Escape then
                    return Enum.ContextActionResult.Pass;
                else
                    return Enum.ContextActionResult.Sink;
                end;
            end, false, Enum.ContextActionPriority.Low.Value, unpack(v3));
        end;
        return function() --[[ Line: 43 ]]
            -- upvalues: v4 (ref), l_ContextActionService_0 (ref)
            if v4 then
                l_ContextActionService_0:UnbindCoreAction("AppChatDisableGameControls");
            end;
        end;
    end, {
        v4
    });
end;