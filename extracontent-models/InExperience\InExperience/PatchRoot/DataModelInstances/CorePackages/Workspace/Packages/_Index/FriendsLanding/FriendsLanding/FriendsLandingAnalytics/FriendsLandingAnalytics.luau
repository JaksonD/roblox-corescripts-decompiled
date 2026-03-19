local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_llama_0 = v2.llama;
local l_tutils_0 = v2.tutils;
local v7 = require(script.Parent.ButtonClickEvents);
local v8 = require(script.Parent.ImpressionEvents);
local v9 = require(script.Parent.NavigatedFromPagesEnum);
local v10 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local v11 = require(script.Parent.Logger);
local v12 = {};
v12.__index = v12;
v12.DiagCounters = {
    UserLoadedPage = game:DefineFastString("FriendsLandingUserLoadedPageCounter", "FriendsLandingUserLoadedPage"), 
    ShowMoreButtonPressedFriends = game:DefineFastString("ShowMoreButtonPressedFriends", "ShowMoreButtonPressedFriends"), 
    ShowMoreButtonPressedFriendRequests = game:DefineFastString("ShowMoreButtonPressedFriendRequests", "ShowMoreButtonPressedFriendRequests")
};
v12.Navigation = {
    [v3.AddFriends] = game:DefineFastString("FriendsLandingNavigationAddFriendsCounter", "FriendsLandingNavigationAddFriends"), 
    [v3.ViewUserProfile] = game:DefineFastString("FriendsLandingNavigationViewUserProfileCounter", "FriendsLandingNavigationViewUserProfile"), 
    [v3.GameDetailsPeekView] = game:DefineFastString("FriendsLandingNavigationGameDetailsPeekViewCounter", "FriendsLandingNavigationGameDetailsPeekView"), 
    [v3.SearchFriends] = game:DefineFastString("FriendsLandingSearchFriendsCounter", "FriendsLandingSearchFriends")
};
v12.Navigation[l_AppPage_0.Home] = game:DefineFastString("AddFriendsHomeEntryCounter", "AddFriendsHomeEntry");
v12.Navigation.ViewUserProfileAddFriends = game:DefineFastString("FriendsLandingViewUserProfileAddFriendsCounter", "FriendsLandingViewUserProfileAddFriends");
v12.Navigation.ConnectWithFriends = game:DefineFastString("AddFriendsConnectWithFriendsCounter", "AddFriendsConnectWithFriends");
v12.DiagStats = {
    LoadingPageTime = game:DefineFastString("FriendsLandingLoadingPageTimeStats", "FriendsLandingLoadingPageTime"), 
    MountingPageTime = game:DefineFastString("FriendsLandingMountingPageTimeStats", "FriendsLandingMountingPageTime")
};
v12.BASE_CONTEXT = "friendsLanding";
v12.new = function(v13, v14, v15) --[[ Line: 71 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    assert(v14, "FriendsLanding must be passed the ID of the local user");
    local v16 = {
        _diagImpl = v13.Diag, 
        _eventStreamImpl = v13.EventStream, 
        localUserId = v14, 
        _getLoadingTimeInfo = v15, 
        _reportedPagePerformanceOnce = {}
    };
    setmetatable(v16, v12);
    return v16;
end;
v12.navigate = function(v17, v18) --[[ Line: 87 ]] --[[ Name: navigate ]]
    -- upvalues: v11 (copy), v12 (copy)
    v11:info("navigate to {}", v18);
    local v19 = v12.Navigation[v18];
    if v19 then
        v17._diagImpl:reportCounter(v19, 1);
        return;
    else
        v11:error("Error from navigate: Invalid destination '{}'", v18);
        return;
    end;
end;
v12.buttonClick = function(v20, v21, v22) --[[ Line: 97 ]] --[[ Name: buttonClick ]]
    -- upvalues: v7 (copy), v11 (copy), l_llama_0 (copy), v10 (copy), v12 (copy)
    assert(v7.isEnumValue(v21), "invalid button name used");
    v11:info("eventName: buttonClick btn: {}{}", v21, v20:_toStringAdditionalArgs(v22));
    local l_BASE_CONTEXT_0 = v20.BASE_CONTEXT;
    if v22 and v22.contextOverride then
        l_BASE_CONTEXT_0 = v22.contextOverride;
    end;
    v22 = l_llama_0.Dictionary.join(v22 or {}, {
        btn = v21:rawValue(), 
        uid = v20.localUserId, 
        contextOverride = l_llama_0.None
    });
    v20._eventStreamImpl:setRBXEventStream(l_BASE_CONTEXT_0, "buttonClick", v22);
    local v24 = nil;
    if v21 == v7.LoadMoreUsers then
        if v22.sectionType == v10.FriendRequests then
            v24 = v12.DiagCounters.ShowMoreButtonPressedFriendRequests;
        elseif v22.sectionType == v10.Friends then
            v24 = v12.DiagCounters.ShowMoreButtonPressedFriends;
        end;
    end;
    if v24 then
        v20._diagImpl:reportCounter(v24, 1);
    end;
end;
v12._toStringAdditionalArgs = function(_, v26) --[[ Line: 127 ]] --[[ Name: _toStringAdditionalArgs ]]
    -- upvalues: l_tutils_0 (copy)
    if not v26 then
        return "";
    else
        local v27, _ = string.gsub(" args: " .. l_tutils_0.toString(v26), "%s+", " ");
        return v27;
    end;
end;
v12.pageLoaded = function(v29) --[[ Line: 136 ]] --[[ Name: pageLoaded ]]
    -- upvalues: v11 (copy), v12 (copy)
    v11:info("pageLoaded");
    local l_UserLoadedPage_0 = v12.DiagCounters.UserLoadedPage;
    v29._diagImpl:reportCounter(l_UserLoadedPage_0, 1);
end;
v12.pageLoadedWithArgs = function(v31, v32, v33) --[[ Line: 142 ]] --[[ Name: pageLoadedWithArgs ]]
    v31._eventStreamImpl:setRBXEventStream(v32 or v31.BASE_CONTEXT, "luaPageLoad", v33);
end;
v12._pagePerformanceReport = function(v34, v35, v36, v37) --[[ Line: 147 ]] --[[ Name: _pagePerformanceReport ]]
    -- upvalues: v9 (copy), v11 (copy)
    local v38 = v37 or os.clock();
    local v39 = v34._getLoadingTimeInfo and v34._getLoadingTimeInfo() or {};
    local l_startPage_0 = v39.startPage;
    local l_startTime_0 = v39.startTime;
    if not v9.fromRawValue(l_startPage_0) or type(l_startTime_0) ~= "number" then
        v11:warning("Cannot report loading time: incorrect startPage or startTime");
        return;
    else
        local v42 = (v38 - l_startTime_0) * 1000;
        local v43 = v9[l_startPage_0].rawValue();
        local v44 = v35 .. "_" .. v43;
        local v45 = {
            startPage = v43, 
            loadingTime = v42, 
            uid = v34.localUserId
        };
        v11:info("pageLoaded in " .. v42 .. "ms");
        v34._diagImpl:reportStats(v44, v42);
        v34._eventStreamImpl:setRBXEventStream(v34.BASE_CONTEXT, v36, v45);
        return;
    end;
end;
v12._reportPagePerformanceOnceCheck = function(v46, v47) --[[ Line: 173 ]] --[[ Name: _reportPagePerformanceOnceCheck ]]
    if v46._reportedPagePerformanceOnce[v47] then
        return true;
    else
        v46._reportedPagePerformanceOnce[v47] = true;
        return false;
    end;
end;
v12.pageMountingTimeReport = function(v48, v49) --[[ Line: 181 ]] --[[ Name: pageMountingTimeReport ]]
    -- upvalues: v12 (copy)
    if v48:_reportPagePerformanceOnceCheck("pageMountingTime") then
        return;
    else
        v48:_pagePerformanceReport(v12.DiagStats.MountingPageTime, "pageMountingTime", v49);
        return;
    end;
end;
v12.pageLoadingTimeReport = function(v50, v51) --[[ Line: 189 ]] --[[ Name: pageLoadingTimeReport ]]
    -- upvalues: v12 (copy)
    if v50:_reportPagePerformanceOnceCheck("pageLoadingTime") then
        return;
    else
        v50:_pagePerformanceReport(v12.DiagStats.LoadingPageTime, "pageLoadingTime", v51);
        return;
    end;
end;
v12.reportAddFriendsEntrypoint = function(v52, v53, v54) --[[ Line: 197 ]] --[[ Name: reportAddFriendsEntrypoint ]]
    -- upvalues: v12 (copy), l_AppPage_0 (copy)
    assert(v12.Navigation[v53] ~= nil, "invalid screen");
    if v53 == l_AppPage_0.Home then
        v52._eventStreamImpl:setRBXEventStream("addUniversalFriends", "buttonClick", {
            btn = "LegacyAddFriendsButton", 
            absolutePosition = 1, 
            showContactImporterModal = if v54 then v54.showContactImporterModal else nil
        });
    end;
    v52._diagImpl:reportCounter(v12.Navigation[v53], 1);
end;
v12.impressionEvent = function(v55, v56, v57) --[[ Line: 209 ]] --[[ Name: impressionEvent ]]
    -- upvalues: v8 (copy)
    assert(v8.isEnumValue(v56), "invalid impression name used");
    v55._eventStreamImpl:setRBXEventStream("addUniversalFriends", v56:rawValue(), v57);
    v55._diagImpl:reportCounter(v56:rawValue(), 1);
end;
return v12;