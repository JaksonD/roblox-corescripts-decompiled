local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
game:DefineFastInt("LinkBrowserTrackerToDeviceRollout", 0);
return function() --[[ Line: 7 ]]
    -- upvalues: l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    return game:GetFastInt("LinkBrowserTrackerToDeviceRollout") > (l_AppStorageService_0 and l_LocalStorageKey_0 and tonumber(l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId)) or 99) % 100;
end;