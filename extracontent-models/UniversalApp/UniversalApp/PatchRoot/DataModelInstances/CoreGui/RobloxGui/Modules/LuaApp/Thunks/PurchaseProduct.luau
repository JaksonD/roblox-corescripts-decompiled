local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_Modules_0.LuaApp.Promise);
local v5 = require(l_Modules_0.LuaApp.ArgCheck);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.PurchaseProduct);
local v7 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v8 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v10 = require(l_Modules_0.LuaApp.Models.EconomyApi.PurchaseProduct);
local v11 = require(l_Modules_0.LuaApp.Types.EconomyTypes);
local v12 = {};
local function _(v13) --[[ Line: 16 ]] --[[ Name: purchaseProductKeyMapper ]]
    return "luaapp.purchaseproduct." .. v13;
end;
local v15 = v3.tuple(v3.callback, v3.numberPositive, v11.PurchaseDetail, v3.optional(v3.callback));
v12.Post = function(v16, v17, v18, v19) --[[ Line: 22 ]] --[[ Name: Post ]]
    -- upvalues: v5 (copy), v15 (copy), l_PerformFetch_0 (copy), v6 (copy), v10 (copy), v8 (copy), v4 (copy), l_Logging_0 (copy), v7 (copy)
    v5.assert(v15(v16, v17, v18, v19));
    return l_PerformFetch_0.Single("luaapp.purchaseproduct." .. v17, function(v20) --[[ Line: 25 ]]
        -- upvalues: v6 (ref), v16 (copy), v17 (copy), v18 (copy), v10 (ref), v19 (copy), v8 (ref), v4 (ref), l_Logging_0 (ref), v7 (ref)
        return v6(v16, v17, v18):andThen(function(v21) --[[ Line: 26 ]]
            -- upvalues: v10 (ref), v19 (ref), v20 (copy), v8 (ref), v4 (ref), l_Logging_0 (ref), v7 (ref)
            local l_responseBody_0 = v21.responseBody;
            if type(l_responseBody_0) == "table" then
                local v23 = v10.fromJsonData(l_responseBody_0);
                if not v23.purchased then
                    if v19 == nil or v19(v23) == false then
                        v20:dispatch(v8(v23));
                    end;
                    return v4.reject(v23);
                else
                    return v4.resolve(v23);
                end;
            else
                l_Logging_0.warn("Response from PurchaseProduct is malformed!");
                v20:dispatch(v7({
                    HttpError = Enum.HttpError.OK
                }));
                return v4.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v24) --[[ Line: 50 ]]
            -- upvalues: v20 (copy), v7 (ref), v4 (ref)
            v20:dispatch(v7(v24));
            return v4.reject(v24);
        end);
    end);
end;
v12.GetPostingStatus = function(v25, v26) --[[ Line: 57 ]] --[[ Name: GetPostingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v25, "luaapp.purchaseproduct." .. v26);
end;
return v12;