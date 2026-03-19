local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v4(v2) --[[ Line: 18 ]] --[[ Name: isColorStyle ]]
    local v3 = false;
    if type(v2) == "table" then
        v3 = false;
        if v2.Color3 ~= nil then
            v3 = false;
            if typeof(v2.Color3) == "Color3" then
                v3 = false;
                if v2.Transparency ~= nil then
                    v3 = typeof(v2.Transparency) == "number";
                end;
            end;
        end;
    end;
    return v3;
end;
local function _(v5) --[[ Line: 26 ]] --[[ Name: getRoundedNumber ]]
    return math.round(v5 * 1000) / 1000;
end;
local function _(v7, v8) --[[ Line: 30 ]] --[[ Name: getRGBAValues ]]
    local v9 = math.round(v7.R * 255);
    local v10 = math.round(v7.G * 255);
    local v11 = math.round(v7.B * 255);
    if v8 then
        return v9, v10, v11, math.round((1 - v8) * 1000) / 1000;
    else
        return v9, v10, v11;
    end;
end;
local function v22(v13, v14) --[[ Line: 38 ]] --[[ Name: formatColorPreviewHTML ]]
    local v15 = math.round(v13.R * 255);
    local v16 = math.round(v13.G * 255);
    local v17 = math.round(v13.B * 255);
    local v18, v19, v20, v21;
    if v14 then
        v18 = v15;
        v19 = v16;
        v20 = v17;
        v21 = math.round((1 - v14) * 1000) / 1000;
    else
        v18 = v15;
        v19 = v16;
        v20 = v17;
        v21 = nil;
    end;
    return (("<span class=\"color-preview\" style=\"background-color: rgba(%*,%*,%*,%*);\"></span>"):format(v18, v19, v20, v21 or 1));
end;
local function v33(v23) --[[ Line: 44 ]] --[[ Name: formatTokenValue ]]
    if typeof(v23) == "Color3" then
        return (("rgb(%*, %*, %*)"):format(math.round(v23.R * 255), math.round(v23.G * 255), (math.round(v23.B * 255))));
    elseif typeof(v23) == "number" then
        return (tostring(math.round(v23 * 1000) / 1000));
    else
        local v24 = false;
        if type(v23) == "table" then
            v24 = false;
            if v23.Color3 ~= nil then
                v24 = false;
                if typeof(v23.Color3) == "Color3" then
                    v24 = false;
                    if v23.Transparency ~= nil then
                        v24 = typeof(v23.Transparency) == "number";
                    end;
                end;
            end;
        end;
        if v24 then
            local l_Color3_0 = v23.Color3;
            local l_Transparency_0 = v23.Transparency;
            local v27 = math.round(l_Color3_0.R * 255);
            local v28 = math.round(l_Color3_0.G * 255);
            local v29 = math.round(l_Color3_0.B * 255);
            local v30, v31, v32;
            if l_Transparency_0 then
                v24 = v27;
                v30 = v28;
                v31 = v29;
                v32 = math.round((1 - l_Transparency_0) * 1000) / 1000;
            else
                v24 = v27;
                v30 = v28;
                v31 = v29;
                v32 = nil;
            end;
            return (("rgba(%*, %*, %*, %*)"):format(v24, v30, v31, v32));
        else
            return (tostring(v23));
        end;
    end;
end;
local function v52(v34) --[[ Line: 59 ]] --[[ Name: formatTokenValueHTML ]]
    if typeof(v34) == "Color3" then
        local v35 = math.round(v34.R * 255);
        local v36 = math.round(v34.G * 255);
        local v37 = math.round(v34.B * 255);
        return (("<span class=\"color\">%* rgb(%*, %*, %*)</span>"):format(("<span class=\"color-preview\" style=\"background-color: rgba(%*,%*,%*,%*);\"></span>"):format(math.round(v34.R * 255), math.round(v34.G * 255), math.round(v34.B * 255), nil or 1), v35, v36, v37));
    elseif typeof(v34) == "number" then
        return (tostring(math.round(v34 * 1000) / 1000));
    else
        local v38 = false;
        if type(v34) == "table" then
            v38 = false;
            if v34.Color3 ~= nil then
                v38 = false;
                if typeof(v34.Color3) == "Color3" then
                    v38 = false;
                    if v34.Transparency ~= nil then
                        v38 = typeof(v34.Transparency) == "number";
                    end;
                end;
            end;
        end;
        if v38 then
            local l_Color3_1 = v34.Color3;
            local l_Transparency_1 = v34.Transparency;
            local v41 = math.round(l_Color3_1.R * 255);
            local v42 = math.round(l_Color3_1.G * 255);
            local v43 = math.round(l_Color3_1.B * 255);
            local v44, v45, v46;
            if l_Transparency_1 then
                v38 = v41;
                v44 = v42;
                v45 = v43;
                v46 = math.round((1 - l_Transparency_1) * 1000) / 1000;
            else
                v38 = v41;
                v44 = v42;
                v45 = v43;
                v46 = nil;
            end;
            l_Transparency_1 = v34.Color3;
            v41 = v34.Transparency;
            local v47 = math.round(l_Transparency_1.R * 255);
            local v48 = math.round(l_Transparency_1.G * 255);
            local v49 = math.round(l_Transparency_1.B * 255);
            local v50, v51;
            if v41 then
                v42 = v47;
                v43 = v48;
                v50 = v49;
                v51 = math.round((1 - v41) * 1000) / 1000;
            else
                v42 = v47;
                v43 = v48;
                v50 = v49;
                v51 = nil;
            end;
            return (("<span class=\"color\">%* rgba(%*, %*, %*, %*)</span>"):format(("<span class=\"color-preview\" style=\"background-color: rgba(%*,%*,%*,%*);\"></span>"):format(v42, v43, v50, v51 or 1), v38, v44, v45, v46));
        else
            return (tostring(v34));
        end;
    end;
end;
local function v53(v54, v55, v56, v57) --[[ Line: 76 ]] --[[ Name: collectTokens ]]
    -- upvalues: v53 (copy)
    local v58 = false;
    local v59 = {};
    for v60, v61 in v54 do
        local v62 = if v56 then ("%*.%*"):format(v56, v60) else v60;
        if type(v61) == "table" and not getmetatable(v61) then
            if v57 then
                local v63 = false;
                if type(v61) == "table" then
                    v63 = false;
                    if v61.Color3 ~= nil then
                        v63 = false;
                        if typeof(v61.Color3) == "Color3" then
                            v63 = false;
                            if v61.Transparency ~= nil then
                                v63 = typeof(v61.Transparency) == "number";
                            end;
                        end;
                    end;
                end;
                v58 = v63;
            end;
            if not v58 then
                for _, v65 in (v53(v61, v55, v62, v57)) do
                    table.insert(v59, v65);
                end;
                continue;
            end;
        end;
        v58 = false;
        table.insert(v59, {
            key = v60, 
            value = v61, 
            category = v55, 
            fullPath = v62
        });
    end;
    return v59;
end;
return {
    isColorStyle = v4, 
    formatColorPreviewHTML = v22, 
    formatTokenValue = v33, 
    formatTokenValueHTML = v52, 
    collectTokens = v53, 
    collectTokensWithSubcategories = function(v66, v67, v68, v69) --[[ Line: 103 ]] --[[ Name: collectTokensWithSubcategories ]]
        -- upvalues: v53 (copy)
        local v70 = {};
        for v71, v72 in v66 do
            local v73 = if v68 then ("%*.%*"):format(v68, v71) else v71;
            if type(v72) == "table" then
                if v69 then
                    local v74 = false;
                    if type(v72) == "table" then
                        v74 = false;
                        if v72.Color3 ~= nil then
                            v74 = false;
                            if typeof(v72.Color3) == "Color3" then
                                v74 = false;
                                if v72.Transparency ~= nil then
                                    v74 = typeof(v72.Transparency) == "number";
                                end;
                            end;
                        end;
                    end;
                    if v74 then
                        v74 = if v68 then v68:split(".")[1] else "Default";
                        if not v70[v74] then
                            v70[v74] = {};
                        end;
                        table.insert(v70[v74], {
                            key = v71, 
                            value = v72, 
                            category = v67, 
                            fullPath = v73
                        });
                        continue;
                    end;
                end;
                if not v68 then
                    local v75 = v53(v72, v67, v71, v69);
                    if #v75 > 0 then
                        v70[v71] = v75;
                    end;
                else
                    local v76 = v53(v72, v67, v73, v69);
                    local v77 = v68:split(".")[1];
                    if not v70[v77] then
                        v70[v77] = {};
                    end;
                    for _, v79 in v76 do
                        table.insert(v70[v77], v79);
                    end;
                end;
            else
                local v80 = if v68 then v68:split(".")[1] else "Default";
                if not v70[v80] then
                    v70[v80] = {};
                end;
                table.insert(v70[v80], {
                    key = v71, 
                    value = v72, 
                    category = v67, 
                    fullPath = v73
                });
            end;
        end;
        return v70;
    end, 
    hasSubcategories = function(v81) --[[ Line: 167 ]] --[[ Name: hasSubcategories ]]
        for _, v83 in v81 do
            if type(v83) == "table" then
                local v84 = false;
                for _, v86 in v83 do
                    if type(v86) == "table" or typeof(v86) == "Color3" or typeof(v86) == "number" then
                        v84 = true;
                        break;
                    end;
                end;
                if v84 then
                    return true;
                end;
            end;
        end;
        return false;
    end, 
    sortTokens = function(v87, v88, v89) --[[ Line: 195 ]] --[[ Name: sortTokens ]]
        if v87:find("(%u%a+)_(%d+)%.?(%u?%w*)") and v88:find("(%u%a+)_(%d+)%.?(%u?%w*)") then
            local v90, v91, v92 = v87:match("(%u%a+)_(%d+)%.?(%u?%w*)");
            local v93, v94, v95 = v88:match("(%u%a+)_(%d+)%.?(%u?%w*)");
            if v90 == v93 then
                if v91 == v94 then
                    return v92 < v95;
                else
                    return tonumber(v91) < tonumber(v94);
                end;
            else
                return v87 < v88;
            end;
        elseif v89 then
            local v96 = v87:match("| (%-?[%d.]+) |$");
            local v97 = v88:match("| (%-?[%d.]+) |$");
            return tonumber(v96) < tonumber(v97);
        else
            return v87 < v88;
        end;
    end, 
    orderedTokenCategories = {
        "Color", 
        "Stroke", 
        "Size", 
        "Radius", 
        "Padding", 
        "Margin", 
        "Gap", 
        "Typography", 
        "FontSize", 
        "FontWeight", 
        "LineHeight", 
        "Ease", 
        "Time", 
        "Inverse", 
        "DarkMode", 
        "LightMode", 
        "Config"
    }
};