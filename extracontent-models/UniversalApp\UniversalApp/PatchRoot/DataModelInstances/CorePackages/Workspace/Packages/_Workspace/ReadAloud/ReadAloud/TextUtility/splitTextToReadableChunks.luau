local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Properties);
return function(v2, v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    local v6 = "()(" .. (v5 or v1.ValidTextTerminators) .. ")";
    local v7 = v3 or v1.PunctuationPauseDuration;
    local v8 = v4 or v1.TTSModelCharacterLimit;
    local v9 = string.rep(".", v7) .. " ";
    local v10 = {};
    local v11 = {};
    local v12 = 0;
    local v13 = 1;
    local function v22(v14) --[[ Line: 21 ]]
        -- upvalues: v2 (copy), v13 (ref), v9 (copy), v12 (ref), v8 (copy), v11 (copy), v10 (copy), v7 (copy)
        local v15 = v2:sub(v13, v14);
        local v16 = #v15 + #v9;
        if v12 + v16 > v8 and v12 > 0 then
            local v17 = table.concat(v11, v9);
            table.insert(v10, v17);
            table.clear(v11);
            v12 = 0;
        end;
        while v8 < v16 do
            local v18 = -1;
            for v19 = v8, 1, -1 do
                if string.sub(v15, v19, v19):match("%s") then
                    v18 = v19;
                    break;
                end;
            end;
            if v18 < 1 then
                table.insert(v10, v15:sub(1, v8));
                v13 = v13 + v8;
            else
                table.insert(v10, v15:sub(1, v18));
                v13 = v13 + v18;
            end;
            v15 = v2:sub(v13, v14);
            v16 = #v15 + v7;
        end;
        v12 = v12 + v16;
        table.insert(v11, v15);
        local v20, _ = v2:find("%S", v14 + 1);
        v13 = v20 or v14 + 1;
    end;
    for v23, v24 in (string.gmatch(v2, v6)) do
        if v23 >= v13 then
            local v25 = v23 + 1;
            if v24 == "\n" or v2:match("^%s+%a", v25) or v2:match("^%s*\n", v25) then
                v22(v23);
            end;
        end;
    end;
    if v13 <= #v2 then
        v22(#v2);
        if #v11 > 0 then
            table.insert(v10, (table.concat(v11, v9)));
        end;
    end;
    return v10;
end;