local function v7(v0, v1) --[[ Line: 26 ]] --[[ Name: mergeTranslationParams ]]
    if type(v0) == "string" then
        return v0;
    else
        local v2 = {};
        if v0.params then
            for v3, v4 in pairs(v0.params) do
                v2[v3] = v4;
            end;
        end;
        for v5, v6 in pairs(v1) do
            v2[v5] = v6;
        end;
        return {
            ["$translate"] = v0["$translate"], 
            params = v2, 
            wrappers = v0.wrappers
        };
    end;
end;
local function v14(v8, v9, v10) --[[ Line: 54 ]] --[[ Name: getWrappedText ]]
    local v11 = "{" .. v8.type .. "Start}";
    local v12 = "{" .. v8.type .. "End}";
    if v8.type == "link" then
        if v9:find(v11) == nil or v9:find(v12) == nil then
            return v9, nil;
        else
            return v9:gsub(("%*(.-)%*"):format(v11, v12), string.format("<font color=\"rgb(%d, %d, %d)\">%s</font>", math.floor(v10.R * 255), math.floor(v10.G * 255), math.floor(v10.B * 255), "%1")), v8;
        end;
    elseif v8.type == "strong" then
        local v13 = string.gsub(v9, v11, "<b>");
        return string.gsub(v13, v12, "</b>"), nil;
    else
        warn("Unknown wrapper type: " .. tostring(v8.type));
        return v9, nil;
    end;
end;
return {
    mergeTranslationParams = v7, 
    translateIntoString = function(v15, v16) --[[ Line: 139 ]] --[[ Name: translateIntoString ]]
        if v16 == nil then
            return "";
        elseif type(v16) == "string" then
            return v16;
        else
            local v17 = v16["$translate"];
            local l_params_0 = v16.params;
            local v19 = v15[v17] or v17;
            if l_params_0 ~= nil then
                v19 = v19:gsub("{(.-)}", l_params_0);
            end;
            return (v19:gsub("{%w+Start}(.-)({%w+End})", "%1"):gsub("{%w+Start}", ""):gsub("{%w+End}", ""));
        end;
    end, 
    translateIntoRichTextString = function(v20, v21, v22) --[[ Line: 89 ]] --[[ Name: translateIntoRichTextString ]]
        -- upvalues: v14 (copy)
        if v21 == nil then
            return "", nil;
        elseif type(v21) == "string" then
            return v21, nil;
        elseif type(v21) ~= "table" then
            return tostring(v21), nil;
        else
            local v23 = v21["$translate"];
            if not v23 or type(v23) ~= "string" then
                return "", nil;
            else
                local l_params_1 = v21.params;
                local v25 = v20[v23] or v23;
                local v26 = nil;
                if l_params_1 ~= nil then
                    v25 = v25:gsub("{(.-)}", l_params_1);
                end;
                if v21.wrappers then
                    for _, v28 in pairs(v21.wrappers) do
                        local v29 = nil;
                        local v30, v31 = v14(v28, v25, v22);
                        v25 = v30;
                        v29 = v31;
                        if v29 ~= nil and v26 == nil then
                            v26 = v29;
                        end;
                    end;
                end;
                return v25, v26;
            end;
        end;
    end
};