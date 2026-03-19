local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.NavigationContext);
local v4 = v2.PureComponent:extend("SceneView");
v4.render = function(v5) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_screenProps_0 = v5.props.screenProps;
    local l_component_0 = v5.props.component;
    local l_navigation_0 = v5.props.navigation;
    return v2.createElement(v3.Provider, {
        value = l_navigation_0
    }, {
        Scene = v2.createElement(l_component_0, {
            screenProps = l_screenProps_0, 
            navigation = l_navigation_0
        })
    });
end;
return v4;