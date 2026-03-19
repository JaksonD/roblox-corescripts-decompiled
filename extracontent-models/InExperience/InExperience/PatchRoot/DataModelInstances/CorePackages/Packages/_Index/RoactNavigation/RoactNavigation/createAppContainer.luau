local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.LuauPolyfill);
local l_console_0 = v3.console;
local l_Object_0 = v3.Object;
local v6 = require(l_Parent_0.NavigationActions);
local v7 = require(l_Parent_0.Events);
local v8 = require(l_Parent_0.views.NavigationContext);
local v9 = require(l_Parent_0.getNavigation);
local l_assert_0 = assert;
local l_urlToPathAndParams_0 = require(l_Parent_0.routers.pathUtils).urlToPathAndParams;
local function _(v12) --[[ Line: 20 ]] --[[ Name: isStateful ]]
    return not v12.navigation;
end;
local function v18(v14) --[[ Line: 24 ]] --[[ Name: validateProps ]]
    -- upvalues: l_Object_0 (copy), l_assert_0 (copy)
    if v14.persistenceKey then
        warn("You passed persistenceKey prop to a navigator. The persistenceKey prop was replaced by a more flexible persistence mechanism, please see the navigation state persistence docs for more information. Passing the persistenceKey prop is a no-op.");
    end;
    if not v14.navigation then
        return;
    else
        local v15 = l_Object_0.assign(table.clone(v14), {
            navigation = l_Object_0.None, 
            screenProps = l_Object_0.None, 
            persistNavigationState = l_Object_0.None, 
            loadNavigationState = l_Object_0.None, 
            externalDispatchConnector = l_Object_0.None
        });
        if next(v15) ~= nil then
            error("This navigator has both navigation and container props, so it is " .. ("unclear if it should own its own state. Remove props: %q "):format(table.concat(l_Object_0.keys(v15), ", ")) .. "if the navigator should get its state from the navigation prop. If the " .. "navigator should maintain its own state, do not pass a navigation prop.");
        end;
        local l_persistNavigationState_0 = v14.persistNavigationState;
        local l_loadNavigationState_0 = v14.loadNavigationState;
        l_assert_0(l_persistNavigationState_0 == nil and l_loadNavigationState_0 == nil or type(l_persistNavigationState_0) == "function" and type(l_loadNavigationState_0) == "function", "both persistNavigationState and loadNavigationState must either be undefined, or be functions");
        return;
    end;
end;
local v19 = 0;
local function v20() --[[ Line: 72 ]] --[[ Name: _TESTING_ONLY_reset_container_count ]]
    -- upvalues: v19 (ref)
    v19 = 0;
end;
return {
    createAppContainer = function(v21, v22) --[[ Line: 117 ]] --[[ Name: createAppContainer ]]
        -- upvalues: l_assert_0 (copy), v2 (copy), v18 (copy), v6 (copy), l_urlToPathAndParams_0 (copy), l_console_0 (copy), v19 (ref), v7 (copy), v9 (copy), v8 (copy), l_Object_0 (copy)
        local v23 = false;
        if type(v21) == "table" then
            v23 = v21.router ~= nil;
        end;
        l_assert_0(v23, "AppComponent must be a navigator or a stateful Roact component with a 'router' field");
        local v24 = string.format("NavigationContainer(%s)", (tostring(v21)));
        v23 = v2.Component:extend(v24);
        v23.router = v21.router;
        v23.getDerivedStateFromProps = function(v25) --[[ Line: 128 ]] --[[ Name: getDerivedStateFromProps ]]
            -- upvalues: v18 (ref)
            v18(v25);
            return nil;
        end;
        v23.init = function(v26) --[[ Line: 133 ]] --[[ Name: init ]]
            -- upvalues: v18 (ref), v6 (ref), v21 (copy)
            v18(v26.props);
            v26._actionEventSubscribers = {};
            v26._initialAction = v6.init();
            local v27 = nil;
            if v26:_isStateful() and not v26.props.loadNavigationState then
                v27 = v21.router.getStateForAction(v26._initialAction);
            end;
            v26.state = {
                nav = v27
            };
        end;
        v23._updateExternalDispatchConnector = function(v28) --[[ Line: 155 ]] --[[ Name: _updateExternalDispatchConnector ]]
            if v28._disconnectExternalDispatch then
                v28._disconnectExternalDispatch();
                v28._disconnectExternalDispatch = nil;
            end;
            local l_externalDispatchConnector_0 = v28.props.externalDispatchConnector;
            if l_externalDispatchConnector_0 ~= nil then
                v28._disconnectExternalDispatch = l_externalDispatchConnector_0(function(...) --[[ Line: 163 ]]
                    -- upvalues: v28 (copy)
                    if v28._isMounted then
                        return v28:dispatch(...);
                    else
                        return false;
                    end;
                end);
            end;
        end;
        v23._renderLoading = function(v30) --[[ Line: 174 ]] --[[ Name: _renderLoading ]]
            return v30.props.renderLoading and v30.props.renderLoading();
        end;
        v23._isStateful = function(v31) --[[ Line: 178 ]] --[[ Name: _isStateful ]]
            return not v31.props.navigation;
        end;
        v23._handleOpenURL = function(v32, v33) --[[ Line: 182 ]] --[[ Name: _handleOpenURL ]]
            -- upvalues: l_urlToPathAndParams_0 (ref), v21 (copy)
            local l_url_0 = v33.url;
            local l_enableURLHandling_0 = v32.props.enableURLHandling;
            local l_uriPrefix_0 = v32.props.uriPrefix;
            if l_enableURLHandling_0 == false then
                return;
            else
                local v37 = l_urlToPathAndParams_0(l_url_0, l_uriPrefix_0);
                if v37 then
                    local l_path_0 = v37.path;
                    local l_params_0 = v37.params;
                    local v40 = v21.router.getActionForPathAndParams(l_path_0, l_params_0);
                    if v40 then
                        v32:dispatch(v40);
                    end;
                end;
                return;
            end;
        end;
        v23._onNavigationStateChange = function(v41, v42, v43, v44) --[[ Line: 201 ]] --[[ Name: _onNavigationStateChange ]]
            -- upvalues: l_console_0 (ref)
            local l_onNavigationStateChange_0 = v41.props.onNavigationStateChange;
            if l_onNavigationStateChange_0 == nil and v41:_isStateful() and _G.REACT_NAV_LOGGING then
                l_console_0.group("Navigation Dispatch: ");
                l_console_0.log("Action: ", v44);
                l_console_0.log("New State: ", v43);
                l_console_0.log("Last State: ", v42);
                l_console_0.groupEnd();
                return;
            else
                if type(l_onNavigationStateChange_0) == "function" then
                    l_onNavigationStateChange_0(v42, v43, v44);
                end;
                return;
            end;
        end;
        v23.didUpdate = function(v46, v47) --[[ Line: 218 ]] --[[ Name: didUpdate ]]
            if v46._navState == v46.state.nav then
                v46._navState = nil;
            end;
            if v46.props.externalDispatchConnector ~= v47.externalDispatchConnector then
                v46:_updateExternalDispatchConnector();
            end;
        end;
        v23.didMount = function(v48) --[[ Line: 231 ]] --[[ Name: didMount ]]
            -- upvalues: v19 (ref), l_console_0 (ref), v22 (copy), v21 (copy), v7 (ref)
            v48._isMounted = true;
            v48:_updateExternalDispatchConnector();
            if not v48:_isStateful() then
                return;
            else
                if _G.__DEV__ and not v48.props.detached and v19 > 0 then
                    l_console_0.warn("You should only render one navigator explicitly in your app, and other navigators should be rendered by including them in that navigator. Full details at: https://reactnavigation.org/docs/4.x/common-mistakes#explicitly-rendering-more-than-one-navigator");
                end;
                v19 = v19 + 1;
                if v22 then
                    v22:listenForLuaURLs(function(v49) --[[ Line: 256 ]]
                        -- upvalues: v48 (copy)
                        v48:_handleOpenURL({
                            url = v49
                        });
                    end, false);
                end;
                local v50 = nil;
                local v51 = nil;
                if v48.props.enableURLHandling ~= false then
                    local v52 = v48:getStartupParams();
                    v50 = v52.parsedUrl;
                    v51 = v52.userProvidedStartupState;
                end;
                local l__initialAction_0 = v48._initialAction;
                local v54 = v48.state.nav or v21.router.getStateForAction(l__initialAction_0);
                if v51 then
                    v54 = v51;
                end;
                if v50 then
                    local l_path_1 = v50.path;
                    local l_params_1 = v50.params;
                    local v57 = v21.router.getActionForPathAndParams(l_path_1, l_params_1);
                    if v57 then
                        l__initialAction_0 = v57;
                        v54 = v21.router.getStateForAction(v57, v54);
                    end;
                end;
                local function v59() --[[ Line: 300 ]] --[[ Name: dispatchAction ]]
                    -- upvalues: v48 (copy), v7 (ref), l__initialAction_0 (ref)
                    for v58 in v48._actionEventSubscribers do
                        v58({
                            type = v7.Action, 
                            action = l__initialAction_0, 
                            state = v48.state.nav, 
                            lastState = nil
                        });
                    end;
                end;
                if v54 == v48.state.nav then
                    spawn(v59);
                    return;
                else
                    v48:setState({
                        nav = v54
                    }, v59);
                    return;
                end;
            end;
        end;
        v23.getStartupParams = function(v60) --[[ Line: 326 ]] --[[ Name: getStartupParams ]]
            -- upvalues: v22 (copy), l_urlToPathAndParams_0 (ref)
            local l_props_0 = v60.props;
            local l_uriPrefix_1 = l_props_0.uriPrefix;
            local l_loadNavigationState_1 = l_props_0.loadNavigationState;
            local v64 = nil;
            local v65 = nil;
            if v22 then
                pcall(function() --[[ Line: 334 ]]
                    -- upvalues: v64 (ref), v22 (ref)
                    v64 = v22:getLastLuaURL();
                end);
            end;
            if l_loadNavigationState_1 then
                pcall(function() --[[ Line: 340 ]]
                    -- upvalues: v65 (ref), l_loadNavigationState_1 (copy)
                    v65 = l_loadNavigationState_1();
                end);
            end;
            return {
                parsedUrl = v64 and l_urlToPathAndParams_0(v64, l_uriPrefix_1), 
                userProvidedStartupState = v65
            };
        end;
        v23._persistNavigationState = function(v66, v67) --[[ Line: 353 ]] --[[ Name: _persistNavigationState ]]
            local l_persistNavigationState_1 = v66.props.persistNavigationState;
            if l_persistNavigationState_1 then
                local l_status_0, l_result_0 = pcall(l_persistNavigationState_1, v67);
                if not l_status_0 then
                    warn("Uncaught error while calling persistNavigationState()! " .. "You should handle exceptions thrown from persistNavigationState(), " .. "ignoring them may result in undefined behavior.\n" .. l_result_0);
                end;
            end;
        end;
        v23.willUnmount = function(v71) --[[ Line: 369 ]] --[[ Name: willUnmount ]]
            -- upvalues: v22 (copy), v19 (ref)
            v71._isMounted = false;
            if v22 then
                v22:stopListeningForLuaURLs();
            end;
            if v71._disconnectExternalDispatch then
                v71._disconnectExternalDispatch();
                v71._disconnectExternalDispatch = nil;
            end;
            if v71:_isStateful() then
                v19 = v19 - 1;
            end;
        end;
        v23.dispatch = function(v72, v73) --[[ Line: 395 ]] --[[ Name: dispatch ]]
            -- upvalues: l_assert_0 (ref), v21 (copy), v7 (ref)
            if v72.props.navigation then
                return v72.props.navigation.dispatch(v73);
            else
                v72._navState = v72._navState or v72.state.nav;
                local l__navState_0 = v72._navState;
                l_assert_0(l__navState_0 ~= nil, "should be set in constructor if stateful");
                local v75 = v21.router.getStateForAction(v73, l__navState_0);
                local l_v75_0 = v75;
                if v75 == nil then
                    l_v75_0 = l__navState_0;
                end;
                local function v78() --[[ Line: 411 ]] --[[ Name: dispatchActionEvents ]]
                    -- upvalues: v72 (copy), v7 (ref), v73 (copy), l_v75_0 (ref), l__navState_0 (copy)
                    for v77 in v72._actionEventSubscribers do
                        v77({
                            type = v7.Action, 
                            action = v73, 
                            state = l_v75_0, 
                            lastState = l__navState_0
                        });
                    end;
                end;
                if v75 == nil then
                    v78();
                    return true;
                elseif l_v75_0 ~= l__navState_0 then
                    v72._navState = l_v75_0;
                    v72:setState({
                        nav = l_v75_0
                    }, function() --[[ Line: 436 ]]
                        -- upvalues: v72 (copy), l__navState_0 (copy), l_v75_0 (ref), v73 (copy), v78 (copy)
                        v72:_onNavigationStateChange(l__navState_0, l_v75_0, v73);
                        task.defer(v78);
                        v72:_persistNavigationState(l_v75_0);
                    end);
                    return true;
                else
                    v78();
                    return false;
                end;
            end;
        end;
        v23._getScreenProps = function(v79, v80, v81) --[[ Line: 450 ]] --[[ Name: _getScreenProps ]]
            if v80 == nil then
                return v79.props.screenProps;
            else
                local l_screenProps_0 = v79.props.screenProps;
                if l_screenProps_0 == nil or l_screenProps_0[v80] == nil then
                    return v81;
                else
                    return l_screenProps_0[v80];
                end;
            end;
        end;
        v23.render = function(v83) --[[ Line: 465 ]] --[[ Name: render ]]
            -- upvalues: v9 (ref), v21 (copy), l_assert_0 (ref), v2 (ref), v8 (ref), l_Object_0 (ref)
            local l_navigation_0 = v83.props.navigation;
            if v83:_isStateful() then
                local l_nav_0 = v83.state.nav;
                if not l_nav_0 then
                    return v83:_renderLoading();
                else
                    if not v83._navigation or v83._navigation.state ~= l_nav_0 then
                        v83._navigation = v9(v21.router, l_nav_0, function(...) --[[ Line: 478 ]]
                            -- upvalues: v83 (copy)
                            return v83:dispatch(...);
                        end, v83._actionEventSubscribers, function(...) --[[ Line: 482 ]]
                            -- upvalues: v83 (copy)
                            return v83:_getScreenProps(...);
                        end, function() --[[ Line: 485 ]]
                            -- upvalues: v83 (copy)
                            return v83._navigation;
                        end);
                    end;
                    l_navigation_0 = v83._navigation;
                end;
            end;
            l_assert_0(l_navigation_0 ~= nil, "failed to get navigation");
            return v2.createElement(v8.Provider, {
                value = l_navigation_0
            }, {
                AppComponent = v2.createElement(v21, l_Object_0.assign(table.clone(v83.props), {
                    navigation = l_navigation_0
                }))
            });
        end;
        return v23;
    end, 
    _TESTING_ONLY_reset_container_count = v20
};