local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Actions.SetFavoriteBundle);
local v6 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v7 = require(l_Parent_0.Thunks.SendCounter);
local v8 = require(l_Parent_0.Constants);
local v9 = {
    v4
};
local v10 = v6("getFavoriteForBundle");
return function(v11) --[[ Line: 20 ]] --[[ Name: GetFavoriteForBundle ]]
    -- upvalues: v3 (copy), v9 (copy), v4 (copy), v10 (copy), l_PerformFetch_0 (copy), v5 (copy), v7 (copy), v8 (copy)
    return v3.new(script.Name, v9, function(v12, v13) --[[ Line: 21 ]]
        -- upvalues: v4 (ref), v10 (ref), v11 (copy), l_PerformFetch_0 (ref), v5 (ref), v7 (ref), v8 (ref)
        local v14 = v13[v4];
        local v15 = v10(v12:getState().storeId, v11);
        return l_PerformFetch_0.Single(v15, function(_) --[[ Line: 26 ]]
            -- upvalues: v14 (copy), v11 (ref), v12 (copy), v5 (ref), v7 (ref), v8 (ref)
            return v14.getFavoriteForBundle(v11):andThen(function(v17) --[[ Line: 27 ]]
                -- upvalues: v12 (ref), v5 (ref), v11 (ref), v7 (ref), v8 (ref)
                if v17 == "null" then
                    v12:dispatch(v5(tostring(v11), false));
                else
                    v12:dispatch(v5(tostring(v11), true));
                end;
                v12:dispatch(v7(v8.Counters.GetFavoriteForBundle .. v8.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 37 ]]
                -- upvalues: v12 (ref), v7 (ref), v8 (ref)
                v12:dispatch(v7(v8.Counters.GetFavoriteForBundle .. v8.CounterSuffix.RequestRejected));
            end);
        end)(v12):catch(function(_) --[[ Line: 42 ]]
            -- upvalues: v12 (copy), v7 (ref), v8 (ref)
            v12:dispatch(v7(v8.Counters.GetFavoriteForBundle .. v8.CounterSuffix.RequestFailed));
        end);
    end);
end;