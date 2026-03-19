local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Actions.ProcessSiteAlertInfoPayload);
local v4 = require(l_Modules_0.LuaApp.Actions.RefreshSiteAlertInfo);
local v5 = require(l_Modules_0.LuaApp.Actions.ApplySetNavigationLocked);
local v6 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy), v5 (copy), v6 (copy)
    v7 = v7 or {};
    if v8.type == v3.name then
        return {
            Text = v8.visible and v8.text or nil, 
            Link = v8.visible and v8.link or nil, 
            timestamp = v8.timestamp or nil, 
            updateRequested = false
        };
    elseif v8.type == v4.name then
        return v1.Dictionary.join(v7, {
            updateRequested = v8.updateRequested
        });
    else
        for _, v10 in ipairs({
            v5, 
            v6
        }) do
            if v8.type == v10.name then
                return v1.Dictionary.join(v7, {
                    updateRequested = true
                });
            end;
        end;
        return v7;
    end;
end;