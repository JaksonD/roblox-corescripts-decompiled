local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.PolicyProvider);
local v2 = v1.GetPolicyImplementations.MemStorageService("app-policy");
local v3 = v1.withGetPolicyImplementation(v2);
v3.Mapper = function(_) --[[ Line: 7 ]]
    return {};
end;
return v3;