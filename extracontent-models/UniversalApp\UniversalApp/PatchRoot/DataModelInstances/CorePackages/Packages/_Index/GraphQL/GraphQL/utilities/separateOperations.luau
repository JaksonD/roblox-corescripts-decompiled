local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Set_0 = v2.Set;
local _ = require(l_Parent_0.jsutils.ObjMap);
local _ = require(l_Parent_0.language.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local l_visit_0 = require(l_Parent_0.language.visitor).visit;
local v9 = nil;
local v10 = nil;
local function v25(v11) --[[ Line: 38 ]] --[[ Name: separateOperations ]]
    -- upvalues: l_Kind_0 (copy), v9 (ref), l_Set_0 (copy), v10 (ref), l_Array_0 (copy)
    local v12 = {};
    local v13 = {};
    for _, v15 in pairs(v11.definitions) do
        local l_kind_0 = v15.kind;
        if l_kind_0 == l_Kind_0.OPERATION_DEFINITION then
            table.insert(v12, v15);
        elseif l_kind_0 == l_Kind_0.FRAGMENT_DEFINITION then
            v13[v15.name.value] = v9(v15.selectionSet);
        end;
    end;
    local v17 = {};
    for _, v19 in pairs(v12) do
        local v20 = l_Set_0.new();
        for _, v22 in pairs(v9(v19.selectionSet)) do
            v10(v20, v13, v22);
        end;
        v17[v19.name and v19.name.value or ""] = {
            kind = l_Kind_0.DOCUMENT, 
            definitions = l_Array_0.filter(v11.definitions, function(v23) --[[ Line: 81 ]]
                -- upvalues: v19 (copy), l_Kind_0 (ref), v20 (copy)
                local v24 = true;
                if v23 ~= v19 then
                    v24 = false;
                    if v23.kind == l_Kind_0.FRAGMENT_DEFINITION then
                        v24 = v20:has(v23.name.value);
                    end;
                end;
                return v24;
            end)
        };
    end;
    return v17;
end;
v10 = function(v26, v27, v28) --[[ Line: 95 ]] --[[ Name: collectTransitiveDependencies ]]
    -- upvalues: v10 (ref)
    if not v26:has(v28) then
        v26:add(v28);
        local v29 = v27[v28];
        if v29 ~= nil then
            for _, v31 in pairs(v29) do
                v10(v26, v27, v31);
            end;
        end;
    end;
end;
v9 = function(v32) --[[ Line: 112 ]] --[[ Name: collectDependencies ]]
    -- upvalues: l_visit_0 (copy)
    local v33 = {};
    l_visit_0(v32, {
        FragmentSpread = function(_, v35) --[[ Line: 116 ]] --[[ Name: FragmentSpread ]]
            -- upvalues: v33 (copy)
            table.insert(v33, v35.name.value);
        end
    });
    return v33;
end;
return {
    separateOperations = v25
};