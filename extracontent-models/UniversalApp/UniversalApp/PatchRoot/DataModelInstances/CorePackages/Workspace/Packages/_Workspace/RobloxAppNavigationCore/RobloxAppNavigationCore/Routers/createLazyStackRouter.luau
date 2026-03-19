local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local l_inspectRouteEntry_0 = require(l_Parent_0.Navigation).inspectRouteEntry;
local v2 = require(l_Parent_0.RoactNavigation);
local l_createConfigGetter_0 = v2.createConfigGetter;
local l_getScreenForRouteName_0 = v2.getScreenForRouteName;
local l_validateRouteConfigMap_0 = v2.validateRouteConfigMap;
local v6 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v6.Array;
local l_Object_0 = v6.Object;
local v9 = require(script.Parent.StateUtils);
local l___DEV___0 = _G.__DEV__;
local v11 = {
    Init = v2.Actions.Init, 
    Back = v2.Actions.Back, 
    Navigate = v2.Actions.Navigate, 
    SetParams = v2.Actions.SetParams, 
    Pop = v2.StackActions.Pop, 
    PopToTop = v2.StackActions.PopToTop, 
    Push = v2.StackActions.Push, 
    Reset = v2.StackActions.Reset, 
    Replace = v2.StackActions.Replace, 
    CompleteTransition = v2.StackActions.CompleteTransition
};
local v12 = tostring(math.random(100000, 1000000));
local v13 = 0;
local function _() --[[ Line: 131 ]] --[[ Name: generateKey ]]
    -- upvalues: v13 (ref), v12 (copy)
    v13 = v13 + 1;
    return (("id-%*-%*"):format(v12, (tostring(v13))));
end;
local function _(v15) --[[ Line: 136 ]] --[[ Name: isResetToRootStack ]]
    -- upvalues: v11 (copy)
    local v16 = false;
    if v15.type == v11.Reset then
        v16 = v15.key == nil;
    end;
    return v16;
end;
local function _(v18) --[[ Line: 140 ]] --[[ Name: getParamsForAction ]]
    -- upvalues: l_Object_0 (copy)
    if v18.params == l_Object_0.None then
        return nil;
    else
        return v18.params;
    end;
end;
return function(v20, v21) --[[ Line: 154 ]]
    -- upvalues: l_Array_0 (copy), l_inspectRouteEntry_0 (copy), l___DEV___0 (copy), l_validateRouteConfigMap_0 (copy), l_getScreenForRouteName_0 (copy), v11 (copy), v13 (ref), v12 (copy), v2 (copy), l_Object_0 (copy), v9 (copy), l_createConfigGetter_0 (copy)
    local v23 = l_Array_0.map(v20, function(v22) --[[ Line: 160 ]]
        -- upvalues: l_inspectRouteEntry_0 (ref)
        return (l_inspectRouteEntry_0(v22));
    end);
    local v28 = l_Array_0.reduce(v20, function(v24, v25) --[[ Line: 167 ]]
        -- upvalues: l_inspectRouteEntry_0 (ref)
        local v26, v27 = l_inspectRouteEntry_0(v25);
        v24[v26] = v27;
        return v24;
    end, {});
    if l___DEV___0 then
        l_validateRouteConfigMap_0(v28);
    end;
    local v29 = v21 or {};
    local v30 = v29.initialRouteName or v23[1];
    if l___DEV___0 and v28[v30] == nil then
        local v31 = table.concat(v23, ", ");
        error((("Invalid initialRouteName: '%*'. Should be one of: %*"):format(v30, v31)));
    end;
    local v32 = {};
    local function _(v33) --[[ Line: 191 ]] --[[ Name: getChildRouter ]]
        -- upvalues: v32 (copy), v28 (copy), l_getScreenForRouteName_0 (ref)
        if v32[v33] == nil and v28[v33] ~= nil then
            local v34 = l_getScreenForRouteName_0(v28, v33);
            if typeof(v34) == "table" and v34.router then
                v32[v33] = v34.router;
            else
                v32[v33] = false;
            end;
        end;
        return v32[v33];
    end;
    local function v47(v36) --[[ Line: 206 ]] --[[ Name: getInitialState ]]
        -- upvalues: v11 (ref), v28 (copy), v13 (ref), v12 (ref), v32 (copy), l_getScreenForRouteName_0 (ref), v2 (ref), l_Object_0 (ref), v30 (copy)
        if (v36.type == v11.Navigate or v36.type == v11.Push) and v28[v36.routeName] ~= nil then
            local v37 = {};
            local l_key_0 = v36.key;
            if not l_key_0 then
                v13 = v13 + 1;
                l_key_0 = ("id-%*-%*"):format(v12, (tostring(v13)));
            end;
            v37.key = l_key_0;
            v37.routeName = v36.routeName;
            v37.params = v36.params;
            local l_routeName_0 = v36.routeName;
            if v32[l_routeName_0] == nil and v28[l_routeName_0] ~= nil then
                local v40 = l_getScreenForRouteName_0(v28, l_routeName_0);
                if typeof(v40) == "table" and v40.router then
                    v32[l_routeName_0] = v40.router;
                else
                    v32[l_routeName_0] = false;
                end;
            end;
            l_key_0 = v32[l_routeName_0];
            if l_key_0 then
                l_routeName_0 = v36.action or v2.Actions.init();
                local v41 = l_key_0.getStateForAction(l_routeName_0);
                v37 = l_Object_0.assign(table.clone(v41), v37);
            end;
            return {
                key = "StackRouterRoot", 
                index = 1, 
                routes = {
                    v37
                }, 
                isTransitioning = false
            };
        else
            local v42 = {};
            v13 = v13 + 1;
            v42.key = ("id-%*-%*"):format(v12, (tostring(v13)));
            v42.routeName = v30;
            local l_v30_0 = v30;
            if v32[l_v30_0] == nil and v28[l_v30_0] ~= nil then
                local v44 = l_getScreenForRouteName_0(v28, l_v30_0);
                if typeof(v44) == "table" and v44.router then
                    v32[l_v30_0] = v44.router;
                else
                    v32[l_v30_0] = false;
                end;
            end;
            local v45 = v32[l_v30_0];
            if v45 then
                l_v30_0 = v2.Actions.init();
                local v46 = v45.getStateForAction(l_v30_0);
                v42 = l_Object_0.assign(table.clone(v46), v42);
            end;
            return {
                key = "StackRouterRoot", 
                index = 1, 
                routes = {
                    v42
                }, 
                isTransitioning = false
            };
        end;
    end;
    local function v135(v48, v49) --[[ Line: 253 ]] --[[ Name: getStateForAction ]]
        -- upvalues: v47 (copy), v11 (ref), v32 (copy), v28 (copy), l_getScreenForRouteName_0 (ref), v9 (ref), l_Object_0 (ref), l___DEV___0 (ref), l_Array_0 (ref), v2 (ref), v13 (ref), v12 (ref)
        local v50 = v49 or v47(v48);
        if not v49 then
            return v50;
        else
            local v51 = v50.routes[v50.index];
            local v52 = false;
            if v48.type == v11.Reset then
                v52 = v48.key == nil;
            end;
            if not v52 and v48.type ~= v11.Navigate then
                local l_routeName_1 = v51.routeName;
                if v32[l_routeName_1] == nil and v28[l_routeName_1] ~= nil then
                    local v54 = l_getScreenForRouteName_0(v28, l_routeName_1);
                    if typeof(v54) == "table" and v54.router then
                        v32[l_routeName_1] = v54.router;
                    else
                        v32[l_routeName_1] = false;
                    end;
                end;
                v52 = v32[l_routeName_1];
                if v52 then
                    l_routeName_1 = v52.getStateForAction(v48, v51);
                    if l_routeName_1 ~= nil and l_routeName_1 ~= v51 then
                        return v9.replaceAt(v50, v51.key, l_routeName_1, v48.type == v11.SetParams);
                    end;
                end;
            elseif v48.type == v11.Navigate then
                for v55 = #v50.routes, 1, -1 do
                    local v56 = v50.routes[v55];
                    local l_routeName_2 = v56.routeName;
                    if v32[l_routeName_2] == nil and v28[l_routeName_2] ~= nil then
                        local v58 = l_getScreenForRouteName_0(v28, l_routeName_2);
                        if typeof(v58) == "table" and v58.router then
                            v32[l_routeName_2] = v58.router;
                        else
                            v32[l_routeName_2] = false;
                        end;
                    end;
                    local v59 = v32[l_routeName_2];
                    l_routeName_2 = v48;
                    if v48.routeName == v56.routeName and v48.action then
                        l_routeName_2 = v48.action;
                    end;
                    if v59 then
                        local v60 = v59.getStateForAction(l_routeName_2, v56);
                        if v60 == nil or v60 ~= v56 then
                            local v61 = v9.replaceAndPrune(v50, if v60 then v60.key else v56.key, v60 or v56);
                            local l_isTransitioning_0 = v50.isTransitioning;
                            if v50.index ~= v61.index then
                                l_isTransitioning_0 = v48.immediate ~= true;
                            end;
                            return l_Object_0.assign(table.clone(v61), {
                                isTransitioning = l_isTransitioning_0
                            });
                        end;
                    end;
                end;
            end;
            if (v48.type == v11.Navigate or v48.type == v11.Push) and v28[v48.routeName] ~= nil then
                local l_routeName_3 = v48.routeName;
                if v32[l_routeName_3] == nil and v28[l_routeName_3] ~= nil then
                    local v64 = l_getScreenForRouteName_0(v28, l_routeName_3);
                    if typeof(v64) == "table" and v64.router then
                        v32[l_routeName_3] = v64.router;
                    else
                        v32[l_routeName_3] = false;
                    end;
                end;
                v52 = v32[l_routeName_3];
                if l___DEV___0 then
                    local v65 = true;
                    if v48.type == v11.Push then
                        v65 = v48.key == nil;
                    end;
                    assert(v65, "StackRouter does not support key on the push action");
                end;
                l_routeName_3 = function(v66) --[[ Line: 336 ]]
                    -- upvalues: v48 (copy)
                    return v66.routeName == v48.routeName;
                end;
                if v48.key then
                    l_routeName_3 = function(v67) --[[ Line: 340 ]]
                        -- upvalues: v48 (copy)
                        return v67.key == v48.key;
                    end;
                end;
                local v68 = l_Array_0.findIndex(v50.routes, l_routeName_3);
                if v48.type ~= v11.Push and v68 > 0 then
                    if v50.index == v68 and not v48.params then
                        return nil;
                    else
                        local v69 = l_Array_0.slice(v50.routes, 1, v68 + 1);
                        if v48.params then
                            local v70 = v50.routes[v68];
                            v69[v68] = l_Object_0.assign(table.clone(v70), {
                                params = if v48.params == l_Object_0.None then l_Object_0.None else if v70.params then l_Object_0.assign(table.clone(v70.params), v48.params) else table.clone(v48.params)
                            });
                        end;
                        local l_isTransitioning_1 = v50.isTransitioning;
                        if v50.index ~= v68 then
                            l_isTransitioning_1 = v48.immediate ~= true;
                        end;
                        return l_Object_0.assign(table.clone(v50), {
                            isTransitioning = l_isTransitioning_1, 
                            index = v68, 
                            routes = v69
                        });
                    end;
                else
                    local v72 = nil;
                    if v52 then
                        local v73 = v48.action or v2.Actions.init({
                            params = if v48.params == l_Object_0.None then nil else v48.params
                        });
                        local l_assign_0 = l_Object_0.assign;
                        local v75 = {
                            params = if v48.params == l_Object_0.None then nil else v48.params
                        };
                        local v76 = v52.getStateForAction(v73);
                        local v77 = {
                            routeName = v48.routeName
                        };
                        local l_key_1 = v48.key;
                        if not l_key_1 then
                            v13 = v13 + 1;
                            l_key_1 = ("id-%*-%*"):format(v12, (tostring(v13)));
                        end;
                        v77.key = l_key_1;
                        v72 = l_assign_0(v75, v76, v77);
                    else
                        local v79 = {
                            params = if v48.params == l_Object_0.None then nil else v48.params, 
                            routeName = v48.routeName
                        };
                        local l_key_2 = v48.key;
                        if not l_key_2 then
                            v13 = v13 + 1;
                            l_key_2 = ("id-%*-%*"):format(v12, (tostring(v13)));
                        end;
                        v79.key = l_key_2;
                        v72 = v79;
                    end;
                    return l_Object_0.assign(v9.push(v50, v72), {
                        isTransitioning = v48.immediate ~= true
                    });
                end;
            elseif v48.type == v11.Push and v28[v48.routeName] == nil then
                return v50;
            else
                if v48.type == v11.Navigate or v48.type == v11.Push then
                    for v81 in v28 do
                        if v32[v81] == nil and v28[v81] ~= nil then
                            local v82 = l_getScreenForRouteName_0(v28, v81);
                            if typeof(v82) == "table" and v82.router then
                                v32[v81] = v82.router;
                            else
                                v32[v81] = false;
                            end;
                        end;
                        local v83 = v32[v81];
                        if v83 then
                            local v84 = v83.getStateForAction(v2.Actions.init());
                            local v85 = v83.getStateForAction(v48, v84);
                            local v86 = nil;
                            if v85 == nil then
                                v86 = v84;
                            elseif v85 ~= v84 then
                                v86 = v85;
                            end;
                            if v86 then
                                local l_assign_1 = l_Object_0.assign;
                                local v88 = table.clone(v86);
                                local v89 = {
                                    routeName = v81
                                };
                                local l_key_3 = v48.key;
                                if not l_key_3 then
                                    v13 = v13 + 1;
                                    l_key_3 = ("id-%*-%*"):format(v12, (tostring(v13)));
                                end;
                                v89.key = l_key_3;
                                l_assign_1 = l_assign_1(v88, v89);
                                return l_Object_0.assign(v9.push(v50, l_assign_1), {
                                    isTransitioning = v48.immediate ~= true
                                });
                            end;
                        end;
                    end;
                end;
                if v48.type == v11.PopToTop then
                    if v48.key and v50.key ~= v48.key then
                        return v50;
                    elseif v50.index > 1 then
                        return l_Object_0.assign(table.clone(v50), {
                            isTransitioning = v48.immediate ~= true, 
                            index = 1, 
                            routes = {
                                v50.routes[1]
                            }
                        });
                    else
                        return v50;
                    end;
                else
                    if v48.type == v11.Replace then
                        v52 = nil;
                        v52 = if v48.key == nil and #v50.routes > 0 then #v50.routes else l_Array_0.findIndex(v50.routes, function(v91) --[[ Line: 481 ]]
                            -- upvalues: v48 (copy)
                            return v91.key == v48.key;
                        end);
                        if v52 > 0 then
                            local l_routeName_4 = v48.routeName;
                            if v32[l_routeName_4] == nil and v28[l_routeName_4] ~= nil then
                                local v93 = l_getScreenForRouteName_0(v28, l_routeName_4);
                                if typeof(v93) == "table" and v93.router then
                                    v32[l_routeName_4] = v93.router;
                                else
                                    v32[l_routeName_4] = false;
                                end;
                            end;
                            local v94 = v32[l_routeName_4];
                            l_routeName_4 = {};
                            if v94 then
                                local v95 = v48.action or v2.Actions.init({
                                    params = if v48.params == l_Object_0.None then nil else v48.params
                                });
                                l_routeName_4 = v94.getStateForAction(v95);
                            end;
                            local v96 = table.clone(v50.routes);
                            local l_assign_2 = l_Object_0.assign;
                            local v98 = {
                                params = if v48.params == l_Object_0.None then nil else v48.params
                            };
                            local l_l_routeName_4_0 = l_routeName_4;
                            local v100 = {
                                routeName = v48.routeName
                            };
                            local l_newKey_0 = v48.newKey;
                            if not l_newKey_0 then
                                v13 = v13 + 1;
                                l_newKey_0 = ("id-%*-%*"):format(v12, (tostring(v13)));
                            end;
                            v100.key = l_newKey_0;
                            v96[v52] = l_assign_2(v98, l_l_routeName_4_0, v100);
                            return l_Object_0.assign(table.clone(v50), {
                                routes = v96
                            });
                        end;
                    end;
                    if v48.type == v11.CompleteTransition and (v48.key == nil or v48.key == v50.key) and v48.toChildKey == v50.routes[v50.index].key and v50.isTransitioning then
                        return l_Object_0.assign(table.clone(v50), {
                            isTransitioning = false
                        });
                    else
                        if v48.type == v11.SetParams then
                            v52 = v48.key;
                            local l_v52_0 = v52 --[[ copy: 4 -> 19 ]];
                            local v104 = l_Array_0.findIndex(v50.routes, function(v103) --[[ Line: 528 ]]
                                -- upvalues: l_v52_0 (copy)
                                return v103.key == l_v52_0;
                            end);
                            if v104 > 0 then
                                local v105 = v50.routes[v104];
                                local l_None_0 = l_Object_0.None;
                                if v48.params ~= l_Object_0.None then
                                    l_None_0 = if v105.params and v48.params then l_Object_0.assign(table.clone(v105.params), v48.params) else if v105.params then table.clone(v105.params) else if v48.params then table.clone(v48.params) else {};
                                end;
                                local v107 = table.clone(v50.routes);
                                v107[v104] = l_Object_0.assign(table.clone(v105), {
                                    params = l_None_0
                                });
                                return l_Object_0.assign(table.clone(v50), {
                                    routes = v107
                                });
                            end;
                        end;
                        if v48.type == v11.Reset then
                            if v48.key ~= nil and v48.key ~= v50.key then
                                return v50;
                            else
                                v52 = if v48.actions then l_Array_0.map(v48.actions, function(v108) --[[ Line: 559 ]]
                                    -- upvalues: v32 (ref), v28 (ref), l_getScreenForRouteName_0 (ref), v2 (ref), l_Object_0 (ref), v13 (ref), v12 (ref)
                                    local l_routeName_5 = v108.routeName;
                                    if v32[l_routeName_5] == nil and v28[l_routeName_5] ~= nil then
                                        local v110 = l_getScreenForRouteName_0(v28, l_routeName_5);
                                        if typeof(v110) == "table" and v110.router then
                                            v32[l_routeName_5] = v110.router;
                                        else
                                            v32[l_routeName_5] = false;
                                        end;
                                    end;
                                    local v111 = v32[l_routeName_5];
                                    l_routeName_5 = {};
                                    if v111 then
                                        local v112 = v108.action or v2.Actions.init({
                                            params = if v108.params == l_Object_0.None then nil else v108.params
                                        });
                                        l_routeName_5 = v111.getStateForAction(v112);
                                    end;
                                    local l_assign_3 = l_Object_0.assign;
                                    local v114 = {
                                        params = if v108.params == l_Object_0.None then nil else v108.params
                                    };
                                    local l_l_routeName_5_0 = l_routeName_5;
                                    local v116 = {
                                        routeName = v108.routeName
                                    };
                                    local l_key_4 = v108.key;
                                    if not l_key_4 then
                                        v13 = v13 + 1;
                                        l_key_4 = ("id-%*-%*"):format(v12, (tostring(v13)));
                                    end;
                                    v116.key = l_key_4;
                                    return l_assign_3(v114, l_l_routeName_5_0, v116);
                                end) else {};
                                return l_Object_0.assign(table.clone(v50), {
                                    routes = v52, 
                                    index = v48.index
                                });
                            end;
                        else
                            if v48.type == v11.Back or v48.type == v11.Pop then
                                v52 = v48.key;
                                local l_n_0 = v48.n;
                                local l_immediate_0 = v48.immediate;
                                local l_prune_0 = v48.prune;
                                if v48.type == v11.Pop and l_prune_0 == false and v52 then
                                    local l_v52_1 = v52 --[[ copy: 4 -> 18 ]];
                                    local v123 = l_Array_0.findIndex(v50.routes, function(v122) --[[ Line: 598 ]]
                                        -- upvalues: l_v52_1 (copy)
                                        return v122.key == l_v52_1;
                                    end);
                                    if v123 > 0 then
                                        local v124 = math.max(v123 - (l_n_0 or 1), 1);
                                        local v125 = l_Array_0.concat(l_Array_0.slice(v50.routes, 1, v124 + 1), l_Array_0.slice(v50.routes, v123 + 1));
                                        if #v125 > 0 then
                                            return l_Object_0.assign(table.clone(v50), {
                                                routes = v125, 
                                                index = #v125, 
                                                isTransitioning = l_immediate_0 ~= true
                                            });
                                        end;
                                    end;
                                else
                                    local l_index_0 = v50.index;
                                    if v48.type == v11.Pop and l_n_0 ~= nil then
                                        l_index_0 = math.max(2, v50.index - l_n_0 + 1);
                                    elseif v52 then
                                        local l_v52_2 = v52 --[[ copy: 4 -> 17 ]];
                                        l_index_0 = l_Array_0.findIndex(v50.routes, function(v128) --[[ Line: 623 ]]
                                            -- upvalues: l_v52_2 (copy)
                                            return v128.key == l_v52_2;
                                        end);
                                    end;
                                    if l_index_0 > 1 then
                                        return l_Object_0.assign(table.clone(v50), {
                                            routes = l_Array_0.slice(v50.routes, 1, l_index_0), 
                                            index = l_index_0 - 1, 
                                            isTransitioning = l_immediate_0 ~= true
                                        });
                                    end;
                                end;
                            end;
                            v52 = v48.key;
                            local v129 = if v52 then v9.indexOf(v50, v52) else nil;
                            for v130 = #v50.routes, 1, -1 do
                                local v131 = v50.routes[v130];
                                if v131.key ~= v51.key and (v129 == 1 or v131.key == v52) then
                                    local l_routeName_6 = v131.routeName;
                                    if v32[l_routeName_6] == nil and v28[l_routeName_6] ~= nil then
                                        local v133 = l_getScreenForRouteName_0(v28, l_routeName_6);
                                        if typeof(v133) == "table" and v133.router then
                                            v32[l_routeName_6] = v133.router;
                                        else
                                            v32[l_routeName_6] = false;
                                        end;
                                    end;
                                    local v134 = v32[l_routeName_6];
                                    if v134 then
                                        l_routeName_6 = v134.getStateForAction(v48, v131);
                                        if l_routeName_6 == nil then
                                            return v50;
                                        elseif l_routeName_6 ~= v131 then
                                            return v9.replaceAt(v50, v131.key, l_routeName_6, v48.preserveFocus);
                                        end;
                                    end;
                                end;
                            end;
                            return v50;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v137(v136) --[[ Line: 678 ]] --[[ Name: getComponentForRouteName ]]
        -- upvalues: l_getScreenForRouteName_0 (ref), v28 (copy)
        return l_getScreenForRouteName_0(v28, v136);
    end;
    local function v154(v138, v139) --[[ Line: 682 ]] --[[ Name: getActionCreators ]]
        -- upvalues: v29 (copy), l_Object_0 (ref), v2 (ref), l___DEV___0 (ref)
        local v140 = v29.getCustomActionCreators or function() --[[ Line: 684 ]]
            return {};
        end;
        return l_Object_0.assign(table.clone(v140(v138, v139)), {
            pop = function(v141, v142) --[[ Line: 688 ]] --[[ Name: pop ]]
                -- upvalues: v2 (ref), l_Object_0 (ref)
                return v2.StackActions.pop(l_Object_0.assign({
                    n = v141
                }, v142 or {}));
            end, 
            popToTop = function(v143) --[[ Line: 691 ]] --[[ Name: popToTop ]]
                -- upvalues: v2 (ref)
                return v2.StackActions.popToTop(v143);
            end, 
            push = function(v144, v145, v146) --[[ Line: 694 ]] --[[ Name: push ]]
                -- upvalues: v2 (ref)
                return v2.StackActions.push({
                    routeName = v144, 
                    params = v145, 
                    action = v146
                });
            end, 
            replace = function(v147, v148, v149, v150) --[[ Line: 701 ]] --[[ Name: replace ]]
                -- upvalues: v2 (ref), v138 (copy), l___DEV___0 (ref)
                if typeof(v147) == "string" then
                    return v2.StackActions.replace({
                        routeName = v147, 
                        params = v148, 
                        action = v149, 
                        key = v138.key, 
                        newKey = v150
                    });
                else
                    if l___DEV___0 then
                        assert(typeof(v147) == "table", "replaceWith must be a table or string");
                        assert(v148 == nil, "params must not be provided to .replace() when specifying a table");
                        assert(v149 == nil, "Child action must not be provided to .replace() when specifying a table");
                        assert(v150 == nil, "newKey must not be provided to .replace() when specifying a table");
                    end;
                    return v2.StackActions.replace(v147);
                end;
            end, 
            reset = function(v151, v152) --[[ Line: 721 ]] --[[ Name: reset ]]
                -- upvalues: v2 (ref), v139 (copy)
                local l_v152_0 = v152;
                if v152 == nil then
                    l_v152_0 = #v151;
                end;
                return v2.StackActions.reset({
                    actions = v151, 
                    index = l_v152_0, 
                    key = v139
                });
            end, 
            dismiss = function() --[[ Line: 733 ]] --[[ Name: dismiss ]]
                -- upvalues: v2 (ref), v139 (copy)
                return v2.Actions.back({
                    key = v139
                });
            end
        });
    end;
    return {
        childRouters = v32, 
        getStateForAction = v135, 
        getComponentForRouteName = v137, 
        getActionCreators = v154, 
        getScreenOptions = l_createConfigGetter_0(v28, v29.defaultNavigationOptions)
    };
end;