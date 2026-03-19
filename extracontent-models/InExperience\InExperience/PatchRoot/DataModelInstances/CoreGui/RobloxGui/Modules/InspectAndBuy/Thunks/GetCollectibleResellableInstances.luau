local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Actions.SetCollectibleResellableInstances);
local v6 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v7 = require(l_Parent_0.Thunks.SendCounter);
local v8 = require(l_Parent_0.Constants);
local v9 = {
    v4
};
local v10 = v6("getCollectibleResellableInstances");
return function(v11, v12) --[[ Line: 17 ]] --[[ Name: GetCollectibleResellableInstances ]]
    -- upvalues: v3 (copy), v9 (copy), v4 (copy), v10 (copy), l_PerformFetch_0 (copy), v5 (copy), v7 (copy), v8 (copy)
    return v3.new(script.Name, v9, function(v13, v14) --[[ Line: 18 ]]
        -- upvalues: v4 (ref), v10 (ref), v11 (copy), v12 (copy), l_PerformFetch_0 (ref), v5 (ref), v7 (ref), v8 (ref)
        local v15 = v14[v4];
        local v16 = v10(v13:getState().storeId, v11, v12);
        return l_PerformFetch_0.Single(v16, function() --[[ Line: 23 ]]
            -- upvalues: v15 (copy), v11 (ref), v12 (ref), v13 (copy), v5 (ref), v7 (ref), v8 (ref)
            return v15.getCollectibleResellableInstances(v11, v12):andThen(function(v17) --[[ Line: 24 ]]
                -- upvalues: v13 (ref), v5 (ref), v11 (ref), v7 (ref), v8 (ref)
                local v18 = v17 and v17.itemInstances;
                if v18 then
                    v13:dispatch(v5(v11, v18));
                end;
                if v18 then
                    v13:dispatch(v7(v8.Counters.GetCollectibleResellableInstances .. v8.CounterSuffix.RequestSucceeded));
                    return;
                else
                    v13:dispatch(v7(v8.Counters.GetCollectibleResellableInstancesRequestSucceededWithoutResult));
                    return;
                end;
            end, function(_) --[[ Line: 42 ]]
                -- upvalues: v13 (ref), v7 (ref), v8 (ref)
                v13:dispatch(v7(v8.Counters.GetCollectibleResellableInstances .. v8.CounterSuffix.RequestRejected));
            end);
        end)(v13):catch(function(_) --[[ Line: 49 ]]
            -- upvalues: v13 (copy), v7 (ref), v8 (ref)
            v13:dispatch(v7(v8.Counters.GetCollectibleResellableInstances .. v8.CounterSuffix.RequestFailed));
        end);
    end);
end;