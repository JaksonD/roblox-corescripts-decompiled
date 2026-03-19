local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v6 = require(l_Parent_0.Thunks.SendCounter);
local v7 = require(l_Parent_0.Constants);
local v8 = {
    v4
};
local v9 = v5("getPlayerModel");
return function(v10, v11, v12) --[[ Line: 19 ]] --[[ Name: GetCharacterModelFromUserId ]]
    -- upvalues: v3 (copy), v8 (copy), v4 (copy), v9 (copy), l_PerformFetch_0 (copy), v6 (copy), v7 (copy)
    return v3.new(script.Name, v8, function(v13, v14) --[[ Line: 20 ]]
        -- upvalues: v4 (ref), v9 (ref), v10 (copy), v11 (copy), l_PerformFetch_0 (ref), v12 (copy), v6 (ref), v7 (ref)
        local v15 = v14[v4];
        local v16 = v9(v13:getState().storeId, v10, v11);
        return l_PerformFetch_0.Single(v16, function() --[[ Line: 25 ]]
            -- upvalues: v15 (copy), v10 (ref), v12 (ref), v13 (copy), v6 (ref), v7 (ref)
            return v15.getModelFromUserId(v10):andThen(function(v17) --[[ Line: 26 ]]
                -- upvalues: v12 (ref), v13 (ref), v6 (ref), v7 (ref)
                v12(v17);
                v13:dispatch(v6(v7.Counters.GetCharacterModelFromUserId .. v7.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 33 ]]
                -- upvalues: v13 (ref), v6 (ref), v7 (ref)
                v13:dispatch(v6(v7.Counters.GetCharacterModelFromUserId .. v7.CounterSuffix.RequestRejected));
            end);
        end)(v13):catch(function(_) --[[ Line: 40 ]]
            -- upvalues: v13 (copy), v6 (ref), v7 (ref)
            v13:dispatch(v6(v7.Counters.GetCharacterModelFromUserId .. v7.CounterSuffix.RequestFailed));
        end);
    end);
end;