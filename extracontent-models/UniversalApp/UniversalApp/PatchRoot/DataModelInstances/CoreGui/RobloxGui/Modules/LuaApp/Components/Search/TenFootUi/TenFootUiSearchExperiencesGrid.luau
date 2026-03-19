local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_EmptyState_0 = v2.App.Indicator.EmptyState;
local l_LoadingStateContainer_0 = v2.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v2.App.Loading.Enum.RetrievalStatus;
local l_LoadingSpinner_0 = v2.App.Loading.LoadingSpinner;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v13 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_RoactNetworking_0 = v13.RoactNetworking;
local l_RoactAnalyticsCommonGameEvents_0 = v13.RoactAnalyticsCommonGameEvents;
local l_RoactAnalytics_0 = v13.RoactAnalytics;
local l_AppEventIngestService_0 = v13.AppEventIngestService;
local l_AppSessionService_0 = v13.AppSessionService;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_useAnimatedScrollToSelection_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useAnimatedScrollToSelection;
local l_GameSortImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.GameCollections).GameSortImpressionsDetector;
local l_SendGameImpressions_0 = require(l_CorePackages_0.Workspace.Packages.GameCollections).SendGameImpressions;
local v24 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_GameTileConstants_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).GameTileConstants;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SearchRetrievalStatus_0 = l_Modules_0.LuaApp.Enum.SearchRetrievalStatus;
local l_FetchDataWithErrorToasts_0 = l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts;
local l_ApiFetchGameSearchResults_0 = l_Modules_0.LuaApp.Thunks.Search.ApiFetchGameSearchResults;
local l_GameGridTable_0 = l_Modules_0.LuaApp.Components.Games.GameGridTable;
local l_SearchTextBanner_0 = l_Modules_0.Personalization.Search.SearchTextBanner;
local l_RemoveTextSearchResults_0 = l_Modules_0.LuaApp.Actions.RemoveTextSearchResults;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v34 = require(l_Modules_1.LuaApp.Hooks.useLocalization);
local v35 = require(l_Modules_1.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v36 = require(l_Modules_1.LuaApp.Thunks.ConfirmSearch);
local v37 = require(l_Modules_1.LuaApp.Constants);
local function v39(v38) --[[ Line: 51 ]]
    return v38.ScreenSize;
end;
return function(v40) --[[ Line: 55 ]] --[[ Name: TenFootUiSearchExperiencesGrid ]]
    -- upvalues: v1 (copy), l_Signal_0 (copy), l_SearchRetrievalStatus_0 (copy), l_useSelector_0 (copy), v39 (copy), l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), v24 (copy), l_SearchTextBanner_0 (copy), l_RemoveTextSearchResults_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppSessionService_0 (copy), l_RoactAnalytics_0 (copy), l_useNavigation_0 (copy), l_useAnimatedScrollToSelection_0 (copy), l_FetchDataWithErrorToasts_0 (copy), l_ApiFetchGameSearchResults_0 (copy), v34 (copy), l_SearchTypes_0 (copy), v36 (copy), l_AppPage_0 (copy), l_SendGameImpressions_0 (copy), l_EmptyState_0 (copy), l_GameTileConstants_0 (copy), v35 (copy), l_GameGridTable_0 (copy), v37 (copy), l_GameSortImpressionsDetector_0 (copy), l_LoadingSpinner_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    local v41 = v1.useRef(nil);
    local l_searchKeyword_0 = v40.searchKeyword;
    local l_layoutOrder_0 = v40.layoutOrder;
    local l_searchType_0 = v40.searchType;
    local l_searchUuid_0 = v40.searchUuid;
    local v46 = v1.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local function v49(v47) --[[ Line: 67 ]] --[[ Name: selectSearchInGamesStatus ]]
        -- upvalues: l_searchUuid_0 (copy), l_SearchRetrievalStatus_0 (ref)
        local v48 = v47.RequestsStatus.SearchesInGamesStatus[l_searchUuid_0];
        if v48 == nil then
            v48 = l_SearchRetrievalStatus_0.NotStarted;
        end;
        return v48;
    end;
    local v50 = l_useSelector_0(v39);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 76 ]]
        -- upvalues: l_searchUuid_0 (copy)
        return v51.Search.SearchesInGames[l_searchUuid_0] or {
            entries = {}, 
            suggestedKeyword = nil, 
            filteredKeyword = nil, 
            correctedKeyword = nil, 
            hasMoreRows = nil, 
            emphasis = nil, 
            algorithm = nil, 
            suggestionAlgorithm = nil
        };
    end);
    local v53 = l_useSelector_0(v49);
    local v54, v55 = v1.useState(v50);
    local v56, v57 = v1.useState(v54.X);
    local v58, v59 = v1.useState(false);
    local l_entries_0 = v52.entries;
    local v61 = "SearchPage" .. tostring(l_searchUuid_0);
    v1.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v53 (copy), l_SearchRetrievalStatus_0 (ref), v59 (copy), v58 (copy)
        if v53 == l_SearchRetrievalStatus_0.Done then
            v59(true);
            return;
        else
            if v53 == l_SearchRetrievalStatus_0.NotStarted and v58 then
                v59(false);
            end;
            return;
        end;
    end, {
        v53
    });
    local v62 = l_useDispatch_0();
    local v63 = l_useDesignTokens_0();
    local v65 = l_useSelector_0(function(v64) --[[ Line: 113 ]]
        -- upvalues: v40 (copy), v24 (ref)
        return v64.TextSearchResults[v40.searchUuid] and v64.TextSearchResults[v40.searchUuid][v24.SearchTextTopicIds.HotlineSearchText] or nil;
    end);
    local v66 = v1.useMemo(function() --[[ Line: 120 ]]
        -- upvalues: v65 (copy), v1 (ref), l_SearchTextBanner_0 (ref)
        if not v65 then
            return nil;
        else
            return v1.createElement(l_SearchTextBanner_0, {
                text = v65.text
            });
        end;
    end, {
        v65
    });
    v1.useEffect(function() --[[ Line: 129 ]]
        -- upvalues: v62 (copy), l_RemoveTextSearchResults_0 (ref), l_searchUuid_0 (copy)
        return function() --[[ Line: 130 ]]
            -- upvalues: v62 (ref), l_RemoveTextSearchResults_0 (ref), l_searchUuid_0 (ref)
            v62(l_RemoveTextSearchResults_0(l_searchUuid_0));
        end;
    end, {
        l_searchUuid_0
    });
    local v67 = l_useRoactService_0(l_RoactNetworking_0);
    local v68 = l_useRoactService_0(l_AppEventIngestService_0);
    local v69 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v70 = l_useRoactService_0(l_AppSessionService_0);
    local v71 = l_useRoactService_0(l_RoactAnalytics_0);
    local v72 = l_useNavigation_0();
    local function v74(v73) --[[ Line: 141 ]]
        -- upvalues: v57 (copy)
        v57(v73.AbsoluteSize.X);
    end;
    local v76 = v1.useCallback(function(v75) --[[ Line: 144 ]]
        -- upvalues: v55 (copy)
        if v75 then
            v55(v75.AbsoluteSize);
        end;
    end, {});
    local v77 = v41.current and v41.current.AbsoluteSize.Y * 0.35 or 0;
    local v78, v79 = v1.useState(false);
    local v80, v81 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.Y, v77);
    local v86 = v1.useCallback(function(v82, v83, v84, v85) --[[ Line: 155 ]]
        -- upvalues: v79 (copy), v77 (copy), v81 (copy)
        v79(v82.CanvasPosition.Y > v77);
        v81(v82, v83, v84, v85);
    end, {
        v77, 
        v81
    });
    local v87 = v1.useCallback(function() --[[ Line: 162 ]]
        -- upvalues: v62 (copy), l_FetchDataWithErrorToasts_0 (ref), l_ApiFetchGameSearchResults_0 (ref), v67 (copy), l_searchKeyword_0 (copy), l_searchUuid_0 (copy)
        return v62(l_FetchDataWithErrorToasts_0(l_ApiFetchGameSearchResults_0(v67, {
            searchKeyword = l_searchKeyword_0, 
            searchUuid = l_searchUuid_0, 
            isAppend = true
        })));
    end, {
        v62, 
        v67, 
        l_searchKeyword_0, 
        l_searchUuid_0
    });
    local v88 = v34({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet", 
        games = "CommonUI.Features.Label.Game", 
        noResultsText = "Feature.GamePage.LabelNoSearchResults", 
        players = "CommonUI.Features.Label.Players"
    });
    v1.useEffect(function() --[[ Line: 177 ]]
        -- upvalues: l_searchKeyword_0 (copy), v72 (copy), v68 (copy), v70 (copy), l_SearchTypes_0 (ref), v62 (copy), v36 (ref), l_ApiFetchGameSearchResults_0 (ref), v67 (copy), l_searchUuid_0 (copy)
        if l_searchKeyword_0 == "" then
            return;
        else
            assert(v72, "Expected navigation, found none");
            assert(v68, "Expected eventIngest, found none");
            assert(v70, "Expected sessionService, found none");
            local v89 = {
                isAutocompleteSuggestion = false, 
                allAutocompleteSuggestions = false, 
                searchType = l_SearchTypes_0.Games, 
                isAvatarAutocompleteEnabled = false, 
                pageOwner = v72.state.routeName, 
                sessionService = v70, 
                eventIngest = v68
            };
            v62(v36(l_searchKeyword_0, v89));
            v62(l_ApiFetchGameSearchResults_0(v67, {
                searchKeyword = l_searchKeyword_0, 
                searchUuid = l_searchUuid_0, 
                isAppend = false
            }));
            return;
        end;
    end, {
        l_searchKeyword_0, 
        l_searchUuid_0, 
        v62, 
        v68, 
        v70, 
        v67
    });
    local l_SearchBoxAndTypeOffset_0 = v63.LuaApps.Search.SearchBoxAndTypeOffset;
    local function v99(v91) --[[ Line: 206 ]]
        -- upvalues: v52 (copy), v69 (copy), l_AppPage_0 (ref)
        local v92 = v52.entries or {};
        local v93 = v92[v91];
        if v93 ~= nil then
            local l_placeId_0 = v93.placeId;
            local l_isSponsored_0 = v93.isSponsored;
            local l_adId_0 = v93.adId;
            local v97 = #v92;
            local l_universeId_0 = v93.universeId;
            v69.reportOpenGameDetailFromSearch(l_placeId_0, v91, v97, l_isSponsored_0, l_adId_0, l_universeId_0, l_AppPage_0.SearchPage, nil, nil);
        end;
    end;
    local function v102(v100) --[[ Line: 230 ]]
        -- upvalues: l_searchUuid_0 (copy), v52 (copy), l_SendGameImpressions_0 (ref), v68 (copy), v71 (copy), l_AppPage_0 (ref)
        local v101 = {
            searchUuid = l_searchUuid_0, 
            emphasisFlag = v52.emphasis and 1 or 0, 
            seeAllFlag = 1
        };
        l_SendGameImpressions_0.sendFromSearch(v68, v71, v100, v52.entries, l_AppPage_0.SearchPage, v101, nil, nil);
    end;
    local v103 = false;
    if l_searchType_0 == l_SearchTypes_0.Games then
        v103 = false;
        if v52 ~= nil then
            v103 = not v52.hasMoreRows and (not (v52.entries ~= nil) or #v52.entries == 0) and not v66;
        end;
    end;
    local v105 = v1.useCallback(function() --[[ Line: 256 ]]
        -- upvalues: v103 (copy), v1 (ref), l_SearchBoxAndTypeOffset_0 (copy), l_layoutOrder_0 (copy), l_EmptyState_0 (ref), v88 (copy), v50 (copy), v63 (copy), l_GameTileConstants_0 (ref), v78 (copy), v74 (copy), v66 (copy), v35 (ref), v41 (copy), v80 (copy), v76 (copy), v46 (copy), v52 (copy), v87 (copy), v86 (copy), v24 (ref), l_GameGridTable_0 (ref), l_entries_0 (copy), v56 (copy), v54 (copy), v99 (copy), v61 (copy), v37 (ref), l_GameSortImpressionsDetector_0 (ref), l_AppPage_0 (ref), v102 (copy)
        if v103 then
            return v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                Position = UDim2.new(0, 0, 0, l_SearchBoxAndTypeOffset_0), 
                LayoutOrder = l_layoutOrder_0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                NoResultsView = v1.createElement(l_EmptyState_0, {
                    text = v88.noResultsText, 
                    maxSizeTextLabel = Vector2.new(v50.X - v63.Global.Size_500, v50.Y)
                })
            });
        else
            local l_Footer_0 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
            return v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                LayoutOrder = l_layoutOrder_0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                SelectionGroup = true, 
                SelectionBehaviorUp = if v78 then Enum.SelectionBehavior.Stop else nil, 
                [v1.Change.AbsoluteSize] = v74
            }, {
                CanvasGroupMask = v1.createElement("CanvasGroup", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    TextComponent = if v66 then v66 else nil, 
                    ScrollingFrame = if v66 then nil else v1.createElement(v35, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        CanvasSize = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        ref = v41, 
                        canvasPosition = v80, 
                        onAbsoluteSizeChangedCallback = v76, 
                        onCanvasPositionChangedCallback = function() --[[ Line: 297 ]] --[[ Name: onCanvasPositionChangedCallback ]]
                            -- upvalues: v46 (ref)
                            v46:fire();
                        end, 
                        onLoadMore = v52.hasMoreRows and v87 or nil, 
                        onSelectionChanged = v86
                    }, {
                        Layout = v1.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, v63.Global.Space_100)
                        }), 
                        Padding = v1.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 0), 
                            PaddingRight = UDim.new(0, 0), 
                            PaddingTop = UDim.new(0, v24.Constants.GAME_GRID_PADDING), 
                            PaddingBottom = UDim.new(0, v24.Constants.GAME_GRID_PADDING)
                        }), 
                        GameGridWrapper = v1.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1
                        }, {
                            Layout = v1.createElement("UIListLayout", {
                                HorizontalAlignment = Enum.HorizontalAlignment.Center
                            }), 
                            Padding = v1.createElement("UIPadding", {
                                PaddingBottom = UDim.new(0, l_SearchBoxAndTypeOffset_0)
                            }), 
                            GameGridTable = v1.createElement(l_GameGridTable_0, {
                                searchResultGrid = true, 
                                entries = l_entries_0, 
                                screenSize = v50, 
                                windowSize = Vector2.new(v56, v54.Y), 
                                gameEmphasis = false, 
                                source = "SearchResults", 
                                useHoverTile = false, 
                                reportGameDetailOpened = v99, 
                                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                                impressionsTag = v61, 
                                launchExperienceEventContext = v37.AnalyticsContext.SearchExperienceTile, 
                                playerCountStyle = l_Footer_0
                            }), 
                            GameSortImpressionsDetector = v1.createElement(l_GameSortImpressionsDetector_0, {
                                parentRef = v41, 
                                pageContext = l_AppPage_0.SearchPage, 
                                impressionsTag = v61, 
                                scrollViewPositionChangedSignal = v46, 
                                sendGameImpressions = v102
                            })
                        })
                    })
                })
            });
        end;
    end, {
        l_SearchBoxAndTypeOffset_0, 
        l_layoutOrder_0, 
        v63, 
        v88, 
        v74, 
        v52, 
        v103, 
        v76, 
        v46, 
        l_entries_0, 
        v87, 
        v50, 
        v54, 
        v56, 
        v99, 
        v61, 
        v102, 
        v66
    });
    local v106 = v1.useCallback(function() --[[ Line: 375 ]]
        -- upvalues: v58 (copy), v105 (copy), v1 (ref), l_SearchBoxAndTypeOffset_0 (copy), l_layoutOrder_0 (copy), l_LoadingSpinner_0 (ref), v63 (copy)
        if v58 and v105 ~= nil then
            return v105();
        else
            return v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
                Position = UDim2.new(0, 0, 0, 0), 
                LayoutOrder = l_layoutOrder_0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                LoadingSpinner = v1.createElement(l_LoadingSpinner_0, {
                    size = UDim2.fromOffset(v63.Global.Size_350, v63.Global.Size_350), 
                    position = UDim2.fromScale(0.5, 0.5), 
                    anchorPoint = Vector2.new(0.5, 0.5)
                })
            });
        end;
    end, {
        v58, 
        v63, 
        v105, 
        l_SearchBoxAndTypeOffset_0, 
        l_layoutOrder_0
    });
    local v107 = v1.useCallback(function() --[[ Line: 407 ]]
        -- upvalues: v1 (ref), l_SearchBoxAndTypeOffset_0 (copy), l_layoutOrder_0 (copy), l_EmptyState_0 (ref), v88 (copy), v50 (copy), v63 (copy)
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -l_SearchBoxAndTypeOffset_0), 
            Position = UDim2.new(0, 0, 0, l_SearchBoxAndTypeOffset_0), 
            LayoutOrder = l_layoutOrder_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            NoResultsView = v1.createElement(l_EmptyState_0, {
                text = v88.failedMessage, 
                maxSizeTextLabel = Vector2.new(v50.X - v63.Global.Size_500, v50.Y)
            })
        });
    end, {
        l_SearchBoxAndTypeOffset_0, 
        l_layoutOrder_0, 
        v50, 
        v63, 
        v88.failedMessage
    });
    if l_searchType_0 ~= l_SearchTypes_0.Games then
        return v1.createElement(v1.Fragment, nil, {});
    else
        return v1.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(v53), 
            renderOnEmpty = function() --[[ Line: 436 ]] --[[ Name: renderOnEmpty ]]
                return nil;
            end, 
            renderOnFailed = v107, 
            renderOnLoading = v106, 
            renderOnLoaded = v105
        });
    end;
end;