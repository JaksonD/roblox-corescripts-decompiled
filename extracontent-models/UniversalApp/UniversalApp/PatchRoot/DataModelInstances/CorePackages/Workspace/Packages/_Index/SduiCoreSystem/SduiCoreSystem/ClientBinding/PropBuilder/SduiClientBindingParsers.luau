local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.ClientBinding.getSduiTokensStore);
local function v7(v5, v6) --[[ Line: 8 ]] --[[ Name: applyTokenScaling ]]
    return v5 * (v6 and v6.Config.UI.Scale or 1);
end;
local function v17(v8, v9, v10) --[[ Line: 15 ]] --[[ Name: parseUDim2 ]]
    -- upvalues: v4 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
        -- upvalues: v8 (copy), v10 (copy), v4 (ref), v9 (copy)
        local v11 = string.split(v8, ",");
        if #v11 == 4 then
            local v12 = tonumber(v11[2]) or 0;
            local v13 = tonumber(v11[4]) or 0;
            if v10 then
                local v14 = v4().getTokens(v9, "parseUDim2");
                v12 = v12 * (v14 and v14.Config.UI.Scale or 1);
                v13 = v13 * (v14 and v14.Config.UI.Scale or 1);
            end;
            return UDim2.new(tonumber(v11[1]) or 0, v12, tonumber(v11[3]) or 0, v13);
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
local function v26(v18, v19, v20) --[[ Line: 41 ]] --[[ Name: parseUDim ]]
    -- upvalues: v4 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 42 ]]
        -- upvalues: v18 (copy), v20 (copy), v4 (ref), v19 (copy)
        local v21 = string.split(v18, ",");
        if #v21 == 2 then
            local v22 = tonumber(v21[2]) or 0;
            if v20 then
                local v23 = v4().getTokens(v19, "parseUDim2");
                v22 = v22 * (v23 and v23.Config.UI.Scale or 1);
            end;
            return UDim.new(tonumber(v21[1]) or 0, v22);
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
local function v33(v27, v28, v29) --[[ Line: 67 ]] --[[ Name: parseNumber ]]
    -- upvalues: v4 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 72 ]]
        -- upvalues: v27 (copy)
        return (tonumber(v27));
    end);
    if l_status_2 and l_result_2 then
        if v29 then
            local v32 = v4().getTokens(v28, "parseUDim2");
            return l_result_2 * (v32 and v32.Config.UI.Scale or 1);
        else
            return l_result_2;
        end;
    else
        error(if typeof(l_result_2) == "string" then l_result_2 else nil);
        return;
    end;
end;
return {
    parseUDim = v26, 
    parseUDim2 = v17, 
    parseNumber = v33, 
    applyTokenScaling = v7, 
    parseUiScaledNumber = function(v34, v35) --[[ Line: 86 ]] --[[ Name: parseUiScaledNumber ]]
        -- upvalues: v33 (copy)
        return v33(v34, v35, true);
    end, 
    parseUiScaledUDim = function(v36, v37) --[[ Line: 90 ]] --[[ Name: parseUiScaledUDim ]]
        -- upvalues: v26 (copy)
        return v26(v36, v37, true);
    end, 
    parseUiScaledUDim2 = function(v38, v39) --[[ Line: 94 ]] --[[ Name: parseUiScaledUDim2 ]]
        -- upvalues: v17 (copy)
        return v17(v38, v39, true);
    end
};