local l_Parent_0 = script:FindFirstAncestor("RobloxAppNavigationCore").Parent;
local _ = require(l_Parent_0.Navigation);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v17 = {
    get = function(v5, v6) --[[ Line: 33 ]] --[[ Name: get ]]
        for _, v8 in v5.routes do
            if v8.key == v6 then
                return v8;
            end;
        end;
        return nil;
    end, 
    indexOf = function(v9, v10) --[[ Line: 44 ]] --[[ Name: indexOf ]]
        for v11, v12 in v9.routes do
            if v12.key == v10 then
                return v11;
            end;
        end;
        return nil;
    end, 
    has = function(v13, v14) --[[ Line: 56 ]] --[[ Name: has ]]
        for _, v16 in v13.routes do
            if v16.key == v14 then
                return true;
            end;
        end;
        return false;
    end
};
v17.push = function(v18, v19) --[[ Line: 67 ]] --[[ Name: push ]]
    -- upvalues: v17 (copy), l_Array_0 (copy), l_Object_0 (copy)
    assert(v17.indexOf(v18, v19.key) == nil, ("should not push route with duplicated key %s"):format(v19.key));
    local v20 = l_Array_0.concat(v18.routes, {
        v19
    });
    return l_Object_0.assign(table.clone(v18), {
        index = #v20, 
        routes = v20
    });
end;
v17.pop = function(v21) --[[ Line: 82 ]] --[[ Name: pop ]]
    -- upvalues: l_Object_0 (copy)
    if v21.index <= 1 then
        return v21;
    else
        local v22 = table.clone(v21.routes);
        table.remove(v22, #v22);
        return l_Object_0.assign(table.clone(v21), {
            index = #v22, 
            routes = v22
        });
    end;
end;
v17.jumpToIndex = function(v23, v24) --[[ Line: 97 ]] --[[ Name: jumpToIndex ]]
    -- upvalues: l_Object_0 (copy)
    if v24 == v23.index then
        return v23;
    else
        assert(v23.routes[v24] ~= nil, ("invalid index %d to jump to"):format(v24));
        return l_Object_0.assign(table.clone(v23), {
            index = v24
        });
    end;
end;
v17.jumpTo = function(v25, v26) --[[ Line: 110 ]] --[[ Name: jumpTo ]]
    -- upvalues: v17 (copy)
    local v27 = v17.indexOf(v25, v26);
    assert(v27 ~= nil, ("attempt to jump to unknown key \"%s\""):format(v26));
    return v17.jumpToIndex(v25, v27);
end;
v17.back = function(v28) --[[ Line: 118 ]] --[[ Name: back ]]
    -- upvalues: v17 (copy)
    local v29 = v28.index - 1;
    if not v28.routes[v29] then
        return v28;
    else
        return v17.jumpToIndex(v28, v29);
    end;
end;
v17.forward = function(v30) --[[ Line: 128 ]] --[[ Name: forward ]]
    -- upvalues: v17 (copy)
    local v31 = v30.index + 1;
    if not v30.routes[v31] then
        return v30;
    else
        return v17.jumpToIndex(v30, v31);
    end;
end;
v17.replaceAndPrune = function(v32, v33, v34) --[[ Line: 139 ]] --[[ Name: replaceAndPrune ]]
    -- upvalues: v17 (copy), l_Object_0 (copy)
    local v35 = v17.indexOf(v32, v33);
    local v36 = v17.replaceAtIndex(v32, v35, v34);
    return l_Object_0.assign(table.clone(v36), {
        routes = {
            unpack(v36.routes, 1, v35)
        }
    });
end;
v17.replaceAt = function(v37, v38, v39, v40) --[[ Line: 151 ]] --[[ Name: replaceAt ]]
    -- upvalues: v17 (copy)
    local v41 = v17.indexOf(v37, v38);
    local v42 = if v40 then v37.index else v41;
    local v43 = v17.replaceAtIndex(v37, v41, v39);
    v43.index = v42;
    return v43;
end;
v17.replaceAtIndex = function(v44, v45, v46) --[[ Line: 161 ]] --[[ Name: replaceAtIndex ]]
    -- upvalues: l_Object_0 (copy)
    assert(v44.routes[v45] ~= nil, ("invalid index %d for replacing route %s"):format(v45, v46.key));
    if v44.routes[v45] == v46 and v45 == v44.index then
        return v44;
    else
        local v47 = table.clone(v44.routes);
        v47[v45] = v46;
        return l_Object_0.assign(table.clone(v44), {
            index = v45, 
            routes = v47
        });
    end;
end;
v17.reset = function(v48, v49, v50) --[[ Line: 180 ]] --[[ Name: reset ]]
    -- upvalues: l_Object_0 (copy)
    local v51 = false;
    if type(v49) == "table" then
        v51 = #v49 > 0;
    end;
    assert(v51, "invalid routes to replace");
    local v52 = v50 or #v49;
    if #v48.routes == #v49 and v48.index == v52 then
        v51 = true;
        for v53 = 1, #v49 do
            if v48.routes[v53] ~= v49[v53] then
                v51 = false;
                break;
            end;
        end;
        if v51 then
            return v48;
        end;
    end;
    assert(v49[v52] ~= nil, ("invalid index %d to reset"):format(v52));
    return l_Object_0.assign(table.clone(v48), {
        index = v52, 
        routes = v49
    });
end;
return v17;