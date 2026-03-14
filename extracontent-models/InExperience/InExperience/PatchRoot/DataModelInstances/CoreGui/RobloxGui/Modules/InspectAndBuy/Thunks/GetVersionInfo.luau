local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Models.AssetInfo);
local v6 = require(l_Parent_0.Actions.SetAssets);
local v7 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v8 = require(l_Parent_0.Thunks.GetExperiencePlayability);
local v9 = require(l_Parent_0.Thunks.GetExperienceInfo);
local v10 = require(l_Parent_0.Thunks.SendCounter);
local v11 = require(l_Parent_0.Constants);
local v12 = {
    v4
};
local v13 = v7("getVersionInfo");
return function(v14) --[[ Line: 29 ]] --[[ Name: GetVersionInfo ]]
    -- upvalues: v3 (copy), v12 (copy), v4 (copy), v13 (copy), l_PerformFetch_0 (copy), v5 (copy), v6 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    return v3.new(script.Name, v12, function(v15, v16) --[[ Line: 30 ]]
        -- upvalues: v4 (ref), v13 (ref), v14 (copy), l_PerformFetch_0 (ref), v5 (ref), v6 (ref), v8 (ref), v9 (ref), v10 (ref), v11 (ref)
        local v17 = v16[v4];
        local v18 = v13(v15:getState().storeId, v14);
        return l_PerformFetch_0.Single(v18, function() --[[ Line: 35 ]]
            -- upvalues: v17 (copy), v14 (ref), v5 (ref), v15 (copy), v6 (ref), v8 (ref), v9 (ref), v10 (ref), v11 (ref)
            return v17.getVersionInfo(v14):andThen(function(v19) --[[ Line: 36 ]]
                -- upvalues: v5 (ref), v14 (ref), v15 (ref), v6 (ref), v8 (ref), v9 (ref), v10 (ref), v11 (ref)
                local v20 = v19.data[1];
                local v21 = if v20 then v20.creatingUniverseId else nil;
                if v21 then
                    v21 = tostring(v21);
                    local v22 = v5.fromGetVersionInfo(v14, v20);
                    v15:dispatch(v6({
                        v22
                    }));
                    v15:dispatch(v8(v21));
                    v15:dispatch(v9(v21));
                end;
                v15:dispatch(v10(v11.Counters.GetVersionInfo .. v11.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 55 ]]
                -- upvalues: v15 (ref), v10 (ref), v11 (ref)
                v15:dispatch(v10(v11.Counters.GetVersionInfo .. v11.CounterSuffix.RequestRejected));
            end);
        end)(v15):catch(function(_) --[[ Line: 60 ]]
            -- upvalues: v15 (copy), v10 (ref), v11 (ref)
            v15:dispatch(v10(v11.Counters.GetVersionInfo .. v11.CounterSuffix.RequestFailed));
        end);
    end);
end;