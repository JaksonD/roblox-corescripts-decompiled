local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local v2 = require(l_Modules_0.LuaApp.Analytics.Events.nsOpenCTAShown);
local v3 = require(l_Modules_0.LuaApp.Analytics.Events.nsOpenContent);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.buttonClick);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
return {
    get = function(v6) --[[ Line: 16 ]] --[[ Name: get ]]
        -- upvalues: v5 (copy), v1 (copy), v4 (copy), v3 (copy), v2 (copy)
        local v7 = v5.get(v6);
        local v8 = {};
        local function _(v9, v10, v11) --[[ Line: 21 ]]
            -- upvalues: v1 (ref), v7 (copy)
            v1(v7.EventStream, v9, v10, v11);
        end;
        v8.reportSearchButtonClick = function(v13) --[[ Line: 25 ]] --[[ Name: reportSearchButtonClick ]]
            -- upvalues: v4 (ref), v7 (copy)
            v4(v7.EventStream, v13, "search");
        end;
        v8.reportSearchFocused = function(v14) --[[ Line: 29 ]] --[[ Name: reportSearchFocused ]]
            -- upvalues: v1 (ref), v7 (copy)
            v1(v7.EventStream, v14, "open", nil);
        end;
        v8.reportSearched = function(v15, v16) --[[ Line: 33 ]] --[[ Name: reportSearched ]]
            -- upvalues: v1 (ref), v7 (copy)
            v1(v7.EventStream, v15, "search", v16);
        end;
        v8.reportSearchCanceled = function(v17) --[[ Line: 37 ]] --[[ Name: reportSearchCanceled ]]
            -- upvalues: v1 (ref), v7 (copy)
            v1(v7.EventStream, v17, "cancel", nil);
        end;
        v8.reportNSButtonTouch = function(v18) --[[ Line: 41 ]] --[[ Name: reportNSButtonTouch ]]
            -- upvalues: v3 (ref), v7 (copy)
            v3(v7.EventStream, "touch", v18);
        end;
        v8.reportNSOpenCTAShown = function(v19) --[[ Line: 45 ]] --[[ Name: reportNSOpenCTAShown ]]
            -- upvalues: v2 (ref), v7 (copy)
            v2(v7.EventStream, "seen", v19);
        end;
        v8.reportRobuxButtonClick = function(v20) --[[ Line: 49 ]] --[[ Name: reportRobuxButtonClick ]]
            -- upvalues: v4 (ref), v7 (copy)
            v4(v7.EventStream, v20, "robux");
        end;
        v8.reportBackButtonClick = function(v21) --[[ Line: 53 ]] --[[ Name: reportBackButtonClick ]]
            -- upvalues: v4 (ref), v7 (copy)
            v4(v7.EventStream, v21, "back");
        end;
        v8.reportAddFriendsButtonClick = function(v22) --[[ Line: 57 ]] --[[ Name: reportAddFriendsButtonClick ]]
            -- upvalues: v4 (ref), v7 (copy)
            v4(v7.EventStream, v22, "addFriends");
        end;
        return v8;
    end
};