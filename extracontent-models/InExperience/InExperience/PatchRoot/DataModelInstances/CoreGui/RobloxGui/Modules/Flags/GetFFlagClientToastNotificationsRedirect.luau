local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v2 = game:DefineFastFlag("ClientToastNotificationsRedirect4", false);
local v3 = game:DefineFastFlag("EnableClientToastNotificationsRedirectExperiment", false);
local v4 = game:DefineFastString("ClientToastNotificationsRedirectLayerName", "Notification.Toast");
local v5 = game:DefineFastString("ClientToastNotificationsRedirectLayerValue", "NotificationRedirect");
local v6 = false;
local v7 = nil;
local v8 = nil;
return function() --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v6 (ref), v7 (ref), v8 (ref), l_IXPServiceWrapper_0 (copy), v4 (copy), v2 (copy), v5 (copy)
    if v3 and not v6 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 14 ]]
            -- upvalues: v6 (ref), l_IXPServiceWrapper_0 (ref), v4 (ref)
            v6 = true;
            return l_IXPServiceWrapper_0:GetLayerData(v4);
        end);
        v7 = l_status_0;
        v8 = l_result_0;
    end;
    return v2 or v7 and v8 and v8[v5];
end;