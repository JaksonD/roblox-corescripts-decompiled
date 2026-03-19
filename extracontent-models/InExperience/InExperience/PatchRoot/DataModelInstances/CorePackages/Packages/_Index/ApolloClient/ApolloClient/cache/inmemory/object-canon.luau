local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Set_0 = v2.Set;
local l_WeakMap_0 = v2.WeakMap;
local l_Map_0 = v2.Map;
local v7 = require(l_Parent_0.luaUtils.Object);
local l_HttpService_0 = game:GetService("HttpService");
local v9 = {};
local l_Trie_0 = require(l_Parent_0.wry.trie).Trie;
local v11 = require(script.Parent.Parent.Parent.utilities);
local l_canUseWeakMap_0 = v11.canUseWeakMap;
local l_isNonNullObject_0 = v11.isNonNullObject;
local l_sortedEncode_0 = require(l_Parent_0.luaUtils.sortedEncode).sortedEncode;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local function _(v18) --[[ Line: 47 ]] --[[ Name: shallowCopy ]]
    return (table.clone(v18));
end;
local function _(v20) --[[ Line: 53 ]] --[[ Name: isArrayLike ]]
    if #v20 == 0 and not next(v20) then
        return true;
    elseif #v20 > 1 then
        return true;
    else
        return false;
    end;
end;
local v22 = {};
v22.__index = v22;
v22.new = function() --[[ Line: 147 ]] --[[ Name: new ]]
    -- upvalues: v22 (copy), l_Set_0 (copy), l_Trie_0 (copy), l_canUseWeakMap_0 (copy), l_WeakMap_0 (copy), l_Map_0 (copy)
    local v23 = setmetatable({}, v22);
    v23.known = l_Set_0.new();
    v23.pool = l_Trie_0.new(l_canUseWeakMap_0);
    v23.passes = l_WeakMap_0.new();
    v23.keysByJSON = l_Map_0.new(nil);
    v23.empty = v23:admit({});
    return v23;
end;
v22.isKnown = function(v24, v25) --[[ Line: 162 ]] --[[ Name: isKnown ]]
    -- upvalues: l_isNonNullObject_0 (copy)
    return l_isNonNullObject_0(v25) and v24.known:has(v25);
end;
v22.pass = function(v26, v27) --[[ Line: 166 ]] --[[ Name: pass ]]
    -- upvalues: l_isNonNullObject_0 (copy)
    if l_isNonNullObject_0(v27) then
        local v28 = table.clone(v27);
        v26.passes:set(v28, v27);
        return v28;
    else
        return v27;
    end;
end;
v22.admit = function(v29, v30) --[[ Line: 177 ]] --[[ Name: admit ]]
    -- upvalues: l_isNonNullObject_0 (copy), v7 (copy), l_Array_0 (copy)
    if l_isNonNullObject_0(v30) then
        local v31 = v29.passes:get(v30);
        if v31 then
            return v31;
        elseif v7.getPrototypeOf(v30) == nil then
            if #v30 == 0 and not next(v30) or #v30 > 1 then
                if v29.known:has(v30) then
                    return v30;
                else
                    local v32 = l_Array_0.map(v30, v29.admit, v29);
                    local v33 = v29.pool:lookupArray(v32);
                    if not v33.array then
                        v33.array = v32;
                        v29.known:add(v33.array);
                        if _G.__DEV__ then
                            v7.freeze(v32);
                        end;
                    end;
                    return v33.array;
                end;
            elseif v29.known:has(v30) then
                return v30;
            else
                local v34 = v7.getPrototypeOf(v30);
                local v35 = {
                    v34
                };
                local v36 = v29:sortedKeys(v30);
                table.insert(v35, v36.json);
                local v37 = #v35;
                l_Array_0.forEach(v36.sorted, function(v38) --[[ Line: 226 ]]
                    -- upvalues: v35 (copy), v29 (copy), v30 (copy)
                    table.insert(v35, v29:admit(v30[v38]));
                end);
                local v39 = v29.pool:lookupArray(v35);
                if not v39.object then
                    v39.object = v7.create(v34);
                    local l_object_0 = v39.object;
                    v29.known:add(l_object_0);
                    l_Array_0.forEach(v36.sorted, function(v41, v42) --[[ Line: 244 ]]
                        -- upvalues: l_object_0 (copy), v35 (copy), v37 (copy)
                        l_object_0[v41] = v35[v37 + v42];
                    end);
                    if _G.__DEV__ then
                        v7.freeze(l_object_0);
                    end;
                end;
                return v39.object;
            end;
        end;
    end;
    return v30;
end;
v22.sortedKeys = function(v43, v44) --[[ Line: 267 ]] --[[ Name: sortedKeys ]]
    -- upvalues: v7 (copy), l_Array_0 (copy), l_HttpService_0 (copy)
    local v45 = v7.keys(v44);
    local v46 = v43.pool:lookupArray(v45);
    if not v46.keys then
        l_Array_0.sort(v45);
        local v47 = l_HttpService_0:JSONEncode(v45);
        v46.keys = v43.keysByJSON:get(v47);
        if not v46.keys then
            v46.keys = {
                sorted = v45, 
                json = v47
            };
            v43.keysByJSON:set(v47, v46.keys);
        end;
    end;
    return v46.keys;
end;
v9.ObjectCanon = v22;
v9.canonicalStringify = v7.assign(setmetatable({}, {
    __call = function(_, v49) --[[ Line: 301 ]] --[[ Name: __call ]]
        -- upvalues: l_isNonNullObject_0 (copy), v16 (ref), v15 (ref), v17 (ref), l_sortedEncode_0 (copy), l_HttpService_0 (copy)
        if l_isNonNullObject_0(v49) then
            if v16 == nil then
                v15();
            end;
            local v50 = v16:admit(v49);
            local v51 = v17:get(v50);
            if v51 == nil then
                local l_v17_0 = v17;
                local l_v50_0 = v50;
                v51 = l_sortedEncode_0(v50);
                l_v17_0:set(l_v50_0, v51);
            end;
            return v51;
        else
            return l_HttpService_0:JSONEncode(v49);
        end;
    end
}), {
    reset = function(_) --[[ Line: 323 ]] --[[ Name: reset ]]
        -- upvalues: v15 (ref)
        return v15();
    end
});
v15 = function() --[[ Line: 330 ]] --[[ Name: resetCanonicalStringify ]]
    -- upvalues: v16 (ref), v22 (copy), v17 (ref), l_WeakMap_0 (copy)
    v16 = v22.new();
    v17 = l_WeakMap_0.new();
end;
return v9;