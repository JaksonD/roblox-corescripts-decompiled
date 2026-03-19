local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_l_MessageBusService_0_MessageId_0 = l_MessageBusService_0:GetMessageId("SystemTheme", "systemThemeSetThemeOverride");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SystemTheme");
local v3 = require(l_script_FirstAncestor_0.Utils.GetSystemThemeEnabled);
return function() --[[ Line: 9 ]]
    -- upvalues: v3 (copy), l_MessageBusService_0 (copy), l_l_MessageBusService_0_MessageId_0 (copy)
    if v3() then
        l_MessageBusService_0:Publish(l_l_MessageBusService_0_MessageId_0, {
            ThemeOverride = nil
        });
    end;
end;