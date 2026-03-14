local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Service.Types);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v2 (copy)
    if v4 and v4.notification then
        local l_notification_0 = v4.notification;
        local v6, v7 = v2.useState(l_notification_0:get());
        v2.useEffect(function() --[[ Line: 15 ]]
            -- upvalues: v4 (copy), v7 (copy), l_notification_0 (copy)
            local v8 = v4.notification:connect(function() --[[ Line: 16 ]]
                -- upvalues: v7 (ref), l_notification_0 (ref)
                v7(l_notification_0:get());
            end);
            return function() --[[ Line: 20 ]]
                -- upvalues: v8 (copy)
                v8:disconnect();
            end;
        end, {
            v4.id
        });
        if v6 and v6.type == "count" then
            return v6.value;
        else
            return 0;
        end;
    else
        warn("notification object not found");
        return 0;
    end;
end;