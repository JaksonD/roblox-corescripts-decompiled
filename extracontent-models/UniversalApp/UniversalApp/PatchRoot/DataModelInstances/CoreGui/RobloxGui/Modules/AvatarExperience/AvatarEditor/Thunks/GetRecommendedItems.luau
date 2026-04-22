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
local l_FFlagAXTimedOptionsSalesTypeFilter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXTimedOptionsSalesTypeFilter;
local v19 = require(l_Modules_0.AvatarExperience.Experiments.AXEditorRecommendationCarousel);
local v20 = game:DefineFastInt("AXYouMayAlsoLikeCarouselNoOfItems", 25);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local function _(v22) --[[ Line: 33 ]] --[[ Name: keyMapper ]]
    -- upvalues: v10 (copy)
    return v10.RecommendedItemsKey .. tostring(v22);
end;
local function v40(v24, v25, v26, v27, v28, v29) --[[ Line: 37 ]] --[[ Name: fetchRecommendedItems ]]
    -- upvalues: l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy), v17 (copy), v10 (copy), v13 (copy), v14 (copy), v6 (copy), l_Logging_0 (copy)
    local v30 = CatalogSearchParams.new();
    v30.SalesTypeFilter = Enum.SalesTypeFilter.All;
    v30.SortType = Enum.CatalogSortType.Relevance;
    v30.CategoryFilter = Enum.CatalogCategoryFilter.Recommended;
    v30.IncludeOffSale = false;
    v30.SortAggregation = Enum.CatalogSortAggregation.AllTime;
    v30.Limit = 120;
    if game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and not l_FFlagAXTimedOptionsSalesTypeFilter_0 then
        v30.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All;
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 57 ]]
        -- upvalues: v25 (copy), v30 (copy)
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            return v25:SearchCatalogAsync(v30);
        else
            return v25:SearchCatalog(v30);
        end;
    end);
    if l_status_0 then
        local l_l_result_0_CurrentPage_0 = l_result_0:GetCurrentPage();
        local l_v17_0 = v17;
        local v35 = {};
        local v36 = {};
        local v37 = {};
        for v38, v39 in l_l_result_0_CurrentPage_0 do
            if v38 < l_v17_0 + 1 then
                if v39.ItemType == v10.ItemType.Asset then
                    table.insert(v35, v39);
                elseif v39.ItemType == v10.ItemType.Bundle then
                    table.insert(v36, v39);
                end;
                table.insert(v37, {
                    itemType = v39.ItemType, 
                    id = v39.Id
                });
            end;
        end;
        v24:dispatch(v13(v35));
        v24:dispatch(v14(v36));
        v24:dispatch(v6(v37, v26, v27));
        v28(l_result_0);
        return;
    else
        l_Logging_0.warn("GetRecommendedItems failure: " .. tostring(l_result_0));
        v29({
            HttpError = Enum.HttpError.OK
        });
        return;
    end;
end;
return function(v41, v42, v43) --[[ Line: 97 ]]
    -- upvalues: v4 (copy), v19 (copy), v15 (copy), v11 (copy), v10 (copy), v16 (copy), v3 (copy), l_PerformFetch_0 (copy), v40 (copy), v20 (copy), v9 (copy), v7 (copy), v8 (copy), v6 (copy), l_Logging_0 (copy)
    return function(v44, v45) --[[ Line: 98 ]]
        -- upvalues: v4 (ref), v41 (copy), v42 (copy), v43 (copy), v19 (ref), v15 (ref), v11 (ref), v10 (ref), v16 (ref), v3 (ref), l_PerformFetch_0 (ref), v40 (ref), v20 (ref), v9 (ref), v7 (ref), v8 (ref), v6 (ref), l_Logging_0 (ref)
        v4.isType(v41, "function", "GetRecommendedItems thunk expects networkImpl");
        v4.isTypeOrNil(v42, "string", "GetRecommendedItems thunk expects assetTypeIdString");
        v4.isType(v43, "string", "GetRecommendedItems thunk expects recommendationsType");
        local v46 = if v19.isEnabled() then v15.readTestVariable(v19.EnableAvatarEditorRecommendationCarousel) else nil;
        if not (v43 and v43 ~= v11.RecommendationsType.None) then
            return nil;
        else
            local l_v42_0 = v42;
            local l_v42_1 = v42;
            local v49 = true;
            if v43 ~= v11.RecommendationsType.Asset then
                l_v42_0 = v43;
                v49 = false;
                if v43 == v11.RecommendationsType.BodyParts then
                    l_v42_1 = v10.BundleTypeIdStrings.BodyParts;
                elseif v43 == v11.RecommendationsType.AvatarAnimations then
                    l_v42_1 = v10.BundleTypeIdStrings.Animations;
                elseif v43 == v11.RecommendationsType.Shoes then
                    l_v42_1 = v10.BundleTypeIdStrings.Shoes;
                elseif v43 == v11.RecommendationsType.DynamicHeads then
                    l_v42_1 = v10.BundleTypeIdStrings.DynamicHead;
                end;
            end;
            if v16() and v43 == v11.RecommendationsType.All then
                local l_avatarEditorService_0 = v45.avatarEditorService;
                return v3.new(function(v51, v52) --[[ Line: 137 ]]
                    -- upvalues: l_PerformFetch_0 (ref), l_v42_0 (ref), v10 (ref), v40 (ref), l_avatarEditorService_0 (copy), v43 (ref), v44 (copy)
                    local l_Single_0 = l_PerformFetch_0.Single;
                    local l_l_v42_0_0 = l_v42_0;
                    return l_Single_0(v10.RecommendedItemsKey .. tostring(l_l_v42_0_0), function(v55) --[[ Line: 138 ]]
                        -- upvalues: v40 (ref), l_avatarEditorService_0 (ref), l_v42_0 (ref), v43 (ref), v51 (copy), v52 (copy)
                        return v40(v55, l_avatarEditorService_0, l_v42_0, v43, v51, v52);
                    end)(v44);
                end);
            else
                return l_PerformFetch_0.Single(v10.RecommendedItemsKey .. tostring(l_v42_0), function(v56) --[[ Line: 144 ]]
                    -- upvalues: v46 (copy), v20 (ref), v9 (ref), v41 (ref), l_v42_1 (ref), v49 (ref), v7 (ref), v42 (ref), v8 (ref), v16 (ref), v6 (ref), l_v42_0 (ref), v43 (ref), v3 (ref), l_Logging_0 (ref)
                    local v57 = nil;
                    if v46 then
                        v57 = v20;
                    end;
                    return v9.GetRecommendations(v41, l_v42_1, v49, v57):andThen(function(v58) --[[ Line: 151 ]]
                        -- upvalues: v49 (ref), v56 (copy), v7 (ref), v42 (ref), v8 (ref), v16 (ref), v6 (ref), l_v42_0 (ref), v43 (ref), v3 (ref), l_Logging_0 (ref), l_v42_1 (ref)
                        local v59 = v58 and v58.responseBody and v58.responseBody.data;
                        if v59 then
                            if v49 then
                                v56:dispatch(v7(v59, v42));
                            else
                                v56:dispatch(v8(v59));
                            end;
                            if v16() then
                                v56:dispatch(v6(v59, l_v42_0, v43));
                            else
                                v56:dispatch(v6(v59, l_v42_0));
                            end;
                            return v3.resolve(v59);
                        else
                            l_Logging_0.warn("Response from GetRecommendations with recommendationId of " .. tostring(l_v42_1) .. " is malformed!");
                            return v3.reject({
                                HttpError = Enum.HttpError.OK
                            });
                        end;
                    end);
                end)(v44);
            end;
        end;
    end;
end;