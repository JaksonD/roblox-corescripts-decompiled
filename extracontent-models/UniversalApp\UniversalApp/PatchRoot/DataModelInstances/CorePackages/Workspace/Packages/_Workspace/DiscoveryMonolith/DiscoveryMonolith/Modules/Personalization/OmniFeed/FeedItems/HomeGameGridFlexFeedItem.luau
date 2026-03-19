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
local v14 = require(l_Parent_0.DiscoveryTypes);
local l_OmniFeedConstants_0 = v14.OmniFeedConstants;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local _ = require(l_Parent_0.GameTile);
local l_getGameTileCollectionItemSize_0 = require(l_Parent_0.GameTile).getGameTileCollectionItemSize;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_TopicContentsReducer_0 = require(l_Parent_0.TopicContentsRodux).TopicContentsReducer;
local l_getSduiFeedStore_0 = require(l_Parent_0.ServerDrivenUi).getSduiFeedStore;
local v23 = require(l_Parent_0.Signals);
local v24 = require(l_Parent_0.SignalsReact);
local v25 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v25.default;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v29 = require(l_Modules_0.Personalization.OmniFeed.DataStore.useUpdateFeedItemRenderedRows);
local v30 = require(l_Modules_0.Personalization.OmniFeed.useGridFlexFeedItemBounds);
local v31 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v32 = game:DefineFastInt("GameGridFlexFeedItemTileNumPerFeed", 30);
local l_FIntLuaAppDelayImpressionsMaxUpdates_0 = require(l_Parent_0.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates;
local v34 = game:DefineFastFlag("FixPlaceholderGameGrid", false);
local l_FFlagLuaAppRfySignalApportioning_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRfySignalApportioning;
local l_FFlagLuaAppRfySignalApportioningIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRfySignalApportioningIxp;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixHomeGridPlaceholderFlowIssues;
local v39 = game:DefineFastFlag("LuaAppAddPlaceholderRecoveryCounter", false);
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v14.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v14.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v47 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
local v48 = not l_FFlagLuaAppRfySignalApportioning_0 and nil;
local v49 = not l_FFlagLuaAppRfySignalApportioning_0 and nil;
return function(v50) --[[ Line: 79 ]]
    -- upvalues: v31 (copy), l_OmniFeedConstants_0 (copy), l_parseBooleanString_0 (copy), l_FFlagLuaAppRfySignalApportioningIxp_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppRfySignalApportioning_0 (copy), l_AppPage_0 (copy), l_getSduiFeedStore_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v2 (copy), v24 (copy), l_useAppPolicy_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_useSelector_0 (copy), l_TopicContentsReducer_0 (copy), v32 (copy), v30 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v47 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (copy), v23 (copy), l_DiscoveryEventErrorLogger_0 (copy), v3 (copy), l_dependencyArray_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GameCollectionItemBuilder_0 (copy), v29 (copy), l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 (copy), v48 (ref), l_default_0 (copy), v25 (copy), v39 (copy), v49 (ref), l_GameCollectionGrid_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_PlaceholderGameGrid_0 (copy), v34 (copy)
    local l_verticalScrollingFrameRef_0 = v50[v31.key].verticalScrollingFrameRef;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = "Narrow";
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    if v50.topicLayoutData then
        v54 = v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
        if v54 then
            if v54 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile then
                v56 = "Event";
            elseif v54 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                v56 = "Wide";
            end;
            local v69 = true;
            if v56 ~= "Wide" then
                v69 = v56 == "Event";
            end;
            v52 = v69;
        end;
        v53 = v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.PlayerCountStyle];
        v55 = v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.PlayButtonStyle];
        v57 = l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideTileMetadata]);
        v58 = l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideTileTitle]);
        v59 = l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ContainedTile]);
        v60 = l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableExplicitFeedback]);
        v61 = if l_FFlagLuaAppRfySignalApportioningIxp_0 then l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableSignalApportioning]) else nil;
        v62 = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SponsoredUserCohort] else nil;
        v63 = l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableSponsoredFeedback]);
        v64 = if l_FFlagLuaAppEnableSponsoredReportAd_0 then l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableReportAd]) else nil;
        v65 = if l_FFlagLuaAppSupportAdRatingFooter_0 then l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.IsSponsoredRatingFooterAllowed]) else nil;
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then
            v66 = v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SponsoredFooterAdLabelText];
            v67 = l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SponsoredFooterAdLabelFirst]);
            v68 = l_parseBooleanString_0(v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SponsoredFooterIncludeRatingContent]);
        end;
    end;
    local v70 = nil;
    if v50.topicLayoutData then
        local v71 = v50.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.IsSponsoredFooterAllowed];
        local v72 = false;
        if v71 ~= nil then
            v72 = v71 == "true";
        end;
        v70 = v72;
    end;
    local v73 = l_FFlagLuaAppRfySignalApportioning_0 and (not l_FFlagLuaAppRfySignalApportioningIxp_0 or v61);
    local l_appPage_0 = v50[v31.key].appPage;
    assert(l_appPage_0 == l_AppPage_0.Home, "component only supports the Home Page");
    local l_feedItemStartRow_0 = v50[v31.key].feedItemStartRow;
    local l_topicId_0 = v50.topicId;
    local l_feedItemPosition_0 = v50[v31.key].feedItemPosition;
    local l_sortIndex_0 = v50.sortIndex;
    local v79 = v50.topicName or "";
    local l_numberOfRows_0 = v50.numberOfRows;
    local v81 = if l_FFlagLuaAppRfySignalApportioning_0 then v50[v31.key].sduiContext else nil;
    local v82 = if l_FFlagLuaAppRfySignalApportioning_0 then l_getSduiFeedStore_0(l_appPage_0) else nil;
    local v83 = nil;
    local v84 = nil;
    if l_FFlagLuaAppRfySignalApportioning_0 then
        local v85 = l_getGameTileCollectionItemSize_0(v56);
        local l_v85_0 = v85 --[[ copy: 32 -> 45 ]];
        local v88 = v2.useCallback(function(v87) --[[ Line: 181 ]]
            -- upvalues: v81 (copy), l_v85_0 (copy)
            return v81.getPageLayoutConfig(l_v85_0)(v87).numColumns;
        end, {
            v85, 
            v81.getPageLayoutConfig
        });
        v83 = v24.useSignalState(v88);
    else
        local v89, v90 = v2.useState(1);
        v83 = v89;
        v84 = v90;
    end;
    local v92 = l_useAppPolicy_0(function(v91) --[[ Line: 190 ]]
        return v91.useGridPageLayout();
    end);
    local v93 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v92 = v92 and not v93;
    local v95 = l_useSelector_0(function(v94) --[[ Line: 198 ]]
        return v94.FormFactor;
    end);
    local v97 = l_useSelector_0(function(v96) --[[ Line: 202 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref)
        return v96.Personalization[l_TopicContentsReducer_0.key];
    end);
    local v100 = l_useSelector_0(function(v98) --[[ Line: 206 ]]
        -- upvalues: l_appPage_0 (copy)
        local v99 = v98.OmniRecommendations[l_appPage_0];
        if v99 then
            return v99.sorts;
        else
            return {};
        end;
    end);
    local v101 = if l_numberOfRows_0 and l_numberOfRows_0 > 0 then l_numberOfRows_0 else math.floor(v32 / v83);
    local v102 = if not l_FFlagLuaAppRfySignalApportioning_0 or l_FFlagLuaAppRfySignalApportioningIxp_0 then v30(v50.topicId, l_feedItemPosition_0, v83, v101, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v97 and v97[l_topicId_0] and v97[l_topicId_0].entries or v47 else nil) else nil;
    local v103 = nil;
    if l_FFlagLuaAppRfySignalApportioning_0 then
        local v104 = v101 or 99999;
        if v104 == -1 then
            v104 = 99999;
        end;
        do
            local l_v104_0 = v104;
            v2.useEffect(function() --[[ Line: 238 ]]
                -- upvalues: v83 (ref), l_v104_0 (ref), v82 (copy), v50 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref)
                local v106 = v83 * l_v104_0;
                v82.updateApportioningCapacity(v50.topicId, v50.sortIndex, v106, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v50.recommendationsRequestId else nil);
            end, {
                v83, 
                l_v104_0, 
                v50.topicId, 
                v50.sortIndex, 
                v82, 
                if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v50.recommendationsRequestId else nil
            });
            local v114 = v2.useMemo(function() --[[ Line: 258 ]]
                -- upvalues: v23 (ref), v82 (copy), v50 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_DiscoveryEventErrorLogger_0 (ref), v3 (ref)
                return v23.createComputed(function(v107) --[[ Line: 259 ]]
                    -- upvalues: v82 (ref), v50 (ref), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (ref), l_DiscoveryEventErrorLogger_0 (ref), v3 (ref)
                    local v108 = v82.getApportionedItems(v50.topicId, v50.sortIndex, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v50.recommendationsRequestId else nil)(v107);
                    if not v108 then
                        return nil;
                    else
                        local v109 = v82.getSingleGridApportioningMetadata(v50.topicId, v50.sortIndex, if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v50.recommendationsRequestId else nil)(v107);
                        local v110 = v109 and v109.startingItemIndex;
                        if not v110 and #v108 > 0 then
                            l_DiscoveryEventErrorLogger_0.reportError("HomeGameGridRenderingWithMissingStartingItemIndex", "Starting item index not found in apportioning data for topicId {props.topicId} and sortIndex {props.sortIndex}, defaulting to 1", {
                                topicId = v50.topicId, 
                                sortIndex = v50.sortIndex
                            });
                        end;
                        local v111 = {};
                        for v112, v113 in v108 do
                            table.insert(v111, (v3.Dictionary.join(v113, {
                                topicContentsIndex = (v110 or 1) + v112 - 1
                            })));
                        end;
                        return v111;
                    end;
                end);
            end, {
                v82, 
                v50.topicId, 
                v50.sortIndex, 
                if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v50.recommendationsRequestId else nil
            });
            v103 = v24.useSignalState(v114);
        end;
    end;
    local v125 = if not l_FFlagLuaAppRfySignalApportioning_0 or l_FFlagLuaAppRfySignalApportioningIxp_0 then v2.useMemo(function() --[[ Line: 308 ]]
        -- upvalues: l_topicId_0 (copy), v97 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v102 (copy), v3 (ref)
        local v115 = nil;
        if l_topicId_0 then
            v115 = v97 and v97[l_topicId_0] or nil;
        end;
        local v116 = v115 and v115.entries or {};
        if v115 and v115.hasMoreRows then
            warn((("HomeGameGridFlexFeedItem may need to fetch more metadata for topicId %*"):format(l_topicId_0)));
        end;
        local v117 = {};
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
            local v118 = v102 and v102.entryIndices;
            local v119 = v102 and v102.firstIndex or 1;
            if v118 then
                for v120, v121 in ipairs(v118) do
                    local v122 = v116[v121];
                    if v122 then
                        table.insert(v117, v3.Dictionary.join(v122, {
                            topicContentsIndex = v119 + v120 - 1
                        }));
                    end;
                end;
                return v117;
            end;
        else
            local v123 = v102 and v102.firstIndex or nil;
            if v123 ~= nil then
                local v124 = v123 + (v102 and v102.numberOfTiles or 0);
                while v123 <= #v116 and v123 < v124 do
                    table.insert(v117, (v3.Dictionary.join(v116[v123], {
                        topicContentsIndex = v123
                    })));
                    v123 = v123 + 1;
                end;
            end;
        end;
        return v117;
    end, l_dependencyArray_0(l_topicId_0, v97, v100, v102)) else nil;
    local v126 = nil;
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
        local v127 = if v73 then v103 else v125;
        local l_v127_0 = v127 --[[ copy: 43 -> 44 ]];
        v126 = v2.useMemo(function() --[[ Line: 358 ]]
            -- upvalues: l_v127_0 (copy), l_GameCollectionItemTypes_0 (ref), l_GameCollectionItemBuilder_0 (ref), v83 (ref), l_appPage_0 (copy), l_sortIndex_0 (copy), l_topicId_0 (copy)
            if not l_v127_0 then
                return l_v127_0;
            else
                local v129 = {};
                local v130 = {};
                for v131, v132 in l_v127_0 do
                    if v132.componentType == l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile then
                        v129[v131] = {
                            colSpan = 2, 
                            rowSpan = 1, 
                            alignmentType = v132.alignmentType, 
                            minRowPadding = tonumber(v132.minRowPadding) or 0
                        };
                        v130[v131] = l_GameCollectionItemTypes_0.GameCollectionItemType.TwoByOneTile;
                    end;
                end;
                return l_GameCollectionItemBuilder_0.BuildCollectionEntries(l_v127_0, v83, v129, v130, nil, l_appPage_0, l_sortIndex_0, l_topicId_0);
            end;
        end, {
            v127, 
            v83, 
            l_appPage_0, 
            l_sortIndex_0, 
            l_topicId_0
        });
    else
        v126 = if v73 then v103 else v125;
    end;
    local v133 = nil;
    if v73 and v126 or not v73 and v102 then
        v133 = math.ceil(#v126 / v83);
    end;
    v29(l_appPage_0, nil, l_feedItemPosition_0, if l_FFlagLuaAppFixHomeGridPlaceholderFlowIssues_0 then v133 or -1 else v133);
    if (not v73 or v126) and #v126 > 0 then
        if l_FFlagLuaAppRfySignalApportioning_0 and v48 then
            l_default_0:logRobloxTelemetryCounter({
                eventName = "HomeGameGridReturnedGridAfterNil", 
                backends = {
                    v25.TelemetryBackends.Counter
                }
            }, 1, {
                experimentTreatment = v61 == true and "signal_apportioning_treatment" or v61 == false and "control" or "not_in_experiment"
            });
            v48 = false;
        end;
        if v39 and v49 then
            l_default_0:logRobloxTelemetryCounter({
                eventName = "HomeGameGridReturnedGridAfterPlaceholder", 
                backends = {
                    v25.TelemetryBackends.Counter
                }
            }, 1, {
                experimentTreatment = v61 == true and "signal_apportioning_treatment" or v61 == false and "control" or "not_in_experiment"
            });
            v49 = false;
        end;
        return v2.createElement(l_GameCollectionGrid_0, {
            entries = v126, 
            title = v79, 
            friendFooterEnabled = true, 
            sortIndex = l_sortIndex_0, 
            gameSortId = l_topicId_0, 
            pageContext = l_appPage_0, 
            scrollViewPositionChangedSignal = v50[v31.key].scrollViewPositionChangedSignal, 
            onItemsPerRowChanged = v84, 
            useGridTiles = v52, 
            playerCountStyle = v53, 
            isSponsoredFooterAllowed = v70, 
            componentType = v54, 
            gameTileLayoutType = v56, 
            gridSupportAllowed = true, 
            isHoverSupportEnabled = true, 
            verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
            startRow = l_feedItemStartRow_0, 
            maxNumRows = if l_numberOfRows_0 and l_numberOfRows_0 > 0 then l_numberOfRows_0 else nil, 
            playButtonStyle = v55, 
            sideMargin = if v95 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0, 
            shouldHideTileMetadata = v57, 
            shouldHideTileTitle = v58, 
            containedTile = v59, 
            numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
            selectionOrderBase = v50[v31.key].selectionOrderBase, 
            enableExplicitFeedback = v60, 
            sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v62 else nil, 
            enableSponsoredFeedback = v63, 
            enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v64 else nil, 
            isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v65 else nil, 
            sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v66 else nil, 
            sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v67 else nil, 
            sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v68 else nil
        });
    elseif v73 and v126 == nil or not v73 and v102 == nil then
        if l_FFlagLuaAppRfySignalApportioning_0 and not v49 then
            l_default_0:logRobloxTelemetryCounter({
                eventName = "HomeGameGridReturnedPlaceholder", 
                backends = {
                    v25.TelemetryBackends.Counter
                }
            }, 1, {
                experimentTreatment = v61 == true and "signal_apportioning_treatment" or v61 == false and "control" or "not_in_experiment"
            });
            v49 = true;
        end;
        return (v2.createElement(l_PlaceholderGameGrid_0, {
            title = v79, 
            onItemsPerRowChanged = v84, 
            useGridTiles = v52, 
            componentType = v54, 
            gameTileLayoutType = v56, 
            gridSupportAllowed = true, 
            isHoverSupportEnabled = true, 
            numRows = if v34 then v101 else l_numberOfRows_0 or 0, 
            sideMargin = if v95 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0, 
            verticalScrollingFrameRef = l_verticalScrollingFrameRef_0, 
            shouldHideTileMetadata = v57, 
            shouldHideTileTitle = v58, 
            containedTile = v59
        }));
    else
        if l_FFlagLuaAppRfySignalApportioning_0 and not v48 then
            l_default_0:logRobloxTelemetryCounter({
                eventName = "HomeGameGridReturnedNil", 
                backends = {
                    v25.TelemetryBackends.Counter
                }
            }, 1, {
                experimentTreatment = v61 == true and "signal_apportioning_treatment" or v61 == false and "control" or "not_in_experiment"
            });
            v48 = true;
        end;
        return nil;
    end;
end;