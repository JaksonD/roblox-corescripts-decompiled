local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v6.Enums.CatalogCategories;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.SponsoredItemsWidgetRow);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v11 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_getUseSelectorDeepEquals_0 = v6.Utils.getUseSelectorDeepEquals;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Stores);
local l_FFlagAXMoveAllTabToWidgetOnly_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMoveAllTabToWidgetOnly;
local v19 = v5.GetSponsoredItemsKey(v4.SponsoredItemsCategoryRecommended, v4.SponsoredItemsToFetch);
return function(v20, v21, v22) --[[ Line: 35 ]] --[[ Name: useSponsoredItemsLocalWidget ]]
    -- upvalues: l_useSelector_0 (copy), l_PerformFetch_0 (copy), v19 (copy), l_getUseSelectorDeepEquals_0 (copy), v12 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), v17 (copy), l_useSignalState_0 (copy), v2 (copy), v11 (copy), v13 (copy), l_CatalogCategories_0 (copy), v3 (copy), v8 (copy)
    local v24 = l_useSelector_0(function(v23) --[[ Line: 40 ]]
        -- upvalues: l_PerformFetch_0 (ref), v19 (ref)
        return l_PerformFetch_0.GetStatus(v23, v19);
    end, l_getUseSelectorDeepEquals_0());
    local v27 = l_useSelector_0(function(v25) --[[ Line: 44 ]]
        -- upvalues: v12 (ref), v20 (copy), l_PerformFetch_0 (ref)
        local v26 = v12.getSearchKey(v25, v20);
        return l_PerformFetch_0.GetStatus(v25, v26);
    end, l_getUseSelectorDeepEquals_0());
    local v29 = l_useSelector_0(function(v28) --[[ Line: 49 ]]
        return v28.AvatarExperience.Catalog.SortAndFilters.SelectedTopics;
    end, l_getUseSelectorDeepEquals_0());
    local v31 = l_useSelector_0(function(v30) --[[ Line: 53 ]]
        -- upvalues: v20 (copy)
        return v30.SearchesParameters[v20];
    end, l_getUseSelectorDeepEquals_0());
    local v32 = nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 then
        local v33 = v17.getFetchMarketplaceStore(false);
        v32 = l_useSignalState_0(v33.getFetchingMarketplaceProcessed);
    end;
    local v40 = v2.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v24 (copy), v11 (ref), v29 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), v27 (copy), v31 (copy), v13 (ref), l_CatalogCategories_0 (ref), v32 (ref), v21 (copy), v22 (copy)
        if v24 ~= v11.Failed then
            local v34 = false;
            if v29 ~= nil then
                v34 = #v29 > 0;
            end;
            local v35 = if not l_FFlagAXMoveAllTabToWidgetOnly_0 then v27 == v11.Done else nil;
            local v36 = not l_FFlagAXMoveAllTabToWidgetOnly_0 and nil;
            local v37 = false;
            if v31 and v31.categoryInfo and not v13.isEmpty(v31.categoryInfo) then
                local l_categoryInfo_0 = v31.categoryInfo;
                v37 = l_categoryInfo_0.ShowSponsored or false;
                if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                    v36 = l_categoryInfo_0.Id == l_CatalogCategories_0.Recommended:rawValue();
                end;
            end;
            if l_FFlagAXMoveAllTabToWidgetOnly_0 then
                local v39 = true;
                if v27 ~= v11.Done then
                    v39 = l_FFlagAXMoveAllTabToWidgetOnly_0 and v32 and v36;
                end;
                v35 = v39;
            end;
            return v21 and v35 and v37 and not v34 and not v22;
        else
            return false;
        end;
    end, {
        v24, 
        v29, 
        v27, 
        v21, 
        v31, 
        v22, 
        if l_FFlagAXMoveAllTabToWidgetOnly_0 then v32 else nil
    });
    return {
        row = v3.SponsoredItemsRow, 
        component = v8, 
        isEnabled = v40
    };
end;