local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v6 = require(l_Parent_0.Models.ExperienceInfo);
local v7 = require(l_Parent_0.Actions.SetExperienceInfo);
local v8 = require(l_Parent_0.Thunks.SendCounter);
local v9 = require(l_Parent_0.Constants);
local v10 = {
    v4
};
local v11 = v5("getExperienceInfo");
return function(v12) --[[ Line: 23 ]] --[[ Name: GetExperienceInfo ]]
    -- upvalues: v3 (copy), v10 (copy), v4 (copy), v11 (copy), l_PerformFetch_0 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    v12 = tostring(v12);
    return v3.new(script.Name, v10, function(v13, v14) --[[ Line: 26 ]]
        -- upvalues: v4 (ref), v11 (ref), v12 (ref), l_PerformFetch_0 (ref), v6 (ref), v7 (ref), v8 (ref), v9 (ref)
        local v15 = v14[v4];
        local v16 = v11(v13:getState().storeId, v12);
        return l_PerformFetch_0.Single(v16, function() --[[ Line: 31 ]]
            -- upvalues: v15 (copy), v12 (ref), v6 (ref), v13 (copy), v7 (ref), v8 (ref), v9 (ref)
            return v15.getExperienceInfo(v12):andThen(function(v17) --[[ Line: 32 ]]
                -- upvalues: v6 (ref), v13 (ref), v7 (ref), v8 (ref), v9 (ref)
                local v18 = v17.data[1];
                local v19 = v6.fromGetExperienceInfo(v18);
                v13:dispatch(v7(v19));
                v13:dispatch(v8(v9.Counters.GetExperienceInfo .. v9.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 40 ]]
                -- upvalues: v13 (ref), v8 (ref), v9 (ref)
                v13:dispatch(v8(v9.Counters.GetExperienceInfo .. v9.CounterSuffix.RequestRejected));
            end);
        end)(v13):catch(function(_) --[[ Line: 45 ]]
            -- upvalues: v13 (copy), v8 (ref), v9 (ref)
            v13:dispatch(v8(v9.Counters.GetExperienceInfo .. v9.CounterSuffix.RequestFailed));
        end);
    end);
end;