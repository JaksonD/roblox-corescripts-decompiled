local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Thunk);
local v5 = require(l_Parent_0.Models.AssetInfo);
local v6 = require(l_Parent_0.Models.BundleInfo);
local v7 = require(l_Parent_0.Services.Network);
local v8 = require(l_Parent_0.Actions.SetAssets);
local v9 = require(l_Parent_0.Actions.SetBundles);
local v10 = require(l_Parent_0.Thunks.GetExperiencePlayability);
local v11 = require(l_Parent_0.Thunks.GetExperienceInfo);
local v12 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v13 = require(l_Parent_0.Thunks.SendCounter);
local v14 = require(l_Parent_0.Constants);
local l_FFlagIBV2Attribution_0 = v1.FFlagIBV2Attribution;
local v16 = {
    v7
};
local v17 = v12("getItemDetails");
return function(v18, v19) --[[ Line: 28 ]] --[[ Name: GetItemDetails ]]
    -- upvalues: v4 (copy), v16 (copy), v7 (copy), v17 (copy), l_PerformFetch_0 (copy), v5 (copy), v8 (copy), v6 (copy), v9 (copy), v13 (copy), v14 (copy), l_FFlagIBV2Attribution_0 (copy), v10 (copy), v11 (copy)
    return v4.new(script.Name, v16, function(v20, v21) --[[ Line: 29 ]]
        -- upvalues: v7 (ref), v17 (ref), v18 (copy), v19 (copy), l_PerformFetch_0 (ref), v5 (ref), v8 (ref), v6 (ref), v9 (ref), v13 (ref), v14 (ref), l_FFlagIBV2Attribution_0 (ref), v10 (ref), v11 (ref)
        local v22 = v21[v7];
        local v23 = v17(v20:getState().storeId, v18, v19);
        return l_PerformFetch_0.Single(v23, function() --[[ Line: 34 ]]
            -- upvalues: v22 (copy), v18 (ref), v19 (ref), v5 (ref), v20 (copy), v8 (ref), v6 (ref), v9 (ref), v13 (ref), v14 (ref), l_FFlagIBV2Attribution_0 (ref), v10 (ref), v11 (ref)
            return v22.getItemDetails(v18, v19):andThen(function(v24) --[[ Line: 35 ]]
                -- upvalues: v19 (ref), v5 (ref), v20 (ref), v8 (ref), v6 (ref), v9 (ref), v13 (ref), v14 (ref), l_FFlagIBV2Attribution_0 (ref), v10 (ref), v11 (ref)
                if v19 == Enum.AvatarItemType.Asset then
                    local v25 = v5.fromGetItemDetails(v24);
                    v20:dispatch(v8({
                        v25
                    }));
                elseif v19 == Enum.AvatarItemType.Bundle then
                    local v26 = v6.fromGetItemDetails(v24);
                    v20:dispatch(v9({
                        v26
                    }));
                else
                    v20:dispatch(v13(v14.Counters.GetItemDetailsRespondedWithUnknownItemType));
                end;
                if l_FFlagIBV2Attribution_0 and v24.CreatingUniverseId then
                    v20:dispatch(v10(v24.CreatingUniverseId));
                    v20:dispatch(v11(v24.CreatingUniverseId));
                end;
                v20:dispatch(v13(v14.Counters.GetItemDetails .. v14.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 54 ]]
                -- upvalues: v20 (ref), v13 (ref), v14 (ref)
                v20:dispatch(v13(v14.Counters.GetItemDetails .. v14.CounterSuffix.RequestRejected));
            end);
        end)(v20):catch(function(_) --[[ Line: 59 ]]
            -- upvalues: v20 (copy), v13 (ref), v14 (ref)
            v20:dispatch(v13(v14.Counters.GetItemDetails .. v14.CounterSuffix.RequestFailed));
        end);
    end);
end;