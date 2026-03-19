local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local l_UserInputService_0 = game:GetService("UserInputService");
return function() --[[ Line: 14 ]]
    -- upvalues: v1 (copy), l_UserInputService_0 (copy)
    local v3, v4 = v1.useState(false);
    local v5, v6 = v1.useState(0);
    local v7, v8 = v1.useState(0);
    v1.useEffect(function() --[[ Line: 19 ]]
        -- upvalues: l_UserInputService_0 (ref), v4 (copy), v6 (copy), v8 (copy)
        local function v12() --[[ Line: 20 ]] --[[ Name: updateKeyboardState ]]
            -- upvalues: l_UserInputService_0 (ref), v4 (ref), v6 (ref), v8 (ref)
            local l_OnScreenKeyboardVisible_0 = l_UserInputService_0.OnScreenKeyboardVisible;
            local l_Y_0 = l_UserInputService_0.OnScreenKeyboardSize.Y;
            local l_Y_1 = l_UserInputService_0.OnScreenKeyboardPosition.Y;
            v4(l_OnScreenKeyboardVisible_0);
            v6(if l_OnScreenKeyboardVisible_0 then l_Y_0 else 0);
            v8(if l_OnScreenKeyboardVisible_0 then l_Y_1 else 0);
        end;
        local l_OnScreenKeyboardVisible_1 = l_UserInputService_0.OnScreenKeyboardVisible;
        local l_Y_2 = l_UserInputService_0.OnScreenKeyboardSize.Y;
        local l_Y_3 = l_UserInputService_0.OnScreenKeyboardPosition.Y;
        v4(l_OnScreenKeyboardVisible_1);
        v6(if l_OnScreenKeyboardVisible_1 then l_Y_2 else 0);
        v8(if l_OnScreenKeyboardVisible_1 then l_Y_3 else 0);
        l_OnScreenKeyboardVisible_1 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(v12);
        l_Y_2 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(v12);
        l_Y_3 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(v12);
        return function() --[[ Line: 38 ]]
            -- upvalues: l_OnScreenKeyboardVisible_1 (copy), l_Y_2 (copy), l_Y_3 (copy)
            if l_OnScreenKeyboardVisible_1 then
                l_OnScreenKeyboardVisible_1:Disconnect();
            end;
            if l_Y_2 then
                l_Y_2:Disconnect();
            end;
            if l_Y_3 then
                l_Y_3:Disconnect();
            end;
        end;
    end, {});
    return {
        isKeyboardShowing = v3, 
        onScreenKeyboardHeight = v5, 
        keyboardPositionY = v7
    };
end;