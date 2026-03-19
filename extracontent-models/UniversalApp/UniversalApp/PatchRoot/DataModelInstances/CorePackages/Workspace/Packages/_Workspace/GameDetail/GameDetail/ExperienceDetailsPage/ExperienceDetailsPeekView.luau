local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(script.Parent.ExperienceDetailsPageUtils);
local v2 = require(script.Parent.ExperienceDetailsPageConstants);
local v3 = require(script.Parent.fetchExperienceDetailsPage);
local v4 = require(script.Parent.getExperienceDetailsPageKey);
local v5 = require(l_Parent_0.DiscoveryTypes);
local l_gameDetailsPeekViewEvents_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents;
local _ = require(l_Parent_0.Navigation);
local v8 = require(l_Parent_0.Foundation);
local v9 = require(l_Parent_0.React);
local v10 = require(l_Parent_0.PeekView);
local l_useTokens_0 = v8.Hooks.useTokens;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_PeekViewWithTopBar_0 = v10.PeekViewWithTopBar;
local l_PeekViewState_0 = v10.PeekViewState;
local l_getSafeAreaSize_0 = require(l_Parent_0.InputUi).getSafeAreaSize;
local l_useDeviceInsets_0 = require(l_Parent_0.Responsive).useDeviceInsets;
local l_useTopBarHeight_0 = require(l_Parent_0.RobloxAppHooks).useTopBarHeight;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v20 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v20.AppEventIngestService;
local l_AppSessionService_0 = v20.AppSessionService;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v25 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v25.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v25.Hooks.RoactRodux.useDispatch;
local v28 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiFeatureEntryPoint_0 = v28.SduiFeatureEntryPoint;
local l_SduiPageEntryPoint_0 = v28.SduiPageEntryPoint;
local l_SduiPageNavigationHeader_0 = v28.SduiPageNavigationHeader;
local l_SduiLoadTimer_0 = v28.SduiLoadTimer;
return v9.memo(function(v33) --[[ Line: 47 ]] --[[ Name: ExperienceDetailsPeekView ]]
    -- upvalues: v1 (copy), v4 (copy), l_useTokens_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_useDispatch_0 (copy), l_useTopBarHeight_0 (copy), l_useScreenSize_0 (copy), l_useDeviceInsets_0 (copy), l_getSafeAreaSize_0 (copy), v9 (copy), v5 (copy), l_useSelector_0 (copy), l_PeekViewState_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), l_SduiLoadTimer_0 (copy), v3 (copy), l_gameDetailsPeekViewEvents_0 (copy), l_PeekViewWithTopBar_0 (copy), l_SduiPageNavigationHeader_0 (copy), l_SduiPageEntryPoint_0 (copy), v2 (copy), l_SduiFeatureEntryPoint_0 (copy)
    local v34 = v1.getUniverseId(v33);
    local v35 = v1.getAnalyticsSource(v33);
    local v36 = v1.getTilePositionIndex(v33);
    local v37 = v1.getFromPropsOrNavigationParams(v33, "onPeekViewClosed");
    local v38 = v4(v34);
    local v39 = l_useTokens_0();
    local v40 = l_useNavigation_0();
    local v41 = l_useRoactService_0(l_AppEventIngestService_0);
    local v42 = l_useRoactService_0(l_AppSessionService_0);
    local v43 = l_useDispatch_0();
    local v44 = l_useTopBarHeight_0();
    local v45 = l_useScreenSize_0();
    local v46 = l_useDeviceInsets_0();
    local v47 = math.min(l_getSafeAreaSize_0(v45, v46).X.Offset, 640);
    local v48 = v9.useRef(nil);
    local v49 = if v48.current then v48.current.AbsoluteSize.Y else v5.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT;
    local v50 = UDim.new(0, v47 + v49);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 71 ]]
        return v51.GameDetailsPeekView.viewState;
    end);
    local v53 = v1.getFromPropsOrNavigationParams(v33, "mountAsFullView");
    local v54 = if v53 ~= nil then v53 else v52 == l_PeekViewState_0.Full or v52 == l_PeekViewState_0.Extended;
    local v55 = v52 == l_PeekViewState_0.Closed;
    local v56 = v9.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v37 (copy), v40 (copy), l_AppPage_0 (ref), v42 (copy), l_SessionType_0 (ref)
        if v37 and typeof(v37) == "function" then
            v37();
        end;
        v40.clearAppScreens({
            l_AppPage_0.GameDetail
        });
        if v42 then
            v42:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
        end;
    end, {
        v40, 
        v42, 
        v37, 
        v34, 
        v35, 
        v36
    });
    local v58 = v9.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v1 (ref), v33 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref)
        local v57 = v1.getFromPropsOrNavigationParams(v33, "pageTimer");
        if v57 then
            return v57;
        else
            return l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
        end;
    end, {});
    v9.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v34 (copy), v58 (copy), v3 (ref)
        if v34 and v58 then
            v3(v34, v58);
        end;
    end, {
        v34, 
        v58
    });
    local v62 = v9.useCallback(function(v59, v60) --[[ Line: 105 ]]
        -- upvalues: v34 (copy), l_PeekViewState_0 (ref), v52 (copy), l_gameDetailsPeekViewEvents_0 (ref), v41 (copy), v35 (copy), v36 (copy), v43 (copy), v56 (copy)
        local v61 = v34 or "";
        if v34 and v59 == l_PeekViewState_0.Brief then
            if v52 == l_PeekViewState_0.Brief then
                l_gameDetailsPeekViewEvents_0(v41, "SwitchGame", v61, v35, v36);
            elseif v60 == l_PeekViewState_0.Closed then
                l_gameDetailsPeekViewEvents_0(v41, "OpenPeekView", v61, v35, v36);
            end;
        end;
        v43({
            type = "SetGameDetailsPeekViewState", 
            viewState = v59
        });
        if v34 and v59 == l_PeekViewState_0.Full and v60 == l_PeekViewState_0.Brief then
            l_gameDetailsPeekViewEvents_0(v41, "GoToFullView", v61, v35, v36);
        end;
        if v59 == l_PeekViewState_0.Closed then
            v56();
        end;
    end, {
        v43, 
        v41, 
        v34, 
        v35, 
        v36, 
        v52, 
        v56
    });
    v9.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: v43 (copy), l_PeekViewState_0 (ref)
        return function() --[[ Line: 126 ]]
            -- upvalues: v43 (ref), l_PeekViewState_0 (ref)
            v43({
                type = "SetGameDetailsPeekViewState", 
                viewState = l_PeekViewState_0.Closed
            });
        end;
    end, {
        v43
    });
    if v34 == nil then
        return nil;
    else
        return v9.createElement(l_PeekViewWithTopBar_0, {
            topBarHeight = v44, 
            bottomDockedContainerHeight = v49, 
            fullViewContentHeight = UDim.new(1, -v44), 
            briefViewContentHeight = v50, 
            onViewStateChanged = v62, 
            viewChangedEventMeta = {
                universeId = v34, 
                source = v35, 
                index = v36
            }, 
            mountAsFullView = v54, 
            mountAnimation = v55, 
            topBarSlot = v9.createElement(l_SduiPageNavigationHeader_0, {
                closeCallback = v56, 
                pageSideMargin = v39.Padding.Large, 
                navButtonType = "close"
            }), 
            contentSlot = v9.createElement(l_SduiPageEntryPoint_0, {
                appPage = l_AppPage_0.GameDetail, 
                configKey = v38, 
                identifier = v1.getResolvedIdentifier(v38, v2.EDP_FEED_IDENTIFIER_SUFFIX), 
                pageTimer = v58, 
                backgroundStyle = v39.Color.Surface.Surface_100, 
                includeNavigationHeaderBar = false
            }), 
            bottomBarSlot = v9.createElement(l_SduiFeatureEntryPoint_0, {
                appPage = l_AppPage_0.GameDetail, 
                configKey = v38, 
                identifier = v2.EDP_ACTION_BAR_IDENTIFIER, 
                loadTimer = v58, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                shouldDisplayError = false, 
                shouldDisplayLoading = false
            })
        });
    end;
end);