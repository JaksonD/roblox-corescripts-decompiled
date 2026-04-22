local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_LoadingStateContainer_0 = v6.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v6.App.Loading.Enum.RetrievalStatus;
local v9 = require(l_CorePackages_0.Packages.RoactNavigation);
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Packages.Cryo);
local v12 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_GameSortGroups_0 = v12.GameSortGroups;
local l_OmniFeedTypes_0 = v12.OmniFeedTypes;
local l_OmniFeedConstants_0 = v12.OmniFeedConstants;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalytics;
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppPrefetch_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPrefetch;
local l_AppAppLifecycleObserverService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppAppLifecycleObserverService;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v28 = require(l_CorePackages_0.Packages.Promise);
local l_SetNetworkingErrorToast_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local l_RetrievalStatus_1 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_feedScroll_0 = require(l_CorePackages_0.Workspace.Packages.ScrollTelemetry).feedScroll;
local v32 = require(l_CorePackages_0.Workspace.Packages.FetchStatusRodux);
local l_FetchStatusNamespace_0 = v32.FetchStatusNamespace;
local l_FetchStatusReducer_0 = v32.FetchStatusReducer;
local l_VerticalEfficiencyExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation;
local l_DiscoveryAppLaunchTracker_0 = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker;
local v37 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_usePreferredInput_0 = v37.usePreferredInput;
local l_useIsSpatial_0 = v37.useIsSpatial;
local v40 = require(l_CorePackages_0.Workspace.Packages.AppStartup);
local v41 = require(l_CorePackages_0.Workspace.Packages.SocialUpsell);
local l_default_0 = v40.AppStartupSequence.default;
local v43 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local l_useCollectionLayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).useCollectionLayoutConfig;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_ApiFetchOmniRecommendations_0 = l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations;
local l_OmniFeedAutoRefresher_0 = l_Modules_0.LuaApp.Components.Games.OmniFeedAutoRefresher;
local l_RefreshGameSorts_0 = l_Modules_0.LuaApp.Thunks.RefreshGameSorts;
local l_FetchHomePageData_0 = l_Modules_0.LuaApp.Thunks.FetchHomePageData;
local l_FetchHomePageContactMethodModuleVariation_0 = l_Modules_0.LuaApp.Thunks.FetchHomePageContactMethodModuleVariation;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v52 = require(l_Modules_1.LuaApp.Actions.RefreshSiteAlertInfo);
local v53 = require(l_Modules_1.Personalization.OmniFeed.DataStore.AddLocalOmniItems);
local v54 = require(l_Modules_1.Personalization.Sessions.PageSessionManager);
local v55 = require(l_Modules_1.Personalization.Sessions.setHomePageSessionInfo);
local v56 = require(l_Modules_1.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore);
local v57 = require(l_Modules_1.Personalization.Analytics.ScrollingPerfTracker);
local v58 = require(l_Modules_1.LuaApp.Components.Banner.useBannerContainer);
local v59 = require(l_Modules_1.LuaApp.Enum.OptionalContactMethodUpsellTypes);
local v60 = require(l_Modules_1.Personalization.Home.HomeOmniFeed.HomeOmniFeedExperimentation);
local v61 = game:DefineFastInt("LuaAppHomeFeedProfilePosition", 1);
local v62 = game:DefineFastInt("LuaAppHomeFeedFriendsPosition", 1);
local v63 = game:DefineFastInt("LuaAppHomeFeedUpsellCardPosition", 1);
local v64 = game:DefineFastFlag("TriggerLuaAppInteractiveFromLua", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("TriggerReportLuaRequireCountFromLua");
local l_GetFFlagFixFetchNextOmniWithoutPageToken_0 = l_Modules_0.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken;
local l_GetFFlagEnableHomePageUpsellCard_0 = l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard;
local v68 = require(l_Modules_1.LuaApp.Flags.GetFFlagEnableHomePageEmailUpsellCard);
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP;
local v71 = require(l_Modules_1.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard);
local l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeForAll;
local l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeWithIxp;
local v74 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v74.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v74.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppCompositionHome_0 = v74.FFlagLuaAppCompositionHome;
local l_FFlagLuaAppRfySignalApportioning_0 = v74.FFlagLuaAppRfySignalApportioning;
local l_FFlagEnableAppStoreAgeSignalsOnHomePage_0 = v74.FFlagEnableAppStoreAgeSignalsOnHomePage;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = v74.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local v81 = require(l_Modules_1.Personalization.Flags.FFlagEnableIAFlyoutIXPHomeProfileRemoval);
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v83 = game:DefineFastFlag("AppIaHomeOmniFeedFix", false);
local l_Home_0 = l_AppPage_0.Home;
local v85 = if v83 then {} else nil;
local v86 = v4.PureComponent:extend("HomeOmniFeed");
v86.validateProps = v10.strictInterface({
    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v10.optional(v10.number) else nil, 
    hasNextPage = v10.optional(v10.boolean), 
    homeOmniFetchStatus = if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() then v10.optional(v10.string) else nil, 
    localUserId = v10.string, 
    homePageDataStatus = v10.string, 
    omniFeedItems = if v83 then v10.table else v10.optional(v10.table), 
    hasLocalOmniItems = v10.optional(v10.boolean), 
    recommendationsRequestId = v10.optional(v10.string), 
    omniSessionId = v10.optional(v10.string), 
    omniItemsGlobalLayoutData = v10.optional(v10.table), 
    screenSize = v10.Vector2, 
    formFactor = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v10.string else nil, 
    upsellCardVariation = v10.optional(v10.table), 
    addLocalFeedItems = v10.callback, 
    refresh = v10.callback, 
    loadNext = v10.optional(v10.callback), 
    fetchHomePageData = v10.callback, 
    fetchHomePageContactMethodModuleVariation = v10.optional(v10.callback), 
    isOmni = v10.optional(v10.boolean), 
    appAnalytics = v10.any, 
    networking = v10.any, 
    loggingProtocol = v10.optional(v10.any), 
    prefetchProtocol = v10.optional(v10.any), 
    sessionService = v10.optional(v10.any), 
    appStartupSequence = v10.any, 
    eventIngest = v10.any, 
    appLifecycleObserverService = if v64 then v10.optional(v10.any) else nil, 
    navigation = v10.any, 
    header = v10.optional(v10.any), 
    headerHeight = v10.number, 
    relativeGuiEnabled = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v10.optional(v10.boolean) else nil, 
    shouldStopAfterOneGameSort = v10.boolean, 
    sduiContext = v10.table, 
    setScrollingFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v10.optional(v10.callback) else nil, 
    onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v10.optional(v10.callback) else nil
});
local function _(v87) --[[ Line: 164 ]] --[[ Name: isRetrievalStatusFinal ]]
    -- upvalues: l_RetrievalStatus_1 (copy)
    local v88 = false;
    if v87 ~= l_RetrievalStatus_1.NotStarted then
        v88 = v87 ~= l_RetrievalStatus_1.Fetching;
    end;
    return v88;
end;
local function v93(v90, v91) --[[ Line: 168 ]]
    -- upvalues: v59 (copy), v68 (copy), v71 (copy)
    local v92 = true;
    if v90 ~= v59.ContactMethodPhoneNumber then
        v92 = true;
        if v90 ~= v59.ContactMethodPhoneNumberVoiceOptIn then
            v92 = true;
            if v90 ~= v59.ContactMethodPhoneNumberEmailVerticalLayout then
                v92 = true;
                if v90 ~= v59.ContactMethodPhoneNumberEmailHorizontalLayout then
                    v92 = v68() and v90 == v59.ContactMethodEmail or v71() and v90 == v59.VoiceWithoutPvTrial or v91 and v91.upsellCardType ~= "" and v91.upsellCardV2Config ~= nil;
                end;
            end;
        end;
    end;
    return v92;
end;
v86.init = function(v94) --[[ Line: 185 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagFixFetchNextOmniWithoutPageToken_0 (copy), l_RetrievalStatus_1 (copy), v28 (copy), v4 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_feedScroll_0 (copy), l_Home_0 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v64 (copy), l_game_EngineFeature_0 (copy), l_ScriptContext_0 (copy), v55 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), l_FormFactor_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), v61 (copy), v81 (copy), l_FlyoutSidePanelIXP_0 (copy), l_OmniFeedTypes_0 (copy), l_GetFFlagEnableHomePageUpsellCard_0 (copy), v93 (copy), v63 (copy), l_OmniFeedConstants_0 (copy), v62 (copy), v9 (copy)
    v94.props.loggingProtocol:logEventOnce("home_page_container_init");
    v94.isMounted = false;
    v94.loadNext = function() --[[ Line: 190 ]]
        -- upvalues: v94 (copy), l_GetFFlagFixFetchNextOmniWithoutPageToken_0 (ref), l_RetrievalStatus_1 (ref), v28 (ref)
        local l_hasNextPage_0 = v94.props.hasNextPage;
        local l_loadNext_0 = v94.props.loadNext;
        if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() then
            local l_homeOmniFetchStatus_0 = v94.props.homeOmniFetchStatus;
            if l_hasNextPage_0 and l_loadNext_0 and l_homeOmniFetchStatus_0 ~= l_RetrievalStatus_1.Fetching then
                return l_loadNext_0(v94.props.networking, v94.props.omniRecommendationsRequest, v94.props.loggingProtocol);
            end;
        elseif l_hasNextPage_0 and l_loadNext_0 then
            return l_loadNext_0(v94.props.networking, v94.props.omniRecommendationsRequest, v94.props.loggingProtocol);
        end;
        return v28.resolve();
    end;
    v94.fetchHomePageData = function() --[[ Line: 219 ]]
        -- upvalues: v94 (copy)
        return v94.props.fetchHomePageData(v94.props.networking, v94.props.omniRecommendationsRequest, v94.props.appAnalytics, v94.props.localUserId, v94.props.isOmni, v94.props.loggingProtocol, v94.props.prefetchProtocol);
    end;
    v94.fetchHomePageContactMethodModuleVariation = function() --[[ Line: 231 ]]
        -- upvalues: v94 (copy)
        return v94.props.fetchHomePageContactMethodModuleVariation(v94.props.networking);
    end;
    v94.scrollingFrameRef = v4.createRef();
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        v94.setScrollingFrameRef = function(v98) --[[ Line: 237 ]]
            -- upvalues: v94 (copy)
            v94.scrollingFrameRef.current = v98;
            if v94.props.setScrollingFrame then
                v94.props.setScrollingFrame(v98);
            end;
        end;
    end;
    v94.sendScrollEvent = function(v99, v100, v101) --[[ Line: 245 ]]
        -- upvalues: v94 (copy), l_feedScroll_0 (ref), l_Home_0 (ref)
        local l_Y_0 = Enum.ScrollingDirection.Y;
        if l_Y_0 then
            local v103 = 0;
            if v94.scrollingFrameRef.current then
                v103 = v94.scrollingFrameRef.current.AbsoluteSize.Y;
            end;
            local v104 = {
                distance = v99, 
                screenSizeX = v94.props.screenSize.X, 
                screenSizeY = v94.props.screenSize.Y, 
                scrollAreaSize = v103, 
                scrollDepth = if v103 > 0 then v99 / v103 else nil, 
                startDepth = if v103 > 0 then v101 / v103 else nil, 
                startPos = v101, 
                scrollDuration = v100
            };
            l_feedScroll_0(v94.props.eventIngest, l_Home_0, l_Y_0, v104);
        end;
    end;
    v94.logHomePageInteractive = function(v105) --[[ Line: 269 ]]
        -- upvalues: v94 (copy), l_DiscoveryAppLaunchTracker_0 (ref), v64 (ref), l_game_EngineFeature_0 (ref), l_ScriptContext_0 (ref)
        if not v94.isMounted then
            return;
        elseif not v105 then
            return;
        elseif v94.props.appStartupSequence.isInteractive then
            return;
        else
            if v105.AbsoluteSize.X > 1 and v105.AbsoluteSize.Y > 1 then
                v94.props.loggingProtocol:logEventOnce("home_page_interactive_legacy");
                task.defer(function() --[[ Line: 284 ]]
                    -- upvalues: v94 (ref), l_DiscoveryAppLaunchTracker_0 (ref), v64 (ref), l_game_EngineFeature_0 (ref), l_ScriptContext_0 (ref)
                    v94.props.loggingProtocol:logEventOnce("home_page_interactive");
                    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
                        l_DiscoveryAppLaunchTracker_0.default:stopTracking();
                    end;
                    if v64 and game:GetEngineFeature("LuaAppInteractiveSignalEnabled") then
                        v94.props.appLifecycleObserverService:TriggerOnLuaAppInteractive();
                    elseif l_game_EngineFeature_0 then
                        l_ScriptContext_0:ReportLuaRequireCount();
                    end;
                    task.defer(function() --[[ Line: 301 ]]
                        -- upvalues: v94 (ref)
                        v94.props.appStartupSequence:setInteractive();
                    end);
                end);
            end;
            return;
        end;
    end;
    v94.setHomePageSessionInfoFunc = function() --[[ Line: 308 ]]
        -- upvalues: v55 (ref), v94 (copy)
        v55(v94.props.sessionService, v94.props.recommendationsRequestId, v94.props.omniSessionId);
    end;
    v94.insertLocalFeedItem = function(v106, v107, v108, v109, v110) --[[ Line: 312 ]]
        table.insert(v106, {
            orderIndex = v107, 
            treatmentType = v108, 
            treatmentProps = v109, 
            numberOfRows = v110
        });
    end;
    v94.createLocalFeedItems = function() --[[ Line: 321 ]]
        -- upvalues: v94 (copy), l_RetrievalStatus_1 (ref), l_FFlagLuaAppMoveProfileIntoTopBar_0 (ref), l_FormFactor_0 (ref), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (ref), l_VerticalEfficiencyExperimentation_0 (ref), v61 (ref), v81 (ref), l_FlyoutSidePanelIXP_0 (ref), l_OmniFeedTypes_0 (ref), l_GetFFlagEnableHomePageUpsellCard_0 (ref), v93 (ref), v63 (ref), l_OmniFeedConstants_0 (ref), v62 (ref)
        local l_homePageDataStatus_0 = v94.props.homePageDataStatus;
        local v112 = false;
        if l_homePageDataStatus_0 ~= l_RetrievalStatus_1.NotStarted then
            v112 = l_homePageDataStatus_0 ~= l_RetrievalStatus_1.Fetching;
        end;
        if not v112 then
            return;
        else
            v112 = {};
            l_homePageDataStatus_0 = nil;
            if l_FFlagLuaAppMoveProfileIntoTopBar_0 then
                local v113 = false;
                if v94.props.formFactor == l_FormFactor_0.COMPACT then
                    v113 = not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar();
                end;
                l_homePageDataStatus_0 = v113;
            end;
            if v61 > 0 and (not l_FFlagLuaAppMoveProfileIntoTopBar_0 or not l_homePageDataStatus_0) and (not v81 or not l_FlyoutSidePanelIXP_0.isProfileEntryRemoved()) then
                v94.insertLocalFeedItem(v112, v61, l_OmniFeedTypes_0.UserInfo, {}, 0);
            end;
            if l_GetFFlagEnableHomePageUpsellCard_0() and v94.props.upsellCardVariation and v93(v94.props.upsellCardVariation.upsellCardType, v94.props.upsellCardVariation) and v63 > 0 then
                v94.insertLocalFeedItem(v112, v63, l_OmniFeedTypes_0.UpsellCard, {});
            end;
            local l_omniItemsGlobalLayoutData_0 = v94.props.omniItemsGlobalLayoutData;
            if not (l_omniItemsGlobalLayoutData_0 and (l_omniItemsGlobalLayoutData_0[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == "true" or l_omniItemsGlobalLayoutData_0[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == true)) and v62 > 0 then
                v94.insertLocalFeedItem(v112, v62, l_OmniFeedTypes_0.FriendCarousel, {});
            end;
            v94.props.addLocalFeedItems(v112);
            return;
        end;
    end;
    v94.fetchDataIfNeeded = function() --[[ Line: 387 ]]
        -- upvalues: v94 (copy), l_RetrievalStatus_1 (ref)
        if v94.props.homePageDataStatus == l_RetrievalStatus_1.NotStarted then
            v94.fetchHomePageData();
        end;
    end;
    v94._willFocusListener = v94.props.navigation.addListener(v9.Events.WillFocus, function() --[[ Line: 393 ]]
        -- upvalues: v94 (copy)
        v94.fetchDataIfNeeded();
    end);
    v94.omniFeedRefresh = function(v115) --[[ Line: 397 ]]
        -- upvalues: v94 (copy)
        return v94.props.refresh(v94.props.networking, v94.props.omniRecommendationsRequest, v94.props.isOmni, v115, v94.props.loggingProtocol);
    end;
    v94.fetchDataIfNeeded();
    v94.createLocalFeedItems();
end;
v86.render = function(v116) --[[ Line: 412 ]] --[[ Name: render ]]
    -- upvalues: l_RetrievalStatus_1 (copy), v4 (copy), v41 (copy), l_FFlagEnableAppStoreAgeSignalsOnHomePage_0 (copy), l_OmniFeedAutoRefresher_0 (copy), l_AppPage_0 (copy), l_GameSortGroups_0 (copy), v54 (copy), l_Home_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), v56 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_OmniFeedConstants_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagLuaAppCompositionHome_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy)
    local l_homePageDataStatus_1 = v116.props.homePageDataStatus;
    local l_isOmni_0 = v116.props.isOmni;
    local l_l_homePageDataStatus_1_0 = l_homePageDataStatus_1;
    local l_l_l_homePageDataStatus_1_0_0 = l_l_homePageDataStatus_1_0;
    local v121 = false;
    if l_l_l_homePageDataStatus_1_0_0 ~= l_RetrievalStatus_1.NotStarted then
        v121 = l_l_l_homePageDataStatus_1_0_0 ~= l_RetrievalStatus_1.Fetching;
    end;
    if v121 and not v116.props.hasLocalOmniItems then
        l_l_homePageDataStatus_1_0 = l_RetrievalStatus_1.Fetching;
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        SocialUpsellEventReceiver = v4.createElement(v41.SocialUpsellEventReceiver, {
            onAgeVerifiedChange = v116.fetchHomePageContactMethodModuleVariation, 
            shouldRequestAppAgeSignals = l_FFlagEnableAppStoreAgeSignalsOnHomePage_0
        }), 
        TokenRefreshComponent = v4.createElement(l_OmniFeedAutoRefresher_0, {
            isOmni = l_isOmni_0, 
            pageType = l_AppPage_0.Home, 
            sortToRefresh = l_GameSortGroups_0.HomeGames
        }), 
        PageSessionManager = v4.createElement(v54, {
            appPage = l_Home_0, 
            setPageSession = v116.setHomePageSessionInfoFunc
        }), 
        LoadingStateContainer = v4.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(l_l_homePageDataStatus_1_0), 
            onRetry = v116.fetchHomePageData, 
            renderOnLoaded = function() --[[ Line: 442 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v4 (ref), v56 (ref), l_Home_0 (ref), v116 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), l_OmniFeedConstants_0 (ref), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (ref), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (ref), l_FFlagAppIaScrollAway_0 (ref), l_FFlagLuaAppCompositionHome_0 (ref), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (ref)
                return v4.createElement(v56, {
                    pageContext = l_Home_0, 
                    refresh = v116.omniFeedRefresh, 
                    omniFeedItems = v116.props.omniFeedItems, 
                    impressionsTag = "FEEDITEM_IMPRESSIONS", 
                    onAbsoluteSizeChanged = v116.logHomePageInteractive, 
                    hasNextPage = v116.props.hasNextPage, 
                    loadNext = v116.loadNext, 
                    scrollingFrameRef = if l_FFlagLuaAppLayoutParamsInContext_0 then v116.setScrollingFrameRef else v116.scrollingFrameRef, 
                    analyticsContext = l_OmniFeedConstants_0.EventContext, 
                    header = v116.props.header, 
                    headerHeight = v116.props.headerHeight, 
                    sendScrollEvent = v116.sendScrollEvent, 
                    enableRelativeGui = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v116.props.relativeGuiEnabled else nil, 
                    shouldStopAfterOneGameSort = v116.props.shouldStopAfterOneGameSort, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v116.props.canvasTopPadding else nil, 
                    sduiContext = v116.props.sduiContext, 
                    appCompositionEnabled = l_FFlagLuaAppCompositionHome_0 and true or nil, 
                    onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v116.props.onTileImageLoaded else nil
                });
            end
        })
    });
end;
v86.didUpdate = function(v122, v123, _) --[[ Line: 475 ]] --[[ Name: didUpdate ]]
    if not v122.props.hasLocalOmniItems or v123.omniItemsGlobalLayoutData ~= v122.props.omniItemsGlobalLayoutData or v123.homePageDataStatus ~= v122.props.homePageDataStatus or v123.upsellCardVariation ~= v122.props.upsellCardVariation then
        v122.createLocalFeedItems();
    end;
    if v122.scrollingPerf then
        v122.scrollingPerf:setScrollingFrame(v122.scrollingFrameRef.current);
    end;
end;
v86.didMount = function(v125) --[[ Line: 497 ]] --[[ Name: didMount ]]
    -- upvalues: v57 (copy)
    v125.isMounted = true;
    v125.logHomePageInteractive(v125.scrollingFrameRef.current);
    if v57 then
        v125.scrollingPerf = v57.new("HomeOmniFeed", {
            loggingProtocol = v125.props.loggingProtocol, 
            analyticsService = v125.props.appAnalytics
        });
        v125.scrollingPerf:setScrollingFrame(v125.scrollingFrameRef.current);
    end;
end;
v86.willUnmount = function(v126) --[[ Line: 511 ]] --[[ Name: willUnmount ]]
    if v126.scrollingPerf then
        v126.scrollingPerf:clean();
        v126.scrollingPerf = nil;
    end;
    v126.isMounted = false;
    if v126._willFocusListener ~= nil then
        v126._willFocusListener.remove();
        v126._willFocusListener = nil;
    end;
end;
v86 = v5.connect(function(v127, v128) --[[ Line: 524 ]]
    -- upvalues: l_Players_0 (copy), l_GetFFlagFixFetchNextOmniWithoutPageToken_0 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_AppPage_0 (copy), l_Home_0 (copy), v83 (copy), v85 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy)
    local v129 = nil;
    local v130 = nil;
    local v131 = nil;
    local v132 = nil;
    local v133 = nil;
    local l_LocalUserId_0 = v127.LocalUserId;
    local v135 = nil;
    local v136 = nil;
    if not l_LocalUserId_0 or l_LocalUserId_0 == "" then
        l_LocalUserId_0 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    end;
    local v137 = if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() and v128.isOmni then v127.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.OmniRecommendations][l_AppPage_0.Home] else nil;
    if v128.isOmni then
        local v138 = v127.OmniRecommendations[l_AppPage_0.Home];
        if v138 then
            v129 = v138.recommendationsId;
            v130 = v138.omniSessionId;
            v131 = v138.nextPageToken;
        end;
    end;
    local v139 = false;
    if v131 ~= nil then
        v139 = false;
        if v131 ~= "" then
            v139 = v128.isOmni;
        end;
    end;
    v133 = v139;
    v139 = v127.Personalization.OrderedOmniItems[l_Home_0];
    v132 = v139 and v139.allItems or if v83 then v85 else {};
    v135 = v139 and v139.hasLocalItems or false;
    v136 = v127.Personalization.OmniItemsGlobalLayoutData;
    return {
        localUserId = tostring(l_LocalUserId_0), 
        homePageDataStatus = v127.Startup.HomePageDataStatus, 
        homeOmniFetchStatus = if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() then v137 else nil, 
        screenSize = v127.ScreenSize, 
        formFactor = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v127.FormFactor else nil, 
        upsellCardVariation = v127.HomePageUpsellCardVariation, 
        hasNextPage = v133, 
        recommendationsRequestId = v129, 
        omniSessionId = v130, 
        omniFeedItems = v132, 
        hasLocalOmniItems = v135, 
        omniItemsGlobalLayoutData = v136
    };
end, function(v140) --[[ Line: 574 ]]
    -- upvalues: v53 (copy), l_Home_0 (copy), l_ApiFetchOmniRecommendations_0 (copy), l_AppPage_0 (copy), l_OmniFeedConstants_0 (copy), v52 (copy), l_RefreshGameSorts_0 (copy), l_GameSortGroups_0 (copy), v28 (copy), l_SetNetworkingErrorToast_0 (copy), l_FetchHomePageData_0 (copy), l_FetchHomePageContactMethodModuleVariation_0 (copy)
    return {
        addLocalFeedItems = function(v141) --[[ Line: 576 ]] --[[ Name: addLocalFeedItems ]]
            -- upvalues: v140 (copy), v53 (ref), l_Home_0 (ref)
            v140(v53(v141, l_Home_0));
        end, 
        loadNext = function(v142, v143, v144) --[[ Line: 579 ]] --[[ Name: loadNext ]]
            -- upvalues: v140 (copy), l_ApiFetchOmniRecommendations_0 (ref), l_AppPage_0 (ref), l_OmniFeedConstants_0 (ref)
            return v140(l_ApiFetchOmniRecommendations_0(v142, v143, l_AppPage_0.Home, true, nil, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.LoadMore, v144));
        end, 
        refresh = function(v145, v146, v147, v148, v149) --[[ Line: 592 ]] --[[ Name: refresh ]]
            -- upvalues: v140 (copy), v52 (ref), l_ApiFetchOmniRecommendations_0 (ref), l_AppPage_0 (ref), l_RefreshGameSorts_0 (ref), l_GameSortGroups_0 (ref), v28 (ref), l_SetNetworkingErrorToast_0 (ref)
            v140(v52());
            local v150 = if v147 then l_ApiFetchOmniRecommendations_0(v145, v146, l_AppPage_0.Home, nil, nil, v148, v149) else l_RefreshGameSorts_0(v145, {
                l_GameSortGroups_0.HomeGames
            }, nil, nil);
            local v151 = {
                v140(v150)
            };
            return v28.all(v151):andThen(function(v152) --[[ Line: 615 ]]
                -- upvalues: v28 (ref)
                return v28.resolve(v152);
            end, function(v153) --[[ Line: 617 ]]
                -- upvalues: v140 (ref), l_SetNetworkingErrorToast_0 (ref), v28 (ref)
                v140(l_SetNetworkingErrorToast_0(v153));
                return v28.reject(v153);
            end);
        end, 
        fetchHomePageData = function(v154, v155, v156, v157, v158, v159, v160) --[[ Line: 622 ]] --[[ Name: fetchHomePageData ]]
            -- upvalues: v140 (copy), l_FetchHomePageData_0 (ref), l_OmniFeedConstants_0 (ref)
            return v140(l_FetchHomePageData_0(v154, v155, v156, v157, v158, v159, v160, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.LogIn));
        end, 
        fetchHomePageContactMethodModuleVariation = function(v161) --[[ Line: 644 ]] --[[ Name: fetchHomePageContactMethodModuleVariation ]]
            -- upvalues: v140 (copy), l_FetchHomePageContactMethodModuleVariation_0 (ref)
            return v140(l_FetchHomePageContactMethodModuleVariation_0(v161));
        end
    };
end)(v86);
local function v165() --[[ Line: 650 ]] --[[ Name: useIsInteractive ]]
    -- upvalues: v3 (copy), l_default_0 (copy)
    local v162, v163 = v3.useState(l_default_0.isInteractive);
    v3.useEffect(function() --[[ Line: 653 ]]
        -- upvalues: v163 (copy), l_default_0 (ref), v162 (copy)
        v163(l_default_0.isInteractive);
        if not v162 then
            local v164 = l_default_0.changed:connect(function() --[[ Line: 657 ]]
                -- upvalues: v163 (ref), l_default_0 (ref)
                v163(l_default_0.isInteractive);
            end);
            return function() --[[ Line: 660 ]]
                -- upvalues: v164 (copy)
                v164:disconnect();
            end;
        else
            return function() --[[ Line: 664 ]]

            end;
        end;
    end, {
        v162
    });
    return v162;
end;
local l_v86_0 = v86;
v86 = l_RoactAppPolicy_0.connect(function(v167, _) --[[ Line: 722 ]]
    return {
        isOmni = v167.getUseOmniRecommendation()
    };
end)(function(v169) --[[ Line: 670 ]]
    -- upvalues: v58 (copy), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (copy), v60 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v37 (copy), v165 (copy), v3 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useCollectionLayoutConfig_0 (copy), v43 (copy), l_Home_0 (copy), l_FFlagLuaAppRfySignalApportioning_0 (copy), l_FFlagLuaAppCompositionHome_0 (copy), v4 (copy), l_v86_0 (copy), v11 (copy)
    local v170, v171 = v58();
    local v172 = nil;
    if l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 then
        v172 = true;
    elseif l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then
        v172 = v60.getRelativeGuiOnHomeEnabled();
    end;
    if l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then
        local v173 = l_usePreferredInput_0();
        local v174 = l_useIsSpatial_0();
        if v173 == v37.Input.Directional or v174 then
            v172 = false;
        end;
    end;
    local v175 = not v165();
    local v176, v177 = v3.useState(nil);
    local v178 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v176) else nil;
    local v179 = v43.useSduiContextFromRoduxAndProcessConfigs(l_Home_0, if l_FFlagLuaAppLayoutParamsInContext_0 then v178 else nil);
    if l_FFlagLuaAppRfySignalApportioning_0 then
        v43.useApportioningPreprocessingFromOmniRecommendations(l_Home_0, v178, l_FFlagLuaAppCompositionHome_0 and true or nil);
    end;
    return v4.createElement(l_v86_0, v11.Dictionary.join(v169, {
        sduiContext = v179, 
        shouldStopAfterOneGameSort = v175, 
        header = v170, 
        headerHeight = v171, 
        setScrollingFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v177 else nil, 
        relativeGuiEnabled = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v172 else nil
    }));
end);
v86 = v9.withNavigation(v86);
return (l_RoactServices_0.connect({
    appAnalytics = l_RoactAnalytics_0, 
    networking = l_RoactNetworking_0, 
    loggingProtocol = l_AppLogging_0, 
    prefetchProtocol = l_AppPrefetch_0, 
    sessionService = l_AppSessionService_0, 
    appStartupSequence = l_AppStartupSequenceTag_0, 
    eventIngest = l_AppEventIngestService_0, 
    appLifecycleObserverService = if v64 then l_AppAppLifecycleObserverService_0 else nil
})(v86));