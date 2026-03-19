return function(v0) --[[ Line: 1 ]]
    local function _(v1) --[[ Line: 2 ]] --[[ Name: makeKeyString ]]
        if type(v1) == "string" then
            return string.format("%s", v1);
        else
            return string.format("[%s]", (tostring(v1)));
        end;
    end;
    local function v5(v3) --[[ Line: 10 ]] --[[ Name: makeValueString ]]
        local v4 = type(v3);
        if v4 == "string" then
            return string.format("%q", v3);
        elseif v4 == "function" or v4 == "table" then
            return string.format("<%s>", (tostring(v3)));
        else
            return string.format("%s", (tostring(v3)));
        end;
    end;
    local function v13(v6, v7, v8, v9) --[[ Line: 21 ]] --[[ Name: printKeypair ]]
        -- upvalues: v5 (copy), v0 (copy)
        local v10 = if type(v6) == "string" then string.format("%s", v6) else string.format("[%s]", (tostring(v6)));
        local v11 = v5(v7);
        local v12 = v9 and string.format(" -- %s", v9) or "";
        v0(string.format("%s%s = %s,%s", v8, v10, v11, v12));
    end;
    return function(v14, v15) --[[ Line: 33 ]]
        -- upvalues: v0 (copy), v5 (copy), v13 (copy)
        v15 = v15 or "  ";
        if type(v14) ~= "table" then
            error("tutils.Print must be passed a table", 2);
        end;
        local v16 = {};
        local function v17(v18, v19, v20) --[[ Line: 43 ]] --[[ Name: recurse ]]
            -- upvalues: v16 (copy), v15 (ref), v0 (ref), v5 (ref), v13 (ref), v17 (copy)
            v16[v18] = true;
            local v21 = string.rep(v15, v20);
            local v22 = string.rep(v15, v20 + 1);
            if v19 then
                v0(string.format("%s%s = %s {", v21, if type(v19) == "string" then string.format("%s", v19) else string.format("[%s]", (tostring(v19))), v5(v18)));
            else
                v0(string.format("%s%s {", v21, v5(v18)));
            end;
            for v23, v24 in pairs(v18) do
                if type(v24) == "table" then
                    if v16[v24] then
                        v13(v23, v24, v22, "Possible cycle");
                    else
                        v17(v24, v23, v20 + 1);
                    end;
                else
                    v13(v23, v24, v22);
                end;
            end;
            v0(string.format("%s}%s", v21, v20 > 0 and "," or ""));
        end;
        v17(v14, nil, 0);
    end;
end;