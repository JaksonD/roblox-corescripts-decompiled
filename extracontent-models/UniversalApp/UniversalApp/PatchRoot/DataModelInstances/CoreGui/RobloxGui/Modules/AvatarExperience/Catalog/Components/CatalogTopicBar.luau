local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.React);
local l_PillGroup_0 = require(l_CorePackages_0.Packages.UIBlox).App.Control.PillGroup;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v7 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCatalogTopics);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useSelectedTopics);
local v11 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectCatalogCategoryId);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectCatalogSubcategoryId);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useSearchParameters);
local v21 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v22 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.topics");
local v23 = game:DefineFastInt("AXTopicsNumInitialItems", 10);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v25.FFlagAXCatalogCategoriesStore;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v25.FFlagAXMoveCatalogFilterToL1Navigation;
local l_FFlagAXCatalogSearchSupportDisableFilters_0 = v25.FFlagAXCatalogSearchSupportDisableFilters;
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local function v34(v30, v31) --[[ Line: 62 ]] --[[ Name: findRemovedTopic ]]
    -- upvalues: v3 (copy)
    for _, v33 in v30 do
        if not v3.List.find(v31, v33) then
            return v33;
        end;
    end;
    return nil;
end;
local v38 = l_memoize_0(function(v35) --[[ Line: 77 ]]
    -- upvalues: v3 (copy), v23 (copy)
    return v3.List.filterMap(v35, function(v36, v37) --[[ Line: 78 ]]
        -- upvalues: v23 (ref)
        if v23 < v37 then
            return nil;
        else
            return {
                targetId = tonumber(v36.id) or 0, 
                itemType = v36.type
            };
        end;
    end);
end);
return (v4.memo(function(v39) --[[ Line: 89 ]] --[[ Name: CatalogTopicBar ]]
    -- upvalues: v38 (copy), v10 (copy), v9 (copy), v11 (copy), v6 (copy), v7 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), l_useSelector_0 (copy), v13 (copy), l_getUseSelectorDeepEquals_0 (copy), v14 (copy), v4 (copy), v29 (copy), v3 (copy), v34 (copy), v22 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v20 (copy), v19 (copy), v21 (copy), v16 (copy), v8 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), l_FFlagAXCatalogSearchSupportDisableFilters_0 (copy), l_PillGroup_0 (copy)
    local v40 = v38(v39.items or {});
    local l_searchKeyword_0 = v39.searchKeyword;
    local v42, v43 = v10();
    local v44, v45 = v9(v42, v40, l_searchKeyword_0);
    local v46 = v11(v6);
    local v47 = v11(v7);
    local v48 = nil;
    local v49 = nil;
    if not l_FFlagAXCatalogCategoriesStore_0 then
        v48 = l_useSelector_0(v13, l_getUseSelectorDeepEquals_0());
        v49 = l_useSelector_0(v14, l_getUseSelectorDeepEquals_0());
    end;
    local v50 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v50 = v4.useCallback(function(v51) --[[ Line: 106 ]]
            -- upvalues: v44 (copy), v42 (copy), v29 (ref), v3 (ref), v46 (copy), v34 (ref), v22 (ref)
            local l_v44_0 = v44;
            local l_v42_0 = v42;
            local v54 = v29.getCatalogSelectionStore();
            local v55 = v54.selectedCategoryId(false);
            local v56 = v54.selectedSubcategoryId(false);
            if #v51 > #v42 then
                local v57 = v51[#v51];
                local v58 = v3.List.find(v44, v57) or 0;
                v46.selectTopic(v57, v58, v55, v56, nil, l_v44_0, l_v42_0);
                return;
            else
                if #v51 == #v42 - 1 then
                    if not v34(v42, v51) then
                        v22:warning("sendTopicsChangedAnalyticsEvent, removedTopic not found: {} -> {}", v42, v51);
                        return;
                    end;
                else
                    v22:warning("sendTopicsChangedAnalyticsEvent, invalid change: {} -> {}", v42, v51);
                end;
                return;
            end;
        end, {
            v42, 
            v44, 
            v34
        });
    end;
    local function v64(v59) --[[ Line: 148 ]] --[[ Name: sendTopicsChangedAnalyticsEvent ]]
        -- upvalues: v44 (copy), v42 (copy), v3 (ref), v46 (copy), v48 (ref), v49 (ref), v34 (ref), v22 (ref)
        local l_v44_1 = v44;
        local l_v42_1 = v42;
        if #v59 > #v42 then
            local v62 = v59[#v59];
            local v63 = v3.List.find(v44, v62) or 0;
            v46.selectTopic(v62, v63, v48, v49, nil, l_v44_1, l_v42_1);
            return;
        else
            if #v59 == #v42 - 1 then
                if not v34(v42, v59) then
                    v22:warning("sendTopicsChangedAnalyticsEvent, removedTopic not found: {} -> {}", v42, v59);
                    return;
                end;
            else
                v22:warning("sendTopicsChangedAnalyticsEvent, invalid change: {} -> {}", v42, v59);
            end;
            return;
        end;
    end;
    local v65 = l_useDispatch_0();
    local v66 = l_useNavigation_0();
    local v67 = v20();
    local v68 = nil;
    if l_FFlagAXCatalogCategoriesStore_0 then
        v68 = v4.useCallback(function(v69) --[[ Line: 188 ]]
            -- upvalues: v50 (ref), v39 (copy), v67 (ref), v43 (copy), v65 (copy), v19 (ref), v66 (copy), v21 (ref), v47 (copy)
            v50(v69);
            if v39.searchKeyword then
                v67 = v67 or {};
                assert(v67, "");
                v43(v69);
                v65(v19(v66, v67));
            else
                v43(v69);
            end;
            v65(v21(v47, v66.state.routeName));
        end, {
            v50, 
            v39.searchKeyword, 
            v67, 
            v65, 
            v66, 
            v47
        });
    end;
    local function v71(v70) --[[ Line: 216 ]] --[[ Name: onSelectionChanged ]]
        -- upvalues: v64 (copy), v39 (copy), v67 (ref), v43 (copy), v65 (copy), v19 (ref), v66 (copy), v21 (ref), v47 (copy)
        v64(v70);
        if v39.searchKeyword then
            v67 = v67 or {};
            assert(v67, "");
            v43(v70);
            v65(v19(v66, v67));
        else
            v43(v70);
        end;
        v65(v21(v47, v66.state.routeName));
    end;
    return v4.createElement(v16, {
        height = v8.PillBarHeight, 
        layoutOrder = v39.layoutOrder, 
        showFilterButton = not l_FFlagAXMoveCatalogFilterToL1Navigation_0 and (not l_FFlagAXCatalogSearchSupportDisableFilters_0 or not (v39.showFilterButton ~= nil) or v39.showFilterButton), 
        layoutRef = v39.frameRef, 
        NextSelectionUp = v39.NextSelectionUp, 
        NextSelectionDown = v39.NextSelectionDown
    }, {
        Topics = v4.createElement(l_PillGroup_0, {
            layoutOrder = 2, 
            pills = v44, 
            selectedPills = v42, 
            isLoading = v45, 
            onSelectionChanged = if l_FFlagAXCatalogCategoriesStore_0 then v68 else v71, 
            leftPadding = 0
        })
    });
end));