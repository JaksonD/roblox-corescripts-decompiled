local l_NotificationService_0 = game:GetService("NotificationService");
local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v2 = require(l_Parent_0.React);
return function() --[[ Line: 13 ]] --[[ Name: useSelectedTheme ]]
    -- upvalues: v2 (copy), l_NotificationService_0 (copy)
    local v3, v4 = v2.useState(string.lower(l_NotificationService_0.SelectedTheme));
    v2.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: l_NotificationService_0 (ref), v4 (copy)
        local v5 = l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function() --[[ Line: 17 ]]
            -- upvalues: v4 (ref), l_NotificationService_0 (ref)
            v4(string.lower(l_NotificationService_0.SelectedTheme));
        end);
        return function() --[[ Line: 21 ]]
            -- upvalues: v5 (copy)
            v5:Disconnect();
        end;
    end);
    return v3;
end;