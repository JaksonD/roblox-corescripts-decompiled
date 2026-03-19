local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleService");
local v1 = {};
local v2 = {};
local l_GetFFlagPeoplePageEnablePersonSignalStore_0 = require(l_script_FirstAncestor_0.Flags).GetFFlagPeoplePageEnablePersonSignalStore;
local function v6(v4) --[[ Line: 19 ]] --[[ Name: loadService ]]
    -- upvalues: l_GetFFlagPeoplePageEnablePersonSignalStore_0 (copy), v2 (ref)
    local v5 = nil;
    if v4 == "PeopleUtility" then
        v5 = require(script.Parent.PeopleUtility);
    elseif v4 == "PeopleListStore" then
        v5 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then require(script.Parent.PeopleListStore)() else require(script.Parent.PeopleListStore);
    elseif v4 == "PeopleAnalyticsManager" then
        v5 = require(script.Parent.Analytics.PeopleAnalyticsManager);
    elseif v4 == "SettingsHubService" then
        v5 = require(script.Parent.Integration.SettingsHubService);
    elseif v4 == "PeopleVoiceChatStore" then
        v5 = require(script.Parent.ButtonStores.PeopleVoiceChatStore);
    elseif v4 == "PeopleBlockStatusStore" then
        v5 = require(script.Parent.ButtonStores.PeopleBlockStatusStore);
    elseif v4 == "FriendStatusStore" then
        v5 = require(script.Parent.ButtonStores.FriendStatusStore);
    elseif v4 == "PeopleReportAbuseMenu" then
        v5 = require(script.Parent.Integration.PeopleReportAbuseMenu);
    elseif v4 == "PeopleBlockingModalManager" then
        v5 = require(script.Parent.Integration.PeopleBlockingModalManager);
    elseif v4 == "Flags" then
        v5 = require(script.Parent.Flags);
    elseif v4 == "Constants" then
        v5 = require(script.Parent.Constants);
    elseif v4 == "FocusNavigationService" then
        v5 = require(script.Parent.FocusNavigationService);
    else
        error("Unknown service: " .. v4);
    end;
    v2[v4] = v5;
    return v5;
end;
v1.register = function(v7, v8) --[[ Line: 58 ]] --[[ Name: register ]]
    -- upvalues: v2 (ref)
    v2[v7] = v8;
end;
v1.get = function(v9) --[[ Line: 62 ]] --[[ Name: get ]]
    -- upvalues: v2 (ref), v6 (copy)
    if not v2[v9] then
        v6(v9);
    end;
    return v2[v9];
end;
v1.has = function(v10) --[[ Line: 69 ]] --[[ Name: has ]]
    -- upvalues: v2 (ref)
    return v2[v10] ~= nil;
end;
v1.clear = function() --[[ Line: 73 ]] --[[ Name: clear ]]
    -- upvalues: v2 (ref)
    v2 = {};
end;
return v1;