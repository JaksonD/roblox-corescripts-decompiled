local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local v3 = {};
v3.__index = v3;
v3.getWebLogin = function() --[[ Line: 8 ]] --[[ Name: getWebLogin ]]
    -- upvalues: l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    return tonumber(l_AppStorageService_0:GetItem(l_LocalStorageKey_0.WebLogin)) or 0;
end;
return v3;