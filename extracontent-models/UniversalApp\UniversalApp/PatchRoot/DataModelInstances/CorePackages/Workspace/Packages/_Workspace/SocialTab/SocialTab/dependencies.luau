local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.Lumberyak);
local v3 = v2.Logger.new(nil, "SocialTab");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GetFFlagHideConnectPageWebViewItemsForVR_0 = require(l_Parent_0.SharedFlags).GetFFlagHideConnectPageWebViewItemsForVR;
local v6 = require(l_Parent_0.StreamNotifications);
local v7 = game:DefineFastInt("SocialTabHttpRetryCount", 3);
local l_httpRequest_0 = v1.httpRequest;
local v9 = v3:new("SocialTab Networking");
local v15 = l_httpRequest_0.config({
    requestFunction = function(v10, v11, v12) --[[ Line: 20 ]] --[[ Name: requestFunction ]]
        -- upvalues: v9 (copy), l_httpRequest_0 (copy)
        v9:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v11, v10));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v10, v11, v12);
    end, 
    postRequestFunction = function(v13, v14) --[[ Line: 24 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v9 (copy)
        v9:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v14.requestMethod, v14.url, v13.StatusCode, v13.Body));
    end, 
    maxRetryCount = v7
});
local l_getFFlagSocialTabReplaceRefreshConversations_0 = require(l_Parent_0.SharedFlags).getFFlagSocialTabReplaceRefreshConversations;
local v17 = v1.RoduxNetworking.config({
    keyPath = "SocialTab.NetworkStatus", 
    networkImpl = v15
});
local l_validatePropsWithForwardRef_0 = require(l_Parent_0.RoactUtils).validatePropsWithForwardRef;
local l_RoduxPresence_0 = v1.RoduxPresence;
local v20 = require(l_Parent_0.FriendsRodux);
local l_RoduxGames_0 = v1.RoduxGames;
local l_RoduxUsers_0 = v1.RoduxUsers;
local l_NetworkingGames_0 = v1.NetworkingGames;
return {
    LocalizationService = l_LocalizationService_0, 
    Promise = require(l_Parent_0.Promise), 
    llama = v1.llama, 
    FitFrame = require(l_Parent_0.FitFrame), 
    Otter = require(l_Parent_0.Otter), 
    Roact = require(l_Parent_0.Roact), 
    React = require(l_Parent_0.React), 
    Rodux = require(l_Parent_0.Rodux), 
    Cryo = require(l_Parent_0.Cryo), 
    RetrievalStatus = require(l_Parent_0.Http).Enum.RetrievalStatus, 
    RoactNavigation = require(l_Parent_0.RoactNavigation), 
    RoactAppExperiment = require(l_Parent_0.RoactAppExperiment), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    ExternalEventConnection = require(l_Parent_0.RoactUtils).ExternalEventConnection, 
    Logger = v3, 
    t = require(l_Parent_0.t), 
    Text = require(l_Parent_0.AppCommonLib).Text, 
    UIBlox = require(l_Parent_0.UIBlox), 
    withLocalization = require(l_Parent_0.Localization).withLocalization, 
    useDispatch = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch, 
    useLocalization = require(l_Parent_0.Localization).Hooks.useLocalization, 
    useSelector = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector, 
    memoize = require(l_Parent_0.AppCommonLib).memoize, 
    PromiseUtilities = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities, 
    enumerate = require(l_Parent_0.enumerate), 
    LocalizationProvider = require(l_Parent_0.Localization).LocalizationProvider, 
    Url = require(l_Parent_0.Http).Url, 
    VerifiedBadges = require(l_Parent_0.VerifiedBadges), 
    DiscoverabilityModal = require(l_Parent_0.DiscoverabilityModal), 
    ShowContactImporterParams = require(l_Parent_0.ContactImporter).ShowContactImporterParams, 
    SocialCommon = require(l_Parent_0.SocialCommon), 
    UniversalAppPolicy = require(l_Parent_0.UniversalAppPolicy).UniversalAppPolicy, 
    UiModeStyleProvider = require(l_Parent_0.Style).UiModeStyleProvider, 
    Mock = v1.Mock, 
    tutils = require(l_Parent_0.tutils), 
    AnalyticsService = require(l_Parent_0.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")), 
    NetworkingPresence = v1.NetworkingPresence.config({
        roduxNetworking = v17
    }), 
    NetworkingFriends = require(l_Parent_0.FriendsNetworking).config({
        roduxNetworking = v17
    }), 
    NetworkingUsers = v1.NetworkingUsers.config({
        roduxNetworking = v17
    }), 
    NetworkingGames = l_NetworkingGames_0.config({
        roduxNetworking = v17
    }) or nil, 
    Players = game:GetService("Players"), 
    RoduxNetworking = v17, 
    RoduxUsers = l_RoduxUsers_0.config({
        keyPath = "SocialTab.Users"
    }), 
    RoduxFriends = v20.config({
        keyPath = "SocialTab.Friends"
    }), 
    RoduxPresence = l_RoduxPresence_0.config({
        keyPath = "SocialTab.Presence"
    }), 
    RoduxGames = l_RoduxGames_0.config({
        keyPath = "SocialTab.Games"
    }), 
    NetworkingChat = l_getFFlagSocialTabReplaceRefreshConversations_0() and v1.NetworkingChat.config({
        roduxNetworking = v17
    }) or nil, 
    CollisionMatchers = v1.CollisionMatchers, 
    Lumberyak = v2, 
    RunService = game:GetService("RunService"), 
    validatePropsWithForwardRef = l_validatePropsWithForwardRef_0, 
    SocialLibraries = v1.SocialLibraries.config({}), 
    GetFFlagHideConnectPageWebViewItemsForVR = l_GetFFlagHideConnectPageWebViewItemsForVR_0, 
    UserLib = require(l_Parent_0.UserLib), 
    getStandardSizeAvatarHeadShotRbxthumb = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb, 
    AppChat = require(l_Parent_0.AppChat), 
    StreamNotifications = v6, 
    AppPage = require(l_Parent_0.RobloxAppEnums).AppPage, 
    BuilderIcons = require(l_Parent_0.BuilderIcons), 
    Foundation = require(l_Parent_0.Foundation)
};