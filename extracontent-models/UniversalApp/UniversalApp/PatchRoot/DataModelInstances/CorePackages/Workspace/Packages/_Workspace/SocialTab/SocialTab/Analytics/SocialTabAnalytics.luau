local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v2.llama;
local l_tutils_0 = v2.tutils;
local l_LocalizationService_0 = v2.LocalizationService;
local v6 = require(script.Parent.Logger);
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v8 = {};
v8.__index = v8;
v8.DiagCounters = {
    UserLoadedPage = game:DefineFastString("SocialTabUserLoadedPageCounter", "SocialTabUserLoadedPage"), 
    UserLoadedSocialTab = game:DefineFastString("SocialTabUserLoadedCounter", "RoactChatUserLoaded")
};
v8.Navigation = {
    LoggedInUserIdentity = game:DefineFastString("SocialTabNavigationLoggedInUserIdentityCounter", "SocialTabNavigationLoggedInUserIdentity"), 
    Chats = game:DefineFastString("SocialTabNavigationChatsCounter", "SocialTabNavigationChats"), 
    Groups = game:DefineFastString("SocialTabNavigationGroupsCounter", "SocialTabNavigationGroups"), 
    AddFriends = game:DefineFastString("SocialTabNavigationAddFriendsCounter", "SocialTabNavigationAddFriends"), 
    FriendRequests = game:DefineFastString("SocialTabNavigationFriendRequestsCounter", "SocialTabNavigationFriendRequests"), 
    SearchFriends = game:DefineFastString("SocialTabNavigationSearchFriendsCounter", "SocialTabNavigationSearchFriends"), 
    Notifications = game:DefineFastString("SocialTabNavigationNotificationsCounter", "SocialTabNavigationNotifications"), 
    CarouselTitle = game:DefineFastString("SocialTabNavigationCarouselTitleCounter", "SocialTabNavigationCarouselTitle"), 
    FriendsLandingPage = game:DefineFastString("SocialTabNavigationFriendsLandingCounter", "SocialTabNavigationFriendsLanding"), 
    ViewUserProfile = game:DefineFastString("SocialTabLuaViewUserProfileCounter", "SocialTabLuaViewUserProfile")
};
v8.Navigation.LuaProfileTEMP = game:DefineFastString("SocialTabLuaProfileSelfCounter", "SocialTabLuaProfileSelf");
v8.new = function(v9, v10) --[[ Line: 58 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    assert(v10, "SocialTabAnalytics must be passed the ID of the local user");
    local v11 = {
        _diagImpl = v9.Diag, 
        _eventStreamImpl = v9.EventStream, 
        localUserId = v10
    };
    setmetatable(v11, v8);
    return v11;
end;
v8.navigate = function(v12, v13, _) --[[ Line: 71 ]] --[[ Name: navigate ]]
    -- upvalues: v6 (copy), v8 (copy)
    v6:info("navigate to {}", v13);
    local v15 = v8.Navigation[v13];
    if v15 then
        v12._diagImpl:reportCounter(v15, 1);
        return;
    else
        v6:error("Error from navigate: Invalid destination '{}'", v13);
        return;
    end;
end;
v8.buttonClick = function(v16, v17, v18) --[[ Line: 81 ]] --[[ Name: buttonClick ]]
    -- upvalues: v6 (copy), l_llama_0 (copy)
    v6:info("eventName: buttonClick btn: {}{}", v17, v16:_toStringAdditionalArgs(v18));
    v18 = l_llama_0.Dictionary.join(v18 or {}, {
        btn = v17, 
        uid = v16.localUserId
    });
    v16._eventStreamImpl:setRBXEventStream("SocialTab", "buttonClick", v18);
end;
v8._toStringAdditionalArgs = function(_, v20) --[[ Line: 93 ]] --[[ Name: _toStringAdditionalArgs ]]
    -- upvalues: l_tutils_0 (copy)
    if not v20 then
        return "";
    else
        local v21, _ = string.gsub(" args: " .. l_tutils_0.toString(v20), "%s+", " ");
        return v21;
    end;
end;
v8.pageLoaded = function(v23) --[[ Line: 102 ]] --[[ Name: pageLoaded ]]
    -- upvalues: v6 (copy), v8 (copy)
    v6:info("pageLoaded");
    local l_UserLoadedPage_0 = v8.DiagCounters.UserLoadedPage;
    v23._diagImpl:reportCounter(l_UserLoadedPage_0, 1);
end;
v8.userLoadedSocialTab = function(v25) --[[ Line: 108 ]] --[[ Name: userLoadedSocialTab ]]
    -- upvalues: v8 (copy)
    local v26 = {
        uid = v25.localUserId
    };
    v25._eventStreamImpl:setRBXEventStream("roactChat", "userLoadedChat", v26);
    local l_UserLoadedSocialTab_0 = v8.DiagCounters.UserLoadedSocialTab;
    v25._diagImpl:reportCounter(l_UserLoadedSocialTab_0, 1);
end;
v8.openPlayerSearch = function(v28) --[[ Line: 121 ]] --[[ Name: openPlayerSearch ]]
    -- upvalues: l_Sources_0 (copy), l_LocalizationService_0 (copy)
    local v29 = {
        act = "open", 
        source = l_Sources_0.SocialTab, 
        locale = l_LocalizationService_0.RobloxLocaleId
    };
    v28._eventStreamImpl:setRBXEventStream("players", "search", v29);
end;
return v8;