local l_Parent_0 = script:FindFirstAncestor("FriendsLanding").Parent;
local v1 = require(l_Parent_0.RoactNavigation);
local function _(v2) --[[ Line: 16 ]] --[[ Name: getUpdatedNavigation ]]
    local v3 = v2._dangerouslyGetParent();
    return v3 and v2.state and v2.state.key and v3.getChildNavigation(v2.state.key) or v2;
end;
return function(v5) --[[ Line: 31 ]]
    -- upvalues: v1 (copy)
    local v6 = v5._dangerouslyGetParent();
    local v7 = v6 and v5.state and v5.state.key and v6.getChildNavigation(v5.state.key) or v5;
    return v1.getActiveChildNavigationOptions(v7);
end;