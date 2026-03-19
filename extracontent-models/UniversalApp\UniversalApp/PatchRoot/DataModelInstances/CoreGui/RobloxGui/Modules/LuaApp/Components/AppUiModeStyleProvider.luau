local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
return function(v5) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v2 (copy), l_UiModeStyleProvider_0 (copy), l_CoreGui_0 (copy)
    return v3.createPortal({
        v2.createElement(l_UiModeStyleProvider_0, v5)
    }, l_CoreGui_0);
end;