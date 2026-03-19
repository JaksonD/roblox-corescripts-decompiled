local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.UpdateCollectibleResellableInstance);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInstance);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v9 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v10 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v11 = require(l_Modules_0.LuaApp.Enum.ToastType);
local function _(v12) --[[ Line: 25 ]] --[[ Name: keyMapper ]]
    -- upvalues: v5 (copy)
    return v5.UpdateCollectibleInstanceResaleStateKey .. tostring(v12);
end;
local v14 = {
    toastMessage = "Feature.Catalog.Response.PlacedOnSaleSuccess", 
    isLocalized = false, 
    toastType = v11.SuccessConfirmation
};
local v15 = {
    toastMessage = "Feature.Catalog.Response.TakenOffSaleSuccess", 
    isLocalized = false, 
    toastType = v11.SuccessConfirmation
};
local function _(v16, v17, v18) --[[ Line: 41 ]] --[[ Name: getCollectibleInstance ]]
    local l_CollectiblesResellableInstances_0 = v16.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
    if l_CollectiblesResellableInstances_0[v17] then
        return l_CollectiblesResellableInstances_0[v17][v18];
    else
        return nil;
    end;
end;
return function(v21, v22, v23, v24, v25) --[[ Line: 48 ]]
    -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v2 (copy), v7 (copy), v4 (copy), v14 (copy), v15 (copy), v9 (copy), v10 (copy)
    return function(v26) --[[ Line: 55 ]]
        -- upvalues: l_PerformFetch_0 (ref), v23 (copy), v5 (ref), v22 (copy), v2 (ref), v7 (ref), v21 (copy), v25 (copy), v24 (copy), v4 (ref), v14 (ref), v15 (ref), v9 (ref), v10 (ref)
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v23_0 = v23;
        return l_Single_0(v5.UpdateCollectibleInstanceResaleStateKey .. tostring(l_v23_0), function(v29) --[[ Line: 56 ]]
            -- upvalues: v22 (ref), v23 (ref), v2 (ref), v7 (ref), v21 (ref), v25 (ref), v24 (ref), v4 (ref), v14 (ref), v15 (ref), v9 (ref), v10 (ref)
            local v30 = v29:getState();
            local l_LocalUserId_0 = v30.LocalUserId;
            local l_v22_0 = v22;
            local l_v23_1 = v23;
            local l_CollectiblesResellableInstances_1 = v30.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
            local v35 = if l_CollectiblesResellableInstances_1[l_v22_0] then l_CollectiblesResellableInstances_1[l_v22_0][l_v23_1] else nil;
            if v35 == nil then
                return v2.reject("Unable to find collectible instance");
            else
                return v7.UpdateCollectibleInstanceResaleState(v21, v22, v23, v35.collectibleProductId, v25, v24, l_LocalUserId_0):andThen(function(_) --[[ Line: 71 ]]
                    -- upvalues: v29 (copy), v22 (ref), v23 (ref), v25 (ref), v24 (ref), v4 (ref), v14 (ref), v15 (ref), v9 (ref), v2 (ref)
                    local v37 = v29:getState();
                    local l_v22_1 = v22;
                    local l_v23_2 = v23;
                    local l_CollectiblesResellableInstances_2 = v37.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
                    local v41 = if l_CollectiblesResellableInstances_2[l_v22_1] then l_CollectiblesResellableInstances_2[l_v22_1][l_v23_2] else nil;
                    if v41 then
                        v41.price = v25 or v41.price;
                        v41.saleState = v24 and "OnSale" or "OffSale";
                        v29:dispatch(v4(v22, v23, v41));
                    end;
                    v29:dispatch(v9(if v24 then v14 else v15));
                    return v2.resolve();
                end, function(v42) --[[ Line: 86 ]]
                    -- upvalues: v29 (copy), v10 (ref), v2 (ref)
                    v29:dispatch(v10(v42));
                    return v2.reject(v42);
                end);
            end;
        end)(v26);
    end;
end;