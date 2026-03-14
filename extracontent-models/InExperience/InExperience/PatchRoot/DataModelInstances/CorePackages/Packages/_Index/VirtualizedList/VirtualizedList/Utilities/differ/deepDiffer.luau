local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = nil;
local function v6(v5) --[[ Line: 22 ]] --[[ Name: unstable_setLogListeners ]]
    -- upvalues: v4 (ref)
    v4 = v5;
end;
local function v7(v8, v9, v10, v11) --[[ Line: 29 ]] --[[ Name: deepDiffer ]]
    -- upvalues: v4 (ref), l_Boolean_0 (copy), l_Array_0 (copy), v7 (copy)
    local v12 = if v10 ~= nil then v10 else -1;
    local v13 = if typeof(v12) == "number" then v11 else v12;
    local v14 = if typeof(v12) == "number" then v12 else -1;
    if v14 == 0 then
        return true;
    elseif v8 == v9 then
        return false;
    elseif typeof(v8) == "function" and typeof(v9) == "function" then
        local v15 = v13 ~= nil and v13.unsafelyIgnoreFunctions ~= nil;
        local v16 = if v13 ~= nil and v15 then v13.unsafelyIgnoreFunctions else nil;
        if v16 == nil then
            if v4 ~= nil and l_Boolean_0.toJSBoolean(v4.onDifferentFunctionsIgnored) and (not l_Boolean_0.toJSBoolean(v13) or not v15) then
                v4.onDifferentFunctionsIgnored(debug.info(v8, "n"), debug.info(v9, "n"));
            end;
            v16 = true;
        end;
        return not v16;
    elseif typeof(v8) ~= "table" or v8 == nil then
        return v8 ~= v9;
    elseif typeof(v9) ~= "table" or v9 == nil then
        return true;
    elseif l_Array_0.isArray(v8) ~= l_Array_0.isArray(v9) then
        return true;
    else
        if l_Array_0.isArray(v8) then
            if #v9 ~= #v8 then
                return true;
            else
                for v17 = 1, #v8 do
                    if v7(v8[v17], v9[v17], v14 - 1, v13) then
                        return true;
                    end;
                end;
            end;
        else
            for v18 in pairs(v8) do
                if v7(v8[v18], v9[v18], v14 - 1, v13) then
                    return true;
                end;
            end;
            for v19 in pairs(v9) do
                if v8[v19] == nil and v9[v19] ~= nil then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
return (setmetatable({
    unstable_setLogListeners = v6
}, {
    __call = function(_, v21, v22, v23, v24) --[[ Line: 110 ]] --[[ Name: __call ]]
        -- upvalues: v7 (copy)
        return (v7(v21, v22, v23, v24));
    end
}));