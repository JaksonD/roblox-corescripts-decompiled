local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local v1 = require(l_Parent_0.React);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_useEffect_0 = v1.useEffect;
local l_useState_0 = v1.useState;
return function() --[[ Line: 9 ]]
    -- upvalues: l_useState_0 (copy), l_useEffect_0 (copy), l_UserInputService_0 (copy)
    local v5, v6 = l_useState_0(0);
    l_useEffect_0(function() --[[ Line: 12 ]]
        -- upvalues: l_UserInputService_0 (ref), v6 (copy)
        local v7 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 14 ]]
            -- upvalues: v6 (ref), l_UserInputService_0 (ref)
            v6(l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0);
        end);
        return function() --[[ Line: 19 ]]
            -- upvalues: v7 (copy)
            v7:Disconnect();
        end;
    end, {});
    return v5;
end;