local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.jsutils.ObjMap);
local l_keyMap_0 = require(l_Parent_0.jsutils.keyMap).keyMap;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(l_Parent_0.language.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local v7 = require(l_Parent_0.type.definition);
local l_isLeafType_0 = v7.isLeafType;
local l_isInputObjectType_0 = v7.isInputObjectType;
local l_isListType_0 = v7.isListType;
local l_isNonNullType_0 = v7.isNonNullType;
local v12 = require(l_Parent_0.luaUtils.null);
local v13 = nil;
local function v14(v15, v16, v17) --[[ Line: 37 ]] --[[ Name: valueFromAST ]]
    -- upvalues: l_Kind_0 (copy), v12 (copy), l_isNonNullType_0 (copy), v14 (copy), l_isListType_0 (copy), v13 (ref), l_isInputObjectType_0 (copy), l_keyMap_0 (copy), l_isLeafType_0 (copy), l_invariant_0 (copy), l_inspect_0 (copy)
    if not v15 then
        return;
    elseif v15.kind == l_Kind_0.VARIABLE then
        local l_value_0 = v15.name.value;
        if v17 == nil or v17[l_value_0] == nil then
            return;
        else
            local v19 = v17[l_value_0];
            if v19 == v12 and l_isNonNullType_0(v16) then
                return;
            else
                return v19;
            end;
        end;
    elseif l_isNonNullType_0(v16) then
        if v15.kind == l_Kind_0.NULL then
            return;
        else
            return v14(v15, v16.ofType, v17);
        end;
    elseif v15.kind == l_Kind_0.NULL then
        return v12;
    elseif l_isListType_0(v16) then
        local l_ofType_0 = v16.ofType;
        if v15.kind == l_Kind_0.LIST then
            local v21 = {};
            for _, v23 in ipairs(v15.values) do
                if v13(v23, v17) then
                    if l_isNonNullType_0(l_ofType_0) then
                        return;
                    else
                        table.insert(v21, v12);
                    end;
                else
                    local v24 = v14(v23, l_ofType_0, v17);
                    if v24 == nil then
                        return;
                    else
                        table.insert(v21, v24);
                    end;
                end;
            end;
            return v21;
        else
            local v25 = v14(v15, l_ofType_0, v17);
            if v25 == nil then
                return;
            else
                return {
                    v25
                };
            end;
        end;
    elseif l_isInputObjectType_0(v16) then
        if v15.kind ~= l_Kind_0.OBJECT then
            return;
        else
            local v26 = {};
            local v28 = l_keyMap_0(v15.fields, function(v27) --[[ Line: 118 ]]
                return v27.name.value;
            end);
            for _, v30 in ipairs(v16:getFields():values()) do
                local v31 = v28[v30.name];
                if not v31 or v13(v31.value, v17) then
                    if v30.defaultValue ~= nil then
                        v26[v30.name] = v30.defaultValue;
                    elseif l_isNonNullType_0(v30.type) then
                        return;
                    end;
                else
                    local v32 = v14(v31.value, v30.type, v17);
                    if v32 == nil then
                        return;
                    else
                        v26[v30.name] = v32;
                    end;
                end;
            end;
            return v26;
        end;
    elseif l_isLeafType_0(v16) then
        local v33 = nil;
        if not pcall(function() --[[ Line: 148 ]]
            -- upvalues: v33 (ref), v16 (copy), v15 (copy), v17 (copy)
            v33 = v16:parseLiteral(v15, v17);
        end) then
            return;
        elseif v33 == nil then
            return;
        else
            return v33;
        end;
    else
        l_invariant_0(false, "Unexpected input type: " .. l_inspect_0(v16));
        return;
    end;
end;
v13 = function(v34, v35) --[[ Line: 170 ]] --[[ Name: isMissingVariable ]]
    -- upvalues: l_Kind_0 (copy)
    local v36 = false;
    if v34.kind == l_Kind_0.VARIABLE then
        v36 = true;
        if v35 ~= nil then
            v36 = v35[v34.name.value] == nil;
        end;
    end;
    return v36;
end;
return {
    valueFromAST = v14
};