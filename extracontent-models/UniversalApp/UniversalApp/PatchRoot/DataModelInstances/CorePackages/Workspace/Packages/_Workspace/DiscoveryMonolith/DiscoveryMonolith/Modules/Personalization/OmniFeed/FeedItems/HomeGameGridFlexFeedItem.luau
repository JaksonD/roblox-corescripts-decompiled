local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_parseBooleanString_0 = require(l_Parent_0.DiscoveryUtils).parseBooleanString;
local _ = require(l_Parent_0.GameCollections);
local l_GameCollectionGrid_0 = require(l_Parent_0.GameCollections).GameCollectionGrid;
local l_GameCollectionItemBuilder_0 = require(l_Parent_0.GameCollections).GameCollectionItemBuilder;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.GameCollections).GameCollectionItemTypes;
local l_PlaceholderGameGrid_0 = require(l_Parent_0.GameCollections).PlaceholderGameGrid;
local v14 = require(l_Parent_0.CollectionViews);
local v15 = require(l_Parent_0.DiscoveryTypes);
local l_OmniFeedConstants_0 = v15.OmniFeedConstants;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local _ = require(l_Parent_0.GameTile);
local l_getGameTileCollectionItemSize_0 = require(l_Parent_0.GameTile).getGameTileCollectionItemSize;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local l_getSduiFeedStore_0 = require(l_Parent_0.ServerDrivenUi).getSduiFeedStore;
local v24 = require(l_Parent_0.Signals);
local v25 = require(l_Parent_0.SignalsReact);
local v26 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v26.default;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v30 = require(l_Modules_0.Personalization.OmniFeed.DataStore.useUpdateFeedItemRenderedRows);
local v31 = require(l_Modules_0.Personalization.OmniFeed.useGridFlexFeedItemBounds);
local v32 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v33 = game:DefineFastInt("GameGridFlexFeedItemTileNumPerFeed", 30);
local l_FIntLuaAppDelayImpressionsMaxUpdates_0 = require(l_Parent_0.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates;
local v35 = game:DefineFastFlag("FixPlaceholderGameGrid", false);
local l_FFlagLuaAppRfySignalApportioning_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRfySignalApportioning;
local l_FFlagLuaAppRfySignalApportioningIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRfySignalApportioningIxp;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixHomeGridPlaceholderFlowIssues;
local v40 = game:DefineFastFlag("LuaAppAddPlaceholderRecoveryCounter", false);
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v52 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
local v53 = not l_FFlagLuaAppRfySignalApportioning_0 and nil;
local v54 = not l_FFlagLuaAppRfySignalApportioning_0 and nil;
return function(v55) --[[ Line: 89 ]]
    -- upvalues: v32 (copy), l_OmniFeedConstants_0 (copy), l_parseBooleanString_0 (copy), l_FFlagLuaAppRfySignalApportioningIxp_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppRfySignalApportioning_0 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_AppPage_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v14 (copy), l_getSduiFeedStore_0 (copy), v2 (copy), v25 (copy), l_useAppPolicy_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_useSelector_0 (copy), l_TopicContentsReducer_0 (copy), v33 (copy), v31 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v52 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (copy), v24 (copy), l_DiscoveryEventErrorLogger_0 (copy), v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GameCollectionItemBuilder_0 (copy), v30 (copy), l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 (copy), v53 (ref), l_default_0 (copy), v26 (copy), v40 (copy), v54 (ref), l_GameCollectionGrid_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_PlaceholderGameGrid_0 (copy), v35 (copy)
    local l_verticalScrollingFrameRef_0 = v55[v32.key].verticalScrollingFrameRef;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = "Narrow";
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    if v55.topicLayoutData then
        v59 = v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
        if v59 then
            if v59 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile then
                v61 = "Event";
            elseif v59 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                v61 = "Wide";
            end;
            local v74 = true;
            if v61 ~= "Wide" then
                v74 = v61 == "Event";
            end;
            v57 = v74;
        end;
        v58 = v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.PlayerCountStyle];
        v60 = v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.PlayButtonStyle];
        v62 = l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideTileMetadata]);
        v63 = l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideTileTitle]);
        v64 = l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ContainedTile]);
        v65 = l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableExplicitFeedback]);
        v66 = if l_FFlagLuaAppRfySignalApportioningIxp_0 then l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableSignalApportioning]) else nil;
        v67 = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SponsoredUserCohort] else nil;
        v68 = l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableSponsoredFeedback]);
        v69 = if l_FFlagLuaAppEnableSponsoredReportAd_0 then l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableReportAd]) else nil;
        v70 = if l_FFlagLuaAppSupportAdRatingFooter_0 then l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.IsSponsoredRatingFooterAllowed]) else nil;
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then
            v71 = v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SponsoredFooterAdLabelText];
            v72 = l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SponsoredFooterAdLabelFirst]);
            v73 = l_parseBooleanString_0(v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SponsoredFooterIncludeRatingContent]);
        end;
    end;
    local v75 = nil;
    if v55.topicLayoutData then
        local v76 = v55.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.IsSponsoredFooterAllowed];
        local v77 = false;
        if v76 ~= nil then
            v77 = v76 == "true";
        end;
        v75 = v77;
    end;
    local v78 = l_FFlagLuaAppRfySignalApportioning_0 and (not l_FFlagLuaAppRfySignalApportioningIxp_0 or v66);
    local l_appPage_0 = v55[v32.key].appPage;
    local v80 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v55[v32.key].appCompositionEnabled else nil;
    assert(l_appPage_0 == l_AppPage_0.Home, "component only supports the Home Page");
    local l_feedItemStartRow_0 = v55[v32.key].feedItemStartRow;
    local l_topicId_0 = v55.topicId;
    local l_feedItemPosition_0 = v55[v32.key].feedItemPosition;
    local l_sortIndex_0 = v55.sortIndex;
    local v85 = v55.topicName or "";
    local l_numberOfRows_0 = v55.numberOfRows;
    local v87 = if l_FFlagLuaAppRfySignalApportioning_0 then v55[v32.key].sduiContext else nil;
    local v88 = nil;
    local v89 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v88 = l_getGameTileCollectionItemSize_0(v61);
        v89 = v14.useCollectionLayout(v88);
    end;
    local v90 = if l_FFlagLuaAppRfySignalApportioning_0 then l_getSduiFeedStore_0(l_appPage_0) else nil;
    local v91 = nil;
    local v92 = nil;
    if not l_FFlagLuaAppCompositionAlways_0 then
        if l_FFlagLuaAppRfySignalApportioning_0 then
            if not l_FFlagLuaAppCompositionSupport_0 then
                v88 = l_getGameTileCollectionItemSize_0(v61);
            end;
            local v94 = v2.useCallback(function(v93) --[[ Line: 206 ]]
                -- upvalues: v87 (copy), v88 (ref)
                return v87.getPageLayoutConfig(v88)(v93).numColumns;
            end, {
                v88, 
                v87.getPageLayoutConfig
            });
            v91 = v25.useSignalState(v94);
        else
            local v95, v96 = v2.useState(1);
            v91 = v95;
            v92 = v96;
        end;
    end;
    if v80 then
        v91 = v89.itemsPerRow;
    end;
    local v98 = l_useAppPolicy_0(function(v97) --[[ Line: 219 ]]
        return v97.useGridPageLayout();
    end);
    local v99 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v98 = v98 and not v99;
    local v101 = l_useSelector_0(function(v100) --[[ Line: 227 ]]
        return v100.FormFactor;
    end);
    local v103 = l_useSelector_0(function(v102) --[[ Line: 231 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref)
        return v102.Personalization[l_TopicContentsReducer_0.key];
    end);
    local v106 = l_useSelector_0(function(v104) --[[ Line: 235 ]]
        -- upvalues: l_appPage_0 (copy)
        local v105 = v104.OmniRecommendations[l_appPage_0];
        if v105 then
            return v105.sorts;
        else
            return {};
        end;
    end);
    local v107 = if l_numberOfRows_0 and l_numberOfRows_0 > 0 then l_numberOfRows_0 else math.floor(v33 / v91);
    local v108 = if not l_FFlagLuaAppRfySignalApportioning_0 or l_FFlagLuaAppRfySignalApportioningIxp_0 then v31(v55.topicId, l_feedItemPosition_0, v91, v107, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v103 and v103[l_topicId_0] and v103[l_topicId_0].entries or v52 else nil) else nil;
    local v109 = nil;
    if l_FFlagLuaAppRfySignalApportioning_0 then
        local v110 = v107 or 99999;
        if v110 == -1 then
            v110 = 99999;
        end;
        do
            local l_v110_0 = v110;
            v2.useEffect(function() --[[ Line: 267 ]]
                -- upvalues: v91 (ref), l_v110_0 (ref), v90 (copy), v55 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref)
                local v112 = v91 * l_v110_0;
                v90.updateApportioningCapacity(v55.topicId, v55.sortIndex, v112, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v55.recommendationsRequestId else nil);
            end, {
                v91, 
                l_v110_0, 
                v55.topicId, 
                v55.sortIndex, 
                v90, 
                if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v55.recommendationsRequestId else nil
            });
            local v120 = v2.useMemo(function() --[[ Line: 287 ]]
                -- upvalues: v24 (ref), v90 (copy), v55 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_DiscoveryEventErrorLogger_0 (ref), v3 (ref)
                return v24.createComputed(function(v113) --[[ Line: 288 ]]
                    -- upvalues: v90 (ref), v55 (ref), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_DiscoveryEventErrorLogger_0 (ref), v3 (ref)
                    local v114 = v90.getApportionedItems(v55.topicId, v55.sortIndex, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v55.recommendationsRequestId else nil)(v113);
                    if not v114 then
                        return nil;
                    else
                        local v115 = v90.getSingleGridApportioningMetadata(v55.topicId, v55.sortIndex, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v55.recommendationsRequestId else nil)(v113);
                        local v116 = v115 and v115.startingItemIndex;
                        if not v116 and #v114 > 0 then
                            l_DiscoveryEventErrorLogger_0.reportError("HomeGameGridRenderingWithMissingStartingItemIndex", "Starting item index not found in apportioning data for topicId {props.topicId} and sortIndex {props.sortIndex}, defaulting to 1", {
                                topicId = v55.topicId, 
                                sortIndex = v55.sortIndex
                            });
                        end;
                        local v117 = {};
                        for v118, v119 in v114 do
                            table.insert(v117, (v3.Dictionary.join(v119, {
                                topicContentsIndex = (v116 or 1) + v118 - 1
                            })));
                        end;
                        return v117;
                    end;
                end);
            end, {
                v90, 
                v55.topicId, 
                v55.sortIndex, 
                if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v55.recommendationsRequestId else nil
            });
            v109 = v25.useSignalState(v120);
        end;
    end;
    local v131 = if not l_FFlagLuaAppRfySignalApportioning_0 or l_FFlagLuaAppRfySignalApportioningIxp_0 then v2.useMemo(function() --[[ Line: 338 ]]
        -- upvalues: l_topicId_0 (copy), v103 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v108 (copy), v3 (ref)
        local v121 = nil;
        if l_topicId_0 then
            v121 = v103 and v103[l_topicId_0] or nil;
        end;
        local v122 = v121 and v121.entries or {};
        if v121 and v121.hasMoreRows then
            warn((("HomeGameGridFlexFeedItem may need to fetch more metadata for topicId %*"):format(l_topicId_0)));
        end;
        local v123 = {};
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
            local v124 = v108 and v108.entryIndices;
            local v125 = v108 and v108.firstIndex or 1;
            if v124 then
                for v126, v127 in ipairs(v124) do
                    local v128 = v122[v127];
                    if v128 then
                        table.insert(v123, v3.Dictionary.join(v128, {
                            topicContentsIndex = v125 + v126 - 1
                        }));
                    end;
                end;
                return v123;
            end;
        else
            local v129 = v108 and v108.firstIndex or nil;
            if v129 ~= nil then
                local v130 = v129 + (v108 and v108.numberOfTiles or 0);
                while v129 <= #v122 and v129 < v130 do
                    table.insert(v123, (v3.Dictionary.join(v122[v129], {
                        topicContentsIndex = v129
                    })));
                    v129 = v129 + 1;
                end;
            end;
        end;
        return v123;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        l_topicId_0, 
        v103, 
        v106, 
        v108
    } else l_dependencyArray_0(l_topicId_0, v103, v106, v108)) else nil;
    local v132 = nil;
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
        local v133 = if v78 then v109 else v131;
        local l_v133_0 = v133 --[[ copy: 46 -> 47 ]];
        v132 = v2.useMemo(function() --[[ Line: 392 ]]
            -- upvalues: l_v133_0 (copy), l_GameCollectionItemTypes_0 (ref), l_GameCollectionItemBuilder_0 (ref), v91 (ref), l_appPage_0 (copy), l_sortIndex_0 (copy), l_topicId_0 (copy)
            if not l_v133_0 then
                return l_v133_0;
            else
                local v135 = {};
                local v136 = {};
                for v137, v138 in l_v133_0 do
                    if v138.componentType == l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile then
                        v135[v137] = {
                            colSpan = 2, 
                            rowSpan = 1, 
                            alignmentType = v138.alignmentType, 
                            minRowPadding = tonumber(v138.minRowPadding) or 0
                        };
                        v136[v137] = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile;
                    end;
                end;
                return l_GameCollectionItemBuilder_0.BuildCollectionEntries(l_v133_0, v91, v135, v136, nil, l_appPage_0, l_sortIndex_0, l_topicId_0);
            end;
        end, {
            v133, 
            v91, 
            l_appPage_0, 
            l_sortIndex_0, 
            l_topicId_0
        });
    else
        v132 = if v78 then v109 else v131;
    end;
    local v139 = nil;
    if v78 and v132 or not v78 and v108 then
        v139 = math.ceil(#v132 / v91);
    end;
    v30(l_appPage_0, nil, l_feedItemPosition_0, if l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 then v139 or -1 else v139);
    if (not v78 or v132) and #v132 > 0 then
        if l_FFlagLuaAppRfySignalApportioning_0 and v53 then
            l_default_0:logRobloxTelemetryCounter({
                eventName = "HomeGameGridReturnedGridAfterNil", 
                backends = {
                    v26.TelemetryBackends.Counter
                }
            }, 1, {
                experimentTreatment = v66 == true and "signal_apportioning_treatment" or v66 == false and "control" or "not_in_experiment"
            });
            v53 = false;
        end;
        if v40 and v54 then
            l_default_0:logRobloxTelemetryCounter({
                eventName = "HomeGameGridReturnedGridAfterPlaceholder", 
                backends = {
                    v26.TelemetryBackends.Counter
                }
            }, 1, {
                experimentTreatment = v66 == true and "signal_apportioning_treatment" or v66 == false and "control" or "not_in_experiment"
            });
            v54 = false;
        end;
        return v2.createElement(l_GameCollectionGrid_0, {
            entries = v132, 
            title = v85, 
            friendFooterEnabled = true, 
            sortIndex = l_sortIndex_0, 
            gameSortId = l_topicId_0, 
            pageContext = l_appPage_0, 
            onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v55[v32.key].onTileImageLoaded else nil, 
            scrollViewPositionChangedSignal = v55[v32.key].scrollViewPositionChangedSignal, 
            onItemsPerRowChanged = if v80 then nil else v92, 
            useGridTiles = v57, 
            playerCountStyle = v58, 
            isSponsoredFooterAllowed = v75, 
            componentType = v59, 
            gameTileLayoutType = v61, 
            gridSupportAllowed = true, 
            isHoverSupportEnabled = true, 
            verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
            startRow = l_feedItemStartRow_0, 
            maxNumRows = if l_numberOfRows_0 and l_numberOfRows_0 > 0 then l_numberOfRows_0 else nil, 
            playButtonStyle = v60, 
            sideMargin = if v80 then nil else if v101 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0, 
            appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v80 else nil, 
            shouldHideTileMetadata = v62, 
            shouldHideTileTitle = v63, 
            containedTile = v64, 
            numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
            selectionOrderBase = v55[v32.key].selectionOrderBase, 
            enableExplicitFeedback = v65, 
            sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v67 else nil, 
            enableSponsoredFeedback = v68, 
            enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v69 else nil, 
            isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v70 else nil, 
            sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v71 else nil, 
            sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v72 else nil, 
            sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v73 else nil
        });
    elseif v78 and v132 == nil or not v78 and v108 == nil then
        if l_FFlagLuaAppRfySignalApportioning_0 and not v54 then
            l_default_0:logRobloxTelemetryCounter({
                eventName = "HomeGameGridReturnedPlaceholder", 
                backends = {
                    v26.TelemetryBackends.Counter
                }
            }, 1, {
                experimentTreatment = v66 == true and "signal_apportioning_treatment" or v66 == false and "control" or "not_in_experiment"
            });
            v54 = true;
        end;
        return (v2.createElement(l_PlaceholderGameGrid_0, {
            title = v85, 
            onItemsPerRowChanged = if v80 then nil else v92, 
            appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v80 else nil, 
            useGridTiles = v57, 
            componentType = v59, 
            gameTileLayoutType = v61, 
            gridSupportAllowed = true, 
            isHoverSupportEnabled = true, 
            numRows = if v35 then v107 else l_numberOfRows_0 or 0, 
            sideMargin = if v80 then nil else if v101 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0, 
            verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
            shouldHideTileMetadata = v62, 
            shouldHideTileTitle = v63, 
            containedTile = v64
        }));
    else
        if l_FFlagLuaAppRfySignalApportioning_0 and not v53 then
            l_default_0:logRobloxTelemetryCounter({
                eventName = "HomeGameGridReturnedNil", 
                backends = {
                    v26.TelemetryBackends.Counter
                }
            }, 1, {
                experimentTreatment = v66 == true and "signal_apportioning_treatment" or v66 == false and "control" or "not_in_experiment"
            });
            v53 = true;
        end;
        return nil;
    end;
end;