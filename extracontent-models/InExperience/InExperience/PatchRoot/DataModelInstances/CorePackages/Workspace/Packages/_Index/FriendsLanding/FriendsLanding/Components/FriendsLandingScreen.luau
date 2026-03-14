local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v3 = require(l_script_FirstAncestor_0.Components.FriendsLandingContainer);
local v4 = l_Roact_0.PureComponent:extend("FriendsLandingScreen");
v4.defaultProps = {
    friends = {}
};
v4.render = function(_) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Roact_0 (copy), v3 (copy)
    return v2.with(function(_) --[[ Line: 14 ]]
        -- upvalues: l_Roact_0 (ref), v3 (ref)
        return l_Roact_0.createElement(v3, {});
    end);
end;
return v4;