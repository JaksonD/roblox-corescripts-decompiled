local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local _ = require(l_Parent_0.GraphQL);
local l_getArgumentValues_0 = require(script.Parent.getArgumentValues).getArgumentValues;
local function v13(v8, v9) --[[ Line: 95 ]] --[[ Name: getDirectivesInExtensions ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local v10 = if v9 ~= nil then v9 else {
        "directives"
    };
    return (l_Array_0.reduce(v10, function(v11, v12) --[[ Line: 104 ]]
        -- upvalues: l_Object_0 (ref)
        if v11 == l_Object_0.None or v11 == nil then
            return nil;
        else
            return v11[v12];
        end;
    end, if typeof(v8) == "table" and v8.extensions then v8.extensions else l_Object_0.None));
end;
v5.getDirectivesInExtensions = v13;
local function v19(v14, v15) --[[ Line: 121 ]] --[[ Name: _getDirectiveInExtensions ]]
    -- upvalues: l_Array_0 (copy)
    local v17 = l_Array_0.filter(v14, function(v16) --[[ Line: 125 ]]
        -- upvalues: v15 (copy)
        return v16.name == v15;
    end);
    if #v17 == 0 then
        return nil;
    else
        return (l_Array_0.map(v17, function(v18) --[[ Line: 134 ]]
            if v18.args ~= nil then
                return v18.args;
            else
                return {};
            end;
        end));
    end;
end;
local function v34(v20, v21, v22) --[[ Line: 141 ]] --[[ Name: getDirectiveInExtensions ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), v19 (copy)
    local v23 = if v22 ~= nil then v22 else {
        "directives"
    };
    local v26 = l_Array_0.reduce(v23, function(v24, v25) --[[ Line: 151 ]]
        -- upvalues: l_Object_0 (ref)
        if v24 == l_Object_0.None or v24 == nil then
            return nil;
        else
            return v24[v25];
        end;
    end, if typeof(v20) == "table" and v20.extensions then v20.extensions else l_Object_0.None);
    if v26 == nil then
        return nil;
    elseif l_Boolean_0.toJSBoolean(l_Array_0.isArray(v26)) then
        return (v19(v26, v21));
    else
        local v27 = {};
        for _, v29 in l_Object_0.entries(v26) do
            local v30, v31 = table.unpack(v29, 1, 2);
            if l_Boolean_0.toJSBoolean(l_Array_0.isArray(v31)) then
                for _, v33 in v31 do
                    table.insert(v27, {
                        name = v30, 
                        args = v33
                    });
                end;
            else
                table.insert(v27, {
                    name = v30, 
                    args = v31
                });
            end;
        end;
        return (v19(v27, v21));
    end;
end;
v5.getDirectiveInExtensions = v34;
v5.getDirectives = function(v35, v36, v37) --[[ Line: 214 ]] --[[ Name: getDirectives ]]
    -- upvalues: v13 (copy), l_Boolean_0 (copy), l_Array_0 (copy), l_Object_0 (copy), l_getArgumentValues_0 (copy)
    local v38 = if v37 ~= nil then v37 else {
        "directives"
    };
    local v39 = v13(v36, v38);
    if v39 ~= nil and #v39 > 0 then
        return v39;
    else
        local v40 = if l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v35) then v35.getDirectives else v35) then v35:getDirectives() else {};
        local v43 = l_Array_0.reduce(v40, function(v41, v42) --[[ Line: 237 ]]
            v41[tostring(v42.name)] = v42;
            return v41;
        end, {});
        local v44 = {};
        if l_Boolean_0.toJSBoolean(v36.astNode) then
            table.insert(v44, v36.astNode);
        end;
        if l_Array_0.indexOf(l_Object_0.keys(v36), "extensionASTNodes") ~= -1 and l_Boolean_0.toJSBoolean(v36.extensionASTNodes) then
            v44 = l_Array_0.concat({}, v44, v36.extensionASTNodes);
        end;
        local v45 = {};
        for _, v47 in v44 do
            if l_Boolean_0.toJSBoolean(v47.directives) then
                for _, v49 in v47.directives do
                    local v50 = v43[tostring(v49.name.value)];
                    if l_Boolean_0.toJSBoolean(v50) then
                        table.insert(v45, {
                            name = v49.name.value, 
                            args = l_getArgumentValues_0(v50, v49)
                        });
                    end;
                end;
            end;
        end;
        return v45;
    end;
end;
v5.getDirective = function(v51, v52, v53, v54) --[[ Line: 278 ]] --[[ Name: getDirective ]]
    -- upvalues: v34 (copy), l_Boolean_0 (copy), l_Array_0 (copy), l_Object_0 (copy), l_getArgumentValues_0 (copy)
    local v55 = if v54 ~= nil then v54 else {
        "directives"
    };
    local v56 = v34(v52, v53, v55);
    if v56 ~= nil then
        return v56;
    else
        local v57 = if l_Boolean_0.toJSBoolean(if l_Boolean_0.toJSBoolean(v51) then v51.getDirective else v51) then v51:getDirective(v53) else nil;
        if v57 == nil then
            return nil;
        else
            local v58 = {};
            if l_Boolean_0.toJSBoolean(v52.astNode) then
                table.insert(v58, v52.astNode);
            end;
            if l_Array_0.indexOf(l_Object_0.keys(v52), "extensionASTNodes") ~= -1 and l_Boolean_0.toJSBoolean(v52.extensionASTNodes) then
                v58 = l_Array_0.concat({}, v58, v52.extensionASTNodes);
            end;
            local v59 = {};
            for _, v61 in v58 do
                if l_Boolean_0.toJSBoolean(v61.directives) then
                    for _, v63 in v61.directives do
                        if v63.name.value == v53 then
                            table.insert(v59, l_getArgumentValues_0(v57, v63));
                        end;
                    end;
                end;
            end;
            if not l_Boolean_0.toJSBoolean(#v59) then
                return nil;
            else
                return v59;
            end;
        end;
    end;
end;
return v5;