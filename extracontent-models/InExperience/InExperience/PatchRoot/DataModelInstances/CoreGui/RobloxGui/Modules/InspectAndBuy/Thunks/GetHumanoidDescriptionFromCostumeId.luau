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
local v9 = v5("getHumanoidDescriptionFromCostumeId");
return function(v10, v11) --[[ Line: 19 ]] --[[ Name: GetHumanoidDescriptionFromCostumeId ]]
    -- upvalues: v3 (copy), v8 (copy), v4 (copy), v9 (copy), l_PerformFetch_0 (copy), v6 (copy), v7 (copy)
    return v3.new(script.Name, v8, function(v12, v13) --[[ Line: 20 ]]
        -- upvalues: v4 (ref), v9 (ref), v10 (copy), l_PerformFetch_0 (ref), v11 (copy), v6 (ref), v7 (ref)
        local v14 = v13[v4];
        local v15 = v9(v12:getState().storeId, v10);
        return l_PerformFetch_0.Single(v15, function() --[[ Line: 25 ]]
            -- upvalues: v14 (copy), v10 (ref), v11 (ref), v12 (copy), v6 (ref), v7 (ref)
            return v14.getHumanoidDescriptionFromCostumeId(v10):andThen(function(v16) --[[ Line: 26 ]]
                -- upvalues: v11 (ref), v12 (ref), v6 (ref), v7 (ref)
                v11(v16);
                v12:dispatch(v6(v7.Counters.GetHumanoidDescriptionFromCostumeId .. v7.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 34 ]]
                -- upvalues: v12 (ref), v6 (ref), v7 (ref)
                v12:dispatch(v6(v7.Counters.GetHumanoidDescriptionFromCostumeId .. v7.CounterSuffix.RequestRejected));
            end);
        end)(v12):catch(function(_) --[[ Line: 42 ]]
            -- upvalues: v12 (copy), v6 (ref), v7 (ref)
            v12:dispatch(v6(v7.Counters.GetHumanoidDescriptionFromCostumeId .. v7.CounterSuffix.RequestFailed));
        end);
    end);
end;