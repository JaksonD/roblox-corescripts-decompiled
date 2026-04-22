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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_gameDetailsPeekViewEvents_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics).Events.gameDetailsPeekViewEvents;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v20 = require(l_Modules_0.LuaApp.Constants);
local v21 = require(l_Modules_0.LuaApp.Actions.Games.SetGameDetailsPeekViewState);
local v22 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsTopBar);
local v23 = require(l_Modules_0.LuaApp.Components.GameDetails.ActionBar);
local v24 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsCard);
local v25 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation);
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local v27 = game:DefineFastFlag("EnableGameDetailsFullViewIXP", false);
local v28 = game:DefineFastFlag("ForceEnableGameDetailsFullView", false);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v30 = game:DefineFastFlag("SduiSocialProofRaisePeekViewBriefHeightIxp", false);
local v31 = game:DefineFastFlag("SduiSocialProofRaisePeekViewBriefHeightDefault", false);
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppExpandableTextImpressionsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 = v15.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT;
local function _(v36) --[[ Line: 53 ]] --[[ Name: getInnerPaddingSize ]]
    if v36 < 600 then
        return 20;
    else
        return 40;
    end;
end;
local v38 = v1.PureComponent:extend("GameDetailsPeekView");
v38.init = function(v39) --[[ Line: 59 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_peekViewDismissedEvent_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), l_PeekViewState_0 (copy), l_gameDetailsPeekViewEvents_0 (copy)
    v39.state = {
        topBarOpacity = 0
    };
    v39.actionBarRef = v1.createRef();
    local v40, v41 = v1.createBinding(0);
    v39.transitionPercent = v40;
    v39.setTransitionPercent = v41;
    v39.briefToFullTransitionPercent = function(v42) --[[ Line: 67 ]]
        -- upvalues: v39 (copy)
        v39:setState({
            topBarOpacity = v42
        });
    end;
    v39.getPeekViewEventMeta = function() --[[ Line: 73 ]]
        -- upvalues: v39 (copy)
        return {
            universeId = v39.props.universeId, 
            source = v39.props.source or "None", 
            index = v39.props.index or -1
        };
    end;
    v39.eventTopBarClosePeekView = function() --[[ Line: 81 ]]
        -- upvalues: v39 (copy), l_peekViewDismissedEvent_0 (ref)
        local l_eventIngest_0 = v39.props.eventIngest;
        local l_routeName_0 = v39.props.navigation.state.routeName;
        local v45 = v39.getPeekViewEventMeta();
        l_peekViewDismissedEvent_0.logEvent(l_eventIngest_0, "ProfilePeekView", {
            dismissMethod = l_peekViewDismissedEvent_0.dismissMethodEnum.topBarTap, 
            page = l_routeName_0, 
            locale = v45.RobloxLocaleId, 
            universeId = v45.universeId, 
            source = v45.source or "None", 
            index = v45.index or -1
        });
    end;
    v39.closeGameDetailsPeekViewInNavigation = function(v46) --[[ Line: 96 ]]
        -- upvalues: v39 (copy), l_AppPage_0 (ref), l_SessionType_0 (ref)
        v39.props.navigation.clearAppScreens({
            l_AppPage_0.GameDetail
        });
        if v39.props.onClose ~= nil then
            v39.props.onClose();
        end;
        if v39.props.onPeekViewClosed and (not v46 or not v46.backButtonNavigation) then
            v39.props.onPeekViewClosed();
        end;
        v39.props.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
    end;
    v39.viewStateChanged = function(v47, v48) --[[ Line: 112 ]]
        -- upvalues: l_PeekViewState_0 (ref), v39 (copy)
        if v47 == l_PeekViewState_0.Brief then
            local l_gameDetailsPeekViewState_0 = v39.props.gameDetailsPeekViewState;
            if l_gameDetailsPeekViewState_0 == l_PeekViewState_0.Brief then
                v39.eventSwitchGame();
            elseif l_gameDetailsPeekViewState_0 == l_PeekViewState_0.Closed then
                v39.eventOpenPeekView();
            end;
        end;
        v39.props.setGameDetailsPeekViewState(v47);
        if v47 == l_PeekViewState_0.Closed then
            v39.closeGameDetailsPeekViewInNavigation();
            return;
        else
            if v48 == l_PeekViewState_0.Brief and v47 == l_PeekViewState_0.Full then
                v39.eventGoToFullView();
            end;
            return;
        end;
    end;
    v39.eventOpenPeekView = function() --[[ Line: 131 ]]
        -- upvalues: v39 (copy), l_gameDetailsPeekViewEvents_0 (ref)
        local l_eventIngest_1 = v39.props.eventIngest;
        local l_universeId_0 = v39.props.universeId;
        local v52 = v39.props.source or "None";
        local v53 = v39.props.index or -1;
        l_gameDetailsPeekViewEvents_0(l_eventIngest_1, "OpenPeekView", l_universeId_0, v52, v53);
    end;
    v39.eventSwitchGame = function() --[[ Line: 139 ]]
        -- upvalues: v39 (copy), l_gameDetailsPeekViewEvents_0 (ref)
        local l_eventIngest_2 = v39.props.eventIngest;
        local l_universeId_1 = v39.props.universeId;
        local v56 = v39.props.source or "None";
        local v57 = v39.props.index or -1;
        l_gameDetailsPeekViewEvents_0(l_eventIngest_2, "SwitchGame", l_universeId_1, v56, v57);
    end;
    v39.eventGoToFullView = function() --[[ Line: 147 ]]
        -- upvalues: v39 (copy), l_gameDetailsPeekViewEvents_0 (ref)
        local l_eventIngest_3 = v39.props.eventIngest;
        local l_universeId_2 = v39.props.universeId;
        local v60 = v39.props.source or "None";
        local v61 = v39.props.index or -1;
        l_gameDetailsPeekViewEvents_0(l_eventIngest_3, "GoToFullView", l_universeId_2, v60, v61);
    end;
end;
v38.willUnmount = function(v62) --[[ Line: 156 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AppPage_0 (copy), l_PeekViewState_0 (copy)
    if (function(_) --[[ Line: 157 ]]
        -- upvalues: v62 (copy), l_AppPage_0 (ref)
        local l_history_0 = v62.props.history;
        local v65 = l_history_0[#l_history_0];
        local v66 = 0;
        for v67 = 1, #v65 do
            if v65[v67].name == l_AppPage_0.GameDetail then
                v66 = v66 + 1;
                if v66 > 1 then
                    return false;
                end;
            end;
        end;
        return true;
    end)(v62.props.universeId) then
        v62.props.setGameDetailsPeekViewState(l_PeekViewState_0.Closed);
    end;
    if v62.props.onClose ~= nil then
        v62.props.onClose();
    end;
end;
v38.render = function(v68) --[[ Line: 183 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), l_getSafeAreaSize_0 (copy), v27 (copy), v28 (copy), l_PeekViewState_0 (copy), l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 (copy), v30 (copy), v25 (copy), v31 (copy), v1 (copy), l_PeekViewWithTopBar_0 (copy), v23 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v24 (copy), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (copy), v22 (copy)
    local l_universeId_3 = v68.props.universeId;
    local l_experienceJoinData_0 = v68.props.experienceJoinData;
    local v71 = v68.props.statusBarHeight + v20.NAV_BAR_SIZE;
    local l_gameDetailsPeekViewState_1 = v68.props.gameDetailsPeekViewState;
    local l_screenSize_0 = v68.props.screenSize;
    local l_globalGuiInset_0 = v68.props.globalGuiInset;
    local v75 = math.min(l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).X.Offset, 640);
    local v76 = v75 < 600 and 20 or 40;
    local l_mountAsFullView_0 = v68.props.mountAsFullView;
    local l_isExperienceUnavailable_0 = v68.props.isExperienceUnavailable;
    if l_mountAsFullView_0 == nil then
        if v27 and v68.props.defaultMountAsFullView or v28 then
            l_mountAsFullView_0 = true;
        else
            local v79 = true;
            if l_gameDetailsPeekViewState_1 ~= l_PeekViewState_0.Full then
                v79 = l_gameDetailsPeekViewState_1 == l_PeekViewState_0.Extended;
            end;
            l_mountAsFullView_0 = v79;
        end;
    end;
    local l_mountAnimation_0 = v68.props.mountAnimation;
    if l_mountAnimation_0 == nil then
        l_mountAnimation_0 = l_gameDetailsPeekViewState_1 == l_PeekViewState_0.Closed;
    end;
    local v81 = nil;
    if v68.props.showBackButton ~= nil then
        v81 = not v68.props.showBackButton;
    end;
    local v82 = v68.actionBarRef.current and v68.actionBarRef.current.AbsoluteSize.Y or l_GAME_DETAILS_ACTION_BAR_HEIGHT_0;
    local v83 = if v30 and v25.getShouldRaisePeekViewBriefHeight() or v31 then 24 + v76 else 0;
    return v1.createElement(l_PeekViewWithTopBar_0, {
        topBarHeight = v71, 
        bottomDockedContainerHeight = v82, 
        fullViewContentHeight = UDim.new(1, -v71), 
        briefViewContentHeight = UDim.new(0, v75 + l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 + v83), 
        onViewStateChanged = v68.viewStateChanged, 
        viewChangedEventMeta = v68.getPeekViewEventMeta(), 
        mountAsFullView = l_mountAsFullView_0, 
        mountAnimation = l_mountAnimation_0, 
        transitionPercentCallback = v68.setTransitionPercent, 
        bottomBarSlot = if l_isExperienceUnavailable_0 then nil else v1.createElement(v23, {
            leftPadding = v76, 
            rightPadding = v76, 
            bottomPadding = 10, 
            universeId = l_universeId_3, 
            referralSource = v68.props.referralSource, 
            experienceJoinData = l_experienceJoinData_0, 
            placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v68.props.placeIdOverride else nil, 
            shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v25.getShouldHydrateLegacy() else nil, 
            containerRef = v68.actionBarRef
        }), 
        contentSlot = v1.createElement(v24, {
            universeId = l_universeId_3, 
            source = v68.props.source, 
            index = v68.props.index, 
            viewportBoundsOffset = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then {
                min = Vector2.zero, 
                max = Vector2.new(0, -v82)
            } else nil, 
            onPeekViewClosed = v68.props.onPeekViewClosed
        }), 
        topBarSlot = v1.createElement(v22, {
            universeId = l_universeId_3, 
            showCloseIcon = v81, 
            onCloseButtonActivated = function(v84) --[[ Line: 272 ]] --[[ Name: onCloseButtonActivated ]]
                -- upvalues: v68 (copy)
                v68.eventTopBarClosePeekView();
                v68.closeGameDetailsPeekViewInNavigation(v84);
            end, 
            transitionPercentBinding = v68.transitionPercent
        })
    });
end;
v38.didUpdate = function(v85, v86) --[[ Line: 281 ]] --[[ Name: didUpdate ]]
    if v85.props.searchBarFocused ~= v86.searchBarFocused and v85.props.searchBarFocused then
        v85.closeGameDetailsPeekViewInNavigation();
    end;
end;
v38 = v2.connect(function(v87, v88) --[[ Line: 287 ]]
    -- upvalues: l_EnumGameDetailErrorTypes_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v89 = v87.GameDetailErrors[v88.universeId] and v87.GameDetailErrors[v88.universeId].errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
    return {
        currentSquad = if l_GetFFlagIsSquadEnabled_0() then v87.Squad and v87.Squad.Squad and v87.Squad.Squad.currentSquad else nil, 
        history = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v87) else v87.Navigation.history, 
        gameDetailsPeekViewState = v87.GameDetailsPeekView.viewState, 
        statusBarHeight = v87.TopBar.statusBarHeight, 
        screenSize = v87.ScreenSize, 
        globalGuiInset = v87.GlobalGuiInset, 
        searchBarFocused = v87.SearchBar.focused, 
        isExperienceUnavailable = v89
    };
end, function(v90) --[[ Line: 304 ]]
    -- upvalues: v21 (copy)
    return {
        setGameDetailsPeekViewState = function(v91) --[[ Line: 306 ]] --[[ Name: setGameDetailsPeekViewState ]]
            -- upvalues: v90 (copy), v21 (ref)
            return v90(v21(v91));
        end
    };
end)(v38);
if v27 then
    v38 = v8.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageExposureLayer
    }, function(v92, _) --[[ Line: 315 ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        return {
            defaultMountAsFullView = (v92[l_AppUserLayers_0.ExperienceDetailsPageExposureLayer] or {}).DefaultMountAsFullView
        };
    end)(v38);
end;
v38 = l_RoactServices_0.connect({
    eventIngest = l_AppEventIngestService_0, 
    sessionService = l_AppSessionService_0
})(v38);
return (v10.withNavigation(v38));