local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_Modules_0.LuaApp.Promise);
local v6 = require(l_Modules_0.LuaApp.ArgCheck);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.DeveloperProductApi.PurchaseDeveloperProduct);
local v8 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v9 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.LuaApp.Models.DeveloperProductApi.PurchaseDeveloperProductModel);
local v12 = require(l_Modules_0.LuaApp.Types.EconomyTypes);
local l_isEconomicRestrictionResponse_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse;
local v14 = {};
local function _(v15) --[[ Line: 21 ]] --[[ Name: purchaseDeveloperProductKeyMapper ]]
    return "luaapp.purchasedeveloperproduct." .. v15;
end;
local v17 = v4.tuple(v4.callback, v4.numberPositive, v12.PurchaseDetail, v4.optional(v4.callback));
local function _(v18, v19) --[[ Line: 27 ]] --[[ Name: updateRobux ]]
    -- upvalues: v6 (copy), v9 (copy)
    local l_LocalUserId_0 = v19:getState().LocalUserId;
    v6.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v19:dispatch(v9(v18, l_LocalUserId_0, true));
    end;
end;
v14.Post = function(v22, v23, v24, v25, v26) --[[ Line: 35 ]] --[[ Name: Post ]]
    -- upvalues: v6 (copy), v17 (copy), l_PerformFetch_0 (copy), v7 (copy), v11 (copy), l_isEconomicRestrictionResponse_0 (copy), v5 (copy), v9 (copy), l_Logging_0 (copy), v8 (copy), l_HttpService_0 (copy)
    v6.assert(v17(v22, v23, v24, v25));
    return l_PerformFetch_0.Single("luaapp.purchasedeveloperproduct." .. v23, function(v27) --[[ Line: 43 ]]
        -- upvalues: v7 (ref), v22 (copy), v23 (copy), v24 (copy), v11 (ref), l_isEconomicRestrictionResponse_0 (ref), v26 (copy), v5 (ref), v6 (ref), v9 (ref), l_Logging_0 (ref), v8 (ref), v25 (copy), l_HttpService_0 (ref)
        return v7(v22, v23, v24):andThen(function(v28) --[[ Line: 44 ]]
            -- upvalues: v11 (ref), l_isEconomicRestrictionResponse_0 (ref), v26 (ref), v5 (ref), v22 (ref), v27 (copy), v6 (ref), v9 (ref), l_Logging_0 (ref), v8 (ref)
            local l_responseBody_0 = v28.responseBody;
            local v30 = v11.fromJsonData(l_responseBody_0);
            if type(l_responseBody_0) == "table" then
                if l_isEconomicRestrictionResponse_0(l_responseBody_0) and v26 ~= nil then
                    v26(l_responseBody_0);
                    return v5.reject(v30);
                else
                    local l_v22_0 = v22;
                    local l_v27_0 = v27;
                    local l_LocalUserId_1 = l_v27_0:getState().LocalUserId;
                    v6.isNonEmptyString(l_LocalUserId_1, "Thunk.PurchaseProduct.updateRobux.localUserId");
                    if typeof(l_LocalUserId_1) == "string" and l_LocalUserId_1 ~= "" then
                        l_v27_0:dispatch(v9(l_v22_0, l_LocalUserId_1, true));
                    end;
                    return v5.resolve(v30);
                end;
            else
                l_Logging_0.warn("Response from PurchaseDeveloperProduct is malformed!");
                v27:dispatch(v8({
                    HttpError = Enum.HttpError.OK
                }));
                return v5.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v34) --[[ Line: 60 ]]
            -- upvalues: v25 (ref), l_HttpService_0 (ref), v27 (copy), v8 (ref), v5 (ref)
            if v25 ~= nil and v34.Body then
                v25(l_HttpService_0:JSONDecode(v34.Body));
            else
                v27:dispatch(v8(v34));
            end;
            return v5.reject(v34);
        end);
    end);
end;
v14.GetPostingStatus = function(v35, v36) --[[ Line: 71 ]] --[[ Name: GetPostingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    if v36 == nil then
        return nil;
    else
        return l_PerformFetch_0.GetStatus(v35, "luaapp.purchasedeveloperproduct." .. v36);
    end;
end;
return v14;