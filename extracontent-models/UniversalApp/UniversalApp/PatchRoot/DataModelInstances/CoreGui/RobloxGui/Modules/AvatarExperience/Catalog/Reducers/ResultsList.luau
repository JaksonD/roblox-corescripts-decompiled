local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearAllResultsListFocusedWidgets);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v10 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP);
return v3.createReducer({}, {
    [v5.name] = function(v11, v12) --[[ Line: 50 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v11, {
            [v12.searchUuid] = {
                focusedWidget = {
                    id = v12.id, 
                    active = true, 
                    title = v12.title or "", 
                    description = v12.description or "", 
                    localizedTitle = v12.localizedTitle or "", 
                    localizedDescription = v12.localizedDescription or "", 
                    localizedTooltip = v12.localizedTooltip or "", 
                    tooltip = v12.tooltip or ""
                }, 
                hideTopBar = true
            }
        });
    end, 
    [v6.name] = function(v13, v14) --[[ Line: 67 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v13, {
            [v14.searchUuid] = {}
        });
    end, 
    [v7.name] = function(_, _) --[[ Line: 72 ]]
        return {};
    end, 
    [v8.PercievedTrackingStarted.name] = function(v17, v18) --[[ Line: 75 ]]
        -- upvalues: v4 (copy)
        return (v4.Dictionary.join(v17, {
            perceivedStartTime = v18.startPerceivedTime
        }));
    end, 
    [v8.StartTracking.name] = function(v19, v20) --[[ Line: 81 ]]
        -- upvalues: v9 (copy), v4 (copy)
        if not v9() then
            return v19;
        else
            local l_searchUuid_0 = v20.searchUuid;
            local v22 = v19[l_searchUuid_0] or {};
            local v23 = v22 and v22.tileLoadingLatency or {};
            local v24 = v4.Dictionary.join(v19, {
                [l_searchUuid_0] = v4.Dictionary.join(v22, {
                    tileLoadingLatency = v4.Dictionary.join(v23, {
                        startTime = v20.startTime
                    })
                })
            });
            v24[l_searchUuid_0].tileLoadingLatency.endTime = nil;
            return v24;
        end;
    end, 
    [v8.EndTracking.name] = function(v25, v26) --[[ Line: 98 ]]
        -- upvalues: v9 (copy), v4 (copy)
        if not v9() then
            return v25;
        else
            local l_searchUuid_1 = v26.searchUuid;
            local v28 = v25[l_searchUuid_1] or {};
            return (v4.Dictionary.join(v25, {
                [l_searchUuid_1] = v4.Dictionary.join(v28, {
                    tileLoadingLatency = v4.Dictionary.join(v28 and v28.tileLoadingLatency or {}, {
                        endTime = v26.endTime
                    })
                }), 
                perceivedStartTime = v4.None
            }));
        end;
    end, 
    [v8.AppendThumbnails.name] = v10.isEnabled() and function(v29, v30) --[[ Line: 116 ]]
        local l_thumbnailsMap_0 = v30.thumbnailsMap;
        if not l_thumbnailsMap_0 then
            return v29;
        else
            local v32 = table.clone(v29);
            for v33, v34 in l_thumbnailsMap_0 do
                local v35 = table.clone(v32[v33] or {});
                local v36 = table.clone(v35.tileLoadingLatency or {});
                local v37 = table.clone(v36.thumbnails or {});
                for _, v39 in v34 do
                    v37[v39] = v37[v39] or false;
                end;
                v36.thumbnails = v37;
                v35.tileLoadingLatency = v36;
                v32[v33] = v35;
            end;
            return v32;
        end;
    end or nil, 
    [v8.AppendThumbnail.name] = function(v40, v41) --[[ Line: 139 ]]
        -- upvalues: v9 (copy), v4 (copy)
        if not v9() then
            return v40;
        else
            local l_searchUuid_2 = v41.searchUuid;
            local v43 = v40[l_searchUuid_2] or {};
            local v44 = v43 and v43.tileLoadingLatency or {};
            local v45 = v44 and v44.thumbnails or {};
            v44.thumbnails = v4.Dictionary.join(v45, {
                [v41.thumbnailId] = false
            });
            return v4.Dictionary.join(v40, {
                [l_searchUuid_2] = v4.Dictionary.join(v43, {
                    tileLoadingLatency = v44
                })
            });
        end;
    end, 
    [v8.SetLoadedThumbnails.name] = v10.isEnabled() and function(v46, v47) --[[ Line: 158 ]]
        local l_searchUuid_3 = v47.searchUuid;
        local v49 = table.clone(v46 or {});
        local v50 = table.clone(v49[l_searchUuid_3] or {});
        local v51 = table.clone(v50.tileLoadingLatency or {});
        local v52 = v50.tileLoadingLatency and v50.tileLoadingLatency.thumbnails and table.clone(v50.tileLoadingLatency.thumbnails) or {};
        if v47.thumbnailIds then
            for _, v54 in v47.thumbnailIds do
                v52[v54] = true;
            end;
        end;
        v51.thumbnails = v52;
        v50.tileLoadingLatency = v51;
        v49[l_searchUuid_3] = v50;
        return v49;
    end or nil, 
    [v8.SetLoadedThumbnail.name] = function(v55, v56) --[[ Line: 181 ]]
        -- upvalues: v9 (copy), v4 (copy)
        if not v9() then
            return v55;
        else
            local v57 = v55[v56.searchUuid] or {};
            local v58 = v57 and v57.tileLoadingLatency or {};
            v58.thumbnails = v4.Dictionary.join(v58.thumbnails or {}, {
                [v56.thumbnailId] = true
            });
            return v4.Dictionary.join(v55, {
                [v56.searchUuid] = v4.Dictionary.join(v57, {
                    tileLoadingLatency = v58
                })
            });
        end;
    end
});