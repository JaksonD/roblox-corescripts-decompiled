local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local function _(v2, v3) --[[ Line: 6 ]] --[[ Name: isSamePage ]]
    return v2.state.key == v3.key;
end;
local _ = function(v5, v6) --[[ Line: 10 ]] --[[ Name: isInPreviousPages ]]
    for _, v8 in v6 do
        if v5.state.key == v8.key then
            return true;
        end;
    end;
    return false;
end;
return function(v10) --[[ Line: 19 ]] --[[ Name: isAvatarRouteVisible ]]
    local v11 = false;
    local l_avatarRoute_0 = v10.avatarRoute;
    local l_navigation_0 = v10.navigation;
    local l_current_0 = l_avatarRoute_0.current;
    local v15 = l_navigation_0.state.key == l_current_0.key;
    for _, v17 in l_avatarRoute_0.previousPages do
        if l_navigation_0.state.key == v17.key then
            l_current_0 = true;
            v11 = true;
        end;
        if v11 then
            break;
        end;
    end;
    if not v11 then
        l_current_0 = false;
    end;
    v11 = false;
    local l_opaque_0 = l_avatarRoute_0.opaque;
    local v19 = l_navigation_0.state.key == l_opaque_0.key;
    return v15 or l_current_0 or v19;
end;