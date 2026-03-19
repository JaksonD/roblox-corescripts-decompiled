local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v2 = require(l_Parent_0.Lumberyak).Logger.new(nil, "SocialTabState");
local v3 = game:DefineFastInt("SocialTabStateHttpRetryCount", 3);
local l_httpRequest_0 = v1.httpRequest;
local v5 = v2:new("SocialTabState Networking");
local v11 = l_httpRequest_0.config({
    requestFunction = function(v6, v7, v8) --[[ Line: 13 ]] --[[ Name: requestFunction ]]
        -- upvalues: v5 (copy), l_httpRequest_0 (copy)
        v5:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", v7, v6));
        return l_httpRequest_0.requestFunctions.HttpRbxApi(v6, v7, v8);
    end, 
    postRequestFunction = function(v9, v10) --[[ Line: 17 ]] --[[ Name: postRequestFunction ]]
        -- upvalues: v5 (copy)
        v5:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", v10.requestMethod, v10.url, v9.StatusCode, v9.Body));
    end, 
    maxRetryCount = v3
});
local v12 = v1.RoduxNetworking.config({
    keyPath = "SocialTab.NetworkStatus", 
    networkImpl = v11
});
local v13 = require(l_Parent_0.FriendsRodux);
local l_getFFlagSocialTabReplaceRefreshConversations_0 = require(l_Parent_0.SharedFlags).getFFlagSocialTabReplaceRefreshConversations;
return {
    Rodux = require(l_Parent_0.Rodux), 
    RoduxNetworking = v12, 
    ShowContactImporterParams = require(l_Parent_0.ContactImporter).ShowContactImporterParams, 
    AppChatNetworking = require(l_Parent_0.AppChatNetworking), 
    llama = v1.llama, 
    NetworkingChat = l_getFFlagSocialTabReplaceRefreshConversations_0() and v1.NetworkingChat.config({
        roduxNetworking = v12
    }) or nil, 
    RoduxUsers = v1.RoduxUsers.config({
        keyPath = "SocialTab.Users"
    }), 
    RoduxFriends = v13.config({
        keyPath = "SocialTab.Friends"
    }), 
    RoduxPresence = v1.RoduxPresence.config({
        keyPath = "SocialTab.Presence"
    })
};