local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Set_0 = require(l_Parent_1.LuauPolyfill).Set;
local v4 = newproxy(true);
getmetatable(v4).__tostring = function() --[[ Line: 23 ]]
    return "Value.None";
end;
local l_isNonNullObject_0 = require(script.Parent.objects).isNonNullObject;
local v6 = require(l_Parent_0.luaUtils.hasOwnProperty);
local v7 = require(l_Parent_0.luaUtils.objectKeysForEach);
local v8 = nil;
v0.mergeDeep = function(...) --[[ Line: 59 ]] --[[ Name: mergeDeep ]]
    -- upvalues: v8 (ref)
    return v8({
        ...
    });
end;
local v9 = {};
v8 = function(v10) --[[ Line: 73 ]] --[[ Name: mergeDeepArray ]]
    -- upvalues: v9 (copy)
    local v11 = v10[1] or {};
    local v12 = #v10;
    if v12 > 1 then
        local v13 = v9.new();
        for v14 = 2, v12 do
            v11 = v13:merge(v11, v10[v14]);
        end;
    end;
    return v11;
end;
v0.mergeDeepArray = v8;
v9.__index = v9;
v9.new = function(v15) --[[ Line: 107 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), l_isNonNullObject_0 (copy), l_Set_0 (copy)
    local v16 = setmetatable({}, v9);
    local function v21(v17, v18, v19, v20) --[[ Line: 110 ]]
        return v17:merge(v18[v20], v19[v20]);
    end;
    if v15 == nil then
        v15 = v21;
    end;
    v16.reconciler = v15;
    v16.isObject = l_isNonNullObject_0;
    v16.pastCopies = l_Set_0.new();
    return v16;
end;
v9.merge = function(v22, v23, v24, ...) --[[ Line: 124 ]] --[[ Name: merge ]]
    -- upvalues: l_isNonNullObject_0 (copy), v7 (copy), v6 (copy), v4 (copy)
    local v25 = table.pack(...);
    if l_isNonNullObject_0(v24) and l_isNonNullObject_0(v23) then
        v7(v24, function(v26) --[[ Line: 130 ]]
            -- upvalues: v6 (ref), v23 (ref), v24 (copy), v22 (copy), v25 (copy), v4 (ref)
            if v6(v23, v26) then
                local v27 = v23[v26];
                if v24[v26] ~= v27 then
                    local v28 = v22:reconciler(v23, v24, v26, table.unpack(v25));
                    if v28 ~= v27 then
                        v23 = v22:shallowCopyForMerge(v23);
                        v23[v26] = v28;
                    end;
                end;
            else
                v23 = v22:shallowCopyForMerge(v23);
                v23[v26] = v24[v26];
            end;
            if v23[v26] == v4 then
                v23[v26] = nil;
            end;
        end);
        return v23;
    else
        return v24;
    end;
end;
v9.shallowCopyForMerge = function(v29, v30) --[[ Line: 163 ]] --[[ Name: shallowCopyForMerge ]]
    -- upvalues: l_isNonNullObject_0 (copy)
    if l_isNonNullObject_0(v30) and not v29.pastCopies:has(v30) then
        v30 = table.clone(v30);
        v29.pastCopies:add(v30);
    end;
    return v30;
end;
v9.None = v4;
v0.DeepMerger = v9;
return v0;