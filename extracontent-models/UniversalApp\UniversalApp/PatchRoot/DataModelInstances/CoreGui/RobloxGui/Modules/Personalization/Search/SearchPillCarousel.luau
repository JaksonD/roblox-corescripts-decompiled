local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_useCollectionImpressionsSignal_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).useCollectionImpressionsSignal;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_FrameBoundsImpressionsTracker_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).FrameBoundsImpressionsTracker;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v7 = require(l_CorePackages_0.Packages.React);
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local v9 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_AppSessionService_0 = v9.AppSessionService;
local l_AppEventIngestService_0 = v9.AppEventIngestService;
local l_RoactNetworking_0 = v9.RoactNetworking;
local v13 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v13.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v13.Hooks.RoactRodux.useDispatch;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_VariableItemWidthCarousel_0 = require(l_CorePackages_0.Workspace.Packages.VariableItemWidthCarousel).VariableItemWidthCarousel;
local v18 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SearchPill_0 = l_Modules_0.Personalization.Search.SearchPill;
local l_querySuggestionClicked_0 = l_Modules_0.Personalization.Analytics.querySuggestionClicked;
local l_queryImpressionsEvent_0 = l_Modules_0.Personalization.Analytics.queryImpressionsEvent;
local l_SearchConstants_0 = l_Modules_0.Personalization.Search.SearchConstants;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v27 = require(l_Modules_1.LuaApp.Thunks.ConfirmSearch);
local v28 = require(l_Modules_1.LuaApp.Thunks.FetchAutocompleteSuggestion);
local l_FIntSearchLandingPageSideMargin_0 = l_Modules_0.Personalization.Search.FIntSearchLandingPageSideMargin;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v18.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
SearchPillCarousel = function(v31) --[[ Line: 59 ]] --[[ Name: SearchPillCarousel ]]
    -- upvalues: l_AppUserLayers_0 (copy), l_useUserExperiment_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useNavigation_0 (copy), l_RoactNetworking_0 (copy), l_AppSessionService_0 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), l_SearchConstants_0 (copy), v7 (copy), l_useCollectionImpressionsSignal_0 (copy), v27 (copy), v28 (copy), l_SearchTypes_0 (copy), l_querySuggestionClicked_0 (copy), l_queryImpressionsEvent_0 (copy), l_TextService_0 (copy), l_SearchPill_0 (copy), l_VariableItemWidthCarousel_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_FIntSearchLandingPageSideMargin_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy)
    local v32 = {
        l_AppUserLayers_0.SearchAutocompleteLayer
    };
    local v34 = l_useUserExperiment_0(v32, function(v33) --[[ Line: 63 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return v33[l_AppUserLayers_0.SearchAutocompleteLayer] or {};
    end);
    local v35 = l_useDesignTokens_0();
    local v36 = l_useDispatch_0();
    local v37 = l_useRoactService_0(l_AppEventIngestService_0);
    local v38 = l_useNavigation_0();
    local v39 = l_useRoactService_0(l_RoactNetworking_0);
    local v40 = l_useRoactService_0(l_AppSessionService_0);
    local v42 = l_useSelector_0(function(v41) --[[ Line: 76 ]]
        return v41.AutocompleteSuggestions;
    end);
    local v44 = l_useSelector_0(function(v43) --[[ Line: 79 ]]
        -- upvalues: l_FormFactor_0 (ref)
        return v43.FormFactor == l_FormFactor_0.COMPACT;
    end);
    local l_entries_0 = v31.entries;
    local l_trendingSearches_0 = l_SearchConstants_0.getSearchTokens(v35).searchLandingPage.trendingSearches;
    local l_pillTextSize_0 = l_trendingSearches_0.pillTextSize;
    local l_pillVerticalPadding_0 = l_trendingSearches_0.pillVerticalPadding;
    local l_pillHorizontalPadding_0 = l_trendingSearches_0.pillHorizontalPadding;
    local l_pillFont_0 = l_trendingSearches_0.pillFont;
    local l_pillTextColor_0 = l_trendingSearches_0.pillTextColor;
    local l_pillBackgroundColor_0 = l_trendingSearches_0.pillBackgroundColor;
    local l_pillBackgroundTransparency_0 = l_trendingSearches_0.pillBackgroundTransparency;
    local l_columnGap_0 = l_trendingSearches_0.columnGap;
    local v55 = l_pillTextSize_0 + l_pillVerticalPadding_0 * 2;
    local v56 = ("SearchPillCarousel_%*%*"):format(v31.sortName, v31.sortIndex);
    local v57 = v7.useRef(nil);
    local v58, v59 = l_useCollectionImpressionsSignal_0(v31.scrollViewPositionChangedSignal);
    local v62 = v7.useCallback(function(v60, v61) --[[ Line: 102 ]]
        -- upvalues: v36 (copy), v27 (ref)
        return v36(v27(v60, v61));
    end, {
        v36
    });
    local v64 = v7.useCallback(function(v63) --[[ Line: 106 ]]
        -- upvalues: v42 (copy)
        return v42[v63];
    end, {
        v42
    });
    local v66 = v7.useCallback(function(v65) --[[ Line: 110 ]]
        -- upvalues: v36 (copy), v28 (ref), v39 (copy), v34 (copy), l_SearchTypes_0 (ref)
        if not v65 then
            warn("requestAutocompleteSuggestion called with nil keyword");
            return;
        else
            v36(v28.Fetch(v39, v65, v34, l_SearchTypes_0.Auto));
            return;
        end;
    end, {
        v36, 
        v39, 
        v34
    });
    local v70 = v7.useCallback(function(v67, v68) --[[ Line: 118 ]]
        -- upvalues: l_SearchTypes_0 (ref), v38 (copy), v40 (copy), v37 (copy), v62 (copy), l_querySuggestionClicked_0 (ref), v31 (copy), v64 (copy), v66 (copy)
        local v69 = {
            isAutocompleteSuggestion = true, 
            allAutocompleteSuggestions = {}, 
            searchType = l_SearchTypes_0.TopResults, 
            isAvatarAutocompleteEnabled = false, 
            navigation = v38, 
            pageOwner = v38.state.routeName, 
            sessionService = v40, 
            eventIngest = v37
        };
        v62(v67, v69);
        l_querySuggestionClicked_0(v37, v31.pageContext, {
            pos = v68, 
            sortPos = v31.sortIndex, 
            sortId = v31.sortName, 
            componentType = "Pill", 
            queryText = v67
        });
        if not v64(v67) then
            v66(v67);
        end;
    end, {
        v62, 
        v38, 
        v40, 
        v37, 
        v64, 
        v66
    });
    local v79 = v7.useCallback(function(v71) --[[ Line: 153 ]]
        -- upvalues: v31 (copy), l_queryImpressionsEvent_0 (ref), v37 (copy)
        local v72 = {};
        local v73 = {};
        for _, v75 in ipairs(v71) do
            local v76 = v31.entries[v75];
            if v76 then
                table.insert(v72, v75);
                table.insert(v73, v76.query);
            end;
        end;
        local v77 = table.concat(v72, ",");
        local v78 = table.concat(v73, ",");
        l_queryImpressionsEvent_0(v37, v31.pageContext, {
            absPositions = v77, 
            queryTexts = v78, 
            sortPos = v31.sortIndex, 
            sortId = v31.sortName, 
            componentType = "Pill"
        });
    end, {
        l_queryImpressionsEvent_0, 
        v37, 
        v31.pageContext, 
        v31.sortIndex, 
        v31.sortName, 
        v31.entries
    });
    local v82 = v7.useCallback(function(v80) --[[ Line: 178 ]]
        -- upvalues: l_entries_0 (copy), l_TextService_0 (ref), l_pillTextSize_0 (copy), l_pillFont_0 (copy), l_pillHorizontalPadding_0 (copy)
        local v81 = l_entries_0[v80];
        if not v81 then
            return 0;
        else
            return l_TextService_0:GetTextSize(v81.query, l_pillTextSize_0, l_pillFont_0, Vector2.new(1e999, l_pillTextSize_0)).X + l_pillHorizontalPadding_0 * 2;
        end;
    end, {
        l_entries_0, 
        l_pillTextSize_0, 
        l_pillFont_0, 
        l_pillHorizontalPadding_0
    });
    local v85 = v7.useCallback(function(v83, v84) --[[ Line: 188 ]]
        -- upvalues: v7 (ref), l_SearchPill_0 (ref), l_pillFont_0 (copy), l_pillTextSize_0 (copy), l_pillTextColor_0 (copy), l_pillVerticalPadding_0 (copy), l_pillHorizontalPadding_0 (copy), l_pillBackgroundColor_0 (copy), l_pillBackgroundTransparency_0 (copy), v70 (copy), v56 (copy)
        return v7.createElement(l_SearchPill_0, {
            layoutOrder = v84, 
            text = v83.query, 
            font = l_pillFont_0, 
            textSize = l_pillTextSize_0, 
            textColor = l_pillTextColor_0, 
            verticalPadding = l_pillVerticalPadding_0, 
            horizontalPadding = l_pillHorizontalPadding_0, 
            backgroundColor = l_pillBackgroundColor_0, 
            backgroundTransparency = l_pillBackgroundTransparency_0, 
            onActivated = function() --[[ Line: 199 ]] --[[ Name: onActivated ]]
                -- upvalues: v70 (ref), v83 (copy), v84 (copy)
                v70(v83.query, v84);
            end, 
            impressionsTag = v56, 
            index = v84
        });
    end, {
        l_pillBackgroundColor_0, 
        l_pillBackgroundTransparency_0, 
        l_pillFont_0, 
        l_pillHorizontalPadding_0, 
        l_pillTextColor_0, 
        l_pillTextSize_0, 
        l_pillVerticalPadding_0, 
        v70, 
        v56
    });
    return v7.createElement(v7.Fragment, nil, {
        v7.createElement(l_VariableItemWidthCarousel_0, {
            title = v31.headerText, 
            hideHeaderButton = true, 
            items = l_entries_0, 
            renderItem = v85, 
            itemPadding = l_columnGap_0, 
            itemHeight = v55, 
            sideMargin = if v44 then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_FIntSearchLandingPageSideMargin_0, 
            scrollButtonsEnabled = true, 
            scrollingFrameRef = v57, 
            calculateItemWidth = v82, 
            onCanvasPositionChanged = v59
        }); 
        ImpressionsTracker = if v79 and v56 then v7.createElement(l_FrameBoundsImpressionsTracker_0, {
            parentRef = v57, 
            pageContext = v31.pageContext, 
            impressionsTag = v56, 
            scrollViewPositionChangedSignal = v58, 
            sendImpressions = v79
        }) else nil
    });
end;
return SearchPillCarousel;