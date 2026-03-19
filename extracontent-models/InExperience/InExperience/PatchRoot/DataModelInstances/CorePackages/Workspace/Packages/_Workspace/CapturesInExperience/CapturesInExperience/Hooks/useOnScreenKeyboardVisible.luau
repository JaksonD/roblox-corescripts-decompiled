local l_Parent_0 = script.Parent.Parent.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_Parent_0.React);
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
return function() --[[ Line: 11 ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), l_UserInputService_0 (copy)
    local v5, v6 = l_useState_0(false);
    l_useEffect_0(function() --[[ Line: 14 ]]
        -- upvalues: l_UserInputService_0 (ref), v6 (copy)
        local v7 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 16 ]]
            -- upvalues: v6 (ref), l_UserInputService_0 (ref)
            v6(l_UserInputService_0.OnScreenKeyboardVisible);
        end);
        return function() --[[ Line: 19 ]]
            -- upvalues: v7 (copy)
            v7:Disconnect();
        end;
    end, {});
    return v5;
end;