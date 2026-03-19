local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.ReactUtils);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useInitializedValue_0 = v2.useInitializedValue;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v10.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v10.AvatarRoute.Hooks.useAvatarRoute;
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterSection);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.Filters);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.Sorts);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useFiltersController);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useSortsController);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.FormPeekview);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendApplySortAndFiltersAnalytics);
local v24 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local function _(v30) --[[ Line: 47 ]] --[[ Name: getTotalSectionHeight ]]
    return v30 + 24 + 24;
end;
local function v35() --[[ Line: 51 ]] --[[ Name: useSearchParameters ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_AvatarScreen_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy)
    local v32 = l_useAvatarRoute_0();
    local v33 = if v32.opaque.name == l_AvatarScreen_0.CatalogSearch then v32.opaque.params.detail else nil;
    return (l_useSelector_0(function(v34) --[[ Line: 56 ]]
        -- upvalues: v33 (copy)
        if v33 then
            return v34.SearchesParameters[v33];
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0()));
end;
return function(_) --[[ Line: 65 ]] --[[ Name: SortAndFiltersScreen ]]
    -- upvalues: v16 (copy), v17 (copy), l_useNavigation_0 (copy), v6 (copy), l_useDispatch_0 (copy), v24 (copy), v25 (copy), v20 (copy), v35 (copy), v23 (copy), v27 (copy), l_useLocalization_0 (copy), v4 (copy), v19 (copy), l_useInitializedValue_0 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v13 (copy), v14 (copy), v15 (copy)
    local v37 = v16();
    local v38 = v17();
    local v39 = l_useNavigation_0();
    local v40 = v6.useRefCache();
    local v41 = v37.canApply or v38.canApply;
    local v42 = v37.canReset or v38.canReset;
    local v43 = l_useDispatch_0();
    local v44 = v24(v25);
    local v45 = v20();
    local v46 = v35();
    local function v47() --[[ Line: 82 ]] --[[ Name: apply ]]
        -- upvalues: v37 (copy), v38 (copy), v45 (copy), v43 (copy), v23 (ref), v44 (copy), v46 (copy), v27 (ref), v39 (copy)
        v37.apply();
        v38.apply();
        v45:fire();
        v43(v23(v44));
        if v46 then
            v43(v27(v39, v46));
        end;
    end;
    local function v48() --[[ Line: 93 ]] --[[ Name: reset ]]
        -- upvalues: v37 (copy), v38 (copy)
        v37.reset();
        v38.reset();
    end;
    local v49 = l_useLocalization_0({
        sorts = "Feature.Catalog.Label.Filter.Sorts", 
        filters = "Feature.Catalog.Label.Filter.Filters"
    });
    local v50, v51 = v4.useBinding(0);
    local v52 = v50:map(v19.mapHeightToSize);
    local v53, v54 = v4.useBinding(0);
    local v55 = v53:map(v19.mapHeightToSize);
    local v60 = l_useInitializedValue_0(function() --[[ Line: 109 ]]
        -- upvalues: v4 (ref), v50 (copy), v53 (copy)
        return v4.joinBindings({
            v50, 
            v53
        }):map(function(v56) --[[ Line: 113 ]]
            local v57 = v56[1];
            local v58 = v56[2];
            local v59 = v57 + 24 + 24 + (v58 + 24 + 24);
            return UDim2.new(1, 0, 0, v59);
        end);
    end);
    return v4.createElement(v21, {
        canApply = v41, 
        canReset = v42, 
        onApply = v47, 
        onReset = v48, 
        closePeekViewSignal = v45, 
        totalSize = v60, 
        shouldCaptureFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
    }, {
        FiltersSection = v4.createElement(v13, {
            title = v49.filters, 
            Size = v50:map(function(v61) --[[ Line: 132 ]]
                return UDim2.new(1, 0, 0, v61 + 24 + 24);
            end), 
            contentSize = v52
        }, {
            Filters = v4.createElement(v14, {
                Size = v52, 
                filtersController = v37, 
                frameRef = v40.Filters, 
                NextSelectionDown = v40.Sorts, 
                onHeightChanged = v51
            })
        }), 
        SortsSection = v4.createElement(v13, {
            title = v49.sorts, 
            Size = v53:map(function(v62) --[[ Line: 147 ]]
                return UDim2.new(1, 0, 0, v62 + 24 + 24);
            end), 
            contentSize = v55
        }, {
            Sorts = v4.createElement(v15, {
                Size = v55, 
                sortsController = v38, 
                frameRef = v40.Sorts, 
                NextSelectionUp = v40.Filters, 
                onHeightChanged = v54
            })
        })
    });
end;