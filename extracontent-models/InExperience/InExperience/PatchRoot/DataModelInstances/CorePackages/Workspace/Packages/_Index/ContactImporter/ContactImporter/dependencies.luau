local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_1.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local v5 = require(l_Parent_1.ShareLinksNetworking);
local v6 = require(l_Parent_1.ShareLinksRodux);
local v7 = require(l_Parent_1.VirtualizedList);
local v8 = require(l_Parent_1.UrlBuilder);
local v9 = require(l_Parent_1.SocialLuaAnalytics);
local v10 = v3.Logger.new(nil, "ContactImporter"):new("ContactImporter Networking");
local v11 = game:DefineFastInt("ContactImporterHttpRetryCount", 3);
local v17 = l_httpRequest_0.config({
    requestFunction = function(v12, v13, v14) --[[ Line: 18 ]] --[[ Name: requestFunction ]]
        -- upvalues: v10 (copy), l_httpRequest_0 (copy)
        v10:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v13, v12));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v12, v13, v14);
    end, 
    postRequestFunction = function(v15, v16) --[[ Line: 22 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v10 (copy)
        v10:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v16.requestMethod, v16.url, v15.StatusCode, v15.Body));
    end, 
    maxRetryCount = v11
});
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local v19 = v2.RoduxNetworking.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v17
});
local v20 = require(l_Parent_1.ContactsRodux).config({
    keyPath = l_RODUX_KEY_0 .. ".Contacts"
});
local v21 = require(l_Parent_1.RoactAppExperiment);
local v22 = require(l_Parent_1.UIBlox);
return {
    SocialLuaAnalytics = v9, 
    Dash = require(l_Parent_1.Dash), 
    UIBlox = v22, 
    Roact = require(l_Parent_1.Roact), 
    RoactNavigation = require(l_Parent_1.RoactNavigation), 
    Rodux = require(l_Parent_1.Rodux), 
    ReactRoblox = require(l_Parent_1.ReactRoblox), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    withLocalization = require(l_Parent_1.Localization).withLocalization, 
    Url = require(l_Parent_1.Http).Url, 
    t = require(l_Parent_1.t), 
    Promise = require(l_Parent_1.Promise), 
    llama = v2.llama, 
    memoize = require(l_Parent_1.AppCommonLib).memoize, 
    RoduxNetworking = v19, 
    enumerate = require(l_Parent_1.enumerate), 
    IXPService = game:GetService("IXPService"), 
    ShareLinksNetworking = v5.config({
        roduxNetworking = v19
    }), 
    SocialLibraries = v2.SocialLibraries.config({}), 
    SocialModalsCommon = require(l_Parent_1.SocialModalsCommon), 
    NetworkingContacts = require(l_Parent_1.ContactsNetworking).config({
        roduxNetworking = v19
    }), 
    NetworkingFriends = require(l_Parent_1.FriendsNetworking).config({
        roduxNetworking = v19
    }), 
    NetworkingUserSettings = v2.NetworkingUserSettings.config({
        roduxNetworking = v19
    }), 
    NetworkingAccountInformation = v2.NetworkingAccountInformation.config({
        roduxNetworking = v19
    }), 
    NetworkingAccountSettings = v2.NetworkingAccountSettings.config({
        roduxNetworking = v19
    }), 
    UrlBuilder = v8.UrlBuilder, 
    ContactsProtocol = require(l_Parent_1.ContactsProtocol).ContactsProtocol, 
    SMSProtocol = require(l_Parent_1.SMSProtocol).SMSProtocol, 
    PermissionsProtocol = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol, 
    RoduxContacts = v20, 
    RoduxUserPermissions = v2.RoduxUserPermissions.config({
        keyPath = l_RODUX_KEY_0 .. ".UserPermissions"
    }), 
    ShareLinksRodux = v6.config({
        keyPath = l_RODUX_KEY_0 .. ".ShareLinks"
    }), 
    AppStorageService = game:GetService("AppStorageService"), 
    UserInputService = game:GetService("UserInputService"), 
    ThrottleUserId = require(l_Parent_1.AppCommonLib).ThrottleUserId, 
    getFStringSocialFriendsLayer = require(l_Parent_1.SharedFlags).getFStringSocialFriendsLayer, 
    Players = game:GetService("Players"), 
    React = require(l_Parent_1.React), 
    FlatList = v7.FlatList, 
    SectionList = v7.SectionList, 
    useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
    useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch, 
    usePrevious = require(l_Parent_1.RoactUtils).Hooks.usePrevious, 
    useNavigation = require(l_Parent_1.Navigation).useNavigation, 
    useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
    useStyle = v22.Core.Style.useStyle, 
    useUserExperiment = v21.useUserExperiment, 
    useEffectOnce = require(l_Parent_1.RoactUtils).Hooks.useEffectOnce, 
    DiscoverabilityOverlay = require(l_Parent_1.DiscoverabilityModal).DiscoverabilityOverlay, 
    DiscoverabilityAnalytics = require(l_Parent_1.DiscoverabilityModal).Analytics, 
    RoactExperimentProvider = v21.Provider, 
    UniversalAppPolicy = require(l_Parent_1.UniversalAppPolicy).UniversalAppPolicy, 
    AmpUpsell = require(l_Parent_1.AmpUpsell), 
    Foundation = require(l_Parent_1.Foundation)
};