local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_Modules_0.Common.Action)(script.Name, function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return v1.Dictionary.join({
        updateRequested = true
    }, v3 or {});
end);