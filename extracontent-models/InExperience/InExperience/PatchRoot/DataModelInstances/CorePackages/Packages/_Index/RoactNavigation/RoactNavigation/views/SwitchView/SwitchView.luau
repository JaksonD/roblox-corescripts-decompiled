local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.Parent.SceneView);
return function(v3) --[[ Line: 8 ]] --[[ Name: SwitchView ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_state_0 = v3.navigation.state;
    local l_key_0 = l_state_0.routes[l_state_0.index].key;
    local v6 = v3.descriptors[l_key_0];
    local v7 = v6.getComponent();
    return v1.createElement(v2, {
        component = v7, 
        navigation = v6.navigation, 
        screenProps = v3.screenProps
    });
end;