local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRecommendedItemsV2);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromAvatarEditorRecommendedItemsV2);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBundleInfoFromAvatarEditorRecommendedItemsV2);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults);
local v15 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize);
local v17 = game:DefineFastInt("AXRecommendedNoOfAllItems", 12);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXTimedOptionsSalesTypeFilter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXTimedOptionsSalesTypeFilter;
local v20 = require(l_Modules_0.AvatarExperience.Experiments.AXEditorRecommendationCarousel);
local v21 = game:DefineFastInt("AXYouMayAlsoLikeCarouselNoOfItems", 25);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local function _(v23) --[[ Line: 34 ]] --[[ Name: keyMapper ]]
    -- upvalues: v10 (copy)
    return v10.RecommendedItemsKey .. tostring(v23);
end;
local function v41(v25, v26, v27, v28, v29, v30) --[[ Line: 38 ]] --[[ Name: fetchRecommendedItems ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy), v17 (copy), v10 (copy), v13 (copy), v14 (copy), v6 (copy), l_Logging_0 (copy)
    local v31 = CatalogSearchParams.new();
    v31.SalesTypeFilter = Enum.SalesTypeFilter.All;
    v31.SortType = Enum.CatalogSortType.Relevance;
    v31.CategoryFilter = Enum.CatalogCategoryFilter.Recommended;
    v31.IncludeOffSale = false;
    v31.SortAggregation = Enum.CatalogSortAggregation.AllTime;
    v31.Limit = 120;
    if game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and l_FFlagAXDurablesSupport_0 and not l_FFlagAXTimedOptionsSalesTypeFilter_0 then
        v31.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 62 ]]
        -- upvalues: v26 (copy), v31 (copy)
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            return v26:SearchCatalogAsync(v31);
        else
            return v26:SearchCatalog(v31);
        end;
    end);
    if l_status_0 then
        local l_l_result_0_CurrentPage_0 = l_result_0:GetCurrentPage();
        local l_v17_0 = v17;
        local v36 = {};
        local v37 = {};
        local v38 = {};
        for v39, v40 in l_l_result_0_CurrentPage_0 do
            if v39 < l_v17_0 + 1 then
                if v40.ItemType == v10.ItemType.Asset then
                    table.insert(v36, v40);
                elseif v40.ItemType == v10.ItemType.Bundle then
                    table.insert(v37, v40);
                end;
                table.insert(v38, {
                    itemType = v40.ItemType, 
                    id = v40.Id
                });
            end;
        end;
        v25:dispatch(v13(v36));
        v25:dispatch(v14(v37));
        v25:dispatch(v6(v38, v27, v28));
        v29(l_result_0);
        return;
    else
        l_Logging_0.warn("GetRecommendedItems failure: " .. tostring(l_result_0));
        v30({
            HttpError = Enum.HttpError.OK
        });
        return;
    end;
end;
return function(v42, v43, v44) --[[ Line: 102 ]]
    -- upvalues: v4 (copy), v20 (copy), v15 (copy), v11 (copy), v10 (copy), v16 (copy), v3 (copy), l_PerformFetch_0 (copy), v41 (copy), v21 (copy), v9 (copy), v7 (copy), v8 (copy), v6 (copy), l_Logging_0 (copy)
    return function(v45, v46) --[[ Line: 103 ]]
        -- upvalues: v4 (ref), v42 (copy), v43 (copy), v44 (copy), v20 (ref), v15 (ref), v11 (ref), v10 (ref), v16 (ref), v3 (ref), l_PerformFetch_0 (ref), v41 (ref), v21 (ref), v9 (ref), v7 (ref), v8 (ref), v6 (ref), l_Logging_0 (ref)
        v4.isType(v42, "function", "GetRecommendedItems thunk expects networkImpl");
        v4.isTypeOrNil(v43, "string", "GetRecommendedItems thunk expects assetTypeIdString");
        v4.isType(v44, "string", "GetRecommendedItems thunk expects recommendationsType");
        local v47 = if v20.isEnabled() then v15.readTestVariable(v20.EnableAvatarEditorRecommendationCarousel) else nil;
        if not (v44 and v44 ~= v11.RecommendationsType.None) then
            return nil;
        else
            local l_v43_0 = v43;
            local l_v43_1 = v43;
            local v50 = true;
            if v44 ~= v11.RecommendationsType.Asset then
                l_v43_0 = v44;
                v50 = false;
                if v44 == v11.RecommendationsType.BodyParts then
                    l_v43_1 = v10.BundleTypeIdStrings.BodyParts;
                elseif v44 == v11.RecommendationsType.AvatarAnimations then
                    l_v43_1 = v10.BundleTypeIdStrings.Animations;
                elseif v44 == v11.RecommendationsType.Shoes then
                    l_v43_1 = v10.BundleTypeIdStrings.Shoes;
                elseif v44 == v11.RecommendationsType.DynamicHeads then
                    l_v43_1 = v10.BundleTypeIdStrings.DynamicHead;
                end;
            end;
            if v16() and v44 == v11.RecommendationsType.All then
                local l_avatarEditorService_0 = v46.avatarEditorService;
                return v3.new(function(v52, v53) --[[ Line: 142 ]]
                    -- upvalues: l_PerformFetch_0 (ref), l_v43_0 (ref), v10 (ref), v41 (ref), l_avatarEditorService_0 (copy), v44 (ref), v45 (copy)
                    local l_Single_0 = l_PerformFetch_0.Single;
                    local l_l_v43_0_0 = l_v43_0;
                    return l_Single_0(v10.RecommendedItemsKey .. tostring(l_l_v43_0_0), function(v56) --[[ Line: 143 ]]
                        -- upvalues: v41 (ref), l_avatarEditorService_0 (ref), l_v43_0 (ref), v44 (ref), v52 (copy), v53 (copy)
                        return v41(v56, l_avatarEditorService_0, l_v43_0, v44, v52, v53);
                    end)(v45);
                end);
            else
                return l_PerformFetch_0.Single(v10.RecommendedItemsKey .. tostring(l_v43_0), function(v57) --[[ Line: 149 ]]
                    -- upvalues: v47 (copy), v21 (ref), v9 (ref), v42 (ref), l_v43_1 (ref), v50 (ref), v7 (ref), v43 (ref), v8 (ref), v16 (ref), v6 (ref), l_v43_0 (ref), v44 (ref), v3 (ref), l_Logging_0 (ref)
                    local v58 = nil;
                    if v47 then
                        v58 = v21;
                    end;
                    return v9.GetRecommendations(v42, l_v43_1, v50, v58):andThen(function(v59) --[[ Line: 156 ]]
                        -- upvalues: v50 (ref), v57 (copy), v7 (ref), v43 (ref), v8 (ref), v16 (ref), v6 (ref), l_v43_0 (ref), v44 (ref), v3 (ref), l_Logging_0 (ref), l_v43_1 (ref)
                        local v60 = v59 and v59.responseBody and v59.responseBody.data;
                        if v60 then
                            if v50 then
                                v57:dispatch(v7(v60, v43));
                            else
                                v57:dispatch(v8(v60));
                            end;
                            if v16() then
                                v57:dispatch(v6(v60, l_v43_0, v44));
                            else
                                v57:dispatch(v6(v60, l_v43_0));
                            end;
                            return v3.resolve(v60);
                        else
                            l_Logging_0.warn("Response from GetRecommendations with recommendationId of " .. tostring(l_v43_1) .. " is malformed!");
                            return v3.reject({
                                HttpError = Enum.HttpError.OK
                            });
                        end;
                    end);
                end)(v45);
            end;
        end;
    end;
end;