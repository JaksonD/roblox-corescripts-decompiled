local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.getSduiTokensStore);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local l_FFlagSduiStructPropParsers_0 = require(l_Parent_0.SharedFlags).FFlagSduiStructPropParsers;
local l_FFlagSduiPropParsersShouldHandleTokens_0 = require(l_Parent_0.SharedFlags).FFlagSduiPropParsersShouldHandleTokens;
local function v10(v8, v9) --[[ Line: 12 ]] --[[ Name: applyTokenScaling ]]
    return v8 * (v9 and v9.Config.UI.Scale or 1);
end;
local function v21(v11, v12) --[[ Line: 17 ]] --[[ Name: resolveTokenValueToNumber ]]
    local v13 = string.sub(v12, 1, 1) == "-";
    local v14 = if v13 then string.sub(v12, 2) else v12;
    local l_v11_0 = v11;
    local v16 = string.split(v14, ".");
    local v17 = #v16;
    for v18, v19 in v16 do
        local v20 = l_v11_0[v19];
        if v18 ~= v17 and typeof(v20) ~= "table" then
            error((("Token path %* invalid"):format(v14)));
        end;
        l_v11_0 = l_v11_0[v19];
    end;
    if typeof(l_v11_0) ~= "number" then
        error((("Token path %* did not resolve to a number: %*"):format(v14, v12)));
    end;
    if v13 then
        return l_v11_0 * -1;
    else
        return l_v11_0;
    end;
end;
local function v30(v22, v23, v24, v25) --[[ Line: 41 ]] --[[ Name: getTokenOrNumber ]]
    -- upvalues: v4 (copy), v21 (copy)
    local v26 = tonumber(v22);
    if v26 then
        if v24 then
            local v27 = v4().getTokens(v23, v25);
            return v26 * (v27 and v27.Config.UI.Scale or 1);
        else
            return v26;
        end;
    elseif typeof(v22) == "string" then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 56 ]]
            -- upvalues: v21 (ref), v4 (ref), v23 (copy), v25 (copy), v22 (copy)
            return (v21(v4().getTokens(v23, v25), v22));
        end);
        if l_status_0 and l_result_0 then
            return l_result_0;
        else
            error(if typeof(l_result_0) == "string" then l_result_0 else nil);
            return;
        end;
    else
        error("Expected number or token string, got " .. typeof(v22));
        return;
    end;
end;
local v48 = l_FFlagSduiPropParsersShouldHandleTokens_0 and function(v31, v32, v33) --[[ Line: 73 ]]
    -- upvalues: v30 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 74 ]]
        -- upvalues: v31 (copy), v30 (ref), v32 (copy), v33 (copy)
        local v34 = string.split(v31, ",");
        if #v34 == 4 then
            local v35 = v30(v34[2], v32, v33, "parseUDim2");
            local v36 = v30(v34[4], v32, v33, "parseUDim2");
            return UDim2.new(tonumber(v34[1]) or 0, v35, tonumber(v34[3]) or 0, v36);
        else
            error("Not enough components in string to parse UDim2");
            return;
        end;
    end);
    if l_status_1 and l_result_1 then
        return l_result_1;
    else
        error(if typeof(l_result_1) == "string" then l_result_1 else nil);
        return;
    end;
end or function(v39, v40, v41) --[[ Line: 91 ]]
    -- upvalues: v4 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 92 ]]
        -- upvalues: v39 (copy), v41 (copy), v4 (ref), v40 (copy)
        local v42 = string.split(v39, ",");
        if #v42 == 4 then
            local v43 = tonumber(v42[2]) or 0;
            local v44 = tonumber(v42[4]) or 0;
            if v41 then
                local v45 = v4().getTokens(v40, "parseUDim2");
                v43 = v43 * (v45 and v45.Config.UI.Scale or 1);
                v44 = v44 * (v45 and v45.Config.UI.Scale or 1);
            end;
            return UDim2.new(tonumber(v42[1]) or 0, v43, tonumber(v42[3]) or 0, v44);
        else
            error("Not enough components in string to parse UDim2");
            return;
        end;
    end);
    if l_status_2 and l_result_2 then
        return l_result_2;
    else
        error(if typeof(l_result_2) == "string" then l_result_2 else nil);
        return;
    end;
end;
local v64 = l_FFlagSduiPropParsersShouldHandleTokens_0 and function(v49, v50, v51) --[[ Line: 119 ]]
    -- upvalues: v30 (copy)
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 120 ]]
        -- upvalues: v49 (copy), v30 (ref), v50 (copy), v51 (copy)
        local v52 = string.split(v49, ",");
        if #v52 == 2 then
            local v53 = v30(v52[2], v50, v51, "parseUDim");
            return UDim.new(tonumber(v52[1]) or 0, v53);
        else
            error("Not enough components in string to parse UDim");
            return;
        end;
    end);
    if l_status_3 and l_result_3 then
        return l_result_3;
    else
        error(if typeof(l_result_3) == "string" then l_result_3 else nil);
        return;
    end;
end or function(v56, v57, v58) --[[ Line: 136 ]]
    -- upvalues: v4 (copy)
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 137 ]]
        -- upvalues: v56 (copy), v58 (copy), v4 (ref), v57 (copy)
        local v59 = string.split(v56, ",");
        if #v59 == 2 then
            local v60 = tonumber(v59[2]) or 0;
            if v58 then
                local v61 = v4().getTokens(v57, "parseUDim2");
                v60 = v60 * (v61 and v61.Config.UI.Scale or 1);
            end;
            return UDim.new(tonumber(v59[1]) or 0, v60);
        else
            error("Not enough components in string to parse UDim");
            return;
        end;
    end);
    if l_status_4 and l_result_4 then
        return l_result_4;
    else
        error(if typeof(l_result_4) == "string" then l_result_4 else nil);
        return;
    end;
end;
local function v71(v65, v66, v67) --[[ Line: 162 ]] --[[ Name: parseNumber ]]
    -- upvalues: v4 (copy)
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 167 ]]
        -- upvalues: v65 (copy)
        return (tonumber(v65));
    end);
    if l_status_5 and l_result_5 then
        if v67 then
            local v70 = v4().getTokens(v66, "parseUDim2");
            return l_result_5 * (v70 and v70.Config.UI.Scale or 1);
        else
            return l_result_5;
        end;
    else
        error(if typeof(l_result_5) == "string" then l_result_5 else nil);
        return;
    end;
end;
local function v74(v72, v73) --[[ Line: 181 ]] --[[ Name: parseUiScaledNumber ]]
    -- upvalues: v71 (copy)
    return v71(v72, v73, true);
end;
local function v77(v75, v76) --[[ Line: 185 ]] --[[ Name: parseUiScaledUDim ]]
    -- upvalues: v64 (copy)
    return v64(v75, v76, true);
end;
local function v80(v78, v79) --[[ Line: 189 ]] --[[ Name: parseUiScaledUDim2 ]]
    -- upvalues: v48 (copy)
    return v48(v78, v79, true);
end;
local function v81(v82) --[[ Line: 195 ]] --[[ Name: parseStruct ]]
    -- upvalues: v5 (copy), v81 (copy)
    if typeof(v82) ~= "table" then
        return v82;
    else
        local l_mapPropName_0 = v5.mapPropName;
        local v84 = {};
        for v85, v86 in v82 do
            v84[if typeof(v85) == "string" then l_mapPropName_0(v85) else v85] = if typeof(v86) == "table" then v81(v86) else v86;
        end;
        return v84;
    end;
end;
local function v91(v87) --[[ Line: 210 ]] --[[ Name: parseArrayOfStruct ]]
    -- upvalues: v81 (copy)
    if typeof(v87) ~= "table" then
        return v87;
    else
        local v88 = {};
        for v89, v90 in v87 do
            v88[v89] = v81(v90);
        end;
        return v88;
    end;
end;
return {
    parseUDim = v64, 
    parseUDim2 = v48, 
    parseNumber = v71, 
    applyTokenScaling = v10, 
    parseUiScaledNumber = v74, 
    parseUiScaledUDim = v77, 
    parseUiScaledUDim2 = v80, 
    parseStruct = if l_FFlagSduiStructPropParsers_0 then v81 else nil, 
    parseArrayOfStruct = if l_FFlagSduiStructPropParsers_0 then v91 else nil
};