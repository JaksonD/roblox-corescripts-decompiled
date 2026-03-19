local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_t_0 = v1.t;
local v5 = l_Roact_0.PureComponent:extend("PageNavigationWatcher");
v5.validateProps = l_t_0.strictInterface({
    desiredPage = l_t_0.string, 
    onNavigateTo = l_t_0.optional(l_t_0.callback), 
    onNavigateAway = l_t_0.optional(l_t_0.callback), 
    currentPage = l_t_0.string, 
    menuOpen = l_t_0.boolean
});
v5.init = function(v6, v7) --[[ Line: 25 ]] --[[ Name: init ]]
    v6:setState({
        lastPage = v7.currentPage, 
        lastMenuOpen = v7.menuOpen
    });
end;
v5.render = function(v8) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createFragment(v8.props[l_Roact_0.Children]);
end;
v5.didUpdate = function(v9) --[[ Line: 36 ]] --[[ Name: didUpdate ]]
    local l_lastPage_0 = v9.state.lastPage;
    local l_lastMenuOpen_0 = v9.state.lastMenuOpen;
    local l_currentPage_0 = v9.props.currentPage;
    local l_menuOpen_0 = v9.props.menuOpen;
    if l_lastPage_0 ~= l_currentPage_0 or l_lastMenuOpen_0 ~= l_menuOpen_0 then
        v9:setState({
            lastPage = l_currentPage_0, 
            lastMenuOpen = l_menuOpen_0
        });
        if l_currentPage_0 == v9.props.desiredPage and l_menuOpen_0 and v9.props.onNavigateTo ~= nil then
            v9.props.onNavigateTo();
            return;
        elseif l_lastPage_0 == v9.props.desiredPage and l_lastMenuOpen_0 and v9.props.onNavigateAway ~= nil then
            v9.props.onNavigateAway();
            return;
        elseif l_lastMenuOpen_0 and not l_menuOpen_0 and v9.props.onNavigateAway ~= nil then
            v9.props.onNavigateAway();
        end;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v14) --[[ Line: 58 ]]
    return {
        currentPage = v14.menuPage, 
        menuOpen = v14.isMenuOpen
    };
end)(v5);