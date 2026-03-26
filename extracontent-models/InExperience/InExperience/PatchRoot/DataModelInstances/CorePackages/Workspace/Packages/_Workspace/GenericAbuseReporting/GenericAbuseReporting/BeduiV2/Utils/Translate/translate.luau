local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_FFlagUpdateTranslateInReportRevamp_0 = require(l_Parent_0.SharedFlags).FFlagUpdateTranslateInReportRevamp;
local function v9(v2, v3) --[[ Line: 33 ]] --[[ Name: mergeTranslationParams ]]
    if type(v2) == "string" then
        return v2;
    else
        local v4 = {};
        if v2.params then
            for v5, v6 in pairs(v2.params) do
                v4[v5] = v6;
            end;
        end;
        for v7, v8 in pairs(v3) do
            v4[v7] = v8;
        end;
        return {
            ["$translate"] = v2["$translate"], 
            params = v4, 
            wrappers = v2.wrappers
        };
    end;
end;
local function v16(v10, v11, v12) --[[ Line: 61 ]] --[[ Name: getWrappedText ]]
    local v13 = "{" .. v10.type .. "Start}";
    local v14 = "{" .. v10.type .. "End}";
    if v10.type == "link" then
        if v11:find(v13) == nil or v11:find(v14) == nil then
            return v11, nil;
        else
            return v11:gsub(("%*(.-)%*"):format(v13, v14), string.format("<font color=\"rgb(%d, %d, %d)\">%s</font>", math.floor(v12.R * 255), math.floor(v12.G * 255), math.floor(v12.B * 255), "%1")), v10;
        end;
    elseif v10.type == "strong" then
        local v15 = string.gsub(v11, v13, "<b>");
        return string.gsub(v15, v14, "</b>"), nil;
    else
        warn("Unknown wrapper type: " .. tostring(v10.type));
        return v11, nil;
    end;
end;
local v17 = nil;
local function v23(v18, v19) --[[ Line: 93 ]] --[[ Name: resolveParams ]]
    -- upvalues: v17 (ref)
    if v19 == nil then
        return nil;
    else
        local v20 = {};
        for v21, v22 in pairs(v19) do
            if type(v22) == "string" then
                v20[v21] = v22;
            else
                v20[v21] = v17(v18, v22);
            end;
        end;
        return v20;
    end;
end;
local function v37(v24, v25, v26) --[[ Line: 118 ]] --[[ Name: translateIntoRichTextString ]]
    -- upvalues: l_FFlagUpdateTranslateInReportRevamp_0 (copy), v23 (copy), v16 (copy)
    if v25 == nil then
        return "", nil;
    elseif type(v25) == "string" then
        return v25, nil;
    elseif type(v25) ~= "table" then
        return tostring(v25), nil;
    else
        local v27 = v25["$translate"];
        if not v27 or type(v27) ~= "string" then
            return "", nil;
        else
            local l_params_0 = v25.params;
            local v29 = nil;
            if l_FFlagUpdateTranslateInReportRevamp_0 then
                v29 = v23(v24, l_params_0);
            end;
            local v30 = v24[v27] or v27;
            local v31 = nil;
            if l_FFlagUpdateTranslateInReportRevamp_0 and v29 ~= nil then
                v30 = v30:gsub("{(.-)}", v29);
            elseif l_params_0 ~= nil then
                v30 = v30:gsub("{(.-)}", l_params_0);
            end;
            if v25.wrappers then
                for _, v33 in pairs(v25.wrappers) do
                    local v34 = nil;
                    local v35, v36 = v16(v33, v30, v26);
                    v30 = v35;
                    v34 = v36;
                    if v34 ~= nil and v31 == nil then
                        v31 = v34;
                    end;
                end;
            end;
            return v30, v31;
        end;
    end;
end;
v17 = function(v38, v39) --[[ Line: 174 ]]
    -- upvalues: l_FFlagUpdateTranslateInReportRevamp_0 (copy), v23 (copy)
    if v39 == nil then
        return "";
    elseif type(v39) == "string" then
        return v39;
    else
        local v40 = v39["$translate"];
        local l_params_1 = v39.params;
        local v42 = nil;
        if l_FFlagUpdateTranslateInReportRevamp_0 then
            v42 = v23(v38, l_params_1);
        end;
        local v43 = v38[v40] or v40;
        if l_FFlagUpdateTranslateInReportRevamp_0 and v42 ~= nil then
            v43 = v43:gsub("{(.-)}", v42);
        elseif l_params_1 ~= nil then
            v43 = v43:gsub("{(.-)}", l_params_1);
        end;
        return (v43:gsub("{%w+Start}(.-)({%w+End})", "%1"):gsub("{%w+Start}", ""):gsub("{%w+End}", ""));
    end;
end;
return {
    mergeTranslationParams = v9, 
    translateIntoString = v17, 
    translateIntoRichTextString = v37
};