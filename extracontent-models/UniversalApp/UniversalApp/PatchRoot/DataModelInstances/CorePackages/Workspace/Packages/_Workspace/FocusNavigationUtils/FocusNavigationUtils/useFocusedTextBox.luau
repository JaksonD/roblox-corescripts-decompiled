local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v2 = require(l_Parent_0.React);
return function(v3, v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), l_UserInputService_0 (copy)
    local v5, v6 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 11 ]]
        -- upvalues: l_UserInputService_0 (ref), v6 (copy), v3 (copy), v4 (copy)
        local v8 = l_UserInputService_0.TextBoxFocused:Connect(function(v7) --[[ Line: 12 ]]
            -- upvalues: v6 (ref), v3 (ref)
            v6(v7);
            if v3 then
                v3(v7);
            end;
        end);
        local v10 = l_UserInputService_0.TextBoxFocusReleased:Connect(function(v9) --[[ Line: 20 ]]
            -- upvalues: v6 (ref), v4 (ref)
            v6(nil);
            if v4 then
                v4(v9);
            end;
        end);
        return function() --[[ Line: 28 ]]
            -- upvalues: v8 (copy), v10 (copy)
            v8:Disconnect();
            v10:Disconnect();
        end;
    end, {
        v6
    });
    return v5;
end;