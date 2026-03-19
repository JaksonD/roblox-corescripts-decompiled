local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_String_0 = v2.String;
local l_getLocation_0 = require(l_Parent_0.location).getLocation;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local function v11(v10) --[[ Line: 27 ]] --[[ Name: printLocation ]]
    -- upvalues: v8 (ref), l_getLocation_0 (copy)
    return v8(v10.source, l_getLocation_0(v10.source, v10.start));
end;
v8 = function(v12, v13) --[[ Line: 34 ]] --[[ Name: printSourceLocation ]]
    -- upvalues: v6 (ref), l_String_0 (copy), v9 (ref), l_Array_0 (copy)
    local v14 = v12.locationOffset.column - 1;
    local v15 = v6(v14) .. v12.body;
    local v16 = v13.line - 1 + 1;
    local v17 = v12.locationOffset.line - 1;
    local v18 = v13.line + v17;
    local v19 = v13.line == 1 and v14 or 0;
    local v20 = v13.column + v19;
    local v21 = v12.name .. ":" .. v18 .. ":" .. v20 .. "\n";
    local v22 = l_String_0.split(v15, {
        "\r\n", 
        "\n", 
        "\r"
    });
    local v23 = v22[v16];
    if string.len(v23) > 120 then
        local v24 = math.floor(v20 / 80) + 1;
        local v25 = v20 % 80;
        local v26 = {};
        for v27 = 1, string.len(v23), 80 do
            table.insert(v26, l_String_0.slice(v23, v27, v27 + 80));
        end;
        return v21 .. v9(l_Array_0.concat({
            {
                tostring(v18), 
                v26[1]
            }
        }, l_Array_0.map(l_Array_0.slice(v26, 2, v24 + 1), function(v28) --[[ Line: 61 ]]
            return {
                "", 
                v28
            };
        end), {
            {
                " ", 
                v6(v25 - 1) .. "^"
            }
        }, {
            {
                "", 
                v26[v24 + 1]
            }
        }));
    else
        return v21 .. v9({
            {
                v18 - 1, 
                v22[v16 - 1]
            }, 
            {
                v18, 
                v23
            }, 
            {
                "", 
                v6(v20 - 1) .. "^"
            }, 
            {
                v18 + 1, 
                v22[v16 + 1]
            }
        });
    end;
end;
v9 = function(v29) --[[ Line: 83 ]] --[[ Name: printPrefixedLines ]]
    -- upvalues: l_Array_0 (copy), v7 (ref)
    local v31 = l_Array_0.filter(v29, function(v30) --[[ Line: 84 ]]
        return v30[2] ~= nil;
    end);
    local v33 = math.max(table.unpack(l_Array_0.map(v31, function(v32) --[[ Line: 89 ]]
        return (string.len(v32[1]));
    end)));
    return l_Array_0.join(l_Array_0.map(v31, function(v34) --[[ Line: 94 ]]
        -- upvalues: v7 (ref), v33 (copy)
        local v35 = v34[1];
        local v36 = v34[2];
        return v7(v33, v35) .. (v36 and v36 ~= "" and " | " .. v36 or " |");
    end), "\n");
end;
v6 = function(v37) --[[ Line: 103 ]] --[[ Name: whitespace ]]
    return string.rep(" ", v37);
end;
v7 = function(v38, v39) --[[ Line: 107 ]] --[[ Name: leftPad ]]
    -- upvalues: v6 (ref)
    return v6(v38 - string.len(v39)) .. v39;
end;
return {
    printSourceLocation = v8, 
    printLocation = v11
};