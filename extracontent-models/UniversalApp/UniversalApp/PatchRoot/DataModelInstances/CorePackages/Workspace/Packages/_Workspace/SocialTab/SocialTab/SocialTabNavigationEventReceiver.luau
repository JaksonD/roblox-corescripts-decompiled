local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = l_Roact_0.PureComponent:extend("SocialTabNavigationEventReceiver");
v2.init = function(v3) --[[ Line: 7 ]] --[[ Name: init ]]
    v3.skipDidFocusOnMount = true;
    v3.onDidFocusHandler = function() --[[ Line: 10 ]]
        -- upvalues: v3 (copy)
        if v3.skipDidFocusOnMount then
            v3.skipDidFocusOnMount = false;
        end;
    end;
end;
v2.render = function(v4) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createElement(v4.props.navigationEventReceiver, {
        onDidFocus = v4.onDidFocusHandler
    });
end;
return v2;