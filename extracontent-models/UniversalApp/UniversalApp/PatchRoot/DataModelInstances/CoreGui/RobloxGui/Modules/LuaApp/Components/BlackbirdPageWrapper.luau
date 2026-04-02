local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Components.GenericWebPageWrapper);
local l_GetFStringBlackbirdUrl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringBlackbirdUrl;
local v5 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_getSubscriptionPurchaseCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback;
return function(v7) --[[ Line: 23 ]] --[[ Name: BlackbirdPageWrapper ]]
    -- upvalues: v2 (copy), l_getSubscriptionPurchaseCloseCallback_0 (copy), v3 (copy), v5 (copy), l_GetFStringBlackbirdUrl_0 (copy)
    local v8 = v2.useMemo(l_getSubscriptionPurchaseCloseCallback_0, {});
    return v2.createElement(v3, {
        isVisible = v7.isVisible, 
        DisplayOrder = v7.DisplayOrder, 
        url = v5.fromString(l_GetFStringBlackbirdUrl_0())(), 
        titleKey = "CommonUI.Features.Label.X", 
        transitionAnimation = v7.transitionAnimation, 
        onClose = v8
    });
end;