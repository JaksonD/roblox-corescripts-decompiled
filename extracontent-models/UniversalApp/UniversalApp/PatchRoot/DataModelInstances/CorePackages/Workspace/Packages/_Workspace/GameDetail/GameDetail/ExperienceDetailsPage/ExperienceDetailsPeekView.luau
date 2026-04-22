local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(script.Parent.ExperienceDetailsPageUtils);
local v2 = require(script.Parent.ExperienceDetailsPageConstants);
local v3 = require(script.Parent.fetchExperienceDetailsPage);
local v4 = require(script.Parent.getExperienceDetailsPageKey);
local v5 = require(script.Parent.Fallback.ExperienceDetailsFallbackActionBar);
local v6 = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed);
local v7 = require(l_Parent_0.DiscoveryTypes);
local l_gameDetailsPeekViewEvents_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents;
local _ = require(l_Parent_0.Navigation);
local v10 = require(l_Parent_0.Foundation);
local v11 = require(l_Parent_0.React);
local v12 = require(l_Parent_0.PeekView);
local l_useTokens_0 = v10.Hooks.useTokens;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_PeekViewWithTopBar_0 = v12.PeekViewWithTopBar;
local l_PeekViewState_0 = v12.PeekViewState;
local l_getSafeAreaSize_0 = require(l_Parent_0.InputUi).getSafeAreaSize;
local l_useDeviceInsets_0 = require(l_Parent_0.Responsive).useDeviceInsets;
local v19 = require(l_Parent_0.DataHydration);
local l_useTopBarHeight_0 = require(l_Parent_0.RobloxAppHooks).useTopBarHeight;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v23 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v23.AppEventIngestService;
local l_AppSessionService_0 = v23.AppSessionService;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v28 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v28.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v28.Hooks.RoactRodux.useDispatch;
local v31 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiFeatureEntryPoint_0 = v31.SduiFeatureEntryPoint;
local l_SduiPageEntryPoint_0 = v31.SduiPageEntryPoint;
local l_SduiPageNavigationHeader_0 = v31.SduiPageNavigationHeader;
local l_SduiLoadTimer_0 = v31.SduiLoadTimer;
local l_UiStatus_0 = v31.UiStatus;
local l_useUiStatus_0 = v31.useUiStatus;
local l_CompositionTags_0 = require(l_Parent_0.AppComposition).CompositionTags;
local l_FFlagSduiPageEntryUseSharedHooks_0 = require(l_Parent_0.SharedFlags).FFlagSduiPageEntryUseSharedHooks;
local l_FFlagLuaAppCompositionSduiEnabled_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSduiEnabled;
return v11.memo(function(v41) --[[ Line: 56 ]] --[[ Name: ExperienceDetailsPeekView ]]
    -- upvalues: v1 (copy), v4 (copy), l_useTokens_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_useDispatch_0 (copy), l_useTopBarHeight_0 (copy), l_useScreenSize_0 (copy), l_useDeviceInsets_0 (copy), l_getSafeAreaSize_0 (copy), v11 (copy), v7 (copy), l_useSelector_0 (copy), l_PeekViewState_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), l_SduiLoadTimer_0 (copy), v3 (copy), l_useUiStatus_0 (copy), l_UiStatus_0 (copy), v19 (copy), l_gameDetailsPeekViewEvents_0 (copy), l_PeekViewWithTopBar_0 (copy), l_SduiPageNavigationHeader_0 (copy), l_SduiPageEntryPoint_0 (copy), l_FFlagSduiPageEntryUseSharedHooks_0 (copy), v2 (copy), l_FFlagLuaAppCompositionSduiEnabled_0 (copy), l_CompositionTags_0 (copy), v6 (copy), l_SduiFeatureEntryPoint_0 (copy), v5 (copy)
    local v42 = v1.getUniverseId(v41);
    local v43 = v1.getAnalyticsSource(v41);
    local v44 = v1.getTilePositionIndex(v41);
    local v45 = v1.getFromPropsOrNavigationParams(v41, "onPeekViewClosed");
    local v46 = v4(v42);
    local v47 = l_useTokens_0();
    local v48 = l_useNavigation_0();
    local v49 = l_useRoactService_0(l_AppEventIngestService_0);
    local v50 = l_useRoactService_0(l_AppSessionService_0);
    local v51 = l_useDispatch_0();
    local v52 = v1.getFromPropsOrNavigationParams(v41, "referralSource");
    local v53 = v1.getFromPropsOrNavigationParams(v41, "experienceJoinData");
    local v54 = v1.getFromPropsOrNavigationParams(v41, "placeIdOverride");
    local v55 = l_useTopBarHeight_0();
    local v56 = l_useScreenSize_0();
    local v57 = l_useDeviceInsets_0();
    local v58 = math.min(l_getSafeAreaSize_0(v56, v57).X.Offset, 640);
    local v59 = v11.useRef(nil);
    local v60, v61 = v11.useState(v7.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT);
    local v64 = v11.useCallback(function(v62) --[[ Line: 81 ]]
        -- upvalues: v61 (copy)
        local l_Y_0 = v62.AbsoluteSize.Y;
        if l_Y_0 > 0 then
            v61(l_Y_0);
        end;
    end, {});
    local v65 = UDim.new(0, v58 + v60);
    local v67 = l_useSelector_0(function(v66) --[[ Line: 89 ]]
        return v66.GameDetailsPeekView.viewState;
    end);
    local v68 = v1.getFromPropsOrNavigationParams(v41, "mountAsFullView");
    local v69 = if v68 ~= nil then v68 else v67 == l_PeekViewState_0.Full or v67 == l_PeekViewState_0.Extended;
    local v70 = v67 == l_PeekViewState_0.Closed;
    local v71 = v11.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v45 (copy), v48 (copy), l_AppPage_0 (ref), v50 (copy), l_SessionType_0 (ref)
        if v45 and typeof(v45) == "function" then
            v45();
        end;
        v48.clearAppScreens({
            l_AppPage_0.GameDetail
        });
        if v50 then
            v50:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
        end;
    end, {
        v48, 
        v50, 
        v45, 
        v42, 
        v43, 
        v44
    });
    local v73 = v11.useMemo(function() --[[ Line: 108 ]]
        -- upvalues: v1 (ref), v41 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref)
        local v72 = v1.getFromPropsOrNavigationParams(v41, "pageTimer");
        if v72 then
            return v72;
        else
            return l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
        end;
    end, {});
    v11.useEffect(function() --[[ Line: 116 ]]
        -- upvalues: v42 (copy), v73 (copy), v3 (ref)
        if v42 and v73 then
            v3(v42, v73);
        end;
    end, {
        v42, 
        v73
    });
    local v74 = l_useUiStatus_0(v46);
    v11.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v74 (copy), l_UiStatus_0 (ref), v42 (copy), v19 (ref)
        if v74 == l_UiStatus_0.Error and v42 then
            v19.Game.getGameInfoStore(false).getAndFetchGameInfo(v42, function(v75) --[[ Line: 127 ]]
                local v76 = true;
                if v75 ~= nil then
                    v76 = v75.creator == nil;
                end;
                return v76;
            end);
            v19.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(v42);
        end;
    end, {
        v74, 
        v42
    });
    local v77 = v11.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v42 (copy), v73 (copy), v3 (ref)
        if v42 and v73 then
            v3(v42, v73, true);
        end;
    end, {
        v42, 
        v73
    });
    local v81 = v11.useCallback(function(v78, v79) --[[ Line: 141 ]]
        -- upvalues: v42 (copy), l_PeekViewState_0 (ref), v67 (copy), l_gameDetailsPeekViewEvents_0 (ref), v49 (copy), v43 (copy), v44 (copy), v51 (copy), v71 (copy)
        local v80 = v42 or "";
        if v42 and v78 == l_PeekViewState_0.Brief then
            if v67 == l_PeekViewState_0.Brief then
                l_gameDetailsPeekViewEvents_0(v49, "SwitchGame", v80, v43, v44);
            elseif v79 == l_PeekViewState_0.Closed then
                l_gameDetailsPeekViewEvents_0(v49, "OpenPeekView", v80, v43, v44);
            end;
        end;
        v51({
            type = "SetGameDetailsPeekViewState", 
            viewState = v78
        });
        if v42 and v78 == l_PeekViewState_0.Full and v79 == l_PeekViewState_0.Brief then
            l_gameDetailsPeekViewEvents_0(v49, "GoToFullView", v80, v43, v44);
        end;
        if v78 == l_PeekViewState_0.Closed then
            v71();
        end;
    end, {
        v51, 
        v49, 
        v42, 
        v43, 
        v44, 
        v67, 
        v71
    });
    v11.useEffect(function() --[[ Line: 161 ]]
        -- upvalues: v51 (copy), l_PeekViewState_0 (ref)
        return function() --[[ Line: 162 ]]
            -- upvalues: v51 (ref), l_PeekViewState_0 (ref)
            v51({
                type = "SetGameDetailsPeekViewState", 
                viewState = l_PeekViewState_0.Closed
            });
        end;
    end, {
        v51
    });
    if v42 == nil then
        return nil;
    else
        return v11.createElement(l_PeekViewWithTopBar_0, {
            topBarHeight = v55, 
            bottomDockedContainerHeight = v60, 
            fullViewContentHeight = UDim.new(1, -v55), 
            briefViewContentHeight = v65, 
            onViewStateChanged = v81, 
            viewChangedEventMeta = {
                universeId = v42, 
                source = v43, 
                index = v44
            }, 
            mountAsFullView = v69, 
            mountAnimation = v70, 
            scrollingFrameRef = v59, 
            topBarSlot = v11.createElement(l_SduiPageNavigationHeader_0, {
                closeCallback = v71, 
                pageSideMargin = v47.Padding.Large, 
                navButtonType = "close"
            }), 
            contentSlot = v11.createElement(l_SduiPageEntryPoint_0, {
                appPage = l_AppPage_0.GameDetail, 
                configKey = v46, 
                identifier = if l_FFlagSduiPageEntryUseSharedHooks_0 then v2.EDP_FEED_IDENTIFIER else v1.getResolvedIdentifier(v46, v2.EDP_FEED_IDENTIFIER_SUFFIX), 
                pageTimer = v73, 
                backgroundStyle = v47.Color.Surface.Surface_100, 
                includeNavigationHeaderBar = false, 
                scrollingFrameRef = v59, 
                contentTag = if l_FFlagLuaAppCompositionSduiEnabled_0 then l_CompositionTags_0.ContentRegion.Body else nil, 
                loadingSlot = v11.createElement(v6.Skeleton, {
                    universeId = v42, 
                    isSmallScreen = true, 
                    launchSource = "LuaGameCard"
                }), 
                errorSlot = v11.createElement(v6.Error, {
                    universeId = v42, 
                    refresh = v77, 
                    isSmallScreen = true, 
                    launchSource = "LuaGameCard", 
                    referralSource = v52, 
                    experienceJoinData = v53, 
                    placeIdOverride = v54
                })
            }), 
            bottomBarSlot = v11.createElement(l_SduiFeatureEntryPoint_0, {
                appPage = l_AppPage_0.GameDetail, 
                configKey = v46, 
                identifier = v2.EDP_ACTION_BAR_IDENTIFIER, 
                loadTimer = v73, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                onAbsoluteSizeChange = v64, 
                loadingSlot = v11.createElement(v5.Skeleton, {
                    universeId = v42, 
                    launchSource = "LuaGameCard", 
                    referralSource = v52, 
                    experienceJoinData = v53, 
                    placeIdOverride = v54
                }), 
                errorSlot = v11.createElement(v5.Error, {
                    universeId = v42, 
                    launchSource = "LuaGameCard", 
                    referralSource = v52, 
                    experienceJoinData = v53, 
                    placeIdOverride = v54
                })
            })
        });
    end;
end);