return function(v0, v1) --[[ Line: 4 ]]
    local l_state_0 = v0.state;
    local l_router_0 = v0.router;
    local v4 = v0.getChildNavigation(l_state_0.routes[l_state_0.index].key);
    return l_router_0.getScreenOptions(v4, v1);
end;