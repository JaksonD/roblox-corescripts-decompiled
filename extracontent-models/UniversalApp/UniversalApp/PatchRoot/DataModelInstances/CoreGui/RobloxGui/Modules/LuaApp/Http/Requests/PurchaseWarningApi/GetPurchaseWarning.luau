local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings);
return function(v5, v6, v7, v8) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v2 (copy)
    return v5(if v4() then v2.economy.purchaseWarning.getPurchaseWarning(v6, v7, v8 == false) else v2.economy.purchaseWarning.getPurchaseWarning(v6), "GET");
end;