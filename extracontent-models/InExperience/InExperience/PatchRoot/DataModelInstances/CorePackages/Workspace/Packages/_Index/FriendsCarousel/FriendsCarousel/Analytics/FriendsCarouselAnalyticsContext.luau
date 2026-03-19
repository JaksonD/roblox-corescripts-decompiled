local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_Dash_0 = v1.Dash;
return l_Roact_0.createContext({
    fireEvent = l_Dash_0.noop
});