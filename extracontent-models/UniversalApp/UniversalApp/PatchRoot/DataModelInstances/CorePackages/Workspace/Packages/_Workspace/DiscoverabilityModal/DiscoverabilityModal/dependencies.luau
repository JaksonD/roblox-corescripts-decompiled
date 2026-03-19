local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuaSocialLibrariesDeps);
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local v4 = require(l_Parent_1.Lumberyak);
local l_httpRequest_0 = v2.httpRequest;
local v6 = v4.Logger.new(nil, "DiscoverabilityModal"):new("DiscoverabilityModal Networking");
local v7 = game:DefineFastInt("DiscoverabilityModalHttpRetryCount", 3);
local v13 = l_httpRequest_0.config({
    requestFunction = function(v8, v9, v10) --[[ Line: 13 ]] --[[ Name: requestFunction ]]
        -- upvalues: v6 (copy), l_httpRequest_0 (copy)
        v6:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v9, v8));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v8, v9, v10);
    end, 
    postRequestFunction = function(v11, v12) --[[ Line: 17 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v6 (copy)
        v6:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v12.requestMethod, v12.url, v11.StatusCode, v11.Body));
    end, 
    maxRetryCount = v7
});
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local v15 = l_RoduxNetworking_0.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v13
});
local v16 = require(l_Parent_1.SocialLuaAnalytics);
local v17 = require(l_Parent_1.SharedFlags);
return {
    AppStorageService = game:GetService("AppStorageService"), 
    SocialLuaAnalytics = v16, 
    Dash = require(l_Parent_1.Dash), 
    UIBlox = require(l_Parent_1.UIBlox), 
    Roact = require(l_Parent_1.Roact), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    Rodux = require(l_Parent_1.Rodux), 
    React = require(l_Parent_1.React), 
    ContactsProtocol = require(l_Parent_1.ContactsProtocol).ContactsProtocol, 
    Promise = require(l_Parent_1.Promise), 
    enumerate = require(l_Parent_1.enumerate), 
    RoactNavigation = require(l_Parent_1.RoactNavigation), 
    rolloutByApplicationId = require(l_Parent_1.AppCommonLib).rolloutByApplicationId, 
    RoduxNetworking = v15, 
    SocialLibraries = v2.SocialLibraries.config({}), 
    SocialModalsCommon = require(l_Parent_1.SocialModalsCommon), 
    PermissionsProtocol = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol, 
    NetworkingUserSettings = v2.NetworkingUserSettings.config({
        roduxNetworking = v15
    }), 
    RoduxUserPermissions = v2.RoduxUserPermissions.config({
        keyPath = l_RODUX_KEY_0 .. ".UserPermissions"
    }), 
    LocalizationProvider = require(l_Parent_1.Localization).LocalizationProvider, 
    Hooks = {
        useLocalization = require(l_Parent_1.Localization).Hooks.useLocalization, 
        useNavigation = require(l_Parent_1.Navigation).useNavigation, 
        useSelector = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useSelector, 
        useDispatch = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch
    }, 
    getFStringSocialProfileLayer = v17.getFStringSocialProfileLayer
};