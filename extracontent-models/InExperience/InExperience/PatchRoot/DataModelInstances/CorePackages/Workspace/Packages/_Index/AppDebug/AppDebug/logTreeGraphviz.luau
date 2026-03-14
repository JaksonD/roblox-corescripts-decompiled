local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppDebug");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.LogTree);
local l_Levels_0 = require(l_Parent_0.Lumberyak).Logger.Levels;
local v4 = {
    [l_Levels_0.Error] = "pink", 
    [l_Levels_0.Warning] = "orange", 
    [l_Levels_0.Info] = "yellow", 
    [l_Levels_0.Debug] = "cyan", 
    [l_Levels_0.Trace] = "green"
};
local v5 = {
    [l_Levels_0.Error] = 1, 
    [l_Levels_0.Warning] = 2, 
    [l_Levels_0.Info] = 3, 
    [l_Levels_0.Debug] = 4, 
    [l_Levels_0.Trace] = 5
};
local function _(v6) --[[ Line: 28 ]] --[[ Name: maxLevelToGraphvizAttr ]]
    -- upvalues: v4 (copy)
    local v7 = v4[v6];
    return v7 and string.format(" fillcolor=%s style=filled", v7) or "";
end;
local function _(v9) --[[ Line: 33 ]] --[[ Name: getLevelRank ]]
    -- upvalues: v5 (copy)
    return v5[v9] or 0;
end;
local function _(v11, v12) --[[ Line: 37 ]] --[[ Name: maxLogLevel ]]
    -- upvalues: v5 (copy)
    return (v5[v11] or 0) > (v5[v12] or 0) and v11 or v12;
end;
local function v14(v15, v16) --[[ Line: 41 ]] --[[ Name: dfsGraphviz ]]
    -- upvalues: v5 (copy), v4 (copy), v14 (copy)
    local v17 = "";
    local v18 = tostring(v15.name);
    for _, v20 in v15.sinks do
        v18 = v18 .. "\\n(sink: " .. tostring(v20.maxLevel) .. ")";
        local l_v16_0 = v16;
        local l_maxLevel_0 = v20.maxLevel;
        if (v5[l_v16_0] or 0) > (v5[l_maxLevel_0] or 0) then
            v16 = l_v16_0;
            if v16 then
                continue;
            end;
        end;
        v16 = l_maxLevel_0;
    end;
    local l_v17_0 = v17;
    local l_format_0 = string.format;
    local v25 = "\"%s\" [label=\"%s\"%s];\n";
    local l_name_0 = v15.name;
    local l_v18_0 = v18;
    local v28 = v4[v16];
    v17 = l_v17_0 .. l_format_0(v25, l_name_0, l_v18_0, v28 and string.format(" fillcolor=%s style=filled", v28) or "");
    for v29, _ in v15.children do
        v17 = (v17 .. string.format("\"%s\" -> \"%s\"\n", tostring(v29.name), v15.name)) .. v14(v29, v16);
    end;
    return v17;
end;
return function() --[[ Line: 56 ]]
    -- upvalues: v2 (copy), v14 (copy)
    local v31 = v2.logger("*");
    return "digraph {\n" .. v14(v31) .. "}\n";
end;