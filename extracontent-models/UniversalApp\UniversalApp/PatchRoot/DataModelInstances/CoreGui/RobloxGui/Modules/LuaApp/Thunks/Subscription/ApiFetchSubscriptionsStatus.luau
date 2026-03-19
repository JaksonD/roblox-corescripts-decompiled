local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.EconomyAPI.SubscriptionGetStatuses);
local v5 = require(l_Modules_0.LuaApp.Actions.Subscription.SetSubscriptionStatuses);
local v6 = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionStatusModel);
return function(v7, v8, v9) --[[ Line: 13 ]]
    -- upvalues: l_PerformFetch_0 (copy), v4 (copy), v6 (copy), v5 (copy), v2 (copy)
    return l_PerformFetch_0.Single("ApiFetchSubscriptionsStatus" .. v9, function(v10) --[[ Line: 14 ]]
        -- upvalues: v4 (ref), v7 (copy), v8 (copy), v6 (ref), v5 (ref), v2 (ref)
        return v4(v7, v8):andThen(function(v11) --[[ Line: 15 ]]
            -- upvalues: v8 (ref), v6 (ref), v10 (copy), v5 (ref)
            local v12 = {};
            for _, v14 in v8 do
                local v15 = v11[v14];
                if v15 then
                    v12[v14] = v6.fromJsonData(v15);
                end;
            end;
            return v10:dispatch(v5(v12));
        end, function(_) --[[ Line: 25 ]]
            -- upvalues: v2 (ref)
            return v2.resolve();
        end);
    end);
end;