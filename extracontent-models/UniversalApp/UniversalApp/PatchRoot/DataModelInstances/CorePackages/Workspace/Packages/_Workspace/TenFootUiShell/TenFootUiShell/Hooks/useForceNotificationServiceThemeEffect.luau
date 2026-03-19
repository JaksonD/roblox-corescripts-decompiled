local l_NotificationService_0 = game:GetService("NotificationService");
local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.useAppPolicy);
return function() --[[ Line: 11 ]] --[[ Name: useForceNotificationServiceThemeEffect ]]
    -- upvalues: v3 (copy), v2 (copy), l_NotificationService_0 (copy)
    local v5 = v3(function(v4) --[[ Line: 12 ]]
        return v4.getForceTheme();
    end);
    v2.useLayoutEffect(function() --[[ Line: 15 ]]
        -- upvalues: v5 (copy), l_NotificationService_0 (ref)
        if v5 then
            l_NotificationService_0.SelectedTheme = v5;
        end;
    end, {
        v5
    });
end;