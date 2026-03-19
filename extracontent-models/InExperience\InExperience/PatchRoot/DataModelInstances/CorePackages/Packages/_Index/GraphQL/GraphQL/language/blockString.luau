local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_String_0 = v1.String;
local v4 = nil;
local v5 = nil;
local _ = nil;
v5 = function(v7) --[[ Line: 22 ]] --[[ Name: dedentBlockStringValue ]]
    -- upvalues: l_String_0 (copy), v4 (ref), l_Array_0 (copy)
    local v8 = l_String_0.split(v7, {
        "\r\n", 
        "\n", 
        "\r"
    });
    local v9 = v4(v7);
    if v9 ~= 0 then
        for v10 = 2, #v8 do
            v8[v10] = l_String_0.slice(v8[v10], v9 + 1);
        end;
    end;
    local v11 = 0;
    while v11 < #v8 and isBlank(v8[v11 + 1]) do
        v11 = v11 + 1;
    end;
    local v12 = #v8;
    while v11 < v12 and isBlank(v8[v12 - 1 + 1]) do
        v12 = v12 - 1;
    end;
    return l_Array_0.join(l_Array_0.slice(v8, v11 + 1, v12 + 1), "\n");
end;
isBlank = function(v13) --[[ Line: 51 ]] --[[ Name: isBlank ]]
    for v14 = 1, #v13 do
        local v15 = string.sub(v13, v14, v14);
        if v15 ~= " " and v15 ~= "\t" then
            return false;
        end;
    end;
    return true;
end;
v4 = function(v16) --[[ Line: 62 ]] --[[ Name: getBlockStringIndentation ]]
    -- upvalues: l_String_0 (copy)
    local v17 = true;
    local v18 = true;
    local v19 = 0;
    local v20 = nil;
    local v21 = 1;
    local v22 = string.len(v16);
    while v21 <= v22 do
        local v23 = l_String_0.charCodeAt(v16, v21);
        if v23 == 13 and l_String_0.charCodeAt(v16, v21 + 1) == 10 then
            v21 = v21 + 1;
        end;
        if v23 == 10 then
            v17 = false;
            v18 = true;
            v19 = 0;
        elseif v23 == 9 or v23 == 32 then
            v19 = v19 + 1;
        else
            if v18 and v17 ~= true and (v20 == nil or v19 < v20) then
                v20 = v19;
            end;
            v18 = false;
        end;
        v21 = v21 + 1;
    end;
    return v20 and v20 or 0;
end;
return {
    getBlockStringIndentation = v4, 
    dedentBlockStringValue = v5, 
    printBlockString = function(v24, v25, v26) --[[ Line: 102 ]] --[[ Name: printBlockString ]]
        local v27 = v25 or "";
        local v28 = v26 ~= nil and v26;
        local v29 = string.find(v24, "\n") == nil;
        local v30 = true;
        if string.sub(v24, 1, 1) ~= " " then
            v30 = string.sub(v24, 1, 1) == "\t";
        end;
        local v31 = string.sub(v24, #v24, #v24) == "\"";
        local v32 = string.sub(v24, #v24, #v24) == "\\";
        local v33 = true;
        if v29 == true then
            v33 = v31 or v32 or v28;
        end;
        local v34 = "";
        if v33 and (v29 and v30) ~= true then
            v34 = v34 .. "\n" .. v27;
        end;
        v34 = v34 .. (v27 ~= "" and string.gsub(v24, "\n", "\n" .. v27) or v24);
        if v33 then
            v34 = v34 .. "\n";
        end;
        return "\"\"\"" .. string.gsub(v34, "\"\"\"", "\\\"\"\"") .. "\"\"\"";
    end
};