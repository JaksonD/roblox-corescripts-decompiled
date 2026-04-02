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
local l_FFlagSduiPageEntryUseSharedHooks_0 = require(l_Parent_0.SharedFlags).FFlagSduiPageEntryUseSharedHooks;
return v9.memo(function(v34) --[[ Line: 49 ]] --[[ Name: ExperienceDetailsPeekView ]]
    -- upvalues: v1 (copy), v4 (copy), l_useTokens_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_useDispatch_0 (copy), l_useTopBarHeight_0 (copy), l_useScreenSize_0 (copy), l_useDeviceInsets_0 (copy), l_getSafeAreaSize_0 (copy), v9 (copy), v5 (copy), l_useSelector_0 (copy), l_PeekViewState_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), l_SduiLoadTimer_0 (copy), v3 (copy), l_gameDetailsPeekViewEvents_0 (copy), l_PeekViewWithTopBar_0 (copy), l_SduiPageNavigationHeader_0 (copy), l_SduiPageEntryPoint_0 (copy), l_FFlagSduiPageEntryUseSharedHooks_0 (copy), v2 (copy), l_SduiFeatureEntryPoint_0 (copy)
    local v35 = v1.getUniverseId(v34);
    local v36 = v1.getAnalyticsSource(v34);
    local v37 = v1.getTilePositionIndex(v34);
    local v38 = v1.getFromPropsOrNavigationParams(v34, "onPeekViewClosed");
    local v39 = v4(v35);
    local v40 = l_useTokens_0();
    local v41 = l_useNavigation_0();
    local v42 = l_useRoactService_0(l_AppEventIngestService_0);
    local v43 = l_useRoactService_0(l_AppSessionService_0);
    local v44 = l_useDispatch_0();
    local v45 = l_useTopBarHeight_0();
    local v46 = l_useScreenSize_0();
    local v47 = l_useDeviceInsets_0();
    local v48 = math.min(l_getSafeAreaSize_0(v46, v47).X.Offset, 640);
    local v49 = v9.useRef(nil);
    local v50 = if v49.current then v49.current.AbsoluteSize.Y else v5.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT;
    local v51 = UDim.new(0, v48 + v50);
    local v53 = l_useSelector_0(function(v52) --[[ Line: 73 ]]
        return v52.GameDetailsPeekView.viewState;
    end);
    local v54 = v1.getFromPropsOrNavigationParams(v34, "mountAsFullView");
    local v55 = if v54 ~= nil then v54 else v53 == l_PeekViewState_0.Full or v53 == l_PeekViewState_0.Extended;
    local v56 = v53 == l_PeekViewState_0.Closed;
    local v57 = v9.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v38 (copy), v41 (copy), l_AppPage_0 (ref), v43 (copy), l_SessionType_0 (ref)
        if v38 and typeof(v38) == "function" then
            v38();
        end;
        v41.clearAppScreens({
            l_AppPage_0.GameDetail
        });
        if v43 then
            v43:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
        end;
    end, {
        v41, 
        v43, 
        v38, 
        v35, 
        v36, 
        v37
    });
    local v59 = v9.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v1 (ref), v34 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref)
        local v58 = v1.getFromPropsOrNavigationParams(v34, "pageTimer");
        if v58 then
            return v58;
        else
            return l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
        end;
    end, {});
    v9.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v35 (copy), v59 (copy), v3 (ref)
        if v35 and v59 then
            v3(v35, v59);
        end;
    end, {
        v35, 
        v59
    });
    local v63 = v9.useCallback(function(v60, v61) --[[ Line: 107 ]]
        -- upvalues: v35 (copy), l_PeekViewState_0 (ref), v53 (copy), l_gameDetailsPeekViewEvents_0 (ref), v42 (copy), v36 (copy), v37 (copy), v44 (copy), v57 (copy)
        local v62 = v35 or "";
        if v35 and v60 == l_PeekViewState_0.Brief then
            if v53 == l_PeekViewState_0.Brief then
                l_gameDetailsPeekViewEvents_0(v42, "SwitchGame", v62, v36, v37);
            elseif v61 == l_PeekViewState_0.Closed then
                l_gameDetailsPeekViewEvents_0(v42, "OpenPeekView", v62, v36, v37);
            end;
        end;
        v44({
            type = "SetGameDetailsPeekViewState", 
            viewState = v60
        });
        if v35 and v60 == l_PeekViewState_0.Full and v61 == l_PeekViewState_0.Brief then
            l_gameDetailsPeekViewEvents_0(v42, "GoToFullView", v62, v36, v37);
        end;
        if v60 == l_PeekViewState_0.Closed then
            v57();
        end;
    end, {
        v44, 
        v42, 
        v35, 
        v36, 
        v37, 
        v53, 
        v57
    });
    v9.useEffect(function() --[[ Line: 127 ]]
        -- upvalues: v44 (copy), l_PeekViewState_0 (ref)
        return function() --[[ Line: 128 ]]
            -- upvalues: v44 (ref), l_PeekViewState_0 (ref)
            v44({
                type = "SetGameDetailsPeekViewState", 
                viewState = l_PeekViewState_0.Closed
            });
        end;
    end, {
        v44
    });
    if v35 == nil then
        return nil;
    else
        return v9.createElement(l_PeekViewWithTopBar_0, {
            topBarHeight = v45, 
            bottomDockedContainerHeight = v50, 
            fullViewContentHeight = UDim.new(1, -v45), 
            briefViewContentHeight = v51, 
            onViewStateChanged = v63, 
            viewChangedEventMeta = {
                universeId = v35, 
                source = v36, 
                index = v37
            }, 
            mountAsFullView = v55, 
            mountAnimation = v56, 
            topBarSlot = v9.createElement(l_SduiPageNavigationHeader_0, {
                closeCallback = v57, 
                pageSideMargin = v40.Padding.Large, 
                navButtonType = "close"
            }), 
            contentSlot = v9.createElement(l_SduiPageEntryPoint_0, {
                appPage = l_AppPage_0.GameDetail, 
                configKey = v39, 
                identifier = if l_FFlagSduiPageEntryUseSharedHooks_0 then v2.EDP_FEED_IDENTIFIER else v1.getResolvedIdentifier(v39, v2.EDP_FEED_IDENTIFIER_SUFFIX), 
                pageTimer = v59, 
                backgroundStyle = v40.Color.Surface.Surface_100, 
                includeNavigationHeaderBar = false
            }), 
            bottomBarSlot = v9.createElement(l_SduiFeatureEntryPoint_0, {
                appPage = l_AppPage_0.GameDetail, 
                configKey = v39, 
                identifier = v2.EDP_ACTION_BAR_IDENTIFIER, 
                loadTimer = v59, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                shouldDisplayError = false, 
                shouldDisplayLoading = false
            })
        });
    end;
end);