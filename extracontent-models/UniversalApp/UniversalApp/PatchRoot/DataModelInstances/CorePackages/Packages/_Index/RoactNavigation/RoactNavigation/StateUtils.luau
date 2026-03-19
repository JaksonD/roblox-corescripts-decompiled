local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v16 = {
    get = function(v4, v5) --[[ Line: 31 ]] --[[ Name: get ]]
        for _, v7 in v4.routes do
            if v7.key == v5 then
                return v7;
            end;
        end;
        return nil;
    end, 
    indexOf = function(v8, v9) --[[ Line: 42 ]] --[[ Name: indexOf ]]
        for v10, v11 in v8.routes do
            if v11.key == v9 then
                return v10;
            end;
        end;
        return nil;
    end, 
    has = function(v12, v13) --[[ Line: 54 ]] --[[ Name: has ]]
        for _, v15 in v12.routes do
            if v15.key == v13 then
                return true;
            end;
        end;
        return false;
    end
};
v16.push = function(v17, v18) --[[ Line: 65 ]] --[[ Name: push ]]
    -- upvalues: v16 (copy), l_Array_0 (copy), l_Object_0 (copy)
    assert(v16.indexOf(v17, v18.key) == nil, ("should not push route with duplicated key %s"):format(v18.key));
    local v19 = l_Array_0.concat(v17.routes, {
        v18
    });
    return l_Object_0.assign(table.clone(v17), {
        index = #v19, 
        routes = v19
    });
end;
v16.pop = function(v20) --[[ Line: 80 ]] --[[ Name: pop ]]
    -- upvalues: l_Object_0 (copy)
    if v20.index <= 1 then
        return v20;
    else
        local v21 = table.clone(v20.routes);
        table.remove(v21, #v21);
        return l_Object_0.assign(table.clone(v20), {
            index = #v21, 
            routes = v21
        });
    end;
end;
v16.jumpToIndex = function(v22, v23) --[[ Line: 95 ]] --[[ Name: jumpToIndex ]]
    -- upvalues: l_Object_0 (copy)
    if v23 == v22.index then
        return v22;
    else
        assert(v22.routes[v23] ~= nil, ("invalid index %d to jump to"):format(v23));
        return l_Object_0.assign(table.clone(v22), {
            index = v23
        });
    end;
end;
v16.jumpTo = function(v24, v25) --[[ Line: 108 ]] --[[ Name: jumpTo ]]
    -- upvalues: v16 (copy)
    local v26 = v16.indexOf(v24, v25);
    assert(v26 ~= nil, ("attempt to jump to unknown key \"%s\""):format(v25));
    return v16.jumpToIndex(v24, v26);
end;
v16.back = function(v27) --[[ Line: 116 ]] --[[ Name: back ]]
    -- upvalues: v16 (copy)
    local v28 = v27.index - 1;
    if not v27.routes[v28] then
        return v27;
    else
        return v16.jumpToIndex(v27, v28);
    end;
end;
v16.forward = function(v29) --[[ Line: 126 ]] --[[ Name: forward ]]
    -- upvalues: v16 (copy)
    local v30 = v29.index + 1;
    if not v29.routes[v30] then
        return v29;
    else
        return v16.jumpToIndex(v29, v30);
    end;
end;
v16.replaceAndPrune = function(v31, v32, v33) --[[ Line: 137 ]] --[[ Name: replaceAndPrune ]]
    -- upvalues: v16 (copy), l_Object_0 (copy)
    local v34 = v16.indexOf(v31, v32);
    local v35 = v16.replaceAtIndex(v31, v34, v33);
    return l_Object_0.assign(table.clone(v35), {
        routes = {
            unpack(v35.routes, 1, v34)
        }
    });
end;
v16.replaceAt = function(v36, v37, v38, v39) --[[ Line: 149 ]] --[[ Name: replaceAt ]]
    -- upvalues: v16 (copy)
    local v40 = v16.indexOf(v36, v37);
    local v41 = if v39 then v36.index else v40;
    local v42 = v16.replaceAtIndex(v36, v40, v38);
    v42.index = v41;
    return v42;
end;
v16.replaceAtIndex = function(v43, v44, v45) --[[ Line: 159 ]] --[[ Name: replaceAtIndex ]]
    -- upvalues: l_Object_0 (copy)
    assert(v43.routes[v44] ~= nil, ("invalid index %d for replacing route %s"):format(v44, v45.key));
    if v43.routes[v44] == v45 and v44 == v43.index then
        return v43;
    else
        local v46 = table.clone(v43.routes);
        v46[v44] = v45;
        return l_Object_0.assign(table.clone(v43), {
            index = v44, 
            routes = v46
        });
    end;
end;
v16.reset = function(v47, v48, v49) --[[ Line: 178 ]] --[[ Name: reset ]]
    -- upvalues: l_Object_0 (copy)
    local v50 = false;
    if type(v48) == "table" then
        v50 = #v48 > 0;
    end;
    assert(v50, "invalid routes to replace");
    local v51 = v49 or #v48;
    if #v47.routes == #v48 and v47.index == v51 then
        v50 = true;
        for v52 = 1, #v48 do
            if v47.routes[v52] ~= v48[v52] then
                v50 = false;
                break;
            end;
        end;
        if v50 then
            return v47;
        end;
    end;
    assert(v48[v51] ~= nil, ("invalid index %d to reset"):format(v51));
    return l_Object_0.assign(table.clone(v47), {
        index = v51, 
        routes = v48
    });
end;
return v16;