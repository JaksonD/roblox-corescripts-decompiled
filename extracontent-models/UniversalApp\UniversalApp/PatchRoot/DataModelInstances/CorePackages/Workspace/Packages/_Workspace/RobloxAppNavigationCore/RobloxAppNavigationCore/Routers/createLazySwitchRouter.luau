local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local l_inspectRouteEntry_0 = require(l_Parent_0.Navigation).inspectRouteEntry;
local v2 = require(l_Parent_0.RoactNavigation);
local l_createConfigGetter_0 = v2.createConfigGetter;
local l_getScreenForRouteName_0 = v2.getScreenForRouteName;
local l_validateRouteConfigMap_0 = v2.validateRouteConfigMap;
local l_StackActions_0 = v2.StackActions;
local l_BackBehavior_0 = v2.BackBehavior;
local v8 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v8.Array;
local l_Object_0 = v8.Object;
local l_FFlagFixInactiveChildStateForwarding_0 = require(l_Parent_0.SharedFlags).FFlagFixInactiveChildStateForwarding;
local l___DEV___0 = _G.__DEV__;
local v13 = {
    Init = v2.Actions.Init, 
    Back = v2.Actions.Back, 
    Navigate = v2.Actions.Navigate, 
    SetParams = v2.Actions.SetParams
};
return function(v14, v15) --[[ Line: 64 ]]
    -- upvalues: l_Array_0 (copy), l_inspectRouteEntry_0 (copy), l___DEV___0 (copy), l_validateRouteConfigMap_0 (copy), l_BackBehavior_0 (copy), l_getScreenForRouteName_0 (copy), v2 (copy), l_Object_0 (copy), v13 (copy), l_StackActions_0 (copy), l_FFlagFixInactiveChildStateForwarding_0 (copy), l_createConfigGetter_0 (copy)
    local v17 = l_Array_0.map(v14, function(v16) --[[ Line: 70 ]]
        -- upvalues: l_inspectRouteEntry_0 (ref)
        return (l_inspectRouteEntry_0(v16));
    end);
    local v21 = l_Array_0.reduce(v17, function(v18, v19, v20) --[[ Line: 77 ]]
        v18[v19] = v20;
        return v18;
    end, {});
    local v26 = l_Array_0.reduce(v14, function(v22, v23) --[[ Line: 86 ]]
        -- upvalues: l_inspectRouteEntry_0 (ref)
        local v24, v25 = l_inspectRouteEntry_0(v23);
        v22[v24] = v25;
        return v22;
    end, {});
    if l___DEV___0 then
        l_validateRouteConfigMap_0(v26);
    end;
    local v27 = v15 or {};
    local v28 = v27.initialRouteName or v17[1];
    local v29 = v27.backBehavior or l_BackBehavior_0.None;
    if l___DEV___0 and v26[v28] == nil then
        local v30 = table.concat(v17, ", ");
        error((("Invalid initialRouteName: '%*'. Should be one of: %*"):format(v28, v30)));
    end;
    local v31 = {};
    local function _(v32) --[[ Line: 111 ]] --[[ Name: getChildRouter ]]
        -- upvalues: v31 (copy), v26 (copy), l_getScreenForRouteName_0 (ref)
        if v31[v32] == nil and v26[v32] ~= nil then
            local v33 = l_getScreenForRouteName_0(v26, v32);
            if typeof(v33) == "table" and v33.router then
                v31[v32] = v33.router;
            else
                v31[v32] = false;
            end;
        end;
        return v31[v32];
    end;
    local function v41(v35) --[[ Line: 126 ]] --[[ Name: initializeChildRoute ]]
        -- upvalues: v31 (copy), v26 (copy), l_getScreenForRouteName_0 (ref), v2 (ref), l_Object_0 (ref)
        local v36 = {
            key = v35, 
            routeName = v35
        };
        if v31[v35] == nil and v26[v35] ~= nil then
            local v37 = l_getScreenForRouteName_0(v26, v35);
            if typeof(v37) == "table" and v37.router then
                v31[v35] = v37.router;
            else
                v31[v35] = false;
            end;
        end;
        local v38 = v31[v35];
        if v38 then
            local v39 = v2.Actions.init();
            local v40 = v38.getStateForAction(v39);
            v36 = l_Object_0.assign(table.clone(v40), v36);
        end;
        return v36;
    end;
    local function _() --[[ Line: 142 ]] --[[ Name: getInitialState ]]
        -- upvalues: v41 (copy), v28 (copy)
        return {
            routes = {
                (v41(v28))
            }, 
            index = 1
        };
    end;
    local function v48(v43, v44, v45) --[[ Line: 149 ]] --[[ Name: getNextState ]]
        -- upvalues: v29 (copy), l_BackBehavior_0 (ref), v13 (ref), l_Object_0 (ref)
        if v29 ~= l_BackBehavior_0.History or v44 and v44.routes[v44.index].key == v45.routes[v45.index].key then
            return v45;
        else
            local v46 = v44 and v44.routeKeyHistory or {};
            if v43.type == v13.Init then
                v46 = {
                    v45.routes[v45.index].key
                };
            elseif v43.type == v13.Navigate then
                local l_key_0 = v45.routes[v45.index].key;
                v46 = table.clone(v46);
                table.insert(v46, l_key_0);
            elseif v43.type == v13.Back then
                v46 = table.clone(v46);
                table.remove(v46);
            end;
            return l_Object_0.assign(table.clone(v45), {
                routeKeyHistory = v46
            });
        end;
    end;
    local function v54(v49, v50) --[[ Line: 178 ]] --[[ Name: sortRoutes ]]
        -- upvalues: v21 (copy), l_Array_0 (ref)
        table.sort(v49, function(v51, v52) --[[ Line: 179 ]]
            -- upvalues: v21 (ref)
            return v21[v51.routeName] < v21[v52.routeName];
        end);
        return l_Array_0.findIndex(v49, function(v53) --[[ Line: 182 ]]
            -- upvalues: v50 (copy)
            return v53.key == v50;
        end);
    end;
    local function v99(v55, v56) --[[ Line: 187 ]] --[[ Name: getStateForAction ]]
        -- upvalues: v41 (copy), v28 (copy), v13 (ref), v48 (copy), v31 (copy), v26 (copy), l_getScreenForRouteName_0 (ref), l_Object_0 (ref), v29 (copy), l_BackBehavior_0 (ref), v17 (copy), l_Array_0 (ref), v54 (copy), l_StackActions_0 (ref), l_FFlagFixInactiveChildStateForwarding_0 (ref)
        local v57 = v56 or {
            routes = {
                (v41(v28))
            }, 
            index = 1
        };
        if v55.type == v13.Init then
            return v48(v55, v56, v57);
        else
            local v58 = v57.routes[v57.index];
            local l_routeName_0 = v58.routeName;
            if v31[l_routeName_0] == nil and v26[l_routeName_0] ~= nil then
                local v60 = l_getScreenForRouteName_0(v26, l_routeName_0);
                if typeof(v60) == "table" and v60.router then
                    v31[l_routeName_0] = v60.router;
                else
                    v31[l_routeName_0] = false;
                end;
            end;
            local v61 = v31[l_routeName_0];
            if v61 then
                l_routeName_0 = v61.getStateForAction(v55, v58);
                if l_routeName_0 == nil then
                    if v56 == nil then
                        return v48(v55, v56, v57);
                    else
                        return nil;
                    end;
                elseif l_routeName_0 ~= v58 then
                    local v62 = table.clone(v57.routes);
                    v62[v57.index] = l_routeName_0;
                    local v63 = l_Object_0.assign(table.clone(v57), {
                        routes = v62
                    });
                    return v48(v55, v56, v63);
                end;
            end;
            if v55.type == v13.Back then
                v58 = v57.routes[v57.index];
                v61 = true;
                if v55.key ~= nil then
                    v61 = v55.key == v58.key;
                end;
                if v61 then
                    l_routeName_0 = v58.key;
                    if v29 == l_BackBehavior_0.InitialRoute then
                        l_routeName_0 = v28;
                    elseif v29 == l_BackBehavior_0.Order then
                        l_routeName_0 = v17[math.max(1, table.find(v17, l_routeName_0) - 1)];
                    elseif v29 == l_BackBehavior_0.History then
                        local l_routeKeyHistory_0 = v57.routeKeyHistory;
                        if #l_routeKeyHistory_0 > 1 then
                            l_routeName_0 = l_routeKeyHistory_0[#l_routeKeyHistory_0 - 1];
                        end;
                    end;
                    if l_routeName_0 ~= v58.key then
                        local v66 = l_Array_0.findIndex(v57.routes, function(v65) --[[ Line: 246 ]]
                            -- upvalues: l_routeName_0 (ref)
                            return v65.key == l_routeName_0;
                        end);
                        if v66 > 0 then
                            local v67 = l_Object_0.assign(table.clone(v57), {
                                index = v66
                            });
                            return v48(v55, v56, v67);
                        else
                            local v68 = table.clone(v57.routes);
                            table.insert(v68, (v41(l_routeName_0)));
                            local v69 = l_Object_0.assign(table.clone(v57), {
                                routes = v68, 
                                index = v54(v68, l_routeName_0)
                            });
                            return v48(v55, v56, v69);
                        end;
                    else
                        --[[ close >= 5 ]]
                    end;
                end;
            end;
            if v55.type == v13.Navigate then
                v58 = v55.routeName;
                if v26[v58] ~= nil then
                    v61 = l_Array_0.findIndex(v57.routes, function(v70) --[[ Line: 271 ]]
                        -- upvalues: v58 (copy)
                        return v70.routeName == v58;
                    end);
                    l_routeName_0 = v57.routes[v61];
                    local l_l_routeName_0_0 = l_routeName_0;
                    if v61 < 0 then
                        l_l_routeName_0_0 = v41(v58);
                    end;
                    if v55.action then
                        if v31[v58] == nil and v26[v58] ~= nil then
                            local v72 = l_getScreenForRouteName_0(v26, v58);
                            if typeof(v72) == "table" and v72.router then
                                v31[v58] = v72.router;
                            else
                                v31[v58] = false;
                            end;
                        end;
                        local v73 = v31[v58];
                        if v73 then
                            local v74 = v73.getStateForAction(v55.action, l_l_routeName_0_0);
                            if v74 then
                                l_l_routeName_0_0 = v74;
                            end;
                        end;
                    end;
                    if v55.params then
                        l_l_routeName_0_0 = l_Object_0.assign(table.clone(l_l_routeName_0_0), {
                            params = if v55.params == l_Object_0.None then l_Object_0.None else if l_l_routeName_0_0.params then l_Object_0.assign(table.clone(l_l_routeName_0_0.params), v55.params) else v55.params
                        });
                    end;
                    if v61 < 0 then
                        local v75 = table.clone(v57.routes);
                        table.insert(v75, l_l_routeName_0_0);
                        local v76 = l_Object_0.assign(table.clone(v57), {
                            routes = v75, 
                            index = v54(v75, v58)
                        });
                        return v48(v55, v56, v76);
                    elseif l_routeName_0 ~= l_l_routeName_0_0 then
                        local v77 = table.clone(v57.routes);
                        v77[v61] = l_l_routeName_0_0;
                        local v78 = l_Object_0.assign(table.clone(v57), {
                            routes = v77, 
                            index = v61
                        });
                        return v48(v55, v56, v78);
                    elseif v57.index ~= v61 then
                        local v79 = l_Object_0.assign(table.clone(v57), {
                            index = v61
                        });
                        return v48(v55, v56, v79);
                    elseif v56 == nil then
                        return v48(v55, v56, v57);
                    else
                        return nil;
                    end;
                end;
            end;
            if v55.type == v13.SetParams then
                v58 = l_Array_0.findIndex(v57.routes, function(v80) --[[ Line: 330 ]]
                    -- upvalues: v55 (copy)
                    return v80.key == v55.key;
                end);
                if v58 > 0 then
                    v61 = v57.routes[v58];
                    l_routeName_0 = l_Object_0.None;
                    if v55.params ~= l_Object_0.None then
                        l_routeName_0 = if v61.params and v55.params then l_Object_0.assign(table.clone(v61.params), v55.params) else v55.params or v61.params or {};
                    end;
                    local v81 = table.clone(v57.routes);
                    v81[v58] = l_Object_0.assign(table.clone(v61), {
                        params = l_routeName_0
                    });
                    local v82 = l_Object_0.assign(table.clone(v57), {
                        routes = v81
                    });
                    return v48(v55, v56, v82);
                end;
            end;
            v58 = true;
            if v55.type ~= v13.Back then
                v58 = true;
                if v55.type ~= l_StackActions_0.Pop then
                    v58 = v55.type == l_StackActions_0.PopToTop;
                end;
            end;
            if not v58 or v55.type == v13.Back and v55.key ~= nil then
                l_routeName_0 = v57.index;
                local l_routes_0 = v57.routes;
                local l_routeName_1 = l_routes_0[l_routeName_0].routeName;
                local v88 = l_Array_0.reduce(l_routes_0, function(v85, v86, v87) --[[ Line: 370 ]]
                    v85[v86.routeName] = v87;
                    return v85;
                end, {});
                for _, v90 in v17 do
                    if v90 ~= l_routeName_1 then
                        if v31[v90] == nil and v26[v90] ~= nil then
                            local v91 = l_getScreenForRouteName_0(v26, v90);
                            if typeof(v91) == "table" and v91.router then
                                v31[v90] = v91.router;
                            else
                                v31[v90] = false;
                            end;
                        end;
                        local v92 = v31[v90];
                        if v92 then
                            local v93 = v88[v90];
                            if v93 == nil then
                                local v94 = v41(v90);
                                local v95 = v92.getStateForAction(v55, v94);
                                if not v95 then
                                    l_routes_0 = table.clone(l_routes_0);
                                    table.insert(l_routes_0, v94);
                                    l_routeName_0 = v54(l_routes_0, v90);
                                    break;
                                elseif v95 ~= v94 then
                                    l_routes_0 = table.clone(l_routes_0);
                                    table.insert(l_routes_0, v95);
                                    l_routeName_0 = v54(l_routes_0, v90);
                                    break;
                                end;
                            else
                                local v96 = l_routes_0[v93];
                                local v97 = v92.getStateForAction(v55, v96);
                                if not v97 then
                                    l_routeName_0 = v93;
                                    break;
                                elseif v97 ~= v96 then
                                    l_routes_0 = table.clone(l_routes_0);
                                    l_routes_0[v93] = if l_FFlagFixInactiveChildStateForwarding_0 then v97 else v96;
                                    l_routeName_0 = v93;
                                    break;
                                end;
                            end;
                        end;
                    end;
                end;
                if v55.preserveFocus then
                    l_routeName_0 = v57.index;
                end;
                if l_routeName_0 ~= v57.index or l_routes_0 ~= v57.routes then
                    local v98 = l_Object_0.assign(table.clone(v57), {
                        index = l_routeName_0, 
                        routes = l_routes_0
                    });
                    return v48(v55, v56, v98);
                end;
            end;
            return v57;
        end;
    end;
    local function v101(v100) --[[ Line: 440 ]] --[[ Name: getComponentForRouteName ]]
        -- upvalues: l_getScreenForRouteName_0 (ref), v26 (copy)
        return l_getScreenForRouteName_0(v26, v100);
    end;
    return {
        childRouters = v31, 
        getStateForAction = v99, 
        getComponentForRouteName = v101, 
        getActionCreators = function(v102, v103) --[[ Line: 444 ]] --[[ Name: getActionCreators ]]
            -- upvalues: v27 (copy)
            return (v27.getCustomActionCreators or function() --[[ Line: 446 ]]
                return {};
            end)(v102, v103);
        end, 
        getScreenOptions = l_createConfigGetter_0(v26, v27.defaultNavigationOptions)
    };
end;