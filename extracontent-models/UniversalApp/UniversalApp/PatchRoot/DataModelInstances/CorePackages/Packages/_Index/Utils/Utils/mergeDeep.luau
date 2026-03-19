local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local v5 = {};
local l_isSymbol_0 = require(l_Parent_0.Utils.jsHelpers).isSymbol;
local v7 = nil;
local function v8(v9, v10) --[[ Line: 26 ]] --[[ Name: mergeDeep ]]
    -- upvalues: l_Boolean_0 (copy), v7 (ref), l_isSymbol_0 (copy), l_Array_0 (copy), l_Object_0 (copy), v8 (copy)
    local v11 = v10 ~= nil and v10;
    local v12 = if l_Boolean_0.toJSBoolean(v9[1]) then v9[1] else {};
    local v13 = {};
    for _, v15 in v9 do
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local v17 = v7(v12);
        if l_toJSBoolean_0(if l_Boolean_0.toJSBoolean(v17) then v7(v15) else v17) then
            for v18 in v15 do
                if not l_isSymbol_0(v18) then
                    if l_Boolean_0.toJSBoolean(v7(v15[tostring(v18)])) then
                        if l_Array_0.indexOf(l_Object_0.keys(v13), (tostring(v18))) == -1 then
                            l_Object_0.assign(v13, {
                                [tostring(v18)] = v15[tostring(v18)]
                            });
                        else
                            v13[v18] = v8({
                                v13[v18], 
                                v15[v18]
                            }, v11);
                        end;
                    else
                        l_Object_0.assign(v13, {
                            [tostring(v18)] = v15[tostring(v18)]
                        });
                    end;
                end;
            end;
        end;
    end;
    return v13;
end;
v5.mergeDeep = v8;
v7 = function(v19) --[[ Line: 98 ]] --[[ Name: isObject ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy)
    return l_Boolean_0.toJSBoolean(v19) and typeof(v19) == "table" and not (l_Array_0.isArray(v19) and #v19 > 0);
end;
return v5;