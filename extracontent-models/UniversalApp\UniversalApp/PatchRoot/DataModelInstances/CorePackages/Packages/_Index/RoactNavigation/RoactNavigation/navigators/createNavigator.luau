local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_Array_0 = v3.Array;
local v6 = require(l_Parent_0.utils.invariant);
local v7 = require(l_Parent_0.views.NavigationFocusEvents);
return function(v8, v9, v10) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v6 (copy), l_Array_0 (copy), l_Object_0 (copy), v7 (copy)
    local v11 = v2.Component:extend("Navigator");
    v11.router = v9;
    v11.navigationOptions = v10.navigationOptions;
    v11.init = function(v12) --[[ Line: 20 ]] --[[ Name: init ]]
        local l_screenProps_0 = v12.props.screenProps;
        v12.state = {
            descriptors = {}, 
            transitioningDescriptors = {}, 
            screenProps = l_screenProps_0
        };
    end;
    v11.getDerivedStateFromProps = function(v14, v15) --[[ Line: 32 ]] --[[ Name: getDerivedStateFromProps ]]
        -- upvalues: v6 (ref), l_Array_0 (ref), v9 (copy), l_Object_0 (ref)
        local l_descriptors_0 = v15.descriptors;
        local l_transitioningDescriptors_0 = v15.transitioningDescriptors;
        local l_navigation_0 = v14.navigation;
        local l_screenProps_1 = v14.screenProps;
        v6(l_navigation_0 ~= nil, "The navigation prop is missing for this navigator. In react-navigation v3 and v4 you must set up your app container directly. More info: https://reactnavigation.org/docs/en/app-containers.html");
        local l_routes_0 = l_navigation_0.state.routes;
        v6(type(l_routes_0) == "table", "No \"routes\" found in navigation state. Did you try to pass the navigation prop of a React component to a Navigator child? See https://reactnavigation.org/docs/en/custom-navigators.html#navigator-navigation-prop");
        local v26 = l_Array_0.reduce(l_routes_0, function(v21, v22) --[[ Line: 55 ]]
            -- upvalues: l_descriptors_0 (copy), l_screenProps_1 (copy), v15 (copy), v9 (ref), l_navigation_0 (copy)
            if l_descriptors_0 and l_descriptors_0[v22.key] and v22 == l_descriptors_0[v22.key].state and l_screenProps_1 == v15.screenProps then
                v21[v22.key] = l_descriptors_0[v22.key];
                return v21;
            else
                local function v23() --[[ Line: 65 ]]
                    -- upvalues: v9 (ref), v22 (copy)
                    return v9.getComponentForRouteName(v22.routeName);
                end;
                local v24 = l_navigation_0.getChildNavigation(v22.key);
                local v25 = v9.getScreenOptions(v24, l_screenProps_1);
                v21[v22.key] = {
                    key = v22.key, 
                    getComponent = v23, 
                    options = v25, 
                    state = v22, 
                    navigation = v24
                };
                return v21;
            end;
        end, {});
        local v27 = {};
        if l_navigation_0.state.isTransitioning then
            v27 = l_Object_0.assign({}, l_transitioningDescriptors_0, l_descriptors_0, l_Array_0.reduce(l_routes_0, function(v28, v29) --[[ Line: 92 ]]
                -- upvalues: l_Object_0 (ref)
                v28[v29.key] = l_Object_0.None;
                return v28;
            end, {}));
        end;
        return {
            descriptors = v26, 
            transitioningDescriptors = v27, 
            screenProps = l_screenProps_1
        };
    end;
    v11.render = function(v30) --[[ Line: 111 ]] --[[ Name: render ]]
        -- upvalues: v2 (ref), v7 (ref), v8 (copy), l_Object_0 (ref), v10 (copy)
        local l_navigation_1 = v30.props.navigation;
        local l_screenProps_2 = v30.state.screenProps;
        local l_descriptors_1 = v30.state.descriptors;
        local l_transitioningDescriptors_1 = v30.state.transitioningDescriptors;
        return v2.createElement(v2.Fragment, {}, {
            Events = v2.createElement(v7, {
                navigation = l_navigation_1, 
                onEvent = function(v35, v36, v37) --[[ Line: 121 ]] --[[ Name: onEvent ]]
                    -- upvalues: l_descriptors_1 (copy), l_transitioningDescriptors_1 (copy)
                    if l_descriptors_1[v35] then
                        l_descriptors_1[v35].navigation.emit(v36, v37);
                        return;
                    else
                        if l_transitioningDescriptors_1[v35] then
                            l_transitioningDescriptors_1[v35].navigation.emit(v36, v37);
                        end;
                        return;
                    end;
                end
            }), 
            View = v2.createElement(v8, l_Object_0.assign(table.clone(v30.props), {
                screenProps = l_screenProps_2, 
                navigation = l_navigation_1, 
                navigationConfig = v10, 
                descriptors = l_descriptors_1
            }))
        });
    end;
    return v11;
end;