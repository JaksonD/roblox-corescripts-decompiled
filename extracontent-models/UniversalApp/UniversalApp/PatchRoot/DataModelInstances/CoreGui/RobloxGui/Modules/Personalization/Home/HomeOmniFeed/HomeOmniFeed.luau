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
local l_FFlagEnableAEGIS1HomePageBanner_0 = v41.Flags.FFlagEnableAEGIS1HomePageBanner;
local v82 = require(l_Modules_1.Personalization.Flags.FFlagEnableIAFlyoutIXPHomeProfileRemoval);
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local l_Home_0 = l_AppPage_0.Home;
local v85 = v4.PureComponent:extend("HomeOmniFeed");
v85.validateProps = v10.strictInterface({
    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v10.optional(v10.number) else nil, 
    hasNextPage = v10.optional(v10.boolean), 
    homeOmniFetchStatus = if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() then v10.optional(v10.string) else nil, 
    localUserId = v10.string, 
    homePageDataStatus = v10.string, 
    omniFeedItems = v10.optional(v10.table), 
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
    fetchHomePageContactMethodModuleVariation = if l_FFlagEnableAEGIS1HomePageBanner_0 then v10.optional(v10.callback) else nil, 
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
local function _(v86) --[[ Line: 162 ]] --[[ Name: isRetrievalStatusFinal ]]
    -- upvalues: l_RetrievalStatus_1 (copy)
    local v87 = false;
    if v86 ~= l_RetrievalStatus_1.NotStarted then
        v87 = v86 ~= l_RetrievalStatus_1.Fetching;
    end;
    return v87;
end;
local function v92(v89, v90) --[[ Line: 166 ]]
    -- upvalues: v59 (copy), v68 (copy), v71 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy)
    local v91 = true;
    if v89 ~= v59.ContactMethodPhoneNumber then
        v91 = true;
        if v89 ~= v59.ContactMethodPhoneNumberVoiceOptIn then
            v91 = true;
            if v89 ~= v59.ContactMethodPhoneNumberEmailVerticalLayout then
                v91 = true;
                if v89 ~= v59.ContactMethodPhoneNumberEmailHorizontalLayout then
                    v91 = v68() and v89 == v59.ContactMethodEmail or v71() and v89 == v59.VoiceWithoutPvTrial or l_FFlagEnableAEGIS1HomePageBanner_0 and v90 and v90.upsellCardType ~= "" and v90.upsellCardV2Config ~= nil;
                end;
            end;
        end;
    end;
    return v91;
end;
v85.init = function(v93) --[[ Line: 184 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagFixFetchNextOmniWithoutPageToken_0 (copy), l_RetrievalStatus_1 (copy), v28 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy), v4 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_feedScroll_0 (copy), l_Home_0 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v64 (copy), l_game_EngineFeature_0 (copy), l_ScriptContext_0 (copy), v55 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), l_FormFactor_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), v61 (copy), v82 (copy), l_FlyoutSidePanelIXP_0 (copy), l_OmniFeedTypes_0 (copy), l_GetFFlagEnableHomePageUpsellCard_0 (copy), v92 (copy), v63 (copy), l_OmniFeedConstants_0 (copy), v62 (copy), v9 (copy)
    v93.props.loggingProtocol:logEventOnce("home_page_container_init");
    v93.isMounted = false;
    v93.loadNext = function() --[[ Line: 189 ]]
        -- upvalues: v93 (copy), l_GetFFlagFixFetchNextOmniWithoutPageToken_0 (ref), l_RetrievalStatus_1 (ref), v28 (ref)
        local l_hasNextPage_0 = v93.props.hasNextPage;
        local l_loadNext_0 = v93.props.loadNext;
        if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() then
            local l_homeOmniFetchStatus_0 = v93.props.homeOmniFetchStatus;
            if l_hasNextPage_0 and l_loadNext_0 and l_homeOmniFetchStatus_0 ~= l_RetrievalStatus_1.Fetching then
                return l_loadNext_0(v93.props.networking, v93.props.omniRecommendationsRequest, v93.props.loggingProtocol);
            end;
        elseif l_hasNextPage_0 and l_loadNext_0 then
            return l_loadNext_0(v93.props.networking, v93.props.omniRecommendationsRequest, v93.props.loggingProtocol);
        end;
        return v28.resolve();
    end;
    v93.fetchHomePageData = function() --[[ Line: 218 ]]
        -- upvalues: v93 (copy)
        return v93.props.fetchHomePageData(v93.props.networking, v93.props.omniRecommendationsRequest, v93.props.appAnalytics, v93.props.localUserId, v93.props.isOmni, v93.props.loggingProtocol, v93.props.prefetchProtocol);
    end;
    if l_FFlagEnableAEGIS1HomePageBanner_0 then
        v93.fetchHomePageContactMethodModuleVariation = function() --[[ Line: 231 ]]
            -- upvalues: v93 (copy)
            return v93.props.fetchHomePageContactMethodModuleVariation(v93.props.networking);
        end;
    end;
    v93.scrollingFrameRef = v4.createRef();
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        v93.setScrollingFrameRef = function(v97) --[[ Line: 238 ]]
            -- upvalues: v93 (copy)
            v93.scrollingFrameRef.current = v97;
            if v93.props.setScrollingFrame then
                v93.props.setScrollingFrame(v97);
            end;
        end;
    end;
    v93.sendScrollEvent = function(v98, v99, v100) --[[ Line: 246 ]]
        -- upvalues: v93 (copy), l_feedScroll_0 (ref), l_Home_0 (ref)
        local l_Y_0 = Enum.ScrollingDirection.Y;
        if l_Y_0 then
            local v102 = 0;
            if v93.scrollingFrameRef.current then
                v102 = v93.scrollingFrameRef.current.AbsoluteSize.Y;
            end;
            local v103 = {
                distance = v98, 
                screenSizeX = v93.props.screenSize.X, 
                screenSizeY = v93.props.screenSize.Y, 
                scrollAreaSize = v102, 
                scrollDepth = if v102 > 0 then v98 / v102 else nil, 
                startDepth = if v102 > 0 then v100 / v102 else nil, 
                startPos = v100, 
                scrollDuration = v99
            };
            l_feedScroll_0(v93.props.eventIngest, l_Home_0, l_Y_0, v103);
        end;
    end;
    v93.logHomePageInteractive = function(v104) --[[ Line: 270 ]]
        -- upvalues: v93 (copy), l_DiscoveryAppLaunchTracker_0 (ref), v64 (ref), l_game_EngineFeature_0 (ref), l_ScriptContext_0 (ref)
        if not v93.isMounted then
            return;
        elseif not v104 then
            return;
        elseif v93.props.appStartupSequence.isInteractive then
            return;
        else
            if v104.AbsoluteSize.X > 1 and v104.AbsoluteSize.Y > 1 then
                v93.props.loggingProtocol:logEventOnce("home_page_interactive_legacy");
                task.defer(function() --[[ Line: 285 ]]
                    -- upvalues: v93 (ref), l_DiscoveryAppLaunchTracker_0 (ref), v64 (ref), l_game_EngineFeature_0 (ref), l_ScriptContext_0 (ref)
                    v93.props.loggingProtocol:logEventOnce("home_page_interactive");
                    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
                        l_DiscoveryAppLaunchTracker_0.default:stopTracking();
                    end;
                    if v64 and game:GetEngineFeature("LuaAppInteractiveSignalEnabled") then
                        v93.props.appLifecycleObserverService:TriggerOnLuaAppInteractive();
                    elseif l_game_EngineFeature_0 then
                        l_ScriptContext_0:ReportLuaRequireCount();
                    end;
                    task.defer(function() --[[ Line: 302 ]]
                        -- upvalues: v93 (ref)
                        v93.props.appStartupSequence:setInteractive();
                    end);
                end);
            end;
            return;
        end;
    end;
    v93.setHomePageSessionInfoFunc = function() --[[ Line: 309 ]]
        -- upvalues: v55 (ref), v93 (copy)
        v55(v93.props.sessionService, v93.props.recommendationsRequestId, v93.props.omniSessionId);
    end;
    v93.insertLocalFeedItem = function(v105, v106, v107, v108, v109) --[[ Line: 313 ]]
        table.insert(v105, {
            orderIndex = v106, 
            treatmentType = v107, 
            treatmentProps = v108, 
            numberOfRows = v109
        });
    end;
    v93.createLocalFeedItems = function() --[[ Line: 322 ]]
        -- upvalues: v93 (copy), l_RetrievalStatus_1 (ref), l_FFlagLuaAppMoveProfileIntoTopBar_0 (ref), l_FormFactor_0 (ref), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (ref), l_VerticalEfficiencyExperimentation_0 (ref), v61 (ref), v82 (ref), l_FlyoutSidePanelIXP_0 (ref), l_OmniFeedTypes_0 (ref), l_GetFFlagEnableHomePageUpsellCard_0 (ref), v92 (ref), v63 (ref), l_OmniFeedConstants_0 (ref), v62 (ref)
        local l_homePageDataStatus_0 = v93.props.homePageDataStatus;
        local v111 = false;
        if l_homePageDataStatus_0 ~= l_RetrievalStatus_1.NotStarted then
            v111 = l_homePageDataStatus_0 ~= l_RetrievalStatus_1.Fetching;
        end;
        if not v111 then
            return;
        else
            v111 = {};
            l_homePageDataStatus_0 = nil;
            if l_FFlagLuaAppMoveProfileIntoTopBar_0 then
                local v112 = false;
                if v93.props.formFactor == l_FormFactor_0.COMPACT then
                    v112 = not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar();
                end;
                l_homePageDataStatus_0 = v112;
            end;
            if v61 > 0 and (not l_FFlagLuaAppMoveProfileIntoTopBar_0 or not l_homePageDataStatus_0) and (not v82 or not l_FlyoutSidePanelIXP_0.isProfileEntryRemoved()) then
                v93.insertLocalFeedItem(v111, v61, l_OmniFeedTypes_0.UserInfo, {}, 0);
            end;
            if l_GetFFlagEnableHomePageUpsellCard_0() and v93.props.upsellCardVariation and v92(v93.props.upsellCardVariation.upsellCardType, v93.props.upsellCardVariation) and v63 > 0 then
                v93.insertLocalFeedItem(v111, v63, l_OmniFeedTypes_0.UpsellCard, {});
            end;
            local l_omniItemsGlobalLayoutData_0 = v93.props.omniItemsGlobalLayoutData;
            if not (l_omniItemsGlobalLayoutData_0 and (l_omniItemsGlobalLayoutData_0[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == "true" or l_omniItemsGlobalLayoutData_0[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == true)) and v62 > 0 then
                v93.insertLocalFeedItem(v111, v62, l_OmniFeedTypes_0.FriendCarousel, {});
            end;
            v93.props.addLocalFeedItems(v111);
            return;
        end;
    end;
    v93.fetchDataIfNeeded = function() --[[ Line: 388 ]]
        -- upvalues: v93 (copy), l_RetrievalStatus_1 (ref)
        if v93.props.homePageDataStatus == l_RetrievalStatus_1.NotStarted then
            v93.fetchHomePageData();
        end;
    end;
    v93._willFocusListener = v93.props.navigation.addListener(v9.Events.WillFocus, function() --[[ Line: 394 ]]
        -- upvalues: v93 (copy)
        v93.fetchDataIfNeeded();
    end);
    v93.omniFeedRefresh = function(v114) --[[ Line: 398 ]]
        -- upvalues: v93 (copy)
        return v93.props.refresh(v93.props.networking, v93.props.omniRecommendationsRequest, v93.props.isOmni, v114, v93.props.loggingProtocol);
    end;
    v93.fetchDataIfNeeded();
    v93.createLocalFeedItems();
end;
v85.render = function(v115) --[[ Line: 413 ]] --[[ Name: render ]]
    -- upvalues: l_RetrievalStatus_1 (copy), v4 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy), v41 (copy), l_FFlagEnableAppStoreAgeSignalsOnHomePage_0 (copy), l_OmniFeedAutoRefresher_0 (copy), l_AppPage_0 (copy), l_GameSortGroups_0 (copy), v54 (copy), l_Home_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), v56 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_OmniFeedConstants_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagLuaAppCompositionHome_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy)
    local l_homePageDataStatus_1 = v115.props.homePageDataStatus;
    local l_isOmni_0 = v115.props.isOmni;
    local l_l_homePageDataStatus_1_0 = l_homePageDataStatus_1;
    local l_l_l_homePageDataStatus_1_0_0 = l_l_homePageDataStatus_1_0;
    local v120 = false;
    if l_l_l_homePageDataStatus_1_0_0 ~= l_RetrievalStatus_1.NotStarted then
        v120 = l_l_l_homePageDataStatus_1_0_0 ~= l_RetrievalStatus_1.Fetching;
    end;
    if v120 and not v115.props.hasLocalOmniItems then
        l_l_homePageDataStatus_1_0 = l_RetrievalStatus_1.Fetching;
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        SocialUpsellEventReceiver = if l_FFlagEnableAEGIS1HomePageBanner_0 then v4.createElement(v41.SocialUpsellEventReceiver, {
            onAgeVerifiedChange = v115.fetchHomePageContactMethodModuleVariation, 
            shouldRequestAppAgeSignals = l_FFlagEnableAppStoreAgeSignalsOnHomePage_0
        }) else nil, 
        TokenRefreshComponent = v4.createElement(l_OmniFeedAutoRefresher_0, {
            isOmni = l_isOmni_0, 
            pageType = l_AppPage_0.Home, 
            sortToRefresh = l_GameSortGroups_0.HomeGames
        }), 
        PageSessionManager = v4.createElement(v54, {
            appPage = l_Home_0, 
            setPageSession = v115.setHomePageSessionInfoFunc
        }), 
        LoadingStateContainer = v4.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(l_l_homePageDataStatus_1_0), 
            onRetry = v115.fetchHomePageData, 
            renderOnLoaded = function() --[[ Line: 445 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v4 (ref), v56 (ref), l_Home_0 (ref), v115 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), l_OmniFeedConstants_0 (ref), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (ref), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (ref), l_FFlagAppIaScrollAway_0 (ref), l_FFlagLuaAppCompositionHome_0 (ref), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (ref)
                return v4.createElement(v56, {
                    pageContext = l_Home_0, 
                    refresh = v115.omniFeedRefresh, 
                    omniFeedItems = v115.props.omniFeedItems, 
                    impressionsTag = "FEEDITEM_IMPRESSIONS", 
                    onAbsoluteSizeChanged = v115.logHomePageInteractive, 
                    hasNextPage = v115.props.hasNextPage, 
                    loadNext = v115.loadNext, 
                    scrollingFrameRef = if l_FFlagLuaAppLayoutParamsInContext_0 then v115.setScrollingFrameRef else v115.scrollingFrameRef, 
                    analyticsContext = l_OmniFeedConstants_0.EventContext, 
                    header = v115.props.header, 
                    headerHeight = v115.props.headerHeight, 
                    sendScrollEvent = v115.sendScrollEvent, 
                    enableRelativeGui = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v115.props.relativeGuiEnabled else nil, 
                    shouldStopAfterOneGameSort = v115.props.shouldStopAfterOneGameSort, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v115.props.canvasTopPadding else nil, 
                    sduiContext = v115.props.sduiContext, 
                    appCompositionEnabled = l_FFlagLuaAppCompositionHome_0 and true or nil, 
                    onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v115.props.onTileImageLoaded else nil
                });
            end
        })
    });
end;
v85.didUpdate = function(v121, v122, _) --[[ Line: 478 ]] --[[ Name: didUpdate ]]
    if not v121.props.hasLocalOmniItems or v122.omniItemsGlobalLayoutData ~= v121.props.omniItemsGlobalLayoutData or v122.homePageDataStatus ~= v121.props.homePageDataStatus or v122.upsellCardVariation ~= v121.props.upsellCardVariation then
        v121.createLocalFeedItems();
    end;
    if v121.scrollingPerf then
        v121.scrollingPerf:setScrollingFrame(v121.scrollingFrameRef.current);
    end;
end;
v85.didMount = function(v124) --[[ Line: 500 ]] --[[ Name: didMount ]]
    -- upvalues: v57 (copy)
    v124.isMounted = true;
    v124.logHomePageInteractive(v124.scrollingFrameRef.current);
    if v57 then
        v124.scrollingPerf = v57.new("HomeOmniFeed", {
            loggingProtocol = v124.props.loggingProtocol, 
            analyticsService = v124.props.appAnalytics
        });
        v124.scrollingPerf:setScrollingFrame(v124.scrollingFrameRef.current);
    end;
end;
v85.willUnmount = function(v125) --[[ Line: 514 ]] --[[ Name: willUnmount ]]
    if v125.scrollingPerf then
        v125.scrollingPerf:clean();
        v125.scrollingPerf = nil;
    end;
    v125.isMounted = false;
    if v125._willFocusListener ~= nil then
        v125._willFocusListener.remove();
        v125._willFocusListener = nil;
    end;
end;
v85 = v5.connect(function(v126, v127) --[[ Line: 527 ]]
    -- upvalues: l_Players_0 (copy), l_GetFFlagFixFetchNextOmniWithoutPageToken_0 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_AppPage_0 (copy), l_Home_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy)
    local v128 = nil;
    local v129 = nil;
    local v130 = nil;
    local v131 = nil;
    local v132 = nil;
    local l_LocalUserId_0 = v126.LocalUserId;
    local v134 = nil;
    local v135 = nil;
    if not l_LocalUserId_0 or l_LocalUserId_0 == "" then
        l_LocalUserId_0 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    end;
    local v136 = if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() and v127.isOmni then v126.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.OmniRecommendations][l_AppPage_0.Home] else nil;
    if v127.isOmni then
        local v137 = v126.OmniRecommendations[l_AppPage_0.Home];
        if v137 then
            v128 = v137.recommendationsId;
            v129 = v137.omniSessionId;
            v130 = v137.nextPageToken;
        end;
    end;
    local v138 = false;
    if v130 ~= nil then
        v138 = false;
        if v130 ~= "" then
            v138 = v127.isOmni;
        end;
    end;
    v132 = v138;
    v138 = v126.Personalization.OrderedOmniItems[l_Home_0];
    v131 = v138 and v138.allItems or {};
    v134 = v138 and v138.hasLocalItems or false;
    v135 = v126.Personalization.OmniItemsGlobalLayoutData;
    return {
        localUserId = tostring(l_LocalUserId_0), 
        homePageDataStatus = v126.Startup.HomePageDataStatus, 
        homeOmniFetchStatus = if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() then v136 else nil, 
        screenSize = v126.ScreenSize, 
        formFactor = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v126.FormFactor else nil, 
        upsellCardVariation = v126.HomePageUpsellCardVariation, 
        hasNextPage = v132, 
        recommendationsRequestId = v128, 
        omniSessionId = v129, 
        omniFeedItems = v131, 
        hasLocalOmniItems = v134, 
        omniItemsGlobalLayoutData = v135
    };
end, function(v139) --[[ Line: 576 ]]
    -- upvalues: v53 (copy), l_Home_0 (copy), l_ApiFetchOmniRecommendations_0 (copy), l_AppPage_0 (copy), l_OmniFeedConstants_0 (copy), v52 (copy), l_RefreshGameSorts_0 (copy), l_GameSortGroups_0 (copy), v28 (copy), l_SetNetworkingErrorToast_0 (copy), l_FetchHomePageData_0 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy), l_FetchHomePageContactMethodModuleVariation_0 (copy)
    return {
        addLocalFeedItems = function(v140) --[[ Line: 578 ]] --[[ Name: addLocalFeedItems ]]
            -- upvalues: v139 (copy), v53 (ref), l_Home_0 (ref)
            v139(v53(v140, l_Home_0));
        end, 
        loadNext = function(v141, v142, v143) --[[ Line: 581 ]] --[[ Name: loadNext ]]
            -- upvalues: v139 (copy), l_ApiFetchOmniRecommendations_0 (ref), l_AppPage_0 (ref), l_OmniFeedConstants_0 (ref)
            return v139(l_ApiFetchOmniRecommendations_0(v141, v142, l_AppPage_0.Home, true, nil, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.LoadMore, v143));
        end, 
        refresh = function(v144, v145, v146, v147, v148) --[[ Line: 594 ]] --[[ Name: refresh ]]
            -- upvalues: v139 (copy), v52 (ref), l_ApiFetchOmniRecommendations_0 (ref), l_AppPage_0 (ref), l_RefreshGameSorts_0 (ref), l_GameSortGroups_0 (ref), v28 (ref), l_SetNetworkingErrorToast_0 (ref)
            v139(v52());
            local v149 = if v146 then l_ApiFetchOmniRecommendations_0(v144, v145, l_AppPage_0.Home, nil, nil, v147, v148) else l_RefreshGameSorts_0(v144, {
                l_GameSortGroups_0.HomeGames
            }, nil, nil);
            local v150 = {
                v139(v149)
            };
            return v28.all(v150):andThen(function(v151) --[[ Line: 617 ]]
                -- upvalues: v28 (ref)
                return v28.resolve(v151);
            end, function(v152) --[[ Line: 619 ]]
                -- upvalues: v139 (ref), l_SetNetworkingErrorToast_0 (ref), v28 (ref)
                v139(l_SetNetworkingErrorToast_0(v152));
                return v28.reject(v152);
            end);
        end, 
        fetchHomePageData = function(v153, v154, v155, v156, v157, v158, v159) --[[ Line: 624 ]] --[[ Name: fetchHomePageData ]]
            -- upvalues: v139 (copy), l_FetchHomePageData_0 (ref), l_OmniFeedConstants_0 (ref)
            return v139(l_FetchHomePageData_0(v153, v154, v155, v156, v157, v158, v159, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.LogIn));
        end, 
        fetchHomePageContactMethodModuleVariation = l_FFlagEnableAEGIS1HomePageBanner_0 and function(v160) --[[ Line: 647 ]]
            -- upvalues: v139 (copy), l_FetchHomePageContactMethodModuleVariation_0 (ref)
            return v139(l_FetchHomePageContactMethodModuleVariation_0(v160));
        end or nil
    };
end)(v85);
local function v164() --[[ Line: 654 ]] --[[ Name: useIsInteractive ]]
    -- upvalues: v3 (copy), l_default_0 (copy)
    local v161, v162 = v3.useState(l_default_0.isInteractive);
    v3.useEffect(function() --[[ Line: 657 ]]
        -- upvalues: v162 (copy), l_default_0 (ref), v161 (copy)
        v162(l_default_0.isInteractive);
        if not v161 then
            local v163 = l_default_0.changed:connect(function() --[[ Line: 661 ]]
                -- upvalues: v162 (ref), l_default_0 (ref)
                v162(l_default_0.isInteractive);
            end);
            return function() --[[ Line: 664 ]]
                -- upvalues: v163 (copy)
                v163:disconnect();
            end;
        else
            return function() --[[ Line: 668 ]]

            end;
        end;
    end, {
        v161
    });
    return v161;
end;
local l_v85_0 = v85;
v85 = l_RoactAppPolicy_0.connect(function(v166, _) --[[ Line: 726 ]]
    return {
        isOmni = v166.getUseOmniRecommendation()
    };
end)(function(v168) --[[ Line: 674 ]]
    -- upvalues: v58 (copy), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (copy), v60 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v37 (copy), v164 (copy), v3 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useCollectionLayoutConfig_0 (copy), v43 (copy), l_Home_0 (copy), l_FFlagLuaAppRfySignalApportioning_0 (copy), l_FFlagLuaAppCompositionHome_0 (copy), v4 (copy), l_v85_0 (copy), v11 (copy)
    local v169, v170 = v58();
    local v171 = nil;
    if l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 then
        v171 = true;
    elseif l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then
        v171 = v60.getRelativeGuiOnHomeEnabled();
    end;
    if l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then
        local v172 = l_usePreferredInput_0();
        local v173 = l_useIsSpatial_0();
        if v172 == v37.Input.Directional or v173 then
            v171 = false;
        end;
    end;
    local v174 = not v164();
    local v175, v176 = v3.useState(nil);
    local v177 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v175) else nil;
    local v178 = v43.useSduiContextFromRoduxAndProcessConfigs(l_Home_0, if l_FFlagLuaAppLayoutParamsInContext_0 then v177 else nil);
    if l_FFlagLuaAppRfySignalApportioning_0 then
        v43.useApportioningPreprocessingFromOmniRecommendations(l_Home_0, v177, l_FFlagLuaAppCompositionHome_0 and true or nil);
    end;
    return v4.createElement(l_v85_0, v11.Dictionary.join(v168, {
        sduiContext = v178, 
        shouldStopAfterOneGameSort = v174, 
        header = v169, 
        headerHeight = v170, 
        setScrollingFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v176 else nil, 
        relativeGuiEnabled = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v171 else nil
    }));
end);
v85 = v9.withNavigation(v85);
return (l_RoactServices_0.connect({
    appAnalytics = l_RoactAnalytics_0, 
    networking = l_RoactNetworking_0, 
    loggingProtocol = l_AppLogging_0, 
    prefetchProtocol = l_AppPrefetch_0, 
    sessionService = l_AppSessionService_0, 
    appStartupSequence = l_AppStartupSequenceTag_0, 
    eventIngest = l_AppEventIngestService_0, 
    appLifecycleObserverService = if v64 then l_AppAppLifecycleObserverService_0 else nil
})(v85));