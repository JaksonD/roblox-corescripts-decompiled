local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_Parent_0.React);
return function(v4) --[[ Line: 7 ]] --[[ Name: usePeekViewFocusNavigationBindings ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy)
    v3.useEffect(function() --[[ Line: 8 ]]
        -- upvalues: l_RunService_0 (ref), v4 (copy), l_UserInputService_0 (ref)
        local v5 = nil;
        local v7 = l_RunService_0.Heartbeat:Connect(function(v6) --[[ Line: 10 ]]
            -- upvalues: v5 (ref), v4 (ref)
            if v5 and v5.KeyCode == Enum.KeyCode.Thumbstick2 then
                v4(v5, v6);
            end;
        end);
        local v10 = l_UserInputService_0.InputChanged:Connect(function(v8, _) --[[ Line: 15 ]]
            -- upvalues: v5 (ref)
            if v8.KeyCode == Enum.KeyCode.Thumbstick2 then
                if v8.UserInputState == Enum.UserInputState.Change then
                    v5 = v8;
                    return;
                elseif v8.UserInputState == Enum.UserInputState.End then
                    v5 = nil;
                end;
            end;
        end);
        return function() --[[ Line: 25 ]]
            -- upvalues: v7 (copy), v10 (copy)
            v7:Disconnect();
            v10:Disconnect();
        end;
    end, {
        v4
    });
end;