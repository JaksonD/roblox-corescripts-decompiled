local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Actions_0 = l_Modules_0.LuaApp.Actions;
local v3 = require(l_Actions_0.Subscription.SetGameSubscriptionProducts);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.LuaApp.Thunks.Subscription.ApiFetchSubscriptionsThumbnails);
local v7 = require(l_Modules_0.LuaApp.Thunks.Subscription.ApiFetchSubscriptionsStatus);
local v8 = require(l_Modules_0.LuaApp.Http.Requests.EconomyAPI.GameGetActiveSubscriptionProducts);
local v9 = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel);
local v10 = game:DefineFastFlag("ReduceActiveSubscriptionFetch", false);
return function(v11, v12) --[[ Line: 18 ]]
    -- upvalues: l_PerformFetch_0 (copy), v8 (copy), v10 (copy), v4 (copy), v9 (copy), v3 (copy), v6 (copy), v7 (copy)
    return l_PerformFetch_0.Single("ApiFetchGameSubscriptionProducts" .. v12, function(v13) --[[ Line: 19 ]]
        -- upvalues: v8 (ref), v11 (copy), v12 (copy), v10 (ref), v4 (ref), v9 (ref), v3 (ref), v6 (ref), v7 (ref)
        return v8(v11, v12):andThen(function(v14) --[[ Line: 20 ]]
            -- upvalues: v10 (ref), v4 (ref), v9 (ref), v13 (copy), v3 (ref), v12 (ref), v6 (ref), v11 (ref), v7 (ref)
            if v10 then
                if v14 == nil or v14.responseBody == nil or v14.responseBody.subscriptionProductsInfo == nil then
                    return v4.reject();
                else
                    local l_subscriptionProductsInfo_0 = v14.responseBody.subscriptionProductsInfo;
                    local v16 = {};
                    local v17 = {};
                    local v18 = {};
                    for _, v20 in l_subscriptionProductsInfo_0 do
                        local v21 = v9.fromJsonData(v20);
                        table.insert(v16, v21);
                        table.insert(v17, v21.iconImageAssetId);
                        table.insert(v18, v21.subscriptionTargetKey);
                    end;
                    v13:dispatch(v3(v12, v16));
                    v13:dispatch(v6(v11, v17));
                    v13:dispatch(v7(v11, v18, v12));
                    return v4.resolve();
                end;
            else
                local v22 = if v14 and v14.responseBody and v14.responseBody.subscriptionProductsInfo then v14.responseBody.subscriptionProductsInfo else {};
                local v23 = {};
                local v24 = {};
                local v25 = {};
                if #v22 == 0 then
                    return v4.resolve();
                else
                    for _, v27 in v22 do
                        local v28 = v9.fromJsonData(v27);
                        table.insert(v23, v28);
                        table.insert(v24, v28.iconImageAssetId);
                        table.insert(v25, v28.subscriptionTargetKey);
                    end;
                    v13:dispatch(v3(v12, v23));
                    v13:dispatch(v6(v11, v24));
                    v13:dispatch(v7(v11, v25, v12));
                    return v4.resolve();
                end;
            end;
        end, function(_) --[[ Line: 74 ]]
            -- upvalues: v4 (ref)
            return v4.resolve();
        end);
    end);
end;