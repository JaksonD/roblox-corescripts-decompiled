local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Modules_0.LuaApp.Flags.FFlagDebugShowSiteMessageBanner);
return function() --[[ Line: 14 ]] --[[ Name: useShowSiteMessageBanner ]]
    -- upvalues: v2 (copy), l_useSelector_0 (copy), v3 (copy), v5 (copy)
    local v7 = v2.useCallback(function(v6) --[[ Line: 16 ]]
        return v6.SiteMessage and v6.SiteMessage.Text;
    end, {});
    local v8 = l_useSelector_0(v7) ~= nil;
    return v3(function(v9) --[[ Line: 22 ]]
        return v9.getSiteMessageBanner();
    end) and v8 or v5;
end;