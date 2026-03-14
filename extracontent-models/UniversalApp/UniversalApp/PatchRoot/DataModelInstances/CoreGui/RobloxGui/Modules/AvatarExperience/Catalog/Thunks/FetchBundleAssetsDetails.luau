local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromCatalogItemAction);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetResellers);
local v11 = require(l_Modules_0.AvatarExperience.Common.Models.AssetInfo);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.ReceivedBundleInfoForTryOn);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandleTryOnFailure);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.UpdateSortOrderDueToLCBundleLoaded);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v21 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_getTryOnItemReducerKey_0 = v4.Utils.getTryOnItemReducerKey;
local function _(v23) --[[ Line: 40 ]] --[[ Name: keyMapper ]]
    -- upvalues: v9 (copy)
    return v9.GetBatchItemDetailsKey(v23);
end;
local function v36(v25, v26, _, v28, v29) --[[ Line: 44 ]] --[[ Name: processSuccessfulResult ]]
    -- upvalues: v7 (copy), v11 (copy), v9 (copy), v10 (copy), v6 (copy), l_getTryOnItemReducerKey_0 (copy), v21 (copy), v13 (copy), v15 (copy)
    local v30 = v28:getState();
    for _, v32 in v29 do
        local v33 = tostring(v32.id);
        v28:dispatch(v7(v33, v32));
        local v34 = v11.fromGetCatalogItemData(v32);
        if v9.IsResellable(v34) then
            v28:dispatch(v10(v25, v33, nil, v6.MaxResellersPerPage));
        end;
    end;
    local v35 = l_getTryOnItemReducerKey_0(v26, v21.ItemType.Bundle);
    if v30.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems[v35] then
        v28:dispatch(v13(v26));
        v28:dispatch(v15(v26));
    end;
end;
return function(v37, v38, v39) --[[ Line: 72 ]]
    -- upvalues: v5 (copy), l_PerformFetch_0 (copy), v9 (copy), v3 (copy), v12 (copy), v36 (copy), v18 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v17 (copy), l_Logging_0 (copy), v14 (copy)
    v5.isType(v39, "table", "FetchBundleAssetsDetails request expects itemIds");
    return function(v40, v41) --[[ Line: 74 ]]
        -- upvalues: l_PerformFetch_0 (ref), v39 (copy), v9 (ref), v3 (ref), v12 (ref), v36 (ref), v37 (copy), v38 (copy), v18 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v17 (ref), l_Logging_0 (ref), v14 (ref)
        local l_avatarEditorService_0 = v41.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v39_0 = v39;
        return l_Single_0(v9.GetBatchItemDetailsKey(l_v39_0), function(v45) --[[ Line: 76 ]]
            -- upvalues: v3 (ref), l_avatarEditorService_0 (copy), v39 (ref), v12 (ref), v36 (ref), v37 (ref), v38 (ref), v18 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v17 (ref), l_Logging_0 (ref), v14 (ref)
            return v3.new(function(v46, v47) --[[ Line: 77 ]]
                -- upvalues: l_avatarEditorService_0 (ref), v39 (ref), v12 (ref), v36 (ref), v37 (ref), v38 (ref), v45 (copy), v18 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v17 (ref), l_Logging_0 (ref), v14 (ref)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 78 ]]
                    -- upvalues: l_avatarEditorService_0 (ref), v39 (ref)
                    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                        return l_avatarEditorService_0:GetBatchItemDetailsAsync(v39, Enum.AvatarItemType.Asset);
                    else
                        return l_avatarEditorService_0:GetBatchItemDetails(v39, Enum.AvatarItemType.Asset);
                    end;
                end);
                if l_status_0 then
                    l_result_0 = v12.tableToCamelCaseKeys(l_result_0);
                    v36(v37, v38, v39, v45, l_result_0);
                    v46(l_result_0);
                    return;
                else
                    if v18() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v17.Counter.AvatarEditorServiceErrors.GetBatchItemDetails);
                    end;
                    l_Logging_0.warn("FetchBundleAssetsDetails failure: " .. tostring(l_result_0));
                    v45:dispatch(v14(v38));
                    v47();
                    return;
                end;
            end);
        end)(v40);
    end;
end;