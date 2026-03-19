local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromCatalogItemAction);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromCatalogItemAction);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromBundleItemAction);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleItemData);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResaleData);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v18 = require(l_Modules_0.AvatarExperience.Common.Models.AssetInfo);
local v19 = require(l_Modules_0.AvatarExperience.Common.Models.BundleInfo);
local v20 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v22 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v23 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local l_FFlagAXInventoryDurablesSupport_0 = v4.FFlagAXInventoryDurablesSupport;
local l_FVariable_0 = settings():GetFVariable("LuaAppsPageLoadTimeItemDetails");
local function _(v30, v31) --[[ Line: 57 ]] --[[ Name: keyMapper ]]
    -- upvalues: v12 (copy)
    return v12.GetItemDetailsKey(v30, v31);
end;
local function _(v33, v34) --[[ Line: 61 ]] --[[ Name: checkIfReceivedFromBundleItemData ]]
    local v35 = v33.AvatarExperience.Common.AssetInfos[v34];
    if v35 and v35.receivedFromBundleItemData then
        return true;
    else
        return false;
    end;
end;
local function v43(v37, v38, v39, v40) --[[ Line: 69 ]]
    -- upvalues: v14 (copy), v17 (copy), v15 (copy), v6 (copy), v16 (copy), v3 (copy)
    local v41 = {
        v37:dispatch(v14(v38, v39))
    };
    local l_LocalUserId_0 = v37:getState().LocalUserId;
    table.insert(v41, v37:dispatch(v17(v38, v39, l_LocalUserId_0)));
    if v40 then
        table.insert(v41, v37:dispatch(v15(v38, v39, nil, v6.MaxResellersPerPage)));
        table.insert(v41, v37:dispatch(v16(v38, v39)));
    end;
    return v3.all(v41);
end;
local function v62(v44, v45, v46, v47, v48) --[[ Line: 97 ]] --[[ Name: processSuccessfulResult ]]
    -- upvalues: v7 (copy), v8 (copy), v11 (copy), v19 (copy), v43 (copy), v9 (copy), v18 (copy), v12 (copy), v13 (copy), v6 (copy)
    local v49 = v47:getState();
    if v46 == v7.ItemType.Bundle then
        v47:dispatch(v8(v45, v48));
        local v50 = {};
        if v48.bundledItems then
            for _, v52 in v48.bundledItems do
                local v53 = tostring(v52.id);
                if v52.Type == v7.ItemType.Asset then
                    local v54 = v49.AvatarExperience.Common.AssetInfos[v53];
                    if not (v54 and v54.receivedFromBundleItemData and true or false) then
                        table.insert(v50, v52);
                    end;
                end;
            end;
            if #v50 > 0 then
                v47:dispatch(v11(v50));
            end;
        end;
        local v55 = v19.fromGetCatalogItemData(v48);
        local l_collectibleItemId_0 = v55.collectibleItemId;
        local l_hasResellers_0 = v55.hasResellers;
        if l_collectibleItemId_0 then
            v43(v47, v44, l_collectibleItemId_0, l_hasResellers_0);
            return;
        end;
    elseif v46 == v7.ItemType.Asset then
        v47:dispatch(v9(v45, v48));
        local v58 = v18.fromGetCatalogItemData(v48);
        local v59 = v12.IsResellable(v58);
        local l_collectibleItemId_1 = v58.collectibleItemId;
        local l_hasResellers_1 = v58.hasResellers;
        if l_collectibleItemId_1 then
            v43(v47, v44, l_collectibleItemId_1, l_hasResellers_1);
            return;
        elseif v59 then
            v47:dispatch(v13(v44, v45, nil, v6.MaxResellersPerPage));
        end;
    end;
end;
return function(v63, v64, v65, v66, v67) --[[ Line: 144 ]]
    -- upvalues: v5 (copy), v7 (copy), l_PerformFetch_0 (copy), v12 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v43 (copy), v13 (copy), v6 (copy), v3 (copy), v20 (copy), v62 (copy), v23 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v22 (copy), l_Logging_0 (copy), l_FVariable_0 (copy)
    v5.isType(v65, "string", "FetchAssetOrBundleInfo request expects itemId");
    v5.isType(v66, "string", "FetchAssetOrBundleInfo request expects itemType");
    return function(v68, v69) --[[ Line: 148 ]]
        -- upvalues: v66 (copy), v7 (ref), v65 (copy), l_PerformFetch_0 (ref), v12 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v67 (copy), v43 (ref), v63 (copy), v13 (ref), v6 (ref), v3 (ref), v20 (ref), v62 (ref), v23 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v22 (ref), l_Logging_0 (ref), v64 (copy), l_FVariable_0 (ref)
        local l_avatarEditorService_0 = v69.avatarEditorService;
        local v71 = tick();
        local v72 = v68:getState();
        local v73 = nil;
        local v74 = nil;
        if v66 == v7.ItemType.Asset then
            v73 = v72.AvatarExperience.Common.AssetInfos[v65];
        elseif v66 == v7.ItemType.Bundle then
            v73 = v72.AvatarExperience.Common.BundleInfos[v65];
        end;
        v74 = v73 and v73.collectibleItemId;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v65_0 = v65;
        local l_v66_0 = v66;
        return l_Single_0(v12.GetItemDetailsKey(l_v65_0, l_v66_0), function(v78) --[[ Line: 162 ]]
            -- upvalues: v73 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), l_FFlagAXInventoryDurablesSupport_0 (ref), v67 (ref), v74 (ref), v43 (ref), v63 (ref), v12 (ref), v13 (ref), v65 (ref), v6 (ref), v3 (ref), l_avatarEditorService_0 (copy), v66 (ref), v20 (ref), v62 (ref), v23 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v22 (ref), l_Logging_0 (ref), v71 (copy), v64 (ref), l_FVariable_0 (ref)
            local v79 = false;
            if v73 ~= nil then
                v79 = v73.receivedCatalogData;
            end;
            if l_FFlagAXMISEnableMultiShopping_0 or l_FFlagAXInventoryDurablesSupport_0 then
                local v80 = false;
                if v73 ~= nil then
                    v80 = v73.receivedCatalogData and not v67;
                end;
                v79 = v80;
            end;
            if v79 then
                if v74 then
                    local l_hasResellers_2 = v73.hasResellers;
                    return v43(v78, v63, v74, l_hasResellers_2);
                elseif v12.IsResellable(v73) then
                    return v78:dispatch(v13(v63, v65, nil, v6.MaxResellersPerPage));
                else
                    return v3.resolve();
                end;
            else
                return v3.new(function(v82, v83) --[[ Line: 183 ]]
                    -- upvalues: l_avatarEditorService_0 (ref), v65 (ref), v66 (ref), v20 (ref), v62 (ref), v63 (ref), v78 (copy), v23 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v22 (ref), l_Logging_0 (ref), v71 (ref), v64 (ref), l_FVariable_0 (ref)
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 184 ]]
                        -- upvalues: l_avatarEditorService_0 (ref), v65 (ref), v66 (ref)
                        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                            return l_avatarEditorService_0:GetItemDetailsAsync(tonumber(v65), v66);
                        else
                            return l_avatarEditorService_0:GetItemDetails(tonumber(v65), v66);
                        end;
                    end);
                    if l_status_0 then
                        l_result_0 = v20.tableToCamelCaseKeys(l_result_0);
                        v62(v63, v65, v66, v78, l_result_0);
                        v82(l_result_0);
                    else
                        if v23() then
                            l_reportAvatarEventCounterNoAnalyticsArgument_0(v22.Counter.AvatarEditorServiceErrors.FetchAssetOrBundleInfo);
                        end;
                        l_Logging_0.warn("FetchAssetOrBundleInfo failure: " .. l_result_0);
                        v83();
                    end;
                    local v86 = (tick() - v71) * 1000;
                    v64.Diag:reportStats(l_FVariable_0, v86);
                end);
            end;
        end)(v68);
    end;
end;