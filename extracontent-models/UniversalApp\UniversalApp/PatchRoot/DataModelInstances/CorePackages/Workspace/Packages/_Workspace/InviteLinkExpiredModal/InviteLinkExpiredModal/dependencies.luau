local l_Parent_0 = script:FindFirstAncestor("InviteLinkExpiredModal").Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.Lumberyak);
local v3 = require(l_Parent_0.ShareLinksRodux);
local v4 = v2.Logger.new(nil, "InviteLinkExpiredModal"):new("InviteLinkExpiredModal Networking");
local v5 = game:DefineFastInt("InviteLinkExpiredModalHttpRetryCount", 3);
local l_httpRequest_0 = v1.httpRequest;
local v12 = l_httpRequest_0.config({
    requestFunction = function(v7, v8, v9) --[[ Line: 14 ]] --[[ Name: requestFunction ]]
        -- upvalues: v4 (copy), l_httpRequest_0 (copy)
        v4:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v8, v7));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v7, v8, v9);
    end, 
    postRequestFunction = function(v10, v11) --[[ Line: 19 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v4 (copy)
        v4:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v11.requestMethod, v11.url, v10.StatusCode, v10.Body));
    end, 
    maxRetryCount = v5
});
local v13 = v1.RoduxNetworking.config({
    keyPath = "InviteLinkExpiredModal.NetworkStatus", 
    networkImpl = v12
});
return {
    Dash = require(l_Parent_0.Dash), 
    Roact = require(l_Parent_0.Roact), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    RoactNavigation = require(l_Parent_0.RoactNavigation), 
    Rodux = require(l_Parent_0.Rodux), 
    t = require(l_Parent_0.t), 
    UIBlox = require(l_Parent_0.UIBlox), 
    LocalizationProvider = require(l_Parent_0.Localization).LocalizationProvider, 
    withLocalization = require(l_Parent_0.Localization).withLocalization, 
    llama = v1.llama, 
    SocialLibraries = v1.SocialLibraries.config({}), 
    RoduxGames = v1.RoduxGames.config({
        keyPath = "InviteLinkExpiredModal.Games"
    }), 
    ShareLinksRodux = v3.config({
        keyPath = "InviteLinkExpiredModal.ShareLinks"
    }), 
    RoduxNetworking = v13, 
    NetworkingGames = v1.NetworkingGames.config({
        roduxNetworking = v13
    })
};