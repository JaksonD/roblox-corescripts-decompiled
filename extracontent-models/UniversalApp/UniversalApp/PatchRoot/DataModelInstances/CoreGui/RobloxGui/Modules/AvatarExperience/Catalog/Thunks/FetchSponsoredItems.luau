local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSponsoredItems);
local l_sendAXStat_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXStat;
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v13, v14, v15) --[[ Line: 25 ]]
    -- upvalues: v7 (copy), l_PerformFetch_0 (copy), v6 (copy), v10 (copy), v4 (copy), v5 (copy), v8 (copy), v9 (copy), l_sendAXStat_0 (copy), v12 (copy), v2 (copy)
    local v16 = v7.GetSponsoredItemsKey(v14, v15);
    local v17 = os.clock();
    return l_PerformFetch_0.Single(v16, function(v18) --[[ Line: 28 ]]
        -- upvalues: v6 (ref), v13 (copy), v14 (copy), v15 (copy), v10 (ref), v4 (ref), v5 (ref), v8 (ref), v9 (ref), v17 (copy), l_sendAXStat_0 (ref), v12 (ref), v2 (ref)
        return v6.FetchSponsoredItems(v13, v14, v15):andThen(function(v19) --[[ Line: 30 ]]
            -- upvalues: v18 (copy), v10 (ref), v14 (ref), v4 (ref), v6 (ref), v13 (ref)
            local v20 = v19.responseBody.data or {};
            v18:dispatch(v10(v14, v20));
            local v22 = v4.map(v20, function(v21) --[[ Line: 39 ]]
                return {
                    id = v21.id, 
                    itemType = v21.itemType
                };
            end);
            return (v6.FetchItemDetails(v13, v22));
        end):andThen(function(v23) --[[ Line: 47 ]]
            -- upvalues: v5 (ref), v18 (copy), v8 (ref), v9 (ref), v17 (ref), l_sendAXStat_0 (ref), v12 (ref), v2 (ref)
            local l_responseBody_0 = v23.responseBody;
            l_responseBody_0.data = l_responseBody_0.data or {};
            local v25 = {};
            local v26 = {};
            for _, v28 in l_responseBody_0.data do
                if v28.itemType == v5.ItemType.Asset then
                    table.insert(v25, v28);
                elseif v28.itemType == v5.ItemType.Bundle then
                    table.insert(v26, v28);
                end;
            end;
            if #v25 > 0 then
                v18:dispatch(v8(v25));
            end;
            if #v26 > 0 then
                v18:dispatch(v9(v26));
            end;
            local v29 = (os.clock() - v17) * 1000;
            l_sendAXStat_0({
                statName = v12.Counter.Latency.Network.FetchSponsoredItems, 
                deltaMs = v29
            });
            return v2.resolve();
        end);
    end);
end;