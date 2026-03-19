local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v2 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_OmniFeedService_0 = require(l_CorePackages_0.Workspace.Packages.OmniFeedService).OmniFeedService;
local l_FeedItemModel_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.DataStore.FeedItemModel;
local v6 = game:DefineFastFlag("FixFeedItemRenderedRowsEqualityCheck", false);
return {
    combineOmniFeedItems = function(v7, v8) --[[ Line: 14 ]] --[[ Name: combineOmniFeedItems ]]
        -- upvalues: l_OmniFeedService_0 (copy), v2 (copy), l_FeedItemModel_0 (copy), v1 (copy)
        local v9 = {};
        local v10 = {};
        local v11 = l_OmniFeedService_0.get():getOmniFeedItemMap();
        if v8 then
            for _, v13 in ipairs(v8) do
                if v13.dataSource ~= v2.DataSourceType.Local and v11.hasComponent(v13.treatmentType) then
                    local v14 = l_FeedItemModel_0.getUniqueNameForFeed(v13);
                    if v14 then
                        v1.assert(v10[v14] == nil, "Duplicate feed item id detected: " .. tostring(v14));
                        v10[v14] = v13;
                    end;
                    table.insert(v9, v13);
                end;
            end;
        end;
        if v7 then
            for _, v16 in ipairs(v7) do
                if v16.dataSource == v2.DataSourceType.Local and v11.hasComponent(v16.treatmentType) then
                    local v17 = l_FeedItemModel_0.getUniqueNameForFeed(v16);
                    assert(v17);
                    if v10[v17] == nil then
                        v10[v17] = v16;
                        local v18 = nil;
                        if v16.orderHint then
                            v18 = v16.orderHint;
                            while v18 <= #v9 and v9[v18] and v9[v18].dataSource == v2.DataSourceType.Local and v9[v18].orderHint and v9[v18].orderHint == v16.orderHint do
                                v18 = v18 + 1;
                            end;
                        end;
                        if v18 ~= nil and v18 <= #v9 then
                            table.insert(v9, v18, v16);
                        else
                            table.insert(v9, v16);
                        end;
                    end;
                end;
            end;
        end;
        return v9;
    end, 
    setFeedItemRenderedRows = function(v19, v20, v21, v22) --[[ Line: 90 ]]
        -- upvalues: v1 (copy), l_FeedItemModel_0 (copy), v6 (copy), v3 (copy)
        if not v19 then
            return nil;
        else
            local v23 = v19[v20];
            if not v23 then
                return nil;
            elseif v23 ~= v21 then
                return nil;
            else
                v1.assert(v23.actualRenderedRows ~= nil, (("WARNING: feed item was not set up for overwriting its number of rows.  \"actualRenderedRows\" should be defined in the FeedItemModel (feed item: %*"):format((l_FeedItemModel_0.getUniqueNameForAnalytics(v23)))));
                local v24 = if v6 then v22 or -1 else nil;
                if v23.actualRenderedRows == if v6 then v24 else v22 then
                    return nil;
                else
                    local v25 = table.clone(v19);
                    v25[v20] = v3.Dictionary.join(v25[v20], {
                        actualRenderedRows = if v6 then v24 else v22 or -1
                    });
                    return v25;
                end;
            end;
        end;
    end
};