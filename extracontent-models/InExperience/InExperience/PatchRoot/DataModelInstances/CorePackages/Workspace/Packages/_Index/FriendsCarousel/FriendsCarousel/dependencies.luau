local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SocialLuaAnalytics);
local v3 = require(l_Parent_1.LuaSocialLibrariesDeps);
local l_httpRequest_0 = v3.httpRequest;
local v5 = require(l_Parent_1.Loggers).Logger:new("FriendsCarousel");
local v6 = v5:new("FriendsCarousel Networking");
local v7 = game:DefineFastInt("FriendsCarouselHttpRetryCount", 3);
local l_getFFlagMigrateSocialNetworking_0 = require(l_Parent_1.SharedFlags).getFFlagMigrateSocialNetworking;
local v14 = l_httpRequest_0.config({
    requestFunction = function(v9, v10, v11) --[[ Line: 18 ]] --[[ Name: requestFunction ]]
        -- upvalues: v6 (copy), l_getFFlagMigrateSocialNetworking_0 (copy), l_httpRequest_0 (copy)
        v6:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v10, v9));
        if l_getFFlagMigrateSocialNetworking_0() then
            return l_httpRequest_0.requestFunctions.RequestInternal(v9, v10, v11);
        else
            return l_httpRequest_0.requestFunctions.HttpRbxApi(v9, v10, v11);
        end;
    end, 
    postRequestFunction = function(v12, v13) --[[ Line: 26 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v6 (copy)
        v6:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", v13.requestMethod, v13.url, v12.StatusCode));
    end, 
    maxRetryCount = v7
});
local l_RODUX_KEY_0 = require(l_Parent_0.Common.Constants).RODUX_KEY;
local v16 = v3.RoduxNetworking.config({
    keyPath = l_RODUX_KEY_0 .. ".NetworkStatus", 
    networkImpl = v14
});
local v17 = require(l_Parent_1.UIBlox);
local _ = require(l_Parent_1.RobloxAppHooks);
return {
    logger = v5, 
    SocialLuaAnalytics = v2, 
    Promise = require(l_Parent_1.Promise), 
    UIBlox = v17, 
    Roact = require(l_Parent_1.Roact), 
    React = require(l_Parent_1.React), 
    Rodux = require(l_Parent_1.Rodux), 
    RoactRodux = require(l_Parent_1.RoactRodux), 
    t = require(l_Parent_1.t), 
    Dash = require(l_Parent_1.Dash), 
    llama = v3.llama, 
    SocialLibraries = v3.SocialLibraries.config({}), 
    SocialCommon = require(l_Parent_1.SocialCommon), 
    RoduxNetworking = v16, 
    NetworkingFriends = require(l_Parent_1.FriendsNetworking).config({
        roduxNetworking = v16
    }), 
    NetworkingAliases = v3.NetworkingAliases.config({
        roduxNetworking = v16
    }), 
    RoduxUsers = v3.RoduxUsers.config({
        keyPath = l_RODUX_KEY_0 .. ".Users"
    }), 
    RoduxFriends = require(l_Parent_1.FriendsRodux).config({
        keyPath = l_RODUX_KEY_0 .. ".Friends"
    }), 
    RoduxPresence = v3.RoduxPresence.config({
        keyPath = l_RODUX_KEY_0 .. ".Presence"
    }), 
    RoduxUserPermissions = v3.RoduxUserPermissions.config({
        keyPath = l_RODUX_KEY_0 .. ".UserPermissions"
    }), 
    RoduxAnalytics = v2.Analytics.RoduxAnalytics.config({
        keyPath = l_RODUX_KEY_0 .. ".Analytics"
    }), 
    convertActions = require(l_Parent_1.SocialReducerAdaptors).convertActions, 
    usersActionAdaptor = require(l_Parent_1.SocialReducerAdaptors).usersActionAdaptor, 
    friendsActionAdaptor = require(l_Parent_1.SocialReducerAdaptors).friendsActionAdaptor, 
    presenceActionAdaptor = require(l_Parent_1.SocialReducerAdaptors).presenceActionAdaptor, 
    Text = require(l_Parent_1.AppCommonLib).Text, 
    enumerate = require(l_Parent_1.enumerate), 
    RetrievalStatus = require(l_Parent_1.Http).Enum.RetrievalStatus, 
    AnalyticsService = require(l_Parent_1.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")), 
    ShowContactImporterParams = require(l_Parent_1.ContactImporter).ShowContactImporterParams, 
    isSubjectToDesktopPolicies = require(l_Parent_1.SharedFlags).isSubjectToDesktopPolicies, 
    isSubjectTo10ftPolicies = require(l_Parent_0.isSubjectTo10ftPolicies)
};