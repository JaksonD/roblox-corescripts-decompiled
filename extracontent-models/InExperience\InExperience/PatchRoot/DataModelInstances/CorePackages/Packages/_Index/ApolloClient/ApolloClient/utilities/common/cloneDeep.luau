local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Map_0 = v3.Map;
local v6 = require(l_Parent_0.luaUtils.Object);
local l_instanceof_0 = v3.instanceof;
local l_NULL_0 = require(script.Parent.Parent.globals.null).NULL;
local v9 = nil;
v0.cloneDeep = function(v10) --[[ Line: 36 ]] --[[ Name: cloneDeep ]]
    -- upvalues: v9 (ref)
    return v9(v10);
end;
local v11 = {
    v3.Error, 
    v3.Map, 
    v3.WeakMap, 
    v3.Set
};
v9 = function(v12, v13) --[[ Line: 48 ]] --[[ Name: cloneDeepHelper ]]
    -- upvalues: l_Array_0 (copy), l_Map_0 (copy), v9 (ref), l_NULL_0 (copy), v11 (copy), l_instanceof_0 (copy), v6 (copy)
    if l_Array_0.isArray(v12) then
        v13 = v13 or l_Map_0.new(nil);
        if v13:has(v12) then
            return v13:get(v12);
        else
            local v14 = l_Array_0.slice(v12, 1);
            v13:set(v12, v14);
            l_Array_0.forEach(v14, function(v15, v16) --[[ Line: 56 ]]
                -- upvalues: v14 (copy), v9 (ref), v13 (ref)
                v14[v16] = v9(v15, v13);
            end);
            return v14;
        end;
    elseif typeof(v12) == "table" and v12 ~= l_NULL_0 and l_Array_0.every(v11, function(v17) --[[ Line: 63 ]]
        -- upvalues: l_instanceof_0 (ref), v12 (copy)
        return not l_instanceof_0(v12, v17);
    end) then
        v13 = v13 or l_Map_0.new(nil);
        if v13:has(v12) then
            return v13:get(v12);
        else
            local v18 = v6.create(v6.getPrototypeOf(v12));
            v13:set(v12, v18);
            l_Array_0.forEach(v6.keys(v12), function(v19) --[[ Line: 76 ]]
                -- upvalues: v18 (copy), v9 (ref), v12 (copy), v13 (ref)
                v18[v19] = v9(v12[v19], v13);
            end);
            return v18;
        end;
    else
        return v12;
    end;
end;
return v0;