local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_isEconomicRestrictionResponse_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_Modules_0.LuaApp.Promise);
local v6 = require(l_Modules_0.LuaApp.ArgCheck);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.PurchaseGamePass);
local v8 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v9 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.LuaApp.Models.EconomyApi.PurchaseProduct);
local v12 = require(l_Modules_0.LuaApp.Types.EconomyTypes);
local v13 = {};
local function _(v14) --[[ Line: 18 ]] --[[ Name: purchaseGamePassKeyMapper ]]
    return "luaapp.purchasegamepass." .. v14;
end;
local v16 = v4.tuple(v4.callback, v4.numberPositive, v12.PurchaseDetail, v4.optional(v4.callback), v4.callback);
v13.Post = function(v17, v18, v19, v20, v21) --[[ Line: 24 ]] --[[ Name: Post ]]
    -- upvalues: v6 (copy), v16 (copy), l_PerformFetch_0 (copy), v7 (copy), v11 (copy), l_isEconomicRestrictionResponse_0 (copy), v9 (copy), v5 (copy), l_Logging_0 (copy), v8 (copy)
    v6.assert(v16(v17, v18, v19, v20, v21));
    return l_PerformFetch_0.Single("luaapp.purchasegamepass." .. v18, function(v22) --[[ Line: 35 ]]
        -- upvalues: v7 (ref), v17 (copy), v18 (copy), v19 (copy), v11 (ref), v20 (copy), l_isEconomicRestrictionResponse_0 (ref), v21 (copy), v9 (ref), v5 (ref), l_Logging_0 (ref), v8 (ref)
        return v7(v17, v18, v19):andThen(function(v23) --[[ Line: 36 ]]
            -- upvalues: v11 (ref), v20 (ref), l_isEconomicRestrictionResponse_0 (ref), v21 (ref), v22 (copy), v9 (ref), v5 (ref), l_Logging_0 (ref), v8 (ref)
            local l_responseBody_0 = v23.responseBody;
            if type(l_responseBody_0) == "table" then
                local v25 = v11.fromJsonData(l_responseBody_0);
                if not v25.purchased then
                    if v20 == nil or v20(v25) == false then
                        if l_isEconomicRestrictionResponse_0(l_responseBody_0) then
                            v21(l_responseBody_0);
                        else
                            v22:dispatch(v9(v25));
                        end;
                    end;
                    return v5.reject(v25);
                else
                    return v5.resolve(v25);
                end;
            else
                l_Logging_0.warn("Response from PurchaseGamePass is malformed!");
                v22:dispatch(v8({
                    HttpError = Enum.HttpError.OK
                }));
                return v5.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v26) --[[ Line: 64 ]]
            -- upvalues: v22 (copy), v8 (ref), v5 (ref)
            v22:dispatch(v8(v26));
            return v5.reject(v26);
        end);
    end);
end;
v13.GetPostingStatus = function(v27, v28) --[[ Line: 71 ]] --[[ Name: GetPostingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    if v28 == nil then
        return nil;
    else
        return l_PerformFetch_0.GetStatus(v27, "luaapp.purchasegamepass." .. v28);
    end;
end;
return v13;