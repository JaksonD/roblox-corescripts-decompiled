local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.formatValue);
local v2 = require(l_Parent_0.splitOn);
local v3 = require(l_Parent_0.startsWith);
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
return function(v6, ...) --[[ Line: 43 ]] --[[ Name: format ]]
    -- upvalues: v2 (copy), l_insert_0 (copy), v3 (copy), v1 (copy), l_concat_0 (copy)
    local v7 = {
        ...
    };
    local v8 = 1;
    local v9, v10 = v2(v6, "{[^{}]*}");
    local v11 = {};
    for v12, v13 in v9 do
        l_insert_0(v11, (v13:gsub("{{", "{"):gsub("}}", "}")));
        local v14 = v10[v12] and v10[v12]:sub(2, -2);
        if v14 then
            local v15 = v13:gmatch("{+$")();
            if not (v15 and #v15 % 2 == 1) then
                local v16 = v2(v14, ":");
                local v17 = v3(v16[1], "#");
                local v18 = v17 and v16[1]:sub(2) or v16[1];
                local v19 = tonumber(v18);
                local v20 = v16[2];
                local v21 = "nil";
                if v19 then
                    v21 = v7[v19];
                elseif v18:len() > 0 then
                    local v22 = v7[1] and v7[1][v18];
                    if v22 ~= nil then
                        v21 = v22;
                    end;
                else
                    v21 = v7[v8];
                    v8 = v8 + 1;
                end;
                if v17 then
                    v21 = #v21;
                end;
                l_insert_0(v11, v1(v21, v20 or ""));
            else
                l_insert_0(v11, v14);
            end;
        end;
    end;
    return l_concat_0(v11, "");
end;