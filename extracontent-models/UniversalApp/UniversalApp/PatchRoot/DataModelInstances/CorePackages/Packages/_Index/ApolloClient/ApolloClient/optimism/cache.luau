local l_Parent_0 = script.Parent.Parent.Parent;
local l_Map_0 = require(l_Parent_0.LuauPolyfill).Map;
local v2 = {};
local function v3() --[[ Line: 21 ]] --[[ Name: defaultDispose ]]

end;
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v4 (copy), l_Map_0 (copy)
    local l_v5_0 = v5;
    local l_v6_0 = v6;
    if l_v5_0 == nil then
        l_v5_0 = 1e999;
    end;
    if l_v6_0 == nil then
        l_v6_0 = v3;
    end;
    local v9 = setmetatable({}, v4);
    v9.map = l_Map_0.new(nil);
    v9.newest = nil;
    v9.oldest = nil;
    v9.max = l_v5_0;
    v9.dispose = l_v6_0;
    return v9;
end;
v4.has = function(v10, v11) --[[ Line: 73 ]] --[[ Name: has ]]
    return v10.map:has(v11);
end;
v4.get = function(v12, v13) --[[ Line: 77 ]] --[[ Name: get ]]
    local v14 = v12:getNode(v13);
    if v14 then
        return v14.value;
    else
        return v14;
    end;
end;
v4.getNode = function(v15, v16) --[[ Line: 87 ]] --[[ Name: getNode ]]
    local v17 = v15.map:get(v16);
    if v17 and v17 ~= v15.newest then
        local l_older_0 = v17.older;
        local l_newer_0 = v17.newer;
        if l_newer_0 then
            l_newer_0.older = l_older_0;
        end;
        if l_older_0 then
            l_older_0.newer = l_newer_0;
        end;
        v17.older = v15.newest;
        v17.older.newer = v17;
        v17.newer = nil;
        v15.newest = v17;
        if v17 == v15.oldest then
            v15.oldest = l_newer_0;
        end;
    end;
    return v17;
end;
v4.set = function(v20, v21, v22) --[[ Line: 121 ]] --[[ Name: set ]]
    local v23 = v20:getNode(v21);
    if v23 then
        v23.value = v22;
        return v23.value;
    else
        v23 = {
            key = v21, 
            value = v22, 
            newer = nil, 
            older = v20.newest
        };
        if v20.newest then
            v20.newest.newer = v23;
        end;
        v20.newest = v23;
        v20.oldest = v20.oldest or v23;
        v20.map:set(v21, v23);
        return v23.value;
    end;
end;
v4.clean = function(v24) --[[ Line: 152 ]] --[[ Name: clean ]]
    while v24.oldest and v24.map.size > v24.max do
        v24:delete(v24.oldest.key);
    end;
end;
v4.delete = function(v25, v26) --[[ Line: 160 ]] --[[ Name: delete ]]
    local v27 = v25.map:get(v26);
    if v27 then
        if v27 == v25.newest then
            v25.newest = v27.older;
        end;
        if v27 == v25.oldest then
            v25.oldest = v27.newer;
        end;
        if v27.newer then
            v27.newer.older = v27.older;
        end;
        if v27.older then
            v27.older.newer = v27.newer;
        end;
        v25.map:delete(v26);
        v25.dispose(v27.value, v26);
        return true;
    else
        return false;
    end;
end;
v2.Cache = v4;
return v2;