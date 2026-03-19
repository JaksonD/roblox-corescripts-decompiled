local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(script.Parent.Rules.Types);
local v3 = {
    System = true
};
local function v7(v4) --[[ Line: 13 ]] --[[ Name: pascalToKebab ]]
    v4 = v4:gsub("_", "-");
    local v6 = string.gsub(v4, "(%u)", function(v5) --[[ Line: 18 ]]
        return "-" .. v5:lower();
    end);
    if v6:sub(1, 1) == "-" then
        v6 = v6:sub(2, #v6);
    end;
    return v6;
end;
return function(v8) --[[ Line: 31 ]] --[[ Name: formatTokens ]]
    -- upvalues: v7 (copy), v3 (copy)
    local v9 = {};
    local v10 = {};
    local v11 = {};
    local v12 = {};
    local v13 = {};
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = {};
    local v18 = {};
    local v19 = {
        colors = v9, 
        variants = v10, 
        strokes = v11, 
        gaps = v12, 
        radii = v13, 
        sizes = v14, 
        typography = v15, 
        paddings = v16, 
        margins = v17, 
        gutters = v18
    };
    if v8 == nil or next(v8) == nil then
        return v19;
    else
        for v20, v21 in v8.Color do
            if v21.Background then
                v10[v7(v20)] = v21;
            else
                v9[v20] = {};
                for v22, v23 in v21 do
                    local v24 = if v3[v20] then v20 .. v22 else v22;
                    v9[v20][v7(v24)] = v23;
                end;
            end;
        end;
        for v25, v26 in v8.Inverse do
            if v25 == "Content" then
                for v27, v28 in v26 do
                    local v29 = if v3[v25] then v25 .. v27 else v27;
                    v9[v25][("inverse-%*"):format((v7(v29)))] = v28;
                end;
            end;
        end;
        for v30, v31 in v8.Stroke do
            table.insert(v11, {
                name = v7(v30), 
                size = v31
            });
        end;
        table.insert(v11, {
            name = "none", 
            size = 0
        });
        table.sort(v11, function(v32, v33) --[[ Line: 89 ]]
            return v32.size < v33.size;
        end);
        for v34, v35 in v8.Gap do
            table.insert(v12, {
                name = string.lower(v34), 
                size = UDim.new(0, v35)
            });
        end;
        table.sort(v12, function(v36, v37) --[[ Line: 97 ]]
            return v36.size.Offset < v37.size.Offset;
        end);
        for v38, v39 in v8.Radius do
            table.insert(v13, {
                name = string.lower(v38), 
                size = UDim.new(0, v39)
            });
        end;
        table.sort(v13, function(v40, v41) --[[ Line: 105 ]]
            return v40.size.Offset < v41.size.Offset;
        end);
        for v42, v43 in v8.Size do
            local v44 = string.split(v42, "_")[2];
            table.insert(v14, {
                name = v7(v44), 
                size = UDim.new(0, v43)
            });
        end;
        table.insert(v14, {
            name = "full", 
            size = UDim.new(1, 0)
        });
        table.sort(v14, function(v45, v46) --[[ Line: 117 ]]
            return v45.size.Offset < v46.size.Offset;
        end);
        for v47, v48 in v8.Typography do
            v15[v7(v47)] = {
                Font = v48.Font, 
                TextSize = v48.FontSize, 
                LineHeight = v48.LineHeight
            };
        end;
        for v49, v50 in v8.Padding do
            table.insert(v16, {
                name = string.lower(v49), 
                size = UDim.new(0, v50)
            });
        end;
        table.sort(v16, function(v51, v52) --[[ Line: 133 ]]
            return v51.size.Offset < v52.size.Offset;
        end);
        for v53, v54 in v8.Margin do
            table.insert(v17, {
                name = string.lower(v53), 
                size = UDim.new(0, v54)
            });
        end;
        table.sort(v17, function(v55, v56) --[[ Line: 141 ]]
            return v55.size.Offset < v56.size.Offset;
        end);
        for v57, v58 in v8.Gutter do
            table.insert(v18, {
                name = string.lower(v57), 
                size = UDim.new(0, v58)
            });
        end;
        table.sort(v18, function(v59, v60) --[[ Line: 149 ]]
            return v59.size.Offset < v60.size.Offset;
        end);
        return v19;
    end;
end;