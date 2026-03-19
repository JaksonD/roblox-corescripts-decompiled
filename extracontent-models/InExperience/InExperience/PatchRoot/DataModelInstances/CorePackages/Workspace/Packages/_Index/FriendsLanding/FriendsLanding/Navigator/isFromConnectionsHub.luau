local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return function(v2) --[[ Line: 7 ]] --[[ Name: getLuaAppsNavigator ]]
    -- upvalues: l_AppPage_0 (copy)
    local v3 = v2._dangerouslyGetParent();
    if v3 then
        local v4 = v3._dangerouslyGetParent();
        if v4 then
            return v4.state.routeName == l_AppPage_0.CoHubMyConnections;
        end;
    end;
    return false;
end;