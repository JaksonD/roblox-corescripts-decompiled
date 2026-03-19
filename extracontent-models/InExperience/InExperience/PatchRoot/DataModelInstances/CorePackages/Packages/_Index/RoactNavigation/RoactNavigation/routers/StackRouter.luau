local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_0.NavigationActions);
local v6 = require(script.Parent.StackActions);
local v7 = require(l_Parent_0.utils.KeyGenerator);
local v8 = require(l_Parent_0.StateUtils);
local v9 = require(script.Parent.getScreenForRouteName);
local v10 = require(script.Parent.createConfigGetter);
local v11 = require(script.Parent.validateRouteConfigArray);
local v12 = require(script.Parent.validateRouteConfigMap);
local v13 = require(l_Parent_0.utils.invariant);
local l_createPathParser_0 = require(script.Parent.pathUtils).createPathParser;
local v15 = require(script.Parent["ChildIsScreenRouterSymbol.roblox"]);
local function v16() --[[ Line: 28 ]]
    return {};
end;
local function _(v17) --[[ Line: 32 ]] --[[ Name: behavesLikePushAction ]]
    -- upvalues: v5 (copy), v6 (copy)
    local v18 = true;
    if v17.type ~= v5.Navigate then
        v18 = v17.type == v6.Push;
    end;
    return v18;
end;
local function _(v20) --[[ Line: 36 ]] --[[ Name: isResetToRootStack ]]
    -- upvalues: v6 (copy)
    local v21 = false;
    if v20.type == v6.Reset then
        v21 = v20.key == nil;
    end;
    return v21;
end;
local function v24(v23) --[[ Line: 40 ]] --[[ Name: mapToRouteName ]]
    return (next(v23));
end;
local function v30(v25, v26, _) --[[ Line: 45 ]] --[[ Name: foldToRoutes ]]
    local v28, v29 = next(v26);
    v25[v28] = v29;
    return v25;
end;
return function(v31, v32) --[[ Line: 51 ]]
    -- upvalues: v11 (copy), v12 (copy), l_Array_0 (copy), v30 (copy), v24 (copy), v15 (copy), v16 (copy), v5 (copy), v6 (copy), l_Object_0 (copy), v7 (copy), l_createPathParser_0 (copy), v13 (copy), v9 (copy), v8 (copy), v10 (copy)
    v11(v31);
    v32 = v32 or {};
    local v33 = v12(l_Array_0.reduce(v31, v30, {}));
    local v34 = v32.order or l_Array_0.map(v31, v24);
    local v35 = {};
    for _, v37 in v34 do
        local v38 = v33[v37];
        local v39 = if type(v38) == "table" and v38.screen then v38.screen else v38;
        if type(v39) == "table" and v39.router then
            v35[v37] = v39.router;
        else
            v35[v37] = v15;
        end;
    end;
    local l_initialRouteParams_0 = v32.initialRouteParams;
    local v41 = v32.getCustomActionCreators or v16;
    local v42 = v32.initialRouteName or v34[1];
    local v43 = v35[v42];
    if l_Array_0.indexOf(v34, v42) < 1 then
        local v44 = "";
        for _, v46 in v34 do
            v44 = v44 .. v46 .. ",";
        end;
        error(string.format("Invalid initialRouteName '%s'. Must be one of [%s]", v42, v44), 2);
    end;
    local function v55(v47) --[[ Line: 97 ]] --[[ Name: getInitialState ]]
        -- upvalues: v35 (copy), v5 (ref), v6 (ref), v15 (ref), l_Object_0 (ref), v7 (ref), v43 (copy), v42 (copy), l_initialRouteParams_0 (copy), v33 (copy), v32 (ref)
        local v48 = {};
        local v49 = v35[v47.routeName];
        local v50 = true;
        if v47.type ~= v5.Navigate then
            v50 = v47.type == v6.Push;
        end;
        if v50 and v49 ~= nil then
            v50 = {};
            if v49 ~= v15 then
                local v51 = v47.action or v5.init({
                    params = v47.params
                });
                v50 = v49.getStateForAction(v51);
            end;
            return {
                key = "StackRouterRoot", 
                isTransitioning = false, 
                index = 1, 
                routes = {
                    l_Object_0.assign({
                        params = v47.params
                    }, v50, {
                        key = v47.key or v7.generateKey(), 
                        routeName = v47.routeName
                    })
                }
            };
        else
            if v43 ~= nil and v43 ~= v15 then
                v48 = v43.getStateForAction(v5.navigate({
                    routeName = v42, 
                    params = l_initialRouteParams_0
                }));
            end;
            v50 = v33[v42];
            local v52 = false;
            if type(v50) == "table" then
                v52 = v50.params;
            end;
            local v53 = (not not v52 or v48.params or v47.params or l_initialRouteParams_0) and l_Object_0.assign(if v52 then table.clone(v52) else {}, v48.params or {}, v47.params or {}, l_initialRouteParams_0 or {});
            local l_initialRouteKey_0 = v32.initialRouteKey;
            v48 = l_Object_0.assign(table.clone(v48), {
                params = v53, 
                routeName = v42, 
                key = v47.key or l_initialRouteKey_0 or v7.generateKey()
            });
            return {
                key = "StackRouterRoot", 
                isTransitioning = false, 
                index = 1, 
                routes = {
                    v48
                }
            };
        end;
    end;
    local function v59(v56, v57) --[[ Line: 162 ]] --[[ Name: getParamsForRouteAndAction ]]
        -- upvalues: l_Object_0 (ref), v33 (copy)
        if v57.params == l_Object_0.None then
            return nil;
        else
            local v58 = v33[v56];
            if type(v58) == "table" and v58.params then
                return l_Object_0.assign(table.clone(v58.params), v57.params);
            elseif v57.params then
                return l_Object_0.assign({}, v57.params);
            else
                return nil;
            end;
        end;
    end;
    local v60 = l_createPathParser_0(v35, v33, v32);
    local l_getPathAndParamsForRoute_0 = v60.getPathAndParamsForRoute;
    local l_getActionForPathAndParams_0 = v60.getActionForPathAndParams;
    local v63 = {};
    for v64, v65 in v35 do
        if v65 ~= v15 then
            v63[v64] = v65;
        end;
    end;
    return {
        childRouters = v63, 
        _CHILD_IS_SCREEN = v15, 
        getComponentForState = function(v66) --[[ Line: 199 ]] --[[ Name: getComponentForState ]]
            -- upvalues: v13 (ref), v35 (copy), v15 (ref), v9 (ref), v33 (copy)
            local v67 = v66.routes[v66.index] or {};
            local l_routeName_0 = v67.routeName;
            v13(l_routeName_0, "There is no route defined for index '%d'. Make sure that you passed in a navigation state with a valid stack index.", v66.index);
            local v69 = v35[l_routeName_0];
            if v69 ~= nil and v69 ~= v15 then
                return v35[l_routeName_0].getComponentForState(v67);
            else
                return v9(v33, l_routeName_0);
            end;
        end, 
        getComponentForRouteName = function(v70) --[[ Line: 220 ]] --[[ Name: getComponentForRouteName ]]
            -- upvalues: v9 (ref), v33 (copy)
            return v9(v33, v70);
        end, 
        getActionCreators = function(v71, v72) --[[ Line: 224 ]] --[[ Name: getActionCreators ]]
            -- upvalues: l_Object_0 (ref), v41 (copy), v6 (ref), v13 (ref), v5 (ref)
            return l_Object_0.assign(table.clone(v41(v71, v72)), {
                pop = function(v73, v74) --[[ Line: 226 ]] --[[ Name: pop ]]
                    -- upvalues: v6 (ref), l_Object_0 (ref)
                    return v6.pop(l_Object_0.assign({
                        n = v73
                    }, v74 or {}));
                end, 
                popToTop = function(v75) --[[ Line: 229 ]] --[[ Name: popToTop ]]
                    -- upvalues: v6 (ref)
                    return v6.popToTop(v75);
                end, 
                push = function(v76, v77, v78) --[[ Line: 232 ]] --[[ Name: push ]]
                    -- upvalues: v6 (ref)
                    return v6.push({
                        routeName = v76, 
                        params = v77, 
                        action = v78
                    });
                end, 
                replace = function(v79, v80, v81, v82) --[[ Line: 239 ]] --[[ Name: replace ]]
                    -- upvalues: v6 (ref), v71 (copy), v13 (ref)
                    if type(v79) == "string" then
                        return v6.replace({
                            routeName = v79, 
                            params = v80, 
                            action = v81, 
                            key = v71.key, 
                            newKey = v82
                        });
                    else
                        v13(type(v79) == "table", "replaceWith must be a table or string");
                        v13(v80 == nil, "params must not be provided to .replace() when specifying a table");
                        v13(v81 == nil, "Child action must not be provided to .replace() when specifying a table");
                        v13(v82 == nil, "newKey must not be provided to .replace() when specifying a table");
                        return v6.replace(v79);
                    end;
                end, 
                reset = function(v83, v84) --[[ Line: 257 ]] --[[ Name: reset ]]
                    -- upvalues: v6 (ref), v72 (copy)
                    local l_v84_0 = v84;
                    if v84 == nil then
                        l_v84_0 = #v83;
                    end;
                    return v6.reset({
                        actions = v83, 
                        index = l_v84_0, 
                        key = v72
                    });
                end, 
                dismiss = function() --[[ Line: 269 ]] --[[ Name: dismiss ]]
                    -- upvalues: v5 (ref), v72 (copy)
                    return v5.back({
                        key = v72
                    });
                end
            });
        end, 
        getStateForAction = function(v86, v87) --[[ Line: 277 ]] --[[ Name: getStateForAction ]]
            -- upvalues: v55 (copy), v6 (ref), v5 (ref), v35 (copy), v15 (ref), v8 (ref), l_Object_0 (ref), v13 (ref), l_Array_0 (ref), v59 (copy), v7 (ref)
            if not v87 then
                return (v55(v86));
            else
                local v88 = v87.routes[v87.index];
                local v89 = false;
                if v86.type == v6.Reset then
                    v89 = v86.key == nil;
                end;
                if not v89 and v86.type ~= v5.Navigate then
                    v89 = v35[v88.routeName];
                    if v89 ~= nil and v89 ~= v15 then
                        local v90 = v89.getStateForAction(v86, v88);
                        if v90 ~= nil and v90 ~= v88 then
                            return v8.replaceAt(v87, v88.key, v90, v86.type == v5.SetParams);
                        end;
                    end;
                elseif v86.type == v5.Navigate then
                    for v91 = #v87.routes, 1, -1 do
                        local v92 = v87.routes[v91];
                        local v93 = v35[v92.routeName];
                        local l_v86_0 = v86;
                        if v86.routeName == v92.routeName and v86.action then
                            l_v86_0 = v86.action;
                        end;
                        if v93 ~= nil and v93 ~= v15 then
                            local v95 = v93.getStateForAction(l_v86_0, v92);
                            if v95 == nil or v95 ~= v92 then
                                local v96 = v8.replaceAndPrune(v87, if v95 then v95.key else v92.key, v95 or v92);
                                local l_isTransitioning_0 = v87.isTransitioning;
                                if v87.index ~= v96.index then
                                    l_isTransitioning_0 = v86.immediate ~= true;
                                end;
                                return l_Object_0.assign(table.clone(v96), {
                                    isTransitioning = l_isTransitioning_0
                                });
                            end;
                        end;
                    end;
                end;
                v89 = true;
                if v86.type ~= v5.Navigate then
                    v89 = v86.type == v6.Push;
                end;
                if v89 and v35[v86.routeName] ~= nil then
                    v89 = v35[v86.routeName];
                    local l_v13_0 = v13;
                    local v99 = true;
                    if v86.type == v6.Push then
                        v99 = v86.key == nil;
                    end;
                    l_v13_0(v99, "StackRouter does not support key on the push action");
                    l_v13_0 = function(v100) --[[ Line: 349 ]]
                        -- upvalues: v86 (copy)
                        return v100.routeName == v86.routeName;
                    end;
                    if v86.key then
                        l_v13_0 = function(v101) --[[ Line: 353 ]]
                            -- upvalues: v86 (copy)
                            return v101.key == v86.key;
                        end;
                    end;
                    v99 = l_Array_0.findIndex(v87.routes, l_v13_0);
                    if v86.type ~= v6.Push and v99 > 0 then
                        if v87.index == v99 and not v86.params then
                            return nil;
                        else
                            local v102 = l_Array_0.slice(v87.routes, 1, v99 + 1);
                            if v86.params then
                                local v103 = v87.routes[v99];
                                v102[v99] = l_Object_0.assign(table.clone(v103), {
                                    params = if v86.params == l_Object_0.None then l_Object_0.None else if v103.params then l_Object_0.assign(table.clone(v103.params), v86.params) else table.clone(v86.params)
                                });
                            end;
                            local l_isTransitioning_1 = v87.isTransitioning;
                            if v87.index ~= v99 then
                                l_isTransitioning_1 = v86.immediate ~= true;
                            end;
                            return l_Object_0.assign(table.clone(v87), {
                                isTransitioning = l_isTransitioning_1, 
                                index = v99, 
                                routes = v102
                            });
                        end;
                    else
                        local v105 = nil;
                        if v89 ~= v15 then
                            local v106 = v86.action or v5.init({
                                params = v59(v86.routeName, v86)
                            });
                            v105 = l_Object_0.assign({
                                params = v59(v86.routeName, v86)
                            }, v89.getStateForAction(v106), {
                                routeName = v86.routeName, 
                                key = v86.key or v7.generateKey()
                            });
                        else
                            v105 = {
                                params = v59(v86.routeName, v86), 
                                routeName = v86.routeName, 
                                key = v86.key or v7.generateKey()
                            };
                        end;
                        return l_Object_0.assign(v8.push(v87, v105), {
                            isTransitioning = v86.immediate ~= true
                        });
                    end;
                elseif v86.type == v6.Push and v35[v86.routeName] == nil then
                    return v87;
                else
                    v89 = true;
                    if v86.type ~= v5.Navigate then
                        v89 = v86.type == v6.Push;
                    end;
                    if v89 then
                        for v107 in v35 do
                            local v108 = v35[v107];
                            if v108 ~= nil and v108 ~= v15 then
                                local v109 = v108.getStateForAction(v5.init());
                                local v110 = v108.getStateForAction(v86, v109);
                                local v111 = nil;
                                if v110 == nil then
                                    v111 = v109;
                                elseif v110 ~= v109 then
                                    v111 = v110;
                                end;
                                if v111 then
                                    local v112 = l_Object_0.assign(table.clone(v111), {
                                        routeName = v107, 
                                        key = v86.key or v7.generateKey()
                                    });
                                    return l_Object_0.assign(v8.push(v87, v112), {
                                        isTransitioning = v86.immediate ~= true
                                    });
                                end;
                            end;
                        end;
                    end;
                    if v86.type == v6.PopToTop then
                        if v86.key and v87.key ~= v86.key then
                            return v87;
                        elseif v87.index > 1 then
                            return l_Object_0.assign(table.clone(v87), {
                                isTransitioning = v86.immediate ~= true, 
                                index = 1, 
                                routes = {
                                    v87.routes[1]
                                }
                            });
                        else
                            return v87;
                        end;
                    else
                        if v86.type == v6.Replace then
                            v89 = nil;
                            v89 = if v86.key == nil and #v87.routes > 0 then #v87.routes else l_Array_0.findIndex(v87.routes, function(v113) --[[ Line: 496 ]]
                                -- upvalues: v86 (copy)
                                return v113.key == v86.key;
                            end);
                            if v89 > 0 then
                                local v114 = v35[v86.routeName];
                                local v115 = {};
                                if v114 ~= nil and v114 ~= v15 then
                                    local v116 = v86.action or v5.init({
                                        params = v59(v86.routeName, v86)
                                    });
                                    v115 = v114.getStateForAction(v116);
                                end;
                                local v117 = table.clone(v87.routes);
                                v117[v89] = l_Object_0.assign({
                                    params = v59(v86.routeName, v86)
                                }, v115, {
                                    routeName = v86.routeName, 
                                    key = v86.newKey or v7.generateKey()
                                });
                                return l_Object_0.assign(table.clone(v87), {
                                    routes = v117
                                });
                            end;
                        end;
                        if v86.type == v6.CompleteTransition and (v86.key == nil or v86.key == v87.key) and v86.toChildKey == v87.routes[v87.index].key and v87.isTransitioning then
                            return l_Object_0.assign(table.clone(v87), {
                                isTransitioning = false
                            });
                        else
                            if v86.type == v5.SetParams then
                                v89 = v86.key;
                                local l_v89_0 = v89 --[[ copy: 3 -> 15 ]];
                                local v120 = l_Array_0.findIndex(v87.routes, function(v119) --[[ Line: 545 ]]
                                    -- upvalues: l_v89_0 (copy)
                                    return v119.key == l_v89_0;
                                end);
                                if v120 > 0 then
                                    local v121 = v87.routes[v120];
                                    local l_None_0 = l_Object_0.None;
                                    if v86.params ~= l_Object_0.None then
                                        l_None_0 = if v121.params and v86.params then l_Object_0.assign(table.clone(v121.params), v86.params) else if v121.params then table.clone(v121.params) else if v86.params then table.clone(v86.params) else {};
                                    end;
                                    local v123 = table.clone(v87.routes);
                                    v123[v120] = l_Object_0.assign(table.clone(v121), {
                                        params = l_None_0
                                    });
                                    return l_Object_0.assign(table.clone(v87), {
                                        routes = v123
                                    });
                                end;
                            end;
                            if v86.type == v6.Reset then
                                if v86.key ~= nil and v86.key ~= v87.key then
                                    return v87;
                                else
                                    v89 = if v86.actions then l_Array_0.map(v86.actions, function(v124) --[[ Line: 576 ]]
                                        -- upvalues: v35 (ref), v15 (ref), v5 (ref), v59 (ref), l_Object_0 (ref), v7 (ref)
                                        local v125 = v35[v124.routeName];
                                        local v126 = {};
                                        if v125 ~= nil and v125 ~= v15 then
                                            local v127 = v124.action or v5.init({
                                                params = v59(v124.routeName, v124)
                                            });
                                            v126 = v125.getStateForAction(v127);
                                        end;
                                        return l_Object_0.assign({
                                            params = v59(v124.routeName, v124)
                                        }, v126, {
                                            routeName = v124.routeName, 
                                            key = v124.key or v7.generateKey()
                                        });
                                    end) else {};
                                    return l_Object_0.assign(table.clone(v87), {
                                        routes = v89, 
                                        index = v86.index
                                    });
                                end;
                            else
                                if v86.type == v5.Back or v86.type == v6.Pop then
                                    v89 = v86.key;
                                    local l_n_0 = v86.n;
                                    local l_immediate_0 = v86.immediate;
                                    local l_prune_0 = v86.prune;
                                    if v86.type == v6.Pop and l_prune_0 == false and v89 then
                                        local l_v89_1 = v89 --[[ copy: 3 -> 14 ]];
                                        local v133 = l_Array_0.findIndex(v87.routes, function(v132) --[[ Line: 617 ]]
                                            -- upvalues: l_v89_1 (copy)
                                            return v132.key == l_v89_1;
                                        end);
                                        if v133 > 0 then
                                            local v134 = math.max(v133 - (l_n_0 or 1), 1);
                                            local v135 = l_Array_0.concat(l_Array_0.slice(v87.routes, 1, v134 + 1), l_Array_0.slice(v87.routes, v133 + 1));
                                            if #v135 > 0 then
                                                return l_Object_0.assign(table.clone(v87), {
                                                    routes = v135, 
                                                    index = #v135, 
                                                    isTransitioning = l_immediate_0 ~= true
                                                });
                                            end;
                                        end;
                                    else
                                        local l_index_0 = v87.index;
                                        if v86.type == v6.Pop and l_n_0 ~= nil then
                                            l_index_0 = math.max(2, v87.index - l_n_0 + 1);
                                        elseif v89 then
                                            local l_v89_2 = v89 --[[ copy: 3 -> 13 ]];
                                            l_index_0 = l_Array_0.findIndex(v87.routes, function(v138) --[[ Line: 642 ]]
                                                -- upvalues: l_v89_2 (copy)
                                                return v138.key == l_v89_2;
                                            end);
                                        end;
                                        if l_index_0 > 1 then
                                            return l_Object_0.assign(table.clone(v87), {
                                                routes = l_Array_0.slice(v87.routes, 1, l_index_0), 
                                                index = l_index_0 - 1, 
                                                isTransitioning = l_immediate_0 ~= true
                                            });
                                        end;
                                    end;
                                end;
                                v89 = if v86.key then v8.indexOf(v87, v86.key) else nil;
                                for v139 = #v87.routes, 1, -1 do
                                    local v140 = v87.routes[v139];
                                    if v140.key ~= v88.key and (v89 == 1 or v140.key == v86.key) then
                                        local v141 = v35[v140.routeName];
                                        if v141 ~= nil and v141 ~= v15 then
                                            local v142 = v141.getStateForAction(v86, v140);
                                            if v142 == nil then
                                                return v87;
                                            elseif v142 ~= v140 then
                                                return v8.replaceAt(v87, v140.key, v142, v86.preserveFocus);
                                            end;
                                        end;
                                    end;
                                end;
                                return v87;
                            end;
                        end;
                    end;
                end;
            end;
        end, 
        getPathAndParamsForState = function(v143) --[[ Line: 696 ]] --[[ Name: getPathAndParamsForState ]]
            -- upvalues: l_getPathAndParamsForRoute_0 (copy)
            local v144 = v143.routes[v143.index];
            return l_getPathAndParamsForRoute_0(v144);
        end, 
        getActionForPathAndParams = function(v145, v146) --[[ Line: 701 ]] --[[ Name: getActionForPathAndParams ]]
            -- upvalues: l_getActionForPathAndParams_0 (copy)
            return l_getActionForPathAndParams_0(v145, v146);
        end, 
        getScreenOptions = v10(v33, v32.defaultNavigationOptions)
    };
end;