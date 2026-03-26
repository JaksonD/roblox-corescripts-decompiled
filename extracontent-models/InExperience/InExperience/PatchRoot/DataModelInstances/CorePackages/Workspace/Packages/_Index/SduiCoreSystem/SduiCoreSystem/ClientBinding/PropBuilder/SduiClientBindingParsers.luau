local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.getSduiTokensStore);
local v5 = require(l_script_FirstAncestor_0.ClientBinding.ProtoVariableMapper);
local l_FFlagSduiStructPropParsers_0 = require(l_Parent_0.SharedFlags).FFlagSduiStructPropParsers;
local function v9(v7, v8) --[[ Line: 11 ]] --[[ Name: applyTokenScaling ]]
    return v7 * (v8 and v8.Config.UI.Scale or 1);
end;
local function v19(v10, v11, v12) --[[ Line: 18 ]] --[[ Name: parseUDim2 ]]
    -- upvalues: v4 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 19 ]]
        -- upvalues: v10 (copy), v12 (copy), v4 (ref), v11 (copy)
        local v13 = string.split(v10, ",");
        if #v13 == 4 then
            local v14 = tonumber(v13[2]) or 0;
            local v15 = tonumber(v13[4]) or 0;
            if v12 then
                local v16 = v4().getTokens(v11, "parseUDim2");
                v14 = v14 * (v16 and v16.Config.UI.Scale or 1);
                v15 = v15 * (v16 and v16.Config.UI.Scale or 1);
            end;
            return UDim2.new(tonumber(v13[1]) or 0, v14, tonumber(v13[3]) or 0, v15);
        else
            error("Not enough components in string to parse UDim2");
            return;
        end;
    end);
    if l_status_0 and l_result_0 then
        return l_result_0;
    else
        error(if typeof(l_result_0) == "string" then l_result_0 else nil);
        return;
    end;
end;
local function v28(v20, v21, v22) --[[ Line: 44 ]] --[[ Name: parseUDim ]]
    -- upvalues: v4 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 45 ]]
        -- upvalues: v20 (copy), v22 (copy), v4 (ref), v21 (copy)
        local v23 = string.split(v20, ",");
        if #v23 == 2 then
            local v24 = tonumber(v23[2]) or 0;
            if v22 then
                local v25 = v4().getTokens(v21, "parseUDim2");
                v24 = v24 * (v25 and v25.Config.UI.Scale or 1);
            end;
            return UDim.new(tonumber(v23[1]) or 0, v24);
        else
            error("Not enough components in string to parse UDim");
            return;
        end;
    end);
    if l_status_1 and l_result_1 then
        return l_result_1;
    else
        error(if typeof(l_result_1) == "string" then l_result_1 else nil);
        return;
    end;
end;
local function v35(v29, v30, v31) --[[ Line: 70 ]] --[[ Name: parseNumber ]]
    -- upvalues: v4 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 75 ]]
        -- upvalues: v29 (copy)
        return (tonumber(v29));
    end);
    if l_status_2 and l_result_2 then
        if v31 then
            local v34 = v4().getTokens(v30, "parseUDim2");
            return l_result_2 * (v34 and v34.Config.UI.Scale or 1);
        else
            return l_result_2;
        end;
    else
        error(if typeof(l_result_2) == "string" then l_result_2 else nil);
        return;
    end;
end;
local function v38(v36, v37) --[[ Line: 89 ]] --[[ Name: parseUiScaledNumber ]]
    -- upvalues: v35 (copy)
    return v35(v36, v37, true);
end;
local function v41(v39, v40) --[[ Line: 93 ]] --[[ Name: parseUiScaledUDim ]]
    -- upvalues: v28 (copy)
    return v28(v39, v40, true);
end;
local function v44(v42, v43) --[[ Line: 97 ]] --[[ Name: parseUiScaledUDim2 ]]
    -- upvalues: v19 (copy)
    return v19(v42, v43, true);
end;
local function v45(v46) --[[ Line: 103 ]] --[[ Name: parseStruct ]]
    -- upvalues: v5 (copy), v45 (copy)
    if typeof(v46) ~= "table" then
        return v46;
    else
        local l_mapPropName_0 = v5.mapPropName;
        local v48 = {};
        for v49, v50 in v46 do
            v48[if typeof(v49) == "string" then l_mapPropName_0(v49) else v49] = if typeof(v50) == "table" then v45(v50) else v50;
        end;
        return v48;
    end;
end;
local function v55(v51) --[[ Line: 118 ]] --[[ Name: parseArrayOfStruct ]]
    -- upvalues: v45 (copy)
    if typeof(v51) ~= "table" then
        return v51;
    else
        local v52 = {};
        for v53, v54 in v51 do
            v52[v53] = v45(v54);
        end;
        return v52;
    end;
end;
return {
    parseUDim = v28, 
    parseUDim2 = v19, 
    parseNumber = v35, 
    applyTokenScaling = v9, 
    parseUiScaledNumber = v38, 
    parseUiScaledUDim = v41, 
    parseUiScaledUDim2 = v44, 
    parseStruct = if l_FFlagSduiStructPropParsers_0 then v45 else nil, 
    parseArrayOfStruct = if l_FFlagSduiStructPropParsers_0 then v55 else nil
};