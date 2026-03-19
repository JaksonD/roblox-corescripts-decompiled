local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v10 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v11 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v12 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v13 = {
    HttpError = Enum.HttpError.OK
};
local v14 = {
    toastMessage = "Feature.Catalog.Label.Redeemed", 
    isLocalized = false, 
    toastType = v12.SuccessConfirmation
};
local v15 = {
    toastMessage = "Feature.Catalog.Label.NotAvailable", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local v16 = {
    toastMessage = "Feature.Catalog.Label.AlreadyOwned", 
    isLocalized = false, 
    toastType = v12.InformationMessage
};
local function _(v17) --[[ Line: 39 ]] --[[ Name: redeemQRCodeItemKeyMapper ]]
    -- upvalues: v8 (copy)
    return v8.RedeemQRCodeItemKey .. tostring(v17);
end;
return function(v19, v20, v21, v22) --[[ Line: 44 ]]
    -- upvalues: l_PerformFetch_0 (copy), v8 (copy), v6 (copy), v11 (copy), v10 (copy), v16 (copy), v3 (copy), v4 (copy), v7 (copy), v14 (copy), v13 (copy), l_Logging_0 (copy), v9 (copy), v15 (copy)
    return l_PerformFetch_0.Single(v8.RedeemQRCodeItemKey .. tostring(v21), function(v23) --[[ Line: 45 ]]
        -- upvalues: v6 (ref), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v11 (ref), v10 (ref), v16 (ref), v3 (ref), v4 (ref), v7 (ref), v14 (ref), v13 (ref), l_Logging_0 (ref), v9 (ref), v15 (ref)
        return v23:dispatch(v6(v19, v20, v21, v22)):andThen(function() --[[ Line: 46 ]]
            -- upvalues: v11 (ref), v23 (copy), v21 (ref), v22 (ref), v10 (ref), v16 (ref), v3 (ref), v4 (ref), v19 (ref), v7 (ref), v14 (ref), v13 (ref), l_Logging_0 (ref), v9 (ref), v15 (ref)
            local v24 = v11(v23:getState().AvatarExperience.Common, v21, v22);
            if v24 and v24.isOwned then
                v23:dispatch(v10(v16));
                return v3.resolve();
            else
                return v4.RedeemQRCodeItem(v19, v21):andThen(function(v25) --[[ Line: 55 ]]
                    -- upvalues: v23 (ref), v7 (ref), v21 (ref), v10 (ref), v14 (ref), v3 (ref), v13 (ref), l_Logging_0 (ref), v9 (ref)
                    local l_responseBody_0 = v25.responseBody;
                    if type(l_responseBody_0) == "table" and l_responseBody_0.success == true then
                        v23:dispatch(v7(v21, true));
                        v23:dispatch(v10(v14));
                        return v3.resolve();
                    else
                        local l_v13_0 = v13;
                        l_Logging_0.warn("Response from RedeemQRCodeItem is malformed!");
                        v23:dispatch(v9(l_v13_0));
                        return v3.reject(l_v13_0);
                    end;
                end, function(v28) --[[ Line: 67 ]]
                    -- upvalues: v13 (ref), v23 (ref), v10 (ref), v15 (ref), v3 (ref)
                    if type(v28) ~= "table" or v28.HttpError == nil then
                        v28 = v13;
                    end;
                    v23:dispatch(v10(v15));
                    return v3.reject(v28);
                end);
            end;
        end);
    end);
end;