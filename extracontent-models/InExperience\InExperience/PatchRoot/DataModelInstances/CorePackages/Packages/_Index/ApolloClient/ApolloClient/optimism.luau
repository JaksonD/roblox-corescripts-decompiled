local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Set_0 = v2.Set;
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local v7 = {};
local l_Trie_0 = require(l_Parent_0.wry.trie).Trie;
local l_Cache_0 = require(script.cache).Cache;
local l_Entry_0 = require(script.entry).Entry;
local l_parentEntrySlot_0 = require(script.context).parentEntrySlot;
local v12 = require(script.context);
v7.bindContext = v12.bindContext;
v7.noContext = v12.noContext;
v7.setTimeout = v12.setTimeout;
v7.dep = require(script.dep).dep;
local _ = function() --[[ Line: 61 ]] --[[ Name: makeDefaultMakeCacheKeyFunction ]]
    -- upvalues: l_Trie_0 (copy)
    local v13 = l_Trie_0.new(true);
    return function(_, ...) --[[ Line: 64 ]]
        -- upvalues: v13 (copy)
        return v13:lookupArray({
            ...
        });
    end;
end;
local v16 = l_Trie_0.new(true);
local l_v16_0 = v16 --[[ copy: 17 -> 19 ]];
v7.defaultMakeCacheKey = function(_, ...) --[[ Line: 64 ]]
    -- upvalues: l_v16_0 (copy)
    return l_v16_0:lookupArray({
        ...
    });
end;
v7.KeyTrie = l_Trie_0;
v16 = require(script.initTypes);
local v19 = l_Set_0.new();
v7.wrap = function(v20, v21, v22) --[[ Line: 104 ]] --[[ Name: wrap ]]
    -- upvalues: l_Cache_0 (copy), l_Boolean_0 (copy), l_Trie_0 (copy), l_Entry_0 (copy), l_Array_0 (copy), v19 (copy), l_parentEntrySlot_0 (copy), l_Object_0 (copy)
    local v23 = false;
    local l_v21_0 = v21;
    if l_v21_0 == nil then
        l_v21_0 = {};
    end;
    local v26 = l_Cache_0.new(l_Boolean_0.toJSBoolean(l_v21_0.max) and l_v21_0.max or 65536, function(v25) --[[ Line: 115 ]]
        return v25:dispose();
    end);
    local l_keyArgs_0 = l_v21_0.keyArgs;
    local v28, v29, v30;
    if l_Boolean_0.toJSBoolean(l_v21_0.makeCacheKey) then
        v30 = l_v21_0.makeCacheKey;
        v23 = v30;
    end;
    if not v23 then
        v28 = l_Trie_0.new(true);
        v29 = v28 --[[ copy: 7 -> 14 ]];
        v30 = function(_, ...) --[[ Line: 64 ]]
            -- upvalues: v29 (copy)
            return v29:lookupArray({
                ...
            });
        end;
    end;
    v23 = false;
    if v22 ~= nil then
        v28 = v20;
        local l_v28_0 = v28 --[[ copy: 7 -> 17 ]];
        v20 = function(...) --[[ Line: 126 ]]
            -- upvalues: l_v28_0 (copy), v22 (copy)
            return l_v28_0(v22, ...);
        end;
    end;
    v28 = setmetatable({}, {
        __call = function(_, v34, ...) --[[ Line: 134 ]] --[[ Name: __call ]]
            -- upvalues: v22 (copy), v30 (copy), l_keyArgs_0 (copy), v20 (ref), v26 (copy), l_Entry_0 (ref), l_v21_0 (ref), l_Array_0 (ref), v19 (ref), l_parentEntrySlot_0 (ref)
            local v35 = nil;
            v35 = if v22 ~= nil then {
                ...
            } else {
                v34, 
                ...
            };
            local v36 = v30(nil, table.unpack((function() --[[ Line: 147 ]]
                -- upvalues: l_keyArgs_0 (ref), v35 (ref)
                if l_keyArgs_0 then
                    return l_keyArgs_0(nil, table.unpack(v35));
                else
                    return v35;
                end;
            end)()));
            if v36 == nil then
                return v20(table.unpack(v35));
            else
                local v37 = v26:get(v36);
                if v37 == nil then
                    v37 = l_Entry_0.new(v20);
                    v26:set(v36, v37);
                    v37.subscribe = l_v21_0.subscribe;
                    v37.forget = function() --[[ Line: 167 ]]
                        -- upvalues: v26 (ref), v36 (copy)
                        return v26:delete(v36);
                    end;
                end;
                local v38 = v37:recompute((l_Array_0.slice(v35)));
                v26:set(v36, v37);
                v19:add(v26);
                if not l_parentEntrySlot_0:hasValue() then
                    v19:forEach(function(v39) --[[ Line: 184 ]]
                        return v39:clean();
                    end);
                    v19:clear();
                end;
                return v38;
            end;
        end, 
        __index = function(v40, v41) --[[ Line: 193 ]] --[[ Name: __index ]]
            -- upvalues: v26 (copy)
            if v41 == "size" then
                return v26.map.size;
            else
                return (rawget(v40, v41));
            end;
        end, 
        __newindex = function(v42, v43, v44) --[[ Line: 199 ]] --[[ Name: __newindex ]]
            if v43 == "size" then
                error("attempt to update a read-only table", 2);
            end;
            rawset(v42, v43, v44);
        end
    });
    local _ = function(v45) --[[ Line: 213 ]] --[[ Name: asMethod ]]
        return function(_, ...) --[[ Line: 214 ]]
            -- upvalues: v45 (copy)
            return v45(...);
        end;
    end;
    local function v50(v48) --[[ Line: 219 ]] --[[ Name: dirtyKey ]]
        -- upvalues: v26 (copy), l_Boolean_0 (ref)
        local v49 = v26:get(v48);
        if l_Boolean_0.toJSBoolean(v49) then
            v49:setDirty();
        end;
    end;
    v28.dirtyKey = function(_, ...) --[[ Line: 214 ]]
        -- upvalues: v50 (copy)
        return v50(...);
    end;
    local function v54(...) --[[ Line: 228 ]]
        -- upvalues: v30 (copy), v26 (copy), l_Boolean_0 (ref)
        local v52 = v30(nil, ...);
        local v53 = v26:get(v52);
        if l_Boolean_0.toJSBoolean(v53) then
            v53:setDirty();
        end;
    end;
    local l_v54_0 = v54 --[[ copy: 11 -> 15 ]];
    v28.dirty = function(_, ...) --[[ Line: 214 ]]
        -- upvalues: l_v54_0 (copy)
        return l_v54_0(...);
    end;
    local function v59(v57) --[[ Line: 232 ]] --[[ Name: peekKey ]]
        -- upvalues: v26 (copy), l_Boolean_0 (ref)
        local v58 = v26:get(v57);
        if l_Boolean_0.toJSBoolean(v58) then
            return v58:peek();
        else
            return;
        end;
    end;
    v28.peekKey = function(_, ...) --[[ Line: 214 ]]
        -- upvalues: v59 (copy)
        return v59(...);
    end;
    local function v61(...) --[[ Line: 242 ]]
        -- upvalues: v59 (copy), v30 (copy)
        return v59(v30(nil, ...));
    end;
    v28.peek = function(_, ...) --[[ Line: 214 ]]
        -- upvalues: v61 (copy)
        return v61(...);
    end;
    v54 = function(v63) --[[ Line: 246 ]] --[[ Name: forgetKey ]]
        -- upvalues: v26 (copy)
        return v26:delete(v63);
    end;
    v28.forgetKey = function(_, ...) --[[ Line: 214 ]]
        -- upvalues: v54 (copy)
        return v54(...);
    end;
    local function v65(...) --[[ Line: 252 ]]
        -- upvalues: v54 (copy), v30 (copy)
        return v54(v30(nil, ...));
    end;
    local l_v65_0 = v65 --[[ copy: 13 -> 16 ]];
    v28.forget = function(_, ...) --[[ Line: 214 ]]
        -- upvalues: l_v65_0 (copy)
        return l_v65_0(...);
    end;
    v28.makeCacheKey = v30;
    if l_Boolean_0.toJSBoolean(l_keyArgs_0) then
        v65 = function(...) --[[ Line: 260 ]]
            -- upvalues: v30 (copy), l_keyArgs_0 (copy)
            return v30(nil, table.unpack(l_keyArgs_0(...)));
        end;
        v28.getKey = function(_, ...) --[[ Line: 214 ]]
            -- upvalues: v65 (copy)
            return v65(...);
        end;
    else
        v28.getKey = v30;
    end;
    return l_Object_0.freeze(v28);
end;
return v7;