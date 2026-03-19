local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v8 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.LuaApp.Constants);
local v14 = require(l_Modules_0.LuaApp.FitChildren);
local v15 = require(l_Modules_0.LuaApp.withLocalization);
local l_ApiFetchGamesDataByPlaceIds_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds;
local l_ConvertUniverseIdToString_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).ConvertUniverseIdToString;
local v18 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local v19 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_initializeProfileAnalytics_0 = v19.initializeProfileAnalytics;
local l_EventNames_0 = v19.EventNames;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v23 = require(l_Modules_0.LuaApp.Enum.FeatureContext);
local v24 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v25 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v26 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v27 = require(l_Modules_0.LuaApp.Models.User);
local v28 = require(l_Modules_0.LuaApp.Components.ListPicker);
local v29 = require(l_Modules_0.LuaApp.Components.Home.UserActiveGame);
local v30 = require(l_Modules_0.LuaApp.Components.FormBasedContextualMenu);
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v33 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v34 = require(l_CorePackages_0.Workspace.Packages.SocialStopwatch);
local l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel;
local v36 = game:DefineFastFlag("JoinGameCardViewProfileNavigateToProfilePlatform", false);
local v37 = game:DefineFastFlag("JoinGameCardViewProfileEnableExposureLogging", false);
local v38 = game:DefineFastString("JoinGameCardViewProfileExperimentLayer", "Social.ViewFriendSortInGameFriends");
local v39 = v4.PureComponent:extend("PeopleListContextualMenu");
local l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 = v13.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH;
v39.defaultProps = {
    positionIndex = 0, 
    absolutePosition = 0
};
v39.init = function(v41) --[[ Line: 70 ]] --[[ Name: init ]]
    -- upvalues: l_initializeProfileAnalytics_0 (copy), l_ChatEntryPointNames_0 (copy), v24 (copy), v37 (copy), l_IXPService_0 (copy), v38 (copy), v36 (copy), v12 (copy), v19 (copy), v27 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy)
    local l_analytics_0 = v41.props.analytics;
    local l_guiService_0 = v41.props.guiService;
    local l_closeCentralOverlay_0 = v41.props.closeCentralOverlay;
    local l_navigateDown_0 = v41.props.navigateDown;
    local l_user_0 = v41.props.user;
    local l_positionIndex_0 = v41.props.positionIndex;
    local l_absolutePosition_0 = v41.props.absolutePosition;
    local l_source_0 = v41.props.source;
    v41.profileAnalytics = if v41.props.mockProfileAnalytics_dev then v41.props.mockProfileAnalytics_dev else l_initializeProfileAnalytics_0();
    v41.chatWithUser = function(v50) --[[ Line: 84 ]]
        -- upvalues: l_analytics_0 (copy), l_positionIndex_0 (copy), l_absolutePosition_0 (copy), v41 (copy), l_source_0 (copy), l_ChatEntryPointNames_0 (ref), l_guiService_0 (copy), v24 (ref)
        l_analytics_0.reportPeopleListInteraction("ChatDropdown", v50, l_positionIndex_0, l_absolutePosition_0, v41.props.analyticContext, {
            source = l_source_0
        });
        v41.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.PeopleListDropdown);
        l_guiService_0:BroadcastNotification(v50, v24.LAUNCH_CONVERSATION);
    end;
    v41.viewProfile = function(v51) --[[ Line: 98 ]]
        -- upvalues: l_analytics_0 (copy), l_positionIndex_0 (copy), l_absolutePosition_0 (copy), v41 (copy), v37 (ref), l_IXPService_0 (ref), v38 (ref), v36 (ref), l_navigateDown_0 (copy), v12 (ref), v19 (ref), l_closeCentralOverlay_0 (copy)
        l_analytics_0.reportPeopleListInteraction("ProfileDropdown", v51, l_positionIndex_0, l_absolutePosition_0, v41.props.analyticContext);
        if v37 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v38);
        end;
        if v36 then
            l_navigateDown_0({
                name = v12.ProfilePlatform, 
                detail = v51, 
                extraProps = {
                    source = v19.Sources.JoinGameCard
                }
            });
            return;
        else
            l_navigateDown_0({
                name = v12.ViewUserProfile, 
                detail = v51, 
                extraProps = {
                    onClose = function() --[[ Line: 124 ]] --[[ Name: onClose ]]
                        -- upvalues: l_closeCentralOverlay_0 (ref), v41 (ref)
                        l_closeCentralOverlay_0();
                        if v41.props.onCloseProfileWebview then
                            v41.props.onCloseProfileWebview();
                        end;
                    end
                }
            });
            return;
        end;
    end;
    local v52 = {
        source = v41.props.source, 
        universeId = if l_user_0.presence == v27.PresenceType.IN_GAME then l_user_0.universeId else nil
    };
    l_analytics_0.reportPeopleListInteraction("openPeopleList", l_user_0.id, l_positionIndex_0, l_absolutePosition_0, v41.props.analyticContext, v52);
    if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 and l_user_0.presence == v27.PresenceType.IN_GAME and v41.props.universePlaceInfo == nil then
        v41.props.requestGameData(v41.props.networking, v41.props.user.placeId);
    end;
end;
v39.didMount = function(v53) --[[ Line: 163 ]] --[[ Name: didMount ]]
    -- upvalues: v34 (copy), l_EventNames_0 (copy), v18 (copy)
    local l_onOpen_0 = v53.props.onOpen;
    local v55 = v34.Stopwatch.stop(v34.Events.JoinGameCardOpened);
    v53.profileAnalytics.fireAnalyticsEvent(l_EventNames_0.ProfileInExperienceUserLoadingStage, {
        status = v18.Analytics.Enums.LoadingStages.Done, 
        statValue = v55 and v55.timeElapsed or nil
    });
    if l_onOpen_0 then
        l_onOpen_0();
    end;
end;
v39.createMenuItem = function(_, v57, v58, v59) --[[ Line: 178 ]] --[[ Name: createMenuItem ]]
    return {
        displayIcon = v57, 
        text = v58, 
        onSelect = v59
    };
end;
v39.render = function(v60) --[[ Line: 186 ]] --[[ Name: render ]]
    -- upvalues: v27 (copy), l_FormFactor_0 (copy), l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0 (copy), v4 (copy), v30 (copy), v14 (copy), v29 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v23 (copy), v28 (copy), v33 (copy), v15 (copy)
    local l_localization_0 = v60.props.localization;
    local l_screenSize_0 = v60.props.screenSize;
    local l_formFactor_0 = v60.props.formFactor;
    local l_closeCentralOverlay_1 = v60.props.closeCentralOverlay;
    local l_user_1 = v60.props.user;
    local l_positionIndex_1 = v60.props.positionIndex;
    local l_absolutePosition_1 = v60.props.absolutePosition;
    local l_anchorSpaceSize_0 = v60.props.anchorSpaceSize;
    local l_anchorSpacePosition_0 = v60.props.anchorSpacePosition;
    local l_combinedName_0 = v60.props.combinedName;
    local v71 = false;
    if l_user_1.presence == v27.PresenceType.IN_GAME then
        v71 = l_user_1.universeId;
    end;
    local v72 = l_formFactor_0 == l_FormFactor_0.COMPACT and l_screenSize_0.X or l_DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH_0;
    local function v75(v73) --[[ Line: 204 ]]
        -- upvalues: v60 (copy), l_user_1 (copy), v4 (ref), v30 (ref), l_anchorSpaceSize_0 (copy), l_anchorSpacePosition_0 (copy), v72 (copy), v14 (ref), v71 (copy), v29 (ref), l_positionIndex_1 (copy), l_absolutePosition_1 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (ref), l_closeCentralOverlay_1 (copy), v23 (ref), v28 (ref), l_formFactor_0 (copy)
        local v74 = {};
        if v60.props.canUsePlatformChat then
            table.insert(v74, v60:createMenuItem("LuaApp/icons/menu/menu_messages", v73.chatWithFriendText, function() --[[ Line: 209 ]]
                -- upvalues: v60 (ref), l_user_1 (ref)
                v60.chatWithUser(l_user_1.id);
            end));
        end;
        if v60.props.areWebViewsSupported then
            table.insert(v74, v60:createMenuItem("LuaApp/icons/menu/menu_profile", v73.viewProfileText, function() --[[ Line: 218 ]]
                -- upvalues: v60 (ref), l_user_1 (ref)
                v60.viewProfile(l_user_1.id);
            end));
        end;
        return v4.createElement(v30, {
            anchorSpaceSize = l_anchorSpaceSize_0, 
            anchorSpacePosition = l_anchorSpacePosition_0, 
            itemWidth = v72
        }, {
            Content = v4.createElement(v14.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v14.FitAxis.Height, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                ListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                GameHeader = v71 and v4.createElement(v29, {
                    friend = l_user_1, 
                    layoutOrder = 1, 
                    width = v72, 
                    index = l_positionIndex_1, 
                    absolutePosition = l_absolutePosition_1, 
                    universeId = l_user_1.universeId, 
                    universeRootPlaceId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_user_1.rootPlaceId else nil, 
                    placeId = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then l_user_1.placeId else nil, 
                    dismissContextualMenu = l_closeCentralOverlay_1, 
                    featureContext = v23.PeopleList, 
                    onCloseGameDetails = v60.props.onCloseGameDetails, 
                    source = v60.props.source
                }), 
                ListPicker = v4.createElement(v28, {
                    formFactor = l_formFactor_0, 
                    items = v74, 
                    layoutOrder = 2, 
                    width = v72, 
                    maxHeight = 162
                })
            })
        });
    end;
    if v33() then
        return v15({
            chatWithFriendText = {
                "Feature.Home.PeopleList.ChatWith"; 
                username = l_combinedName_0
            }, 
            viewProfileText = "Feature.Chat.Label.ViewProfile"
        })(v75);
    else
        return v75({
            chatWithFriendText = l_localization_0:Format("Feature.Home.PeopleList.ChatWith", {
                username = l_combinedName_0
            }), 
            viewProfileText = l_localization_0:Format("Feature.Chat.Label.ViewProfile")
        });
    end;
end;
v39.willUnmount = function(v76) --[[ Line: 280 ]] --[[ Name: willUnmount ]]
    local l_onClose_0 = v76.props.onClose;
    if l_onClose_0 then
        l_onClose_0();
    end;
end;
v39 = v5.connect(function(v78, v79) --[[ Line: 288 ]]
    -- upvalues: l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), v27 (copy), l_ConvertUniverseIdToString_0 (copy)
    local v80 = nil;
    if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then
        local l_user_2 = v79.user;
        if l_user_2.presence == v27.PresenceType.IN_GAME then
            local v82 = l_ConvertUniverseIdToString_0(l_user_2.universeId);
            v80 = v78.UniversePlaceInfos[v82];
        end;
    end;
    return {
        universePlaceInfo = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v80 else nil, 
        formFactor = v78.FormFactor, 
        screenSize = v78.ScreenSize
    };
end, function(v83) --[[ Line: 305 ]]
    -- upvalues: v26 (copy), v25 (copy), l_EnteredChatFromEntryPoint_0 (copy), l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 (copy), l_ApiFetchGamesDataByPlaceIds_0 (copy)
    return {
        navigateDown = function(v84) --[[ Line: 307 ]] --[[ Name: navigateDown ]]
            -- upvalues: v83 (copy), v26 (ref)
            v83(v26(v84));
        end, 
        closeCentralOverlay = function() --[[ Line: 310 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v83 (copy), v25 (ref)
            v83(v25());
        end, 
        enteredChatFromEntryPoint = function(v85) --[[ Line: 313 ]] --[[ Name: enteredChatFromEntryPoint ]]
            -- upvalues: v83 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            v83(l_EnteredChatFromEntryPoint_0(v85));
        end, 
        requestGameData = l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 and function(v86, v87) --[[ Line: 317 ]]
            -- upvalues: v83 (copy), l_ApiFetchGamesDataByPlaceIds_0 (ref)
            return v83(l_ApiFetchGamesDataByPlaceIds_0(v86, {
                v87
            }));
        end or nil
    };
end)(v39);
v39 = l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    localization = v8, 
    guiService = l_AppGuiService_0, 
    networking = if l_FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel_0 then v11 else nil
})(v39);
return (l_RoactAppPolicy_0.connect(function(v88, _) --[[ Line: 331 ]]
    return {
        enableDisplayNamePolicy = v88.getShowDisplayName(), 
        areWebViewsSupported = v88.getWebViewSupport(), 
        canUsePlatformChat = v88.getCanUsePlatformChat()
    };
end)(v39));