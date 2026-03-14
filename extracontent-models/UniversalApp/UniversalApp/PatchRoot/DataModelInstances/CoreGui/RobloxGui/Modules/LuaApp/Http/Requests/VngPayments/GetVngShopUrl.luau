local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    return v4(v2.economy.vngPayments.getVngShopUrl(), "GET");
end;