local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_PeekViewWithTopBar_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewWithTopBar;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v8 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v10 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_peekViewDismissedEvent_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).analytics.peekViewDismissedEvent;
local v15 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_EnumGameDetailErrorTypes_0 = v15.EnumGameDetailErrorTypes;
local l_gameDetailsPeekViewEvents_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v19 = require(l_Modules_0.LuaApp.Constants);
local v20 = require(l_Modules_0.LuaApp.Actions.Games.SetGameDetailsPeekViewState);
local v21 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsTopBar);
local v22 = require(l_Modules_0.LuaApp.Components.GameDetails.ActionBar);
local v23 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsCard);
local v24 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation);
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local v26 = game:DefineFastFlag("EnableGameDetailsFullViewIXP", false);
local v27 = game:DefineFastFlag("ForceEnableGameDetailsFullView", false);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v29 = game:DefineFastFlag("SduiSocialProofRaisePeekViewBriefHeightIxp", false);
local v30 = game:DefineFastFlag("SduiSocialProofRaisePeekViewBriefHeightDefault", false);
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppExpandableTextImpressionsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled;
local l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 = v15.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT;
local function _(v34) --[[ Line: 51 ]] --[[ Name: getInnerPaddingSize ]]
    if v34 < 600 then
        return 20;
    else
        return 40;
    end;
end;
local v36 = v1.PureComponent:extend("GameDetailsPeekView");
v36.init = function(v37) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_peekViewDismissedEvent_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), l_PeekViewState_0 (copy), l_gameDetailsPeekViewEvents_0 (copy)
    v37.state = {
        topBarOpacity = 0
    };
    v37.actionBarRef = v1.createRef();
    local v38, v39 = v1.createBinding(0);
    v37.transitionPercent = v38;
    v37.setTransitionPercent = v39;
    v37.briefToFullTransitionPercent = function(v40) --[[ Line: 65 ]]
        -- upvalues: v37 (copy)
        v37:setState({
            topBarOpacity = v40
        });
    end;
    v37.getPeekViewEventMeta = function() --[[ Line: 71 ]]
        -- upvalues: v37 (copy)
        return {
            universeId = v37.props.universeId, 
            source = v37.props.source or "None", 
            index = v37.props.index or -1
        };
    end;
    v37.eventTopBarClosePeekView = function() --[[ Line: 79 ]]
        -- upvalues: v37 (copy), l_peekViewDismissedEvent_0 (ref)
        local l_eventIngest_0 = v37.props.eventIngest;
        local l_routeName_0 = v37.props.navigation.state.routeName;
        local v43 = v37.getPeekViewEventMeta();
        l_peekViewDismissedEvent_0.logEvent(l_eventIngest_0, "ProfilePeekView", {
            dismissMethod = l_peekViewDismissedEvent_0.dismissMethodEnum.topBarTap, 
            page = l_routeName_0, 
            locale = v43.RobloxLocaleId, 
            universeId = v43.universeId, 
            source = v43.source or "None", 
            index = v43.index or -1
        });
    end;
    v37.closeGameDetailsPeekViewInNavigation = function(v44) --[[ Line: 94 ]]
        -- upvalues: v37 (copy), l_AppPage_0 (ref), l_SessionType_0 (ref)
        v37.props.navigation.clearAppScreens({
            l_AppPage_0.GameDetail
        });
        if v37.props.onClose ~= nil then
            v37.props.onClose();
        end;
        if v37.props.onPeekViewClosed and (not v44 or not v44.backButtonNavigation) then
            v37.props.onPeekViewClosed();
        end;
        v37.props.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
    end;
    v37.viewStateChanged = function(v45, v46) --[[ Line: 110 ]]
        -- upvalues: l_PeekViewState_0 (ref), v37 (copy)
        if v45 == l_PeekViewState_0.Brief then
            local l_gameDetailsPeekViewState_0 = v37.props.gameDetailsPeekViewState;
            if l_gameDetailsPeekViewState_0 == l_PeekViewState_0.Brief then
                v37.eventSwitchGame();
            elseif l_gameDetailsPeekViewState_0 == l_PeekViewState_0.Closed then
                v37.eventOpenPeekView();
            end;
        end;
        v37.props.setGameDetailsPeekViewState(v45);
        if v45 == l_PeekViewState_0.Closed then
            v37.closeGameDetailsPeekViewInNavigation();
            return;
        else
            if v46 == l_PeekViewState_0.Brief and v45 == l_PeekViewState_0.Full then
                v37.eventGoToFullView();
            end;
            return;
        end;
    end;
    v37.eventOpenPeekView = function() --[[ Line: 129 ]]
        -- upvalues: v37 (copy), l_gameDetailsPeekViewEvents_0 (ref)
        local l_eventIngest_1 = v37.props.eventIngest;
        local l_universeId_0 = v37.props.universeId;
        local v50 = v37.props.source or "None";
        local v51 = v37.props.index or -1;
        l_gameDetailsPeekViewEvents_0(l_eventIngest_1, "OpenPeekView", l_universeId_0, v50, v51);
    end;
    v37.eventSwitchGame = function() --[[ Line: 137 ]]
        -- upvalues: v37 (copy), l_gameDetailsPeekViewEvents_0 (ref)
        local l_eventIngest_2 = v37.props.eventIngest;
        local l_universeId_1 = v37.props.universeId;
        local v54 = v37.props.source or "None";
        local v55 = v37.props.index or -1;
        l_gameDetailsPeekViewEvents_0(l_eventIngest_2, "SwitchGame", l_universeId_1, v54, v55);
    end;
    v37.eventGoToFullView = function() --[[ Line: 145 ]]
        -- upvalues: v37 (copy), l_gameDetailsPeekViewEvents_0 (ref)
        local l_eventIngest_3 = v37.props.eventIngest;
        local l_universeId_2 = v37.props.universeId;
        local v58 = v37.props.source or "None";
        local v59 = v37.props.index or -1;
        l_gameDetailsPeekViewEvents_0(l_eventIngest_3, "GoToFullView", l_universeId_2, v58, v59);
    end;
end;
v36.willUnmount = function(v60) --[[ Line: 154 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AppPage_0 (copy), l_PeekViewState_0 (copy)
    if (function(_) --[[ Line: 155 ]]
        -- upvalues: v60 (copy), l_AppPage_0 (ref)
        local l_history_0 = v60.props.history;
        local v63 = l_history_0[#l_history_0];
        local v64 = 0;
        for v65 = 1, #v63 do
            if v63[v65].name == l_AppPage_0.GameDetail then
                v64 = v64 + 1;
                if v64 > 1 then
                    return false;
                end;
            end;
        end;
        return true;
    end)(v60.props.universeId) then
        v60.props.setGameDetailsPeekViewState(l_PeekViewState_0.Closed);
    end;
    if v60.props.onClose ~= nil then
        v60.props.onClose();
    end;
end;
v36.render = function(v66) --[[ Line: 181 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), l_getSafeAreaSize_0 (copy), v26 (copy), v27 (copy), l_PeekViewState_0 (copy), l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 (copy), v29 (copy), v24 (copy), v30 (copy), v1 (copy), l_PeekViewWithTopBar_0 (copy), v22 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v23 (copy), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (copy), v21 (copy)
    local l_universeId_3 = v66.props.universeId;
    local l_experienceJoinData_0 = v66.props.experienceJoinData;
    local v69 = v66.props.statusBarHeight + v19.NAV_BAR_SIZE;
    local l_gameDetailsPeekViewState_1 = v66.props.gameDetailsPeekViewState;
    local l_screenSize_0 = v66.props.screenSize;
    local l_globalGuiInset_0 = v66.props.globalGuiInset;
    local v73 = math.min(l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).X.Offset, 640);
    local v74 = v73 < 600 and 20 or 40;
    local l_mountAsFullView_0 = v66.props.mountAsFullView;
    local l_isExperienceUnavailable_0 = v66.props.isExperienceUnavailable;
    if l_mountAsFullView_0 == nil then
        if v26 and v66.props.defaultMountAsFullView or v27 then
            l_mountAsFullView_0 = true;
        else
            local v77 = true;
            if l_gameDetailsPeekViewState_1 ~= l_PeekViewState_0.Full then
                v77 = l_gameDetailsPeekViewState_1 == l_PeekViewState_0.Extended;
            end;
            l_mountAsFullView_0 = v77;
        end;
    end;
    local l_mountAnimation_0 = v66.props.mountAnimation;
    if l_mountAnimation_0 == nil then
        l_mountAnimation_0 = l_gameDetailsPeekViewState_1 == l_PeekViewState_0.Closed;
    end;
    local v79 = nil;
    if v66.props.showBackButton ~= nil then
        v79 = not v66.props.showBackButton;
    end;
    local v80 = v66.actionBarRef.current and v66.actionBarRef.current.AbsoluteSize.Y or l_GAME_DETAILS_ACTION_BAR_HEIGHT_0;
    local v81 = if v29 and v24.getShouldRaisePeekViewBriefHeight() or v30 then 24 + v74 else 0;
    return v1.createElement(l_PeekViewWithTopBar_0, {
        topBarHeight = v69, 
        bottomDockedContainerHeight = v80, 
        fullViewContentHeight = UDim.new(1, -v69), 
        briefViewContentHeight = UDim.new(0, v73 + l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 + v81), 
        onViewStateChanged = v66.viewStateChanged, 
        viewChangedEventMeta = v66.getPeekViewEventMeta(), 
        mountAsFullView = l_mountAsFullView_0, 
        mountAnimation = l_mountAnimation_0, 
        transitionPercentCallback = v66.setTransitionPercent, 
        bottomBarSlot = if l_isExperienceUnavailable_0 then nil else v1.createElement(v22, {
            leftPadding = v74, 
            rightPadding = v74, 
            bottomPadding = 10, 
            universeId = l_universeId_3, 
            referralSource = v66.props.referralSource, 
            experienceJoinData = l_experienceJoinData_0, 
            placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v66.props.placeIdOverride else nil, 
            shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v24.getShouldHydrateLegacy() else nil, 
            containerRef = v66.actionBarRef
        }), 
        contentSlot = v1.createElement(v23, {
            universeId = l_universeId_3, 
            source = v66.props.source, 
            index = v66.props.index, 
            viewportBoundsOffset = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then {
                min = Vector2.zero, 
                max = Vector2.new(0, -v80)
            } else nil, 
            onPeekViewClosed = v66.props.onPeekViewClosed
        }), 
        topBarSlot = v1.createElement(v21, {
            universeId = l_universeId_3, 
            showCloseIcon = v79, 
            onCloseButtonActivated = function(v82) --[[ Line: 270 ]] --[[ Name: onCloseButtonActivated ]]
                -- upvalues: v66 (copy)
                v66.eventTopBarClosePeekView();
                v66.closeGameDetailsPeekViewInNavigation(v82);
            end, 
            transitionPercentBinding = v66.transitionPercent
        })
    });
end;
v36.didUpdate = function(v83, v84) --[[ Line: 279 ]] --[[ Name: didUpdate ]]
    if v83.props.searchBarFocused ~= v84.searchBarFocused and v83.props.searchBarFocused then
        v83.closeGameDetailsPeekViewInNavigation();
    end;
end;
v36 = v2.connect(function(v85, v86) --[[ Line: 285 ]]
    -- upvalues: l_EnumGameDetailErrorTypes_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
    local v87 = v85.GameDetailErrors[v86.universeId] and v85.GameDetailErrors[v86.universeId].errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
    return {
        currentSquad = if l_GetFFlagIsSquadEnabled_0() then v85.Squad and v85.Squad.Squad and v85.Squad.Squad.currentSquad else nil, 
        history = v85.Navigation.history, 
        gameDetailsPeekViewState = v85.GameDetailsPeekView.viewState, 
        statusBarHeight = v85.TopBar.statusBarHeight, 
        screenSize = v85.ScreenSize, 
        globalGuiInset = v85.GlobalGuiInset, 
        searchBarFocused = v85.SearchBar.focused, 
        isExperienceUnavailable = v87
    };
end, function(v88) --[[ Line: 300 ]]
    -- upvalues: v20 (copy)
    return {
        setGameDetailsPeekViewState = function(v89) --[[ Line: 302 ]] --[[ Name: setGameDetailsPeekViewState ]]
            -- upvalues: v88 (copy), v20 (ref)
            return v88(v20(v89));
        end
    };
end)(v36);
if v26 then
    v36 = v8.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageExposureLayer
    }, function(v90, _) --[[ Line: 311 ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        return {
            defaultMountAsFullView = (v90[l_AppUserLayers_0.ExperienceDetailsPageExposureLayer] or {}).DefaultMountAsFullView
        };
    end)(v36);
end;
v36 = l_RoactServices_0.connect({
    eventIngest = l_AppEventIngestService_0, 
    sessionService = l_AppSessionService_0
})(v36);
return (v10.withNavigation(v36));