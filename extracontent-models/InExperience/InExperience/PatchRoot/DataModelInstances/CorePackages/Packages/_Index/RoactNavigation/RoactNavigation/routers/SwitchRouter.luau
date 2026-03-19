local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_0.NavigationActions);
local v6 = require(l_Parent_0.BackBehavior);
local v7 = require(script.Parent.getScreenForRouteName);
local v8 = require(script.Parent.createConfigGetter);
local v9 = require(script.Parent.validateRouteConfigMap);
local v10 = require(script.Parent.validateRouteConfigArray);
local v11 = require(l_Parent_0.utils.invariant);
local v12 = require(l_Parent_0.routers.StackActions);
local v13 = require(script.Parent.SwitchActions);
local l_createPathParser_0 = require(script.Parent.pathUtils).createPathParser;
local function v15() --[[ Line: 20 ]] --[[ Name: defaultActionCreators ]]
    return {};
end;
local function v17(v16) --[[ Line: 24 ]] --[[ Name: mapToRouteName ]]
    return (next(v16));
end;
local function v22(v18, v19) --[[ Line: 29 ]] --[[ Name: foldToRoutes ]]
    local v20, v21 = next(v19);
    v18[v20] = v21;
    return v18;
end;
return function(v23, v24) --[[ Line: 35 ]]
    -- upvalues: v10 (copy), v9 (copy), l_Array_0 (copy), v22 (copy), v17 (copy), v15 (copy), v6 (copy), v7 (copy), l_Object_0 (copy), l_createPathParser_0 (copy), v5 (copy), v8 (copy), v13 (copy), v12 (copy), v11 (copy)
    v10(v23);
    v24 = v24 or {};
    local v25 = v9(l_Array_0.reduce(v23, v22, {}));
    local v26 = v24.order or l_Array_0.map(v23, v17);
    local v27 = v24.getCustomActionCreators or v15;
    local l_initialRouteParams_0 = v24.initialRouteParams;
    local v29 = v24.initialRouteName or v26[1];
    local v30 = v24.backBehavior or v6.None;
    local v31 = true;
    if v24.resetOnBlur ~= nil then
        v31 = v24.resetOnBlur;
    end;
    local v32 = l_Array_0.indexOf(v26, v29);
    if v32 < 1 then
        local v34 = table.concat(l_Array_0.map(v26, function(v33) --[[ Line: 61 ]]
            return ("\"%s\""):format(v33);
        end), ", ");
        error(("Invalid initialRouteName '%s'. Should be one of %s"):format(v29, v34), 2);
    end;
    local v35 = {};
    for _, v37 in v26 do
        local v38 = v7(v25, v37);
        if type(v38) == "table" and v38.router then
            v35[v37] = v38.router;
        else
            v35[v37] = false;
        end;
    end;
    local function _(v39, v40) --[[ Line: 80 ]] --[[ Name: getParamsForRoute ]]
        -- upvalues: v25 (copy), l_Object_0 (ref)
        local v41 = v25[v39];
        if type(v41) == "table" and v41.params then
            if v40 then
                return (l_Object_0.assign(table.clone(v41.params), v40));
            else
                return (table.clone(v41.params));
            end;
        else
            return v40;
        end;
    end;
    local v43 = l_createPathParser_0(v35, v25, v24);
    local l_getPathAndParamsForRoute_0 = v43.getPathAndParamsForRoute;
    local l_getActionForPathAndParams_0 = v43.getActionForPathAndParams;
    local function v51(v46) --[[ Line: 95 ]] --[[ Name: resetChildRoute ]]
        -- upvalues: v29 (copy), l_initialRouteParams_0 (copy), v25 (copy), l_Object_0 (ref), v35 (copy), v5 (ref)
        local v47 = if v46 == v29 then l_initialRouteParams_0 else nil;
        local v48 = v25[v46];
        local v49 = if type(v48) == "table" and v48.params then if v47 then l_Object_0.assign(table.clone(v48.params), v47) else table.clone(v48.params) else v47;
        v48 = v35[v46];
        if v48 then
            local v50 = v5.init();
            return l_Object_0.assign(table.clone(v48.getStateForAction(v50)), {
                key = v46, 
                routeName = v46, 
                params = v49
            });
        else
            return {
                key = v46, 
                routeName = v46, 
                params = v49
            };
        end;
    end;
    local function v61(v52, v53, v54) --[[ Line: 118 ]] --[[ Name: getNextState ]]
        -- upvalues: v31 (ref), v51 (copy), l_Object_0 (ref), v30 (copy), v6 (ref), v5 (ref), l_Array_0 (ref)
        local l_v54_0 = v54;
        if v53 and v54 and v53.index ~= v54.index and v31 then
            local l_routeName_0 = v53.routes[v53.index].routeName;
            local v57 = table.clone(v54.routes);
            v57[v53.index] = v51(l_routeName_0);
            l_v54_0 = l_Object_0.assign(table.clone(v54), {
                routes = v57
            });
        end;
        if v30 ~= v6.History or v53 and l_v54_0 and l_v54_0.index == v53.index then
            return l_v54_0;
        else
            local v58 = if v53 then v53.routeKeyHistory else {};
            if v52.type == v5.Navigate then
                local l_key_0 = l_v54_0.routes[l_v54_0.index].key;
                v58 = l_Array_0.filter(v58, function(v60) --[[ Line: 136 ]]
                    -- upvalues: l_key_0 (copy)
                    return v60 ~= l_key_0;
                end);
                table.insert(v58, l_key_0);
            elseif v52.type == v5.Back then
                v58 = table.clone(v58);
                table.remove(v58, #v58);
            end;
            return l_Object_0.assign(table.clone(l_v54_0), {
                routeKeyHistory = v58
            });
        end;
    end;
    local function v64() --[[ Line: 148 ]] --[[ Name: getInitialState ]]
        -- upvalues: l_Array_0 (ref), v26 (copy), v51 (copy), v32 (copy), v30 (copy), v6 (ref)
        local v62 = l_Array_0.map(v26, v51);
        local v63 = {
            routes = v62, 
            index = v32
        };
        if v30 == v6.History then
            v63.routeKeyHistory = {
                v62[v32].key
            };
        end;
        return v63;
    end;
    return {
        childRouters = v35, 
        getActionCreators = function(v65, v66) --[[ Line: 165 ]] --[[ Name: getActionCreators ]]
            -- upvalues: v27 (copy)
            return v27(v65, v66);
        end, 
        getScreenOptions = v8(v25, v24.defaultNavigationOptions), 
        getStateForAction = function(v67, v68) --[[ Line: 171 ]] --[[ Name: getStateForAction ]]
            -- upvalues: v64 (copy), v5 (ref), l_Array_0 (ref), v29 (copy), l_initialRouteParams_0 (copy), l_Object_0 (ref), v13 (ref), v61 (copy), v35 (copy), v26 (copy), v30 (copy), v6 (ref), v32 (copy), v12 (ref)
            local v69 = if v68 then table.clone(v68) else nil;
            local v70 = v68 or v64();
            local l_index_0 = v70.index;
            if v67.type == v5.Init then
                local l_params_0 = v67.params;
                if l_params_0 then
                    local l_l_params_0_0 = l_params_0 --[[ copy: 5 -> 15 ]];
                    v70.routes = l_Array_0.map(v70.routes, function(v74) --[[ Line: 181 ]]
                        -- upvalues: v29 (ref), l_initialRouteParams_0 (ref), l_Object_0 (ref), l_l_params_0_0 (copy)
                        local v75 = v74.routeName == v29 and l_initialRouteParams_0 or {};
                        return l_Object_0.assign(table.clone(v74), {
                            params = if v74.params then l_Object_0.assign(table.clone(v74.params), l_l_params_0_0, v75) else l_Object_0.assign(table.clone(l_l_params_0_0), v75)
                        });
                    end);
                end;
            end;
            if v67.type == v13.JumpTo and (v67.key == nil or v67.key == v70.key) then
                local l_params_1 = v67.params;
                local v78 = l_Array_0.findIndex(v70.routes, function(v77) --[[ Line: 194 ]]
                    -- upvalues: v67 (copy)
                    return v77.routeName == v67.routeName;
                end);
                if v78 < 1 then
                    error(("There is no route named '%s' in the navigator with the key '%s'.\n"):format(v67.routeName, v67.key) .. "Must be one of: " .. table.concat(l_Array_0.map(v70.routes, function(v79) --[[ Line: 206 ]]
                        return v79.routeName;
                    end), ","));
                end;
                local l_routes_0 = v70.routes;
                if l_params_1 then
                    return v70.routes.map(function(v81, v82) --[[ Line: 216 ]]
                        -- upvalues: v78 (copy), l_Object_0 (ref), l_params_1 (copy)
                        if v82 == v78 then
                            return l_Object_0.assign(table.clone(v81), {
                                params = l_Object_0.assign(table.clone(v81.params), l_params_1)
                            });
                        else
                            return v81;
                        end;
                    end);
                else
                    return v61(v67, v69, l_Object_0.assign(table.clone(v70), {
                        routes = l_routes_0, 
                        index = v78
                    }));
                end;
            else
                local v83 = v70.routes[v70.index];
                local v84 = v35[v26[v70.index]];
                if v84 then
                    local v85 = v84.getStateForAction(v67, v83);
                    if not v85 and v68 then
                        return nil;
                    elseif v85 and v85 ~= v83 then
                        local v86 = table.clone(v70.routes);
                        v86[v70.index] = v85;
                        return v61(v67, v69, l_Object_0.assign(table.clone(v70), {
                            routes = v86
                        }));
                    end;
                end;
                local v87 = true;
                if v67.key ~= nil then
                    v87 = v67.key == v83.key;
                end;
                if v67.type == v5.Back then
                    if v87 and v30 == v6.InitialRoute then
                        l_index_0 = v32;
                    elseif v87 and v30 == v6.Order then
                        l_index_0 = math.max(1, l_index_0 - 1);
                    elseif v87 and v30 == v6.History and #v70.routeKeyHistory > 1 then
                        local v88 = v70.routeKeyHistory[#v70.routeKeyHistory - 1];
                        l_index_0 = l_Array_0.indexOf(v26, v88);
                    end;
                end;
                local v89 = false;
                if v67.type == v5.Navigate then
                    v89 = l_Array_0.find(v26, function(v90, v91) --[[ Line: 274 ]]
                        -- upvalues: v67 (copy), l_index_0 (ref)
                        if v90 == v67.routeName then
                            l_index_0 = v91;
                            return true;
                        else
                            return false;
                        end;
                    end) ~= nil;
                    if v89 then
                        local v92 = v70.routes[l_index_0];
                        local v93 = v35[v67.routeName];
                        local l_v92_0 = v92;
                        if v67.action and v93 then
                            local v95 = v93.getStateForAction(v67.action, v92);
                            if v95 then
                                l_v92_0 = v95;
                            end;
                        end;
                        if v67.params then
                            l_v92_0 = l_Object_0.assign(table.clone(l_v92_0), {
                                params = if v67.params == l_Object_0.None then l_Object_0.None else if l_v92_0.params then l_Object_0.assign(table.clone(l_v92_0.params), v67.params) else table.clone(v67.params)
                            });
                        end;
                        if l_v92_0 ~= v92 then
                            local v96 = table.clone(v70.routes);
                            v96[l_index_0] = l_v92_0;
                            local v97 = l_Object_0.assign(table.clone(v70), {
                                routes = v96, 
                                index = l_index_0
                            });
                            return v61(v67, v69, v97);
                        elseif l_v92_0 == v92 and v70.index == l_index_0 and v69 then
                            return nil;
                        end;
                    end;
                end;
                if v67.type == v5.SetParams then
                    local l_key_1 = v67.key;
                    local l_l_key_1_0 = l_key_1 --[[ copy: 9 -> 14 ]];
                    local v101 = l_Array_0.findIndex(v70.routes, function(v100) --[[ Line: 320 ]]
                        -- upvalues: l_l_key_1_0 (copy)
                        return v100.key == l_l_key_1_0;
                    end);
                    if v101 > 0 then
                        local v102 = v70.routes[v101];
                        local l_None_0 = l_Object_0.None;
                        if v67.params ~= l_Object_0.None then
                            l_None_0 = if v102.params and v67.params then l_Object_0.assign(table.clone(v102.params), v67.params) else if v102.params then table.clone(v102.params) else if v67.params then table.clone(v67.params) else {};
                        end;
                        local v104 = table.clone(v70.routes);
                        v104[v101] = l_Object_0.assign(table.clone(v102), {
                            params = l_None_0
                        });
                        return v61(v67, v69, l_Object_0.assign(table.clone(v70), {
                            routes = v104
                        }));
                    end;
                end;
                if v70.index ~= l_index_0 then
                    return v61(v67, v69, l_Object_0.assign(table.clone(v70), {
                        index = l_index_0
                    }));
                elseif v89 and not v68 then
                    return v70;
                elseif v89 then
                    return table.clone(v70);
                else
                    local v105 = true;
                    if v67.type ~= v5.Back then
                        v105 = true;
                        if v67.type ~= v12.Pop then
                            v105 = v67.type == v12.PopToTop;
                        end;
                    end;
                    if not v105 or v67.type == v5.Back and v67.key ~= nil then
                        local l_index_1 = v70.index;
                        local l_routes_1 = v70.routes;
                        l_Array_0.find(v26, function(v108, v109) --[[ Line: 363 ]]
                            -- upvalues: v35 (ref), l_index_1 (ref), l_routes_1 (ref), v67 (copy)
                            local v110 = v35[v108];
                            if v109 == l_index_1 then
                                return false;
                            else
                                local v111 = l_routes_1[v109];
                                if v110 then
                                    v111 = v110.getStateForAction(v67, v111);
                                end;
                                if not v111 then
                                    l_index_1 = v109;
                                    return true;
                                elseif v111 ~= l_routes_1[v109] then
                                    l_routes_1 = table.clone(l_routes_1);
                                    l_routes_1[v109] = v111;
                                    l_index_1 = v109;
                                    return true;
                                else
                                    return false;
                                end;
                            end;
                        end);
                        if v67.preserveFocus then
                            l_index_1 = v70.index;
                        end;
                        if v70.index ~= l_index_1 or l_routes_1 ~= v70.routes then
                            return v61(v67, v69, l_Object_0.assign(table.clone(v70), {
                                index = l_index_1, 
                                routes = l_routes_1
                            }));
                        else
                            --[[ close >= 11 ]]
                        end;
                    end;
                    return v70;
                end;
            end;
        end, 
        getComponentForState = function(v112) --[[ Line: 410 ]] --[[ Name: getComponentForState ]]
            -- upvalues: v11 (ref), v35 (copy), v7 (ref), v25 (copy)
            local l_routeName_1 = (v112.routes[v112.index] or {}).routeName;
            v11(l_routeName_1, "There is no route defined for index '%d'. Check that you passed in a navigation state with a valid tab/screen index.", v112.index);
            local v114 = v35[l_routeName_1];
            if v114 then
                return v114.getComponentForState(v112.routes[v112.index]);
            else
                return v7(v25, l_routeName_1);
            end;
        end, 
        getComponentForRouteName = function(v115) --[[ Line: 430 ]] --[[ Name: getComponentForRouteName ]]
            -- upvalues: v7 (ref), v25 (copy)
            return v7(v25, v115);
        end, 
        getPathAndParamsForState = function(v116) --[[ Line: 434 ]] --[[ Name: getPathAndParamsForState ]]
            -- upvalues: l_getPathAndParamsForRoute_0 (copy)
            local v117 = v116.routes[v116.index];
            return l_getPathAndParamsForRoute_0(v117);
        end, 
        getActionForPathAndParams = function(v118, v119) --[[ Line: 439 ]] --[[ Name: getActionForPathAndParams ]]
            -- upvalues: l_getActionForPathAndParams_0 (copy)
            return l_getActionForPathAndParams_0(v118, v119);
        end
    };
end;