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
local v64 = game:DefineFastFlag("UseTriggerReportLuaRequireCountFromLua", false);
local v65 = game:DefineFastFlag("TriggerLuaAppInteractiveFromLua", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("TriggerReportLuaRequireCountFromLua");
local l_GetFFlagFixFetchNextOmniWithoutPageToken_0 = l_Modules_0.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken;
local l_GetFFlagEnableHomePageUpsellCard_0 = l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard;
local v69 = require(l_Modules_1.LuaApp.Flags.GetFFlagEnableHomePageEmailUpsellCard);
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar;
local l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBarIXP;
local v72 = require(l_Modules_1.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard);
local l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeForAll;
local l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableRelativeGuiHomeWithIxp;
local v75 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v75.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v75.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppRfySignalApportioning_0 = v75.FFlagLuaAppRfySignalApportioning;
local l_FFlagEnableAppStoreAgeSignalsOnHomePage_0 = v75.FFlagEnableAppStoreAgeSignalsOnHomePage;
local l_FFlagEnableAEGIS1HomePageBanner_0 = v41.Flags.FFlagEnableAEGIS1HomePageBanner;
local v81 = require(l_Modules_1.Personalization.Flags.FFlagEnableIAFlyoutIXPHomeProfileRemoval);
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local l_Home_0 = l_AppPage_0.Home;
local v84 = v4.PureComponent:extend("HomeOmniFeed");
v84.validateProps = v10.strictInterface({
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
    appLifecycleObserverService = if v65 then v10.optional(v10.any) else nil, 
    navigation = v10.any, 
    header = v10.optional(v10.any), 
    headerHeight = v10.number, 
    relativeGuiEnabled = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v10.optional(v10.boolean) else nil, 
    shouldStopAfterOneGameSort = v10.boolean, 
    sduiContext = v10.table, 
    setScrollingFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v10.optional(v10.callback) else nil
});
local function _(v85) --[[ Line: 158 ]] --[[ Name: isRetrievalStatusFinal ]]
    -- upvalues: l_RetrievalStatus_1 (copy)
    local v86 = false;
    if v85 ~= l_RetrievalStatus_1.NotStarted then
        v86 = v85 ~= l_RetrievalStatus_1.Fetching;
    end;
    return v86;
end;
local function v91(v88, v89) --[[ Line: 162 ]]
    -- upvalues: v59 (copy), v69 (copy), v72 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy)
    local v90 = true;
    if v88 ~= v59.ContactMethodPhoneNumber then
        v90 = true;
        if v88 ~= v59.ContactMethodPhoneNumberVoiceOptIn then
            v90 = true;
            if v88 ~= v59.ContactMethodPhoneNumberEmailVerticalLayout then
                v90 = true;
                if v88 ~= v59.ContactMethodPhoneNumberEmailHorizontalLayout then
                    v90 = v69() and v88 == v59.ContactMethodEmail or v72() and v88 == v59.VoiceWithoutPvTrial or l_FFlagEnableAEGIS1HomePageBanner_0 and v89 and v89.upsellCardType ~= "" and v89.upsellCardV2Config ~= nil;
                end;
            end;
        end;
    end;
    return v90;
end;
v84.init = function(v92) --[[ Line: 180 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagFixFetchNextOmniWithoutPageToken_0 (copy), l_RetrievalStatus_1 (copy), v28 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy), v4 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_feedScroll_0 (copy), l_Home_0 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v65 (copy), v64 (copy), l_game_EngineFeature_0 (copy), l_ScriptContext_0 (copy), v55 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), l_FormFactor_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), v61 (copy), v81 (copy), l_FlyoutSidePanelIXP_0 (copy), l_OmniFeedTypes_0 (copy), l_GetFFlagEnableHomePageUpsellCard_0 (copy), v91 (copy), v63 (copy), l_OmniFeedConstants_0 (copy), v62 (copy), v9 (copy)
    v92.props.loggingProtocol:logEventOnce("home_page_container_init");
    v92.isMounted = false;
    v92.loadNext = function() --[[ Line: 185 ]]
        -- upvalues: v92 (copy), l_GetFFlagFixFetchNextOmniWithoutPageToken_0 (ref), l_RetrievalStatus_1 (ref), v28 (ref)
        local l_hasNextPage_0 = v92.props.hasNextPage;
        local l_loadNext_0 = v92.props.loadNext;
        if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() then
            local l_homeOmniFetchStatus_0 = v92.props.homeOmniFetchStatus;
            if l_hasNextPage_0 and l_loadNext_0 and l_homeOmniFetchStatus_0 ~= l_RetrievalStatus_1.Fetching then
                return l_loadNext_0(v92.props.networking, v92.props.omniRecommendationsRequest, v92.props.loggingProtocol);
            end;
        elseif l_hasNextPage_0 and l_loadNext_0 then
            return l_loadNext_0(v92.props.networking, v92.props.omniRecommendationsRequest, v92.props.loggingProtocol);
        end;
        return v28.resolve();
    end;
    v92.fetchHomePageData = function() --[[ Line: 214 ]]
        -- upvalues: v92 (copy)
        return v92.props.fetchHomePageData(v92.props.networking, v92.props.omniRecommendationsRequest, v92.props.appAnalytics, v92.props.localUserId, v92.props.isOmni, v92.props.loggingProtocol, v92.props.prefetchProtocol);
    end;
    if l_FFlagEnableAEGIS1HomePageBanner_0 then
        v92.fetchHomePageContactMethodModuleVariation = function() --[[ Line: 227 ]]
            -- upvalues: v92 (copy)
            return v92.props.fetchHomePageContactMethodModuleVariation(v92.props.networking);
        end;
    end;
    v92.scrollingFrameRef = v4.createRef();
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        v92.setScrollingFrameRef = function(v96) --[[ Line: 234 ]]
            -- upvalues: v92 (copy)
            v92.scrollingFrameRef.current = v96;
            if v92.props.setScrollingFrame then
                v92.props.setScrollingFrame(v96);
            end;
        end;
    end;
    v92.sendScrollEvent = function(v97, v98, v99) --[[ Line: 242 ]]
        -- upvalues: v92 (copy), l_feedScroll_0 (ref), l_Home_0 (ref)
        local l_Y_0 = Enum.ScrollingDirection.Y;
        if l_Y_0 then
            local v101 = 0;
            if v92.scrollingFrameRef.current then
                v101 = v92.scrollingFrameRef.current.AbsoluteSize.Y;
            end;
            local v102 = {
                distance = v97, 
                screenSizeX = v92.props.screenSize.X, 
                screenSizeY = v92.props.screenSize.Y, 
                scrollAreaSize = v101, 
                scrollDepth = if v101 > 0 then v97 / v101 else nil, 
                startDepth = if v101 > 0 then v99 / v101 else nil, 
                startPos = v99, 
                scrollDuration = v98
            };
            l_feedScroll_0(v92.props.eventIngest, l_Home_0, l_Y_0, v102);
        end;
    end;
    v92.logHomePageInteractive = function(v103) --[[ Line: 266 ]]
        -- upvalues: v92 (copy), l_DiscoveryAppLaunchTracker_0 (ref), v65 (ref), v64 (ref), l_game_EngineFeature_0 (ref), l_ScriptContext_0 (ref)
        if not v92.isMounted then
            return;
        elseif not v103 then
            return;
        elseif v92.props.appStartupSequence.isInteractive then
            return;
        else
            if v103.AbsoluteSize.X > 1 and v103.AbsoluteSize.Y > 1 then
                v92.props.loggingProtocol:logEventOnce("home_page_interactive_legacy");
                task.defer(function() --[[ Line: 281 ]]
                    -- upvalues: v92 (ref), l_DiscoveryAppLaunchTracker_0 (ref), v65 (ref), v64 (ref), l_game_EngineFeature_0 (ref), l_ScriptContext_0 (ref)
                    v92.props.loggingProtocol:logEventOnce("home_page_interactive");
                    if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then
                        l_DiscoveryAppLaunchTracker_0.default:stopTracking();
                    end;
                    if v65 and game:GetEngineFeature("LuaAppInteractiveSignalEnabled") then
                        v92.props.appLifecycleObserverService:TriggerOnLuaAppInteractive();
                    elseif v64 and l_game_EngineFeature_0 then
                        l_ScriptContext_0:ReportLuaRequireCount();
                    end;
                    task.defer(function() --[[ Line: 298 ]]
                        -- upvalues: v92 (ref)
                        v92.props.appStartupSequence:setInteractive();
                    end);
                end);
            end;
            return;
        end;
    end;
    v92.setHomePageSessionInfoFunc = function() --[[ Line: 305 ]]
        -- upvalues: v55 (ref), v92 (copy)
        v55(v92.props.sessionService, v92.props.recommendationsRequestId, v92.props.omniSessionId);
    end;
    v92.insertLocalFeedItem = function(v104, v105, v106, v107, v108) --[[ Line: 309 ]]
        table.insert(v104, {
            orderIndex = v105, 
            treatmentType = v106, 
            treatmentProps = v107, 
            numberOfRows = v108
        });
    end;
    v92.createLocalFeedItems = function() --[[ Line: 318 ]]
        -- upvalues: v92 (copy), l_RetrievalStatus_1 (ref), l_FFlagLuaAppMoveProfileIntoTopBar_0 (ref), l_FormFactor_0 (ref), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (ref), l_VerticalEfficiencyExperimentation_0 (ref), v61 (ref), v81 (ref), l_FlyoutSidePanelIXP_0 (ref), l_OmniFeedTypes_0 (ref), l_GetFFlagEnableHomePageUpsellCard_0 (ref), v91 (ref), v63 (ref), l_OmniFeedConstants_0 (ref), v62 (ref)
        local l_homePageDataStatus_0 = v92.props.homePageDataStatus;
        local v110 = false;
        if l_homePageDataStatus_0 ~= l_RetrievalStatus_1.NotStarted then
            v110 = l_homePageDataStatus_0 ~= l_RetrievalStatus_1.Fetching;
        end;
        if not v110 then
            return;
        else
            v110 = {};
            l_homePageDataStatus_0 = nil;
            if l_FFlagLuaAppMoveProfileIntoTopBar_0 then
                local v111 = false;
                if v92.props.formFactor == l_FormFactor_0.COMPACT then
                    v111 = not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar();
                end;
                l_homePageDataStatus_0 = v111;
            end;
            if v61 > 0 and (not l_FFlagLuaAppMoveProfileIntoTopBar_0 or not l_homePageDataStatus_0) and (not v81 or not l_FlyoutSidePanelIXP_0.isProfileEntryRemoved()) then
                v92.insertLocalFeedItem(v110, v61, l_OmniFeedTypes_0.UserInfo, {}, 0);
            end;
            if l_GetFFlagEnableHomePageUpsellCard_0() and v92.props.upsellCardVariation and v91(v92.props.upsellCardVariation.upsellCardType, v92.props.upsellCardVariation) and v63 > 0 then
                v92.insertLocalFeedItem(v110, v63, l_OmniFeedTypes_0.UpsellCard, {});
            end;
            local l_omniItemsGlobalLayoutData_0 = v92.props.omniItemsGlobalLayoutData;
            if not (l_omniItemsGlobalLayoutData_0 and (l_omniItemsGlobalLayoutData_0[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == "true" or l_omniItemsGlobalLayoutData_0[l_OmniFeedConstants_0.GlobalLayoutDataKeys.JYFRefresh] == true)) and v62 > 0 then
                v92.insertLocalFeedItem(v110, v62, l_OmniFeedTypes_0.FriendCarousel, {});
            end;
            v92.props.addLocalFeedItems(v110);
            return;
        end;
    end;
    v92.fetchDataIfNeeded = function() --[[ Line: 384 ]]
        -- upvalues: v92 (copy), l_RetrievalStatus_1 (ref)
        if v92.props.homePageDataStatus == l_RetrievalStatus_1.NotStarted then
            v92.fetchHomePageData();
        end;
    end;
    v92._willFocusListener = v92.props.navigation.addListener(v9.Events.WillFocus, function() --[[ Line: 390 ]]
        -- upvalues: v92 (copy)
        v92.fetchDataIfNeeded();
    end);
    v92.omniFeedRefresh = function(v113) --[[ Line: 394 ]]
        -- upvalues: v92 (copy)
        return v92.props.refresh(v92.props.networking, v92.props.omniRecommendationsRequest, v92.props.isOmni, v113, v92.props.loggingProtocol);
    end;
    v92.fetchDataIfNeeded();
    v92.createLocalFeedItems();
end;
v84.render = function(v114) --[[ Line: 409 ]] --[[ Name: render ]]
    -- upvalues: l_RetrievalStatus_1 (copy), v4 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy), v41 (copy), l_FFlagEnableAppStoreAgeSignalsOnHomePage_0 (copy), l_OmniFeedAutoRefresher_0 (copy), l_AppPage_0 (copy), l_GameSortGroups_0 (copy), v54 (copy), l_Home_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), v56 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_OmniFeedConstants_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (copy), l_FFlagAppIaScrollAway_0 (copy)
    local l_homePageDataStatus_1 = v114.props.homePageDataStatus;
    local l_isOmni_0 = v114.props.isOmni;
    local l_l_homePageDataStatus_1_0 = l_homePageDataStatus_1;
    local l_l_l_homePageDataStatus_1_0_0 = l_l_homePageDataStatus_1_0;
    local v119 = false;
    if l_l_l_homePageDataStatus_1_0_0 ~= l_RetrievalStatus_1.NotStarted then
        v119 = l_l_l_homePageDataStatus_1_0_0 ~= l_RetrievalStatus_1.Fetching;
    end;
    if v119 and not v114.props.hasLocalOmniItems then
        l_l_homePageDataStatus_1_0 = l_RetrievalStatus_1.Fetching;
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        SocialUpsellEventReceiver = if l_FFlagEnableAEGIS1HomePageBanner_0 then v4.createElement(v41.SocialUpsellEventReceiver, {
            onAgeVerifiedChange = v114.fetchHomePageContactMethodModuleVariation, 
            shouldRequestAppAgeSignals = l_FFlagEnableAppStoreAgeSignalsOnHomePage_0
        }) else nil, 
        TokenRefreshComponent = v4.createElement(l_OmniFeedAutoRefresher_0, {
            isOmni = l_isOmni_0, 
            pageType = l_AppPage_0.Home, 
            sortToRefresh = l_GameSortGroups_0.HomeGames
        }), 
        PageSessionManager = v4.createElement(v54, {
            appPage = l_Home_0, 
            setPageSession = v114.setHomePageSessionInfoFunc
        }), 
        LoadingStateContainer = v4.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(l_l_homePageDataStatus_1_0), 
            onRetry = v114.fetchHomePageData, 
            renderOnLoaded = function() --[[ Line: 441 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v4 (ref), v56 (ref), l_Home_0 (ref), v114 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), l_OmniFeedConstants_0 (ref), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (ref), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (ref), l_FFlagAppIaScrollAway_0 (ref)
                return v4.createElement(v56, {
                    pageContext = l_Home_0, 
                    refresh = v114.omniFeedRefresh, 
                    omniFeedItems = v114.props.omniFeedItems, 
                    impressionsTag = "FEEDITEM_IMPRESSIONS", 
                    onAbsoluteSizeChanged = v114.logHomePageInteractive, 
                    hasNextPage = v114.props.hasNextPage, 
                    loadNext = v114.loadNext, 
                    scrollingFrameRef = if l_FFlagLuaAppLayoutParamsInContext_0 then v114.setScrollingFrameRef else v114.scrollingFrameRef, 
                    analyticsContext = l_OmniFeedConstants_0.EventContext, 
                    header = v114.props.header, 
                    headerHeight = v114.props.headerHeight, 
                    sendScrollEvent = v114.sendScrollEvent, 
                    enableRelativeGui = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v114.props.relativeGuiEnabled else nil, 
                    shouldStopAfterOneGameSort = v114.props.shouldStopAfterOneGameSort, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v114.props.canvasTopPadding else nil, 
                    sduiContext = v114.props.sduiContext
                });
            end
        })
    });
end;
v84.didUpdate = function(v120, v121, _) --[[ Line: 470 ]] --[[ Name: didUpdate ]]
    if not v120.props.hasLocalOmniItems or v121.omniItemsGlobalLayoutData ~= v120.props.omniItemsGlobalLayoutData or v121.homePageDataStatus ~= v120.props.homePageDataStatus or v121.upsellCardVariation ~= v120.props.upsellCardVariation then
        v120.createLocalFeedItems();
    end;
    if v120.scrollingPerf then
        v120.scrollingPerf:setScrollingFrame(v120.scrollingFrameRef.current);
    end;
end;
v84.didMount = function(v123) --[[ Line: 492 ]] --[[ Name: didMount ]]
    -- upvalues: v57 (copy)
    v123.isMounted = true;
    v123.logHomePageInteractive(v123.scrollingFrameRef.current);
    if v57 then
        v123.scrollingPerf = v57.new("HomeOmniFeed", {
            loggingProtocol = v123.props.loggingProtocol, 
            analyticsService = v123.props.appAnalytics
        });
        v123.scrollingPerf:setScrollingFrame(v123.scrollingFrameRef.current);
    end;
end;
v84.willUnmount = function(v124) --[[ Line: 506 ]] --[[ Name: willUnmount ]]
    if v124.scrollingPerf then
        v124.scrollingPerf:clean();
        v124.scrollingPerf = nil;
    end;
    v124.isMounted = false;
    if v124._willFocusListener ~= nil then
        v124._willFocusListener.remove();
        v124._willFocusListener = nil;
    end;
end;
v84 = v5.connect(function(v125, v126) --[[ Line: 519 ]]
    -- upvalues: l_Players_0 (copy), l_GetFFlagFixFetchNextOmniWithoutPageToken_0 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_AppPage_0 (copy), l_Home_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy)
    local v127 = nil;
    local v128 = nil;
    local v129 = nil;
    local v130 = nil;
    local v131 = nil;
    local l_LocalUserId_0 = v125.LocalUserId;
    local v133 = nil;
    local v134 = nil;
    if not l_LocalUserId_0 or l_LocalUserId_0 == "" then
        l_LocalUserId_0 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
    end;
    local v135 = if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() and v126.isOmni then v125.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.OmniRecommendations][l_AppPage_0.Home] else nil;
    if v126.isOmni then
        local v136 = v125.OmniRecommendations[l_AppPage_0.Home];
        if v136 then
            v127 = v136.recommendationsId;
            v128 = v136.omniSessionId;
            v129 = v136.nextPageToken;
        end;
    end;
    local v137 = false;
    if v129 ~= nil then
        v137 = false;
        if v129 ~= "" then
            v137 = v126.isOmni;
        end;
    end;
    v131 = v137;
    v137 = v125.Personalization.OrderedOmniItems[l_Home_0];
    v130 = v137 and v137.allItems or {};
    v133 = v137 and v137.hasLocalItems or false;
    v134 = v125.Personalization.OmniItemsGlobalLayoutData;
    return {
        localUserId = tostring(l_LocalUserId_0), 
        homePageDataStatus = v125.Startup.HomePageDataStatus, 
        homeOmniFetchStatus = if l_GetFFlagFixFetchNextOmniWithoutPageToken_0() then v135 else nil, 
        screenSize = v125.ScreenSize, 
        formFactor = if l_FFlagLuaAppMoveProfileIntoTopBar_0 then v125.FormFactor else nil, 
        upsellCardVariation = v125.HomePageUpsellCardVariation, 
        hasNextPage = v131, 
        recommendationsRequestId = v127, 
        omniSessionId = v128, 
        omniFeedItems = v130, 
        hasLocalOmniItems = v133, 
        omniItemsGlobalLayoutData = v134
    };
end, function(v138) --[[ Line: 568 ]]
    -- upvalues: v53 (copy), l_Home_0 (copy), l_ApiFetchOmniRecommendations_0 (copy), l_AppPage_0 (copy), l_OmniFeedConstants_0 (copy), v52 (copy), l_RefreshGameSorts_0 (copy), l_GameSortGroups_0 (copy), v28 (copy), l_SetNetworkingErrorToast_0 (copy), l_FetchHomePageData_0 (copy), l_FFlagEnableAEGIS1HomePageBanner_0 (copy), l_FetchHomePageContactMethodModuleVariation_0 (copy)
    return {
        addLocalFeedItems = function(v139) --[[ Line: 570 ]] --[[ Name: addLocalFeedItems ]]
            -- upvalues: v138 (copy), v53 (ref), l_Home_0 (ref)
            v138(v53(v139, l_Home_0));
        end, 
        loadNext = function(v140, v141, v142) --[[ Line: 573 ]] --[[ Name: loadNext ]]
            -- upvalues: v138 (copy), l_ApiFetchOmniRecommendations_0 (ref), l_AppPage_0 (ref), l_OmniFeedConstants_0 (ref)
            return v138(l_ApiFetchOmniRecommendations_0(v140, v141, l_AppPage_0.Home, true, nil, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.LoadMore, v142));
        end, 
        refresh = function(v143, v144, v145, v146, v147) --[[ Line: 586 ]] --[[ Name: refresh ]]
            -- upvalues: v138 (copy), v52 (ref), l_ApiFetchOmniRecommendations_0 (ref), l_AppPage_0 (ref), l_RefreshGameSorts_0 (ref), l_GameSortGroups_0 (ref), v28 (ref), l_SetNetworkingErrorToast_0 (ref)
            v138(v52());
            local v148 = if v145 then l_ApiFetchOmniRecommendations_0(v143, v144, l_AppPage_0.Home, nil, nil, v146, v147) else l_RefreshGameSorts_0(v143, {
                l_GameSortGroups_0.HomeGames
            }, nil, nil);
            local v149 = {
                v138(v148)
            };
            return v28.all(v149):andThen(function(v150) --[[ Line: 609 ]]
                -- upvalues: v28 (ref)
                return v28.resolve(v150);
            end, function(v151) --[[ Line: 611 ]]
                -- upvalues: v138 (ref), l_SetNetworkingErrorToast_0 (ref), v28 (ref)
                v138(l_SetNetworkingErrorToast_0(v151));
                return v28.reject(v151);
            end);
        end, 
        fetchHomePageData = function(v152, v153, v154, v155, v156, v157, v158) --[[ Line: 616 ]] --[[ Name: fetchHomePageData ]]
            -- upvalues: v138 (copy), l_FetchHomePageData_0 (ref), l_OmniFeedConstants_0 (ref)
            return v138(l_FetchHomePageData_0(v152, v153, v154, v155, v156, v157, v158, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.LogIn));
        end, 
        fetchHomePageContactMethodModuleVariation = l_FFlagEnableAEGIS1HomePageBanner_0 and function(v159) --[[ Line: 639 ]]
            -- upvalues: v138 (copy), l_FetchHomePageContactMethodModuleVariation_0 (ref)
            return v138(l_FetchHomePageContactMethodModuleVariation_0(v159));
        end or nil
    };
end)(v84);
local function v163() --[[ Line: 646 ]] --[[ Name: useIsInteractive ]]
    -- upvalues: v3 (copy), l_default_0 (copy)
    local v160, v161 = v3.useState(l_default_0.isInteractive);
    v3.useEffect(function() --[[ Line: 649 ]]
        -- upvalues: v161 (copy), l_default_0 (ref), v160 (copy)
        v161(l_default_0.isInteractive);
        if not v160 then
            local v162 = l_default_0.changed:connect(function() --[[ Line: 653 ]]
                -- upvalues: v161 (ref), l_default_0 (ref)
                v161(l_default_0.isInteractive);
            end);
            return function() --[[ Line: 656 ]]
                -- upvalues: v162 (copy)
                v162:disconnect();
            end;
        else
            return function() --[[ Line: 660 ]]

            end;
        end;
    end, {
        v160
    });
    return v160;
end;
local l_v84_0 = v84;
v84 = l_RoactAppPolicy_0.connect(function(v165, _) --[[ Line: 714 ]]
    return {
        isOmni = v165.getUseOmniRecommendation()
    };
end)(function(v167) --[[ Line: 666 ]]
    -- upvalues: v58 (copy), l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 (copy), l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 (copy), v60 (copy), l_usePreferredInput_0 (copy), l_useIsSpatial_0 (copy), v37 (copy), v163 (copy), v3 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useCollectionLayoutConfig_0 (copy), v43 (copy), l_Home_0 (copy), l_FFlagLuaAppRfySignalApportioning_0 (copy), v4 (copy), l_v84_0 (copy), v11 (copy)
    local v168, v169 = v58();
    local v170 = nil;
    if l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 then
        v170 = true;
    elseif l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then
        v170 = v60.getRelativeGuiOnHomeEnabled();
    end;
    if l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then
        local v171 = l_usePreferredInput_0();
        local v172 = l_useIsSpatial_0();
        if v171 == v37.Input.Directional or v172 then
            v170 = false;
        end;
    end;
    local v173 = not v163();
    local v174, v175 = v3.useState(nil);
    local v176 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v174) else nil;
    local v177 = v43.useSduiContextFromRoduxAndProcessConfigs(l_Home_0, if l_FFlagLuaAppLayoutParamsInContext_0 then v176 else nil);
    if l_FFlagLuaAppRfySignalApportioning_0 then
        v43.useApportioningPreprocessingFromOmniRecommendations(l_Home_0, v176);
    end;
    return v4.createElement(l_v84_0, v11.Dictionary.join(v167, {
        sduiContext = v177, 
        shouldStopAfterOneGameSort = v173, 
        header = v168, 
        headerHeight = v169, 
        setScrollingFrame = if l_FFlagLuaAppLayoutParamsInContext_0 then v175 else nil, 
        relativeGuiEnabled = if not not l_FFlagLuaAppEnableRelativeGuiHomeForAll_0 or l_FFlagLuaAppEnableRelativeGuiHomeWithIxp_0 then v170 else nil
    }));
end);
v84 = v9.withNavigation(v84);
return (l_RoactServices_0.connect({
    appAnalytics = l_RoactAnalytics_0, 
    networking = l_RoactNetworking_0, 
    loggingProtocol = l_AppLogging_0, 
    prefetchProtocol = l_AppPrefetch_0, 
    sessionService = l_AppSessionService_0, 
    appStartupSequence = l_AppStartupSequenceTag_0, 
    eventIngest = l_AppEventIngestService_0, 
    appLifecycleObserverService = if v65 then l_AppAppLifecycleObserverService_0 else nil
})(v84));