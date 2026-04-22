local v0 = require(script.Parent.FFlagErrorStackFixDebugTracebackProcessing);
local function v7(v1, v2) --[[ Line: 21 ]] --[[ Name: splitStringWithMarks ]]
    if type(v1) ~= "string" or type(v2) ~= "table" then
        return v1, "";
    else
        for _, v4 in ipairs(v2) do
            local v5, v6 = v1:find(v4, nil, true);
            if v5 ~= nil then
                return v1:sub(1, v5 - 1), (v1:sub(v6 + 1));
            end;
        end;
        return v1, "";
    end;
end;
local function _(v8) --[[ Line: 39 ]] --[[ Name: findFileNameFromPath ]]
    if type(v8) ~= "string" then
        return "";
    else
        return string.match(v8, "([^.]*)$");
    end;
end;
return function(v10, v11) --[[ Line: 47 ]] --[[ Name: ProcessErrorStack ]]
    -- upvalues: v7 (copy), v0 (copy)
    local v12 = {};
    local v13 = {};
    if not v11 then
        v11 = 0;
    end;
    if type(v10) ~= "string" then
        return v12, v13;
    else
        for v14 in v10:gmatch("[^\r\n]+") do
            local _ = nil;
            local v16 = nil;
            local v17 = nil;
            local v18 = nil;
            local v19, v20 = v7(v14, {
                ", line ", 
                ", Line ", 
                ":"
            });
            v16 = v19;
            v19, v20 = v7(v20, {
                " - "
            });
            v18 = v19;
            v17 = v20;
            if v0 and v17 == "" and v18 ~= "" then
                v19, v20 = string.match(v18, "^(%d+)%s*(.*)");
                if v19 then
                    v18 = v19;
                    if v20 ~= "" then
                        v17 = v20;
                    end;
                end;
            end;
            if v18 ~= "" and v16 ~= "" then
                local v21;
                v19, v20, v21 = string.find(v16, "Script '(.*)'");
                if v21 ~= nil then
                    v16 = v21;
                end;
                local v22 = v13[v16];
                if v22 == nil then
                    v11 = v11 + 1;
                    v22 = v11;
                    v13[v16] = v22;
                end;
                if v17 == "" then
                    local l_v16_0 = v16;
                    v17 = type(l_v16_0) ~= "string" and "" or string.match(l_v16_0, "([^.]*)$");
                end;
                table.insert(v12, {
                    line = v18, 
                    funcName = v17, 
                    sourceCode = tostring(v22)
                });
            end;
        end;
        local v24 = {};
        for v25, v26 in pairs(v13) do
            v24[tostring(v26)] = {
                path = v25
            };
        end;
        return v12, v24, v11;
    end;
end;