local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPProducts);
local v3 = game:GetService("GuiService"):IsTenFootInterface();
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v5 = require(script.Parent.RobuxPackage);
local v6 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableNativeRobuxProducts);
local l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseEnablePremiumUserFeaturesAppPolicy;
return function(v9, v10) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), l_IsVRAppBuild_0 (copy), l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 (copy), v5 (copy), v6 (copy), v7 (copy), v2 (copy)
    local l_LocalUserId_0 = v9.LocalUserId;
    local v12 = not v3 and not l_IsVRAppBuild_0() and v9.Users[l_LocalUserId_0] and v9.Users[l_LocalUserId_0].membership == Enum.MembershipType.Premium;
    if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
        local v13 = false;
        if v10.enablePremiumUserFeatures ~= nil then
            v13 = v10.enablePremiumUserFeatures and v9.Users[l_LocalUserId_0] and v9.Users[l_LocalUserId_0].membership == Enum.MembershipType.Premium;
        end;
        v12 = v13;
    end;
    local v14 = if v12 then v9.IAPProducts.PremiumRobux else v9.IAPProducts.Robux;
    local v15 = v5.formatIapProducts(v14);
    local l_Done_0 = v6.Done;
    if v7() then
        if v9.NativeRobuxProducts.Products ~= nil then
            v15 = v5.formatNativeRobuxProducts(v9.NativeRobuxProducts.Products);
        end;
        l_Done_0 = v9.NativeRobuxProducts.FetchingStatus;
    end;
    return {
        screenSize = v9.ScreenSize, 
        iapPurchase = v9.NativePurchase, 
        userId = l_LocalUserId_0, 
        isPremium = v12, 
        robuxBalance = v9.UserRobux[l_LocalUserId_0], 
        robuxPackages = v15, 
        iapProductsFetchingStatus = v2.GetFetchingStatus(v9), 
        nativeProductsFetchingStatus = l_Done_0
    };
end;