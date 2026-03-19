local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.StringSplit);
assertIsType = function(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: assertIsType ]]
    -- upvalues: l_RunService_0 (copy)
    if l_RunService_0:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ then
        assert(typeof(v2) == v3, string.format("expects %s to be a %s! it was: %s", v4, v3, (typeof(v2))));
    end;
end;
local function v8(v5) --[[ Line: 14 ]] --[[ Name: urlDecode ]]
    assertIsType(v5, "string", "input");
    local v7 = string.gsub(v5, "%%(%x%x)", function(v6) --[[ Line: 16 ]]
        return (string.char((tonumber(v6, 16))));
    end);
    return (string.gsub(v7, "+", " "));
end;
return function(v9, v10) --[[ Line: 36 ]] --[[ Name: ParseQuery ]]
    -- upvalues: v1 (copy), v8 (copy)
    if v9 ~= nil then
        assertIsType(v9, "string", "input");
    end;
    if v10 ~= nil then
        assertIsType(v10, "function", "listKeyMapper");
    end;
    local v11 = type(v10) == "function";
    local v12 = {};
    if v9 and #v9 > 0 then
        local v13 = v1(v9, "[&;]");
        for _, v15 in ipairs(v13) do
            if v15 and #v15 > 0 then
                local v16, v17 = unpack(string.split(v15, "="));
                if v17 == nil then
                    v17 = "";
                end;
                v16 = v8(v16);
                v17 = v8(v17);
                if v11 then
                    if v12[v16] ~= nil then
                        local v18 = v10(v16);
                        if v18 == nil then
                            v18 = v16;
                        end;
                        if type(v12[v18]) ~= "table" then
                            v12[v18] = {
                                v12[v16]
                            };
                        end;
                        table.insert(v12[v18], v17);
                        if v16 ~= v18 then
                            v12[v16] = v17;
                        end;
                    else
                        v12[v16] = v17;
                    end;
                else
                    if v12[v16] == nil then
                        v12[v16] = {};
                    end;
                    table.insert(v12[v16], v17);
                end;
            end;
        end;
    end;
    return v12;
end;