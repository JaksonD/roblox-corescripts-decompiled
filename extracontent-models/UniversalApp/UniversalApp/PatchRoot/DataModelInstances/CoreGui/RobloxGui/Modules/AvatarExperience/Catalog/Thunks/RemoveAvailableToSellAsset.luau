local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.UpdateUserAssetPrice);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AddCurrentlySellingAsset);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveAvailableToSellAsset);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v12 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v13 = require(l_Modules_0.LuaApp.Enum.ToastType);
local function _(v14) --[[ Line: 21 ]] --[[ Name: keyMapper ]]
    -- upvalues: v8 (copy)
    return v8.RemoveAvailableToSellAssetKey .. tostring(v14);
end;
local v16 = {
    toastMessage = "Feature.Catalog.Label.SellSuccess", 
    isLocalized = false, 
    toastType = v13.SuccessConfirmation
};
return function(v17, v18, v19, v20) --[[ Line: 31 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v8 (copy), v9 (copy), v5 (copy), v7 (copy), v6 (copy), v11 (copy), v16 (copy), v2 (copy), v12 (copy)
    return function(v21) --[[ Line: 32 ]]
        -- upvalues: v3 (ref), v18 (copy), v19 (copy), v20 (copy), l_PerformFetch_0 (ref), v8 (ref), v9 (ref), v17 (copy), v5 (ref), v7 (ref), v6 (ref), v11 (ref), v16 (ref), v2 (ref), v12 (ref)
        v3.isType(v18, "string", "RemoveAvailableToSellAsset thunk expects assetId to be a string");
        v3.isType(v19, "string", "RemoveAvailableToSellAsset thunk expects userAssetId to be a string");
        v3.isType(v20, "number", "RemoveAvailableToSellAsset thunk expects priceInRobux to be a number");
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v19_0 = v19;
        return l_Single_0(v8.RemoveAvailableToSellAssetKey .. tostring(l_v19_0), function(v24) --[[ Line: 37 ]]
            -- upvalues: v9 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v5 (ref), v7 (ref), v6 (ref), v11 (ref), v16 (ref), v2 (ref), v12 (ref)
            return v9.RemoveAvailableToSell(v17, v18, v19, v20):andThen(function(_) --[[ Line: 39 ]]
                -- upvalues: v24 (copy), v5 (ref), v19 (ref), v20 (ref), v7 (ref), v18 (ref), v6 (ref), v11 (ref), v16 (ref), v2 (ref)
                v24:dispatch(v5(v19, v20));
                v24:dispatch(v7(v18, v19));
                v24:dispatch(v6(v18, v19));
                v24:dispatch(v11(v16));
                return v2.resolve();
            end, function(v26) --[[ Line: 47 ]]
                -- upvalues: v24 (copy), v12 (ref), v2 (ref)
                v24:dispatch(v12(v26));
                return v2.reject(v26);
            end);
        end)(v21);
    end;
end;