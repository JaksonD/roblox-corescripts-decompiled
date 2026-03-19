local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_0.utils.TableUtilities);
local v6 = require(l_Parent_0.utils.invariant);
local function v10(v7, v8) --[[ Line: 12 ]] --[[ Name: compareScenes ]]
    if v7.index == v8.index then
        local v9 = #v7.key - #v8.key;
        if v9 == 0 then
            return v7.key < v8.key;
        else
            return v9 < 0;
        end;
    else
        return v7.index < v8.index;
    end;
end;
local function _(v11, v12) --[[ Line: 27 ]] --[[ Name: routesAreShallowEqual ]]
    -- upvalues: v5 (copy)
    if not v11 or not v12 then
        return v11 == v12;
    elseif v11.key ~= v12.key then
        return false;
    else
        return v5.ShallowEqual(v11, v12);
    end;
end;
local function _(v14, v15) --[[ Line: 39 ]] --[[ Name: scenesAreShallowEqual ]]
    -- upvalues: v5 (copy)
    local v16 = false;
    if v14.key == v15.key then
        v16 = false;
        if v14.index == v15.index then
            v16 = false;
            if v14.isStale == v15.isStale then
                v16 = false;
                if v14.isActive == v15.isActive then
                    if not v14 or not v15 then
                        return v14 == v15;
                    elseif v14.key ~= v15.key then
                        return false;
                    else
                        v16 = v5.ShallowEqual(v14, v15);
                    end;
                end;
            end;
        end;
    end;
    return v16;
end;
return function(v18, v19, v20, v21) --[[ Line: 48 ]]
    -- upvalues: l_Array_0 (copy), v6 (copy), v5 (copy), v10 (copy), l_Object_0 (copy)
    for _, v23 in v18 do
        local l_route_0 = v23.route;
        if v21 and v21[l_route_0.key] then
            v23.descriptor = v21[l_route_0.key];
        end;
    end;
    if v20 == v19 then
        return v18;
    else
        local v25 = {};
        local v26 = {};
        local v27 = {};
        for _, v29 in v18 do
            local l_key_0 = v29.key;
            if v29.isStale then
                v27[l_key_0] = v29;
            end;
            v25[l_key_0] = v29;
        end;
        local v31 = {};
        local l_routes_0 = v19.routes;
        if #l_routes_0 > v19.index then
            print("Warning: StackRouter provided invalid state. Index should always be the top route");
            l_routes_0 = l_Array_0.slice(l_routes_0, 1, v19.index);
        end;
        for v33, v34 in l_routes_0 do
            local v35 = "scene_" .. v34.key;
            local v36 = if v21 then v21[v34.key] else nil;
            local v37 = {
                index = v33, 
                isActive = false, 
                isStale = false, 
                key = v35, 
                route = v34, 
                descriptor = v36
            };
            v6(not v31[v35], "navigation.state.routes[%d].key '%s' conflicts with another route!", v33, v35);
            v31[v35] = true;
            if v27[v35] then
                v27[v35] = nil;
            end;
            v26[v35] = v37;
        end;
        if v20 then
            local l_routes_1 = v20.routes;
            if #l_routes_1 > v20.index then
                print("StackRouter provided invalid state. Index should always be the top route.");
                l_routes_1 = l_Array_0.slice(l_routes_1, 1, v20.index);
            end;
            for v39, v40 in l_routes_1 do
                local v41 = "scene_" .. v40.key;
                if not v26[v41] then
                    local v42 = nil;
                    for _, v44 in v18 do
                        if v44.route.key == v40.key then
                            v42 = v44;
                            break;
                        end;
                    end;
                    local v45 = v21[v40.key];
                    if v42 then
                        v45 = v42.descriptor;
                    end;
                    if v45 then
                        v27[v41] = {
                            index = v39, 
                            isActive = false, 
                            isStale = true, 
                            key = v41, 
                            route = v40, 
                            descriptor = v45
                        };
                    end;
                end;
            end;
        end;
        local v46 = {};
        local function _(v47) --[[ Line: 155 ]] --[[ Name: mergeScene ]]
            -- upvalues: v25 (copy), v5 (ref), v46 (copy)
            local v48 = v25[v47.key] or nil;
            if v48 then
                local v49 = false;
                if v48.key == v47.key then
                    v49 = false;
                    if v48.index == v47.index then
                        v49 = false;
                        if v48.isStale == v47.isStale then
                            v49 = false;
                            if v48.isActive == v47.isActive then
                                v49 = if v48 and v47 then not (v48.key ~= v47.key) and v5.ShallowEqual(v48, v47) else v48 == v47;
                            end;
                        end;
                    end;
                end;
                if v49 then
                    table.insert(v46, v48);
                    return;
                end;
            end;
            table.insert(v46, v47);
        end;
        for _, v52 in v27 do
            local v53 = v25[v52.key] or nil;
            if v53 then
                local v54 = false;
                if v53.key == v52.key then
                    v54 = false;
                    if v53.index == v52.index then
                        v54 = false;
                        if v53.isStale == v52.isStale then
                            v54 = false;
                            if v53.isActive == v52.isActive then
                                v54 = if v53 and v52 then not (v53.key ~= v52.key) and v5.ShallowEqual(v53, v52) else v53 == v52;
                            end;
                        end;
                    end;
                end;
                if v54 then
                    table.insert(v46, v53);
                    continue;
                end;
            end;
            table.insert(v46, v52);
        end;
        for _, v56 in v26 do
            local v57 = v25[v56.key] or nil;
            if v57 then
                local v58 = false;
                if v57.key == v56.key then
                    v58 = false;
                    if v57.index == v56.index then
                        v58 = false;
                        if v57.isStale == v56.isStale then
                            v58 = false;
                            if v57.isActive == v56.isActive then
                                v58 = if v57 and v56 then not (v57.key ~= v56.key) and v5.ShallowEqual(v57, v56) else v57 == v56;
                            end;
                        end;
                    end;
                end;
                if v58 then
                    table.insert(v46, v57);
                    continue;
                end;
            end;
            table.insert(v46, v56);
        end;
        table.sort(v46, v10);
        local v59 = 0;
        for v60, v61 in v46 do
            local v62 = not v61.isStale and v61.index == v19.index;
            if v62 ~= v61.isActive then
                v46[v60] = l_Object_0.assign(table.clone(v61), {
                    isActive = v62
                });
            end;
            if v62 then
                v59 = v59 + 1;
            end;
        end;
        v6(v59 == 1, "There should only be one active scene, not %d", v59);
        if #v46 ~= #v18 then
            return v46;
        else
            for v63, v64 in v46 do
                local v65 = v18[v63];
                local v66 = false;
                if v65.key == v64.key then
                    v66 = false;
                    if v65.index == v64.index then
                        v66 = false;
                        if v65.isStale == v64.isStale then
                            v66 = false;
                            if v65.isActive == v64.isActive then
                                v66 = if v65 and v64 then not (v65.key ~= v64.key) and v5.ShallowEqual(v65, v64) else v65 == v64;
                            end;
                        end;
                    end;
                end;
                if not v66 then
                    return v46;
                end;
            end;
            return v18;
        end;
    end;
end;