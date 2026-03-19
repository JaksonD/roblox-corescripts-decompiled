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
local l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 = v15.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT;
local function _(v33) --[[ Line: 49 ]] --[[ Name: getInnerPaddingSize ]]
    if v33 < 600 then
        return 20;
    else
        return 40;
    end;
end;
local v35 = v1.PureComponent:extend("GameDetailsPeekView");
v35.init = function(v36) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_peekViewDismissedEvent_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), l_PeekViewState_0 (copy), l_gameDetailsPeekViewEvents_0 (copy)
    v36.state = {
        topBarOpacity = 0
    };
    v36.actionBarRef = v1.createRef();
    local v37, v38 = v1.createBinding(0);
    v36.transitionPercent = v37;
    v36.setTransitionPercent = v38;
    v36.briefToFullTransitionPercent = function(v39) --[[ Line: 63 ]]
        -- upvalues: v36 (copy)
        v36:setState({
            topBarOpacity = v39
        });
    end;
    v36.getPeekViewEventMeta = function() --[[ Line: 69 ]]
        -- upvalues: v36 (copy)
        return {
            universeId = v36.props.universeId, 
            source = v36.props.source or "None", 
            index = v36.props.index or -1
        };
    end;
    v36.eventTopBarClosePeekView = function() --[[ Line: 77 ]]
        -- upvalues: v36 (copy), l_peekViewDismissedEvent_0 (ref)
        local l_eventIngest_0 = v36.props.eventIngest;
        local l_routeName_0 = v36.props.navigation.state.routeName;
        local v42 = v36.getPeekViewEventMeta();
        l_peekViewDismissedEvent_0.logEvent(l_eventIngest_0, "ProfilePeekView", {
            dismissMethod = l_peekViewDismissedEvent_0.dismissMethodEnum.topBarTap, 
            page = l_routeName_0, 
            locale = v42.RobloxLocaleId, 
            universeId = v42.universeId, 
            source = v42.source or "None", 
            index = v42.index or -1
        });
    end;
    v36.closeGameDetailsPeekViewInNavigation = function(v43) --[[ Line: 92 ]]
        -- upvalues: v36 (copy), l_AppPage_0 (ref), l_SessionType_0 (ref)
        v36.props.navigation.clearAppScreens({
            l_AppPage_0.GameDetail
        });
        if v36.props.onClose ~= nil then
            v36.props.onClose();
        end;
        if v36.props.onPeekViewClosed and (not v43 or not v43.backButtonNavigation) then
            v36.props.onPeekViewClosed();
        end;
        v36.props.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
    end;
    v36.viewStateChanged = function(v44, v45) --[[ Line: 108 ]]
        -- upvalues: l_PeekViewState_0 (ref), v36 (copy)
        if v44 == l_PeekViewState_0.Brief then
            local l_gameDetailsPeekViewState_0 = v36.props.gameDetailsPeekViewState;
            if l_gameDetailsPeekViewState_0 == l_PeekViewState_0.Brief then
                v36.eventSwitchGame();
            elseif l_gameDetailsPeekViewState_0 == l_PeekViewState_0.Closed then
                v36.eventOpenPeekView();
            end;
        end;
        v36.props.setGameDetailsPeekViewState(v44);
        if v44 == l_PeekViewState_0.Closed then
            v36.closeGameDetailsPeekViewInNavigation();
            return;
        else
            if v45 == l_PeekViewState_0.Brief and v44 == l_PeekViewState_0.Full then
                v36.eventGoToFullView();
            end;
            return;
        end;
    end;
    v36.eventOpenPeekView = function() --[[ Line: 127 ]]
        -- upvalues: v36 (copy), l_gameDetailsPeekViewEvents_0 (ref)
        local l_eventIngest_1 = v36.props.eventIngest;
        local l_universeId_0 = v36.props.universeId;
        local v49 = v36.props.source or "None";
        local v50 = v36.props.index or -1;
        l_gameDetailsPeekViewEvents_0(l_eventIngest_1, "OpenPeekView", l_universeId_0, v49, v50);
    end;
    v36.eventSwitchGame = function() --[[ Line: 135 ]]
        -- upvalues: v36 (copy), l_gameDetailsPeekViewEvents_0 (ref)
        local l_eventIngest_2 = v36.props.eventIngest;
        local l_universeId_1 = v36.props.universeId;
        local v53 = v36.props.source or "None";
        local v54 = v36.props.index or -1;
        l_gameDetailsPeekViewEvents_0(l_eventIngest_2, "SwitchGame", l_universeId_1, v53, v54);
    end;
    v36.eventGoToFullView = function() --[[ Line: 143 ]]
        -- upvalues: v36 (copy), l_gameDetailsPeekViewEvents_0 (ref)
        local l_eventIngest_3 = v36.props.eventIngest;
        local l_universeId_2 = v36.props.universeId;
        local v57 = v36.props.source or "None";
        local v58 = v36.props.index or -1;
        l_gameDetailsPeekViewEvents_0(l_eventIngest_3, "GoToFullView", l_universeId_2, v57, v58);
    end;
end;
v35.willUnmount = function(v59) --[[ Line: 152 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_AppPage_0 (copy), l_PeekViewState_0 (copy)
    if (function(_) --[[ Line: 153 ]]
        -- upvalues: v59 (copy), l_AppPage_0 (ref)
        local l_history_0 = v59.props.history;
        local v62 = l_history_0[#l_history_0];
        local v63 = 0;
        for v64 = 1, #v62 do
            if v62[v64].name == l_AppPage_0.GameDetail then
                v63 = v63 + 1;
                if v63 > 1 then
                    return false;
                end;
            end;
        end;
        return true;
    end)(v59.props.universeId) then
        v59.props.setGameDetailsPeekViewState(l_PeekViewState_0.Closed);
    end;
    if v59.props.onClose ~= nil then
        v59.props.onClose();
    end;
end;
v35.render = function(v65) --[[ Line: 179 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), l_getSafeAreaSize_0 (copy), v26 (copy), v27 (copy), l_PeekViewState_0 (copy), l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 (copy), v29 (copy), v24 (copy), v30 (copy), v1 (copy), l_PeekViewWithTopBar_0 (copy), v22 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v23 (copy), v21 (copy)
    local l_universeId_3 = v65.props.universeId;
    local l_experienceJoinData_0 = v65.props.experienceJoinData;
    local v68 = v65.props.statusBarHeight + v19.NAV_BAR_SIZE;
    local l_gameDetailsPeekViewState_1 = v65.props.gameDetailsPeekViewState;
    local l_screenSize_0 = v65.props.screenSize;
    local l_globalGuiInset_0 = v65.props.globalGuiInset;
    local v72 = math.min(l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0).X.Offset, 640);
    local v73 = v72 < 600 and 20 or 40;
    local l_mountAsFullView_0 = v65.props.mountAsFullView;
    local l_isExperienceUnavailable_0 = v65.props.isExperienceUnavailable;
    if l_mountAsFullView_0 == nil then
        if v26 and v65.props.defaultMountAsFullView or v27 then
            l_mountAsFullView_0 = true;
        else
            local v76 = true;
            if l_gameDetailsPeekViewState_1 ~= l_PeekViewState_0.Full then
                v76 = l_gameDetailsPeekViewState_1 == l_PeekViewState_0.Extended;
            end;
            l_mountAsFullView_0 = v76;
        end;
    end;
    local l_mountAnimation_0 = v65.props.mountAnimation;
    if l_mountAnimation_0 == nil then
        l_mountAnimation_0 = l_gameDetailsPeekViewState_1 == l_PeekViewState_0.Closed;
    end;
    local v78 = nil;
    if v65.props.showBackButton ~= nil then
        v78 = not v65.props.showBackButton;
    end;
    local v79 = v65.actionBarRef.current and v65.actionBarRef.current.AbsoluteSize.Y or l_GAME_DETAILS_ACTION_BAR_HEIGHT_0;
    local v80 = if v29 and v24.getShouldRaisePeekViewBriefHeight() or v30 then 24 + v73 else 0;
    return v1.createElement(l_PeekViewWithTopBar_0, {
        topBarHeight = v68, 
        bottomDockedContainerHeight = v79, 
        fullViewContentHeight = UDim.new(1, -v68), 
        briefViewContentHeight = UDim.new(0, v72 + l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 + v80), 
        onViewStateChanged = v65.viewStateChanged, 
        viewChangedEventMeta = v65.getPeekViewEventMeta(), 
        mountAsFullView = l_mountAsFullView_0, 
        mountAnimation = l_mountAnimation_0, 
        transitionPercentCallback = v65.setTransitionPercent, 
        bottomBarSlot = if l_isExperienceUnavailable_0 then nil else v1.createElement(v22, {
            leftPadding = v73, 
            rightPadding = v73, 
            bottomPadding = 10, 
            universeId = l_universeId_3, 
            referralSource = v65.props.referralSource, 
            experienceJoinData = l_experienceJoinData_0, 
            placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v65.props.placeIdOverride else nil, 
            shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v24.getShouldHydrateLegacy() else nil, 
            containerRef = v65.actionBarRef
        }), 
        contentSlot = v1.createElement(v23, {
            universeId = l_universeId_3, 
            source = v65.props.source, 
            index = v65.props.index, 
            onPeekViewClosed = v65.props.onPeekViewClosed
        }), 
        topBarSlot = v1.createElement(v21, {
            universeId = l_universeId_3, 
            showCloseIcon = v78, 
            onCloseButtonActivated = function(v81) --[[ Line: 261 ]] --[[ Name: onCloseButtonActivated ]]
                -- upvalues: v65 (copy)
                v65.eventTopBarClosePeekView();
                v65.closeGameDetailsPeekViewInNavigation(v81);
            end, 
            transitionPercentBinding = v65.transitionPercent
        })
    });
end;
v35.didUpdate = function(v82, v83) --[[ Line: 270 ]] --[[ Name: didUpdate ]]
    if v82.props.searchBarFocused ~= v83.searchBarFocused and v82.props.searchBarFocused then
        v82.closeGameDetailsPeekViewInNavigation();
    end;
end;
v35 = v2.connect(function(v84, v85) --[[ Line: 276 ]]
    -- upvalues: l_EnumGameDetailErrorTypes_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
    local v86 = v84.GameDetailErrors[v85.universeId] and v84.GameDetailErrors[v85.universeId].errorType == l_EnumGameDetailErrorTypes_0.ExperienceUnavailable;
    return {
        currentSquad = if l_GetFFlagIsSquadEnabled_0() then v84.Squad and v84.Squad.Squad and v84.Squad.Squad.currentSquad else nil, 
        history = v84.Navigation.history, 
        gameDetailsPeekViewState = v84.GameDetailsPeekView.viewState, 
        statusBarHeight = v84.TopBar.statusBarHeight, 
        screenSize = v84.ScreenSize, 
        globalGuiInset = v84.GlobalGuiInset, 
        searchBarFocused = v84.SearchBar.focused, 
        isExperienceUnavailable = v86
    };
end, function(v87) --[[ Line: 291 ]]
    -- upvalues: v20 (copy)
    return {
        setGameDetailsPeekViewState = function(v88) --[[ Line: 293 ]] --[[ Name: setGameDetailsPeekViewState ]]
            -- upvalues: v87 (copy), v20 (ref)
            return v87(v20(v88));
        end
    };
end)(v35);
if v26 then
    v35 = v8.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageExposureLayer
    }, function(v89, _) --[[ Line: 302 ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        return {
            defaultMountAsFullView = (v89[l_AppUserLayers_0.ExperienceDetailsPageExposureLayer] or {}).DefaultMountAsFullView
        };
    end)(v35);
end;
v35 = l_RoactServices_0.connect({
    eventIngest = l_AppEventIngestService_0, 
    sessionService = l_AppSessionService_0
})(v35);
return (v10.withNavigation(v35));