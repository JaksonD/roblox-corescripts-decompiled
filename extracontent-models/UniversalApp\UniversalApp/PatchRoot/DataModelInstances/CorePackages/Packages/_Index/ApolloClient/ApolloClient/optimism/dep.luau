local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Set_0 = v1.Set;
local l_Array_0 = v1.Array;
local v4 = {};
local _ = require(script.Parent.anyEntryTypes);
local _ = require(script.Parent.initTypes);
local l_parentEntrySlot_0 = require(script.Parent.context).parentEntrySlot;
local v8 = require(script.Parent.helpers);
local l_hasOwnProperty_0 = v8.hasOwnProperty;
local l_maybeUnsubscribe_0 = v8.maybeUnsubscribe;
local l_toArray_0 = v8.toArray;
local v12 = {
    setDirty = true, 
    dispose = true, 
    forget = true
};
local _ = require(script.Parent.depTypes);
v4.dep = function(v14) --[[ Line: 66 ]] --[[ Name: dep ]]
    -- upvalues: l_parentEntrySlot_0 (copy), l_Set_0 (copy), l_maybeUnsubscribe_0 (copy), l_hasOwnProperty_0 (copy), v12 (copy), l_Array_0 (copy), l_toArray_0 (copy)
    local v15 = {};
    local v16 = if v14 ~= nil then v14.subscribe else v14;
    local v21 = setmetatable({}, {
        __call = function(_, v18) --[[ Line: 74 ]] --[[ Name: __call ]]
            -- upvalues: l_parentEntrySlot_0 (ref), v15 (copy), l_Set_0 (ref), v16 (copy), l_maybeUnsubscribe_0 (ref)
            local v19 = l_parentEntrySlot_0:getValue();
            if v19 ~= nil then
                local v20 = v15[v18];
                if not v20 then
                    v20 = l_Set_0.new();
                    v15[v18] = v20;
                end;
                v19:dependOn(v20);
                if type(v16) == "function" then
                    l_maybeUnsubscribe_0(v20);
                    v20.unsubscribe = v16(v18);
                end;
            end;
        end
    });
    v21.dirty = function(_, v23, v24) --[[ Line: 101 ]]
        -- upvalues: v15 (copy), l_hasOwnProperty_0 (ref), v12 (ref), l_Array_0 (ref), l_toArray_0 (ref), l_maybeUnsubscribe_0 (ref)
        local v25 = v15[v23];
        if v25 then
            local v26 = if v24 and l_hasOwnProperty_0(v12, v24) then v24 else "setDirty";
            l_Array_0.forEach(l_toArray_0(v25), function(v27) --[[ Line: 112 ]]
                -- upvalues: v26 (copy)
                v27[v26](v27);
            end);
            v15[v23] = nil;
            l_maybeUnsubscribe_0(v25);
        end;
    end;
    return v21;
end;
return v4;