local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local l_DeviceOrientationMode_0 = require(l_Parent_0.RobloxAppEnums).DeviceOrientationMode;
local l_wasLastInputGamepad_0 = require(l_Parent_0.RoactUtils).wasLastInputGamepad;
local v6 = require(l_Parent_0.IxpUtils);
local v7 = require(l_Parent_0.AXCommon);
local v8 = require(l_script_FirstAncestor_0.Utils.debounce);
local v9 = require(l_script_FirstAncestor_0.Utils.normalizeKeyword);
local v10 = require(l_script_FirstAncestor_0.Utils.RecentSearchTermsAppStorage);
local v11 = require(l_script_FirstAncestor_0.Enums.Counter);
local v12 = require(l_script_FirstAncestor_0.Enums.Stat);
local v13 = require(l_script_FirstAncestor_0.Enums.SuggestedItemTypeEnum);
local _ = require(l_script_FirstAncestor_0.Components.SuggestedItemList);
local _ = require(l_script_FirstAncestor_0.Components.SuggestedItem);
local _ = require(script.Parent.SearchLandingPage);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local v18 = require(l_script_FirstAncestor_0.Features.RecentlyViewedSearchItemsWidget.useRecentlyViewedSearchItemsWidgetProps);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v20 = require(l_script_FirstAncestor_0.Flags.GetFIntAXSearchAutocompleteDebounceMs);
local v21 = require(l_script_FirstAncestor_0.Flags.GetFIntAXMaxAutocompleteSearchTextLen);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v7.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local l_FFlagAXMigrateAXFocusBehaviorRoot_0 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot;
local v24 = game:DefineFastFlag("AXMigrateSearchLandingPageToFocusNavigation", false) and l_FFlagAXMigrateAXFocusBehaviorRoot_0;
local v25 = v20() / 1000;
local function v31(v26) --[[ Line: 39 ]] --[[ Name: getRecentSearchTerms ]]
    -- upvalues: v10 (copy), v13 (copy)
    local v27 = v10.findTermsForQuery(v26);
    local v28 = {};
    for _, v30 in v27 do
        table.insert(v28, {
            text = v30, 
            type = v13.Recent
        });
    end;
    return v28;
end;
local function v38(v32, v33) --[[ Line: 54 ]] --[[ Name: getAutocompleteTermsForQueryFromState ]]
    -- upvalues: v9 (copy)
    local v34 = v33[v9(v32)];
    local v35 = {};
    if v34 and v34.entries then
        for _, v37 in v34.entries do
            table.insert(v35, v37.searchQuery);
        end;
    end;
    return v35;
end;
local function v49(v39, v40) --[[ Line: 69 ]] --[[ Name: getAutocompleteTerms ]]
    -- upvalues: v10 (copy), v38 (copy), v13 (copy)
    local v41 = v10.findTermsForQuery(v39);
    local v42 = {};
    for _, v44 in v41 do
        v42[v44:lower()] = true;
    end;
    local v45 = v38(v39, v40);
    local v46 = {};
    for _, v48 in v45 do
        if not v42[v48:lower()] then
            table.insert(v46, {
                text = v48, 
                type = v13.Autocomplete
            });
        end;
    end;
    return v46;
end;
local v52 = v8(function(v50, v51) --[[ Line: 99 ]]
    if v51 then
        v51(v50);
    end;
end, v25);
return function(v53) --[[ Line: 134 ]] --[[ Name: useSearchLandingPageProps ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), v10 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), v6 (copy), l_DeviceOrientationMode_0 (copy), v11 (copy), v24 (copy), l_wasLastInputGamepad_0 (copy), v9 (copy), v21 (copy), v52 (copy), v3 (copy), v12 (copy), v13 (copy), v31 (copy), v49 (copy), v18 (copy)
    local v54 = l_useDesignTokens_0();
    local v55, v56 = v2.useState(v10.getTerms());
    local v57, v58 = v2.useState("");
    local v59 = v2.useRef(os.clock());
    local v60 = nil;
    if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then
        v60 = v6.readTestVariable(l_AXRecentlyViewedSearchItemsIXPTest_0.EnabledForUser);
    end;
    local v64 = v2.useCallback(function(v61) --[[ Line: 152 ]]
        -- upvalues: v53 (copy)
        local v62 = v61:lower();
        local v63 = v53.autocompleteState and v53.autocompleteState[v62];
        if v63 and v63.expirationTime then
            return tick() < v63.expirationTime;
        else
            return false;
        end;
    end, {
        v53.autocompleteState
    });
    local v68 = v2.useCallback(function(v65) --[[ Line: 162 ]]
        -- upvalues: v53 (copy), l_DeviceOrientationMode_0 (ref)
        local v66 = v53.createSearchUuid();
        local v67 = {
            searchKeyword = v65, 
            isKeywordSuggestionEnabled = true
        };
        v53.setSearchType(v66);
        v53.setSearchParameters(v66, v67);
        if v53.deviceOrientation == l_DeviceOrientationMode_0.Portrait then
            v53.setFullView();
        end;
        v53.navigateToSearch(v66, v67);
    end, {
        v53.createSearchUuid, 
        v53.setSearchType, 
        v53.setSearchParameters, 
        v53.setFullView, 
        v53.deviceOrientation, 
        v53.navigateToSearch
    });
    local v72 = v2.useCallback(function(v69, v70) --[[ Line: 188 ]]
        -- upvalues: v53 (copy), v11 (ref), v56 (copy), v10 (ref), v24 (ref), l_wasLastInputGamepad_0 (ref)
        if v53.sendCounter then
            v53.sendCounter(v11.SearchRecentTermRemoved);
            if v70 then
                local v71 = v11.SearchRecentTermRemovedPosPrefix .. v70;
                v53.sendCounter(v71);
            end;
        end;
        v56(v10.removeTerm(v69));
        if not v24 and l_wasLastInputGamepad_0() then
            v53.focusController.moveFocusTo(v53.searchBarRef);
        end;
    end, {
        if v24 then nil else v53.focusController, 
        v53.searchBarRef, 
        v53.sendCounter
    });
    local v75 = v2.useCallback(function(v73) --[[ Line: 215 ]]
        -- upvalues: v58 (copy), v53 (copy), v9 (ref), v21 (ref), v64 (copy), v52 (ref)
        v58(v73);
        if v53.searchTelemetry then
            v53.searchTelemetry.updateQuery(v73);
        end;
        local v74 = v9(v73, true);
        if not v74 or v74 == "" or #v74 > v21() or v64(v74) then
            return;
        else
            v52(v74, v53.fetchAutocompleteSuggestions);
            return;
        end;
    end, {
        v53.autocompleteState, 
        v53.fetchAutocompleteSuggestions, 
        v64, 
        v53.searchTelemetry
    });
    local v78 = v2.useCallback(function(v76) --[[ Line: 245 ]]
        -- upvalues: v3 (ref), v53 (copy), v11 (ref), v59 (copy), v12 (ref), v10 (ref), v68 (copy)
        if not v76 or v3.trim(v76) == "" then
            if v53.sendCounter then
                v53.sendCounter(v11.SearchSubmitNoQuery);
            end;
            return;
        else
            if v53.sendCounter then
                v53.sendCounter(v11.SearchSubmit);
                local v77 = (os.clock() - v59.current) * 1000;
                if v53.sendStats then
                    v53.sendStats(v12.SearchTimeToSearchMs, v77);
                end;
            end;
            v10.addTerm(v76);
            v68(v76);
            return;
        end;
    end, {
        v68, 
        v53.sendCounter
    });
    local v79 = v2.useCallback(function() --[[ Line: 267 ]]
        -- upvalues: v53 (copy), v11 (ref)
        if v53.sendCounter then
            v53.sendCounter(v11.SearchCancel);
        end;
        if v53.navigation then
            v53.navigation.goBack();
        end;
    end, {
        v53.navigation, 
        v53.sendCounter
    });
    local v81 = v2.useCallback(function(v80) --[[ Line: 278 ]]
        -- upvalues: v58 (copy), v53 (copy), v11 (ref)
        v58("");
        if v53.searchTelemetry then
            v53.searchTelemetry.sendClearEvent(v80);
        end;
        if v53.sendCounter then
            v53.sendCounter(v11.SearchClear);
        end;
    end, {
        v53.sendCounter, 
        v53.searchTelemetry
    });
    local v87 = v2.useCallback(function(v82, v83, v84) --[[ Line: 294 ]]
        -- upvalues: v53 (copy), v13 (ref), v11 (ref), v57 (copy), v78 (copy)
        if v53.sendCounter then
            local v85 = if v83 == v13.Recent then v11.SearchRecentTermSelected else v11.SearchAutocompleteTermSelected;
            v53.sendCounter(v85);
            if v83 == v13.Recent and v57 == "" or v57 == nil then
                v53.sendCounter(v11.SearchRecentTermSelectedNoQuery);
            end;
            local v86 = v11.SearchSuggestedTermSelectedPosPrefix .. v84;
            v53.sendCounter(v86);
        end;
        if v53.searchTelemetry and v83 == v13.Autocomplete then
            v53.searchTelemetry.sendAutocompleteTermClickedEvent(v57, v82);
        end;
        v78(v82);
    end, {
        v78, 
        v53.sendCounter, 
        v57, 
        v53.searchTelemetry
    });
    local v97 = v2.useMemo(function() --[[ Line: 324 ]]
        -- upvalues: v31 (ref), v57 (copy), v53 (copy), v49 (ref), v87 (copy), v13 (ref), v72 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (ref), v60 (ref), v3 (ref)
        local v88 = v31(v57);
        local v89 = if v53.autocompleteState then v49(v57, v53.autocompleteState) else {};
        local v90 = {};
        for _, v92 in v88 do
            table.insert(v90, v92);
        end;
        for _, v94 in v89 do
            table.insert(v90, v94);
        end;
        for v95, v96 in v90 do
            v96.onActivate = function() --[[ Line: 342 ]]
                -- upvalues: v87 (ref), v96 (copy), v95 (copy)
                v87(v96.text, v96.type, v95);
            end;
            if v96.type == v13.Recent then
                v96.onRemove = function() --[[ Line: 347 ]]
                    -- upvalues: v72 (ref), v96 (copy), v95 (copy)
                    v72(v96.text, v95);
                end;
            end;
        end;
        if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and v60 and v57 == "" then
            return v3.slice(v90, 1, 5);
        else
            return v90;
        end;
    end, {
        v57, 
        v55, 
        v53.autocompleteState, 
        v87, 
        v72
    });
    local v98 = false;
    if #v97 == 0 then
        v98 = v57 == "";
    end;
    local v99 = nil;
    if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then
        v6.logExperimentExposure(l_AXRecentlyViewedSearchItemsIXPTest_0);
        if v60 then
            v99 = v18({
                fetchSearchRecentlyViewed = v53.fetchSearchRecentlyViewed, 
                toggleTryOn = v53.toggleTryOn, 
                catalogAnalytics = v53.catalogAnalytics
            });
            v98 = v98 and #v99.items == 0;
        end;
    end;
    return {
        padding = {
            top = v53.statusBarHeight or 0, 
            left = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then nil else v54.Global.Space_150, 
            right = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then nil else v54.Global.Space_150
        }, 
        onCancelSearch = v79, 
        onChangeSearchQuery = v75, 
        onSubmitSearch = v78, 
        onClearSearch = v81, 
        shouldShowEmptyState = v98, 
        hasQuery = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then v57 ~= "" else nil, 
        searchBarRef = v53.searchBarRef, 
        firstSuggestedItemRef = v53.firstSuggestedItemRef, 
        suggestedSearchTerms = v97, 
        recentlyViewedItems = if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and v99 then v99.items else nil
    };
end;