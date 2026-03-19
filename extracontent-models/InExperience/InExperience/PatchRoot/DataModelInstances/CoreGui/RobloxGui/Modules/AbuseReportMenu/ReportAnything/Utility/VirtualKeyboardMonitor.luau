local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = {
    _initialized = false, 
    _isKeyboardJustOff = false, 
    getInstance = function(v1) --[[ Line: 8 ]] --[[ Name: getInstance ]]
        if not v1._initialized then
            v1:initialize();
            v1._initialized = true;
        end;
        return v1;
    end, 
    initialize = function(v2) --[[ Line: 16 ]] --[[ Name: initialize ]]
        -- upvalues: l_UserInputService_0 (copy)
        v2._isKeyboardJustOff = false;
        l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 18 ]]
            -- upvalues: l_UserInputService_0 (ref), v2 (copy)
            if not l_UserInputService_0.OnScreenKeyboardVisible then
                v2._isKeyboardJustOff = true;
            end;
        end);
        l_UserInputService_0.InputEnded:Connect(function(_) --[[ Line: 23 ]]
            -- upvalues: v2 (copy)
            if v2._isKeyboardJustOff then
                v2._isKeyboardJustOff = false;
            end;
        end);
    end, 
    isKeyboardJustOff = function(v4) --[[ Line: 35 ]] --[[ Name: isKeyboardJustOff ]]
        return v4._isKeyboardJustOff;
    end
};
return {
    getInstance = function() --[[ Line: 40 ]] --[[ Name: getInstance ]]
        -- upvalues: v5 (copy)
        return v5:getInstance();
    end
};