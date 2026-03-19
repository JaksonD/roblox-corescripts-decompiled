local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Set_0 = v1.Set;
local l_Map_0 = v1.Map;
local l_Error_0 = v1.Error;
local v6 = {};
local v7 = newproxy(true);
getmetatable(v7).__tostring = function() --[[ Line: 34 ]]
    return "Value.None";
end;
local v8 = nil;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local l_parentEntrySlot_0 = require(script.Parent.context).parentEntrySlot;
local _ = require(script.Parent.initTypes);
local _ = require(script.Parent.depTypes);
local v25 = require(script.Parent.helpers);
local l_maybeUnsubscribe_0 = v25.maybeUnsubscribe;
local l_toArray_0 = v25.toArray;
local v28 = {};
local function _(v29, v30) --[[ Line: 73 ]] --[[ Name: assert ]]
    -- upvalues: l_Error_0 (copy)
    if not v29 then
        error(l_Error_0.new(v30 or "assertion failure"));
    end;
end;
local _ = require(script.Parent.entryTypes);
local _ = require(script.Parent.anyEntryTypes);
local function _(v34, v35) --[[ Line: 87 ]] --[[ Name: valueIs ]]
    local v36 = #v34;
    local v37 = false;
    if v36 > 0 then
        v37 = false;
        if v36 == #v35 then
            v37 = v34[v36] == v35[v36];
        end;
    end;
    return v37;
end;
local function v40(v39) --[[ Line: 98 ]] --[[ Name: valueGet ]]
    -- upvalues: v7 (copy), l_Error_0 (copy)
    if v39[2] ~= nil then
        error(v39[2]);
        return;
    elseif v39[1] ~= nil then
        if v39[1] == v7 then
            return nil;
        else
            return v39[1];
        end;
    else
        error(l_Error_0.new("unknown value"));
        return;
    end;
end;
local function _(v41) --[[ Line: 123 ]] --[[ Name: valueCopy ]]
    return (table.clone(v41));
end;
local v43 = {};
v43.__index = v43;
v43.count = 0;
v43.new = function(v44) --[[ Line: 138 ]] --[[ Name: new ]]
    -- upvalues: v43 (copy), l_Set_0 (copy), l_Map_0 (copy)
    local v45 = setmetatable({}, v43);
    v45.parents = l_Set_0.new();
    v45.childValues = l_Map_0.new(nil);
    v45.dirtyChildren = nil;
    v45.dirty = true;
    v45.recomputing = false;
    v45.value = {};
    v45.deps = nil;
    v45.fn = v44;
    local l_v43_0 = v43;
    l_v43_0.count = l_v43_0.count + 1;
    return v45;
end;
v43.peek = function(v47) --[[ Line: 159 ]] --[[ Name: peek ]]
    -- upvalues: v11 (ref), v8 (ref)
    if #v47.value == 1 and not v11(v47) then
        v8(v47);
        return v47.value[1];
    else
        return nil;
    end;
end;
v43.recompute = function(v48, v49) --[[ Line: 173 ]] --[[ Name: recompute ]]
    -- upvalues: l_Error_0 (copy), v8 (ref), v11 (ref), v9 (ref), v40 (copy)
    if v48.recomputing then
        error(l_Error_0.new("already recomputing"));
    end;
    v8(v48);
    if v11(v48) then
        return v9(v48, v49);
    else
        return v40(v48.value);
    end;
end;
v43.setDirty = function(v50) --[[ Line: 183 ]] --[[ Name: setDirty ]]
    -- upvalues: v13 (ref), l_maybeUnsubscribe_0 (copy)
    if v50.dirty then
        return;
    else
        v50.dirty = true;
        v50.value = {};
        v13(v50);
        l_maybeUnsubscribe_0(v50);
        return;
    end;
end;
v43.dispose = function(v51) --[[ Line: 198 ]] --[[ Name: dispose ]]
    -- upvalues: v19 (ref), v15 (ref), v20 (ref)
    v51:setDirty();
    v19(v51);
    v15(v51, function(v52, _) --[[ Line: 216 ]]
        -- upvalues: v20 (ref), v51 (copy)
        v52:setDirty();
        v20(v52, v51);
        return nil;
    end);
end;
v43.forget = function(v54) --[[ Line: 223 ]] --[[ Name: forget ]]
    v54:dispose();
end;
v43.dependOn = function(v55, v56) --[[ Line: 230 ]] --[[ Name: dependOn ]]
    -- upvalues: v28 (copy), l_Set_0 (copy)
    v56:add(v55);
    if not v55.deps then
        v55.deps = table.remove(v28) or l_Set_0.new();
    end;
    v55.deps:add(v56);
end;
v43.forgetDeps = function(v57) --[[ Line: 240 ]] --[[ Name: forgetDeps ]]
    -- upvalues: l_Array_0 (copy), l_toArray_0 (copy), v28 (copy)
    if v57.deps then
        l_Array_0.forEach(l_toArray_0(v57.deps), function(v58) --[[ Line: 244 ]]
            -- upvalues: v57 (copy)
            v58:delete(v57);
        end);
        v57.deps:clear();
        table.insert(v28, v57.deps);
        v57.deps = nil;
    end;
end;
v6.Entry = v43;
v8 = function(v59) --[[ Line: 255 ]] --[[ Name: rememberParent ]]
    -- upvalues: l_parentEntrySlot_0 (copy), v11 (ref), v16 (ref), v17 (ref)
    local v60 = l_parentEntrySlot_0:getValue();
    if v60 then
        v59.parents:add(v60);
        if not v60.childValues:has(v59) then
            v60.childValues:set(v59, {});
        end;
        if v11(v59) then
            v16(v60, v59);
            return v60;
        else
            v17(v60, v59);
            return v60;
        end;
    else
        return nil;
    end;
end;
v9 = function(v61, v62) --[[ Line: 281 ]] --[[ Name: reallyRecompute ]]
    -- upvalues: v19 (ref), l_parentEntrySlot_0 (copy), v10 (ref), v21 (ref), v12 (ref), v40 (copy)
    v19(v61);
    l_parentEntrySlot_0:withValue(v61, v10, {
        v61, 
        v62
    });
    if v21(v61, v62) then
        v12(v61);
    end;
    return v40(v61.value);
end;
v10 = function(_, v64, v65) --[[ Line: 298 ]] --[[ Name: recomputeNewValue ]]
    -- upvalues: v7 (copy)
    v64.recomputing = true;
    table.clear(v64.value);
    local l_status_0, l_result_0 = pcall(v64.fn, table.unpack(v65));
    if l_status_0 then
        v64.value[1] = l_result_0;
        if v64.value[1] == nil then
            v64.value[1] = v7;
        end;
    end;
    if not l_status_0 then
        v64.value[2] = l_result_0;
    end;
    v64.recomputing = false;
end;
v11 = function(v68) --[[ Line: 321 ]] --[[ Name: mightBeDirty ]]
    return v68.dirty or v68.dirtyChildren ~= nil and v68.dirtyChildren.size > 0;
end;
v12 = function(v69) --[[ Line: 327 ]] --[[ Name: setClean ]]
    -- upvalues: v11 (ref), v14 (ref)
    v69.dirty = false;
    if v11(v69) then
        return;
    else
        v14(v69);
        return;
    end;
end;
v13 = function(v70) --[[ Line: 339 ]] --[[ Name: reportDirty ]]
    -- upvalues: v15 (ref), v16 (ref)
    v15(v70, v16);
end;
v14 = function(v71) --[[ Line: 343 ]] --[[ Name: reportClean ]]
    -- upvalues: v15 (ref), v17 (ref)
    v15(v71, v17);
end;
v15 = function(v72, v73) --[[ Line: 347 ]] --[[ Name: eachParent ]]
    -- upvalues: l_toArray_0 (copy)
    local l_size_0 = v72.parents.size;
    if l_size_0 then
        local v75 = l_toArray_0(v72.parents);
        for v76 = 1, l_size_0 do
            v73(v75[v76], v72);
        end;
    end;
end;
v16 = function(v77, v78) --[[ Line: 360 ]] --[[ Name: reportDirtyChild ]]
    -- upvalues: l_Error_0 (copy), v11 (ref), v28 (copy), l_Set_0 (copy), v13 (ref)
    if _G.__DEV__ then
        local v79, v80 = v77.childValues:has(v78);
        if not v79 then
            error(l_Error_0.new(v80 or "assertion failure"));
        end;
        v79, v80 = v11(v78);
        if not v79 then
            error(l_Error_0.new(v80 or "assertion failure"));
        end;
    end;
    local v81 = not v11(v77);
    if not v77.dirtyChildren then
        v77.dirtyChildren = table.remove(v28) or l_Set_0.new();
    elseif v77.dirtyChildren:has(v78) then
        return;
    end;
    v77.dirtyChildren:add(v78);
    if v81 then
        v13(v77);
    end;
end;
v17 = function(v82, v83) --[[ Line: 394 ]] --[[ Name: reportCleanChild ]]
    -- upvalues: l_Error_0 (copy), v11 (ref), v18 (ref), v14 (ref)
    if _G.__DEV__ then
        local v84, v85 = v82.childValues:has(v83);
        if not v84 then
            error(l_Error_0.new(v85 or "assertion failure"));
        end;
        if v11(v83) then
            error(l_Error_0.new("assertion failure"));
        end;
    end;
    local v86 = v82.childValues:get(v83);
    if #v86 == 0 then
        local l_childValues_0 = v82.childValues;
        local l_v83_0 = v83;
        local l_value_0 = v83.value;
        l_childValues_0:set(l_v83_0, (table.clone(l_value_0)));
    else
        local l_value_1 = v83.value;
        local v91 = #v86;
        local v92 = false;
        if v91 > 0 then
            v92 = false;
            if v91 == #l_value_1 then
                v92 = v86[v91] == l_value_1[v91];
            end;
        end;
        if not v92 then
            v82:setDirty();
        end;
    end;
    v18(v82, v83);
    if v11(v82) then
        return;
    else
        v14(v82);
        return;
    end;
end;
v18 = function(v93, v94) --[[ Line: 421 ]] --[[ Name: removeDirtyChild ]]
    -- upvalues: v28 (copy)
    local l_dirtyChildren_0 = v93.dirtyChildren;
    if l_dirtyChildren_0 ~= nil then
        l_dirtyChildren_0:delete(v94);
        if l_dirtyChildren_0.size == 0 then
            if #v28 < 100 then
                table.insert(v28, l_dirtyChildren_0);
            end;
            v93.dirtyChildren = nil;
        end;
    end;
end;
v19 = function(v96) --[[ Line: 436 ]] --[[ Name: forgetChildren ]]
    -- upvalues: l_Array_0 (copy), v20 (ref), l_Error_0 (copy)
    if v96.childValues.size > 0 then
        local v97 = table.clone(v96.childValues:keys());
        l_Array_0.forEach(v97, function(v98) --[[ Line: 444 ]]
            -- upvalues: v20 (ref), v96 (copy)
            v20(v96, v98);
        end);
    end;
    v96:forgetDeps();
    if not (v96.dirtyChildren == nil) then
        error(l_Error_0.new("assertion failure"));
    end;
end;
v20 = function(v99, v100) --[[ Line: 458 ]] --[[ Name: forgetChild ]]
    -- upvalues: v18 (ref)
    v100.parents:delete(v99);
    v99.childValues:delete(v100);
    v18(v99, v100);
end;
v21 = function(v101, v102) --[[ Line: 464 ]] --[[ Name: maybeSubscribe ]]
    -- upvalues: l_maybeUnsubscribe_0 (copy)
    if typeof(v101.subscribe) == "function" and not pcall(function() --[[ Line: 466 ]]
        -- upvalues: l_maybeUnsubscribe_0 (ref), v101 (copy), v102 (copy)
        l_maybeUnsubscribe_0(v101);
        v101.unsubscribe = v101.subscribe(table.unpack(v102));
        return nil, false;
    end) then
        v101:setDirty();
        return false;
    else
        return true;
    end;
end;
return v6;