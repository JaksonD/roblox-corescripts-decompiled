local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_1.routers.StackActions);
local v6 = require(l_Parent_0.StackViewLayout);
local v7 = require(l_Parent_0.Transitioner);
local v8 = require(l_Parent_0.StackViewTransitionConfigs);
local v9 = {
    mode = require(l_Parent_0.StackPresentationStyle).Default
};
local v10 = v4.Component:extend("StackView");
v10.init = function(v11) --[[ Line: 20 ]] --[[ Name: init ]]
    v11._doRender = function(...) --[[ Line: 21 ]]
        -- upvalues: v11 (copy)
        return v11:_render(...);
    end;
    v11._doConfigureTransition = function(...) --[[ Line: 25 ]]
        -- upvalues: v11 (copy)
        return v11:_configureTransition(...);
    end;
    v11._doOnTransitionStart = function(...) --[[ Line: 29 ]]
        -- upvalues: v11 (copy)
        return v11:_onTransitionStart(...);
    end;
    v11._doOnTransitionEnd = function(...) --[[ Line: 33 ]]
        -- upvalues: v11 (copy)
        return v11:_onTransitionEnd(...);
    end;
    v11._doOnTransitionStep = function(...) --[[ Line: 37 ]]
        -- upvalues: v11 (copy)
        return v11:_onTransitionStep(...);
    end;
end;
v10.render = function(v12) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v7 (copy)
    local l_screenProps_0 = v12.props.screenProps;
    local l_navigation_0 = v12.props.navigation;
    local l_descriptors_0 = v12.props.descriptors;
    return v4.createElement(v7, {
        render = v12._doRender, 
        configureTransition = v12._doConfigureTransition, 
        screenProps = l_screenProps_0, 
        navigation = l_navigation_0, 
        descriptors = l_descriptors_0, 
        onTransitionStart = v12._doOnTransitionStart, 
        onTransitionEnd = v12._doOnTransitionEnd, 
        onTransitionStep = v12._doOnTransitionStep
    });
end;
v10.didMount = function(v16) --[[ Line: 61 ]] --[[ Name: didMount ]]
    -- upvalues: v5 (copy)
    local l_navigation_1 = v16.props.navigation;
    if l_navigation_1.state.isTransitioning then
        l_navigation_1.dispatch(v5.completeTransition({
            key = l_navigation_1.state.key
        }));
    end;
end;
v10._render = function(v18, v19, v20) --[[ Line: 70 ]] --[[ Name: _render ]]
    -- upvalues: l_Object_0 (copy), v9 (copy), v4 (copy), v6 (copy)
    local l_screenProps_1 = v18.props.screenProps;
    local v22 = l_Object_0.assign(table.clone(v9), v18.props.navigationConfig);
    local l_descriptors_1 = v18.props.descriptors;
    return v4.createElement(v6, l_Object_0.assign(v22, {
        screenProps = l_screenProps_1, 
        descriptors = l_descriptors_1, 
        transitionProps = v19, 
        lastTransitionProps = v20
    }));
end;
v10._configureTransition = function(v24, v25, v26) --[[ Line: 86 ]] --[[ Name: _configureTransition ]]
    -- upvalues: v8 (copy)
    return v8.getTransitionConfig(v24.props.navigationConfig.transitionConfig, v25, v26, v24.props.navigationConfig.mode).transitionSpec;
end;
v10._onTransitionStart = function(v27, v28, v29) --[[ Line: 95 ]] --[[ Name: _onTransitionStart ]]
    local v30 = v27.props.onTransitionStart or v27.props.navigationConfig.onTransitionStart;
    if v30 and v28.index ~= v29.index then
        v30(v28.navigation, v29.navigation);
    end;
end;
v10._onTransitionEnd = function(v31, v32, v33) --[[ Line: 106 ]] --[[ Name: _onTransitionEnd ]]
    -- upvalues: v5 (copy)
    local l_navigationConfig_0 = v31.props.navigationConfig;
    local l_navigation_2 = v31.props.navigation;
    local v36 = v31.props.onTransitionEnd or l_navigationConfig_0.onTransitionEnd;
    local l_key_0 = v32.scene.route.key;
    local v38 = l_navigation_2.state.routes[l_navigation_2.state.index].key == l_key_0;
    if v32.navigation.state.isTransitioning and v38 then
        l_navigation_2.dispatch(v5.completeTransition({
            key = l_navigation_2.state.key, 
            toChildKey = l_key_0
        }));
    end;
    if v36 and v32.index ~= v33.index then
        v36(v32.navigation, v33.navigation);
    end;
end;
v10._onTransitionStep = function(v39, v40, v41, v42) --[[ Line: 128 ]] --[[ Name: _onTransitionStep ]]
    local v43 = v39.props.onTransitionStep or v39.props.navigationConfig.onTransitionStep;
    if v43 and v40.index ~= v41.index then
        v43(v40.navigation, v41.navigation, v42);
    end;
end;
return v10;