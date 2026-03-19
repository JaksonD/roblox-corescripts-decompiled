local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local v3 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Providers.Responsive.ResponsiveContext);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v12(v6, v7, v8) --[[ Line: 29 ]] --[[ Name: getColumnMetrics ]]
    local v9 = v6.grid.columns[v7];
    local l_v9_0 = v9;
    if v8 then
        if type(v8) == "table" then
            v8 = v8[v6.breakpoint.shortNames[v7]] or v9;
        end;
        l_v9_0 = math.clamp(v8, 0, v9);
    end;
    local v11 = math.max(0, l_v9_0 - 1);
    return {
        colCount = l_v9_0, 
        gutterCount = v11
    };
end;
return function(v13, v14, v15, v16) --[[ Line: 53 ]] --[[ Name: getGridMetrics ]]
    -- upvalues: v12 (copy), v3 (copy)
    local v17 = v12(v13, v14);
    local v18 = if v16 then v12(v13, v14, v16) else v17;
    local l_grid_0 = v13.grid;
    local v20 = l_grid_0.gaps[v14];
    local v21 = l_grid_0.gutters[v14];
    local v22 = l_grid_0.margins[v14];
    local v23 = math.max(0, v15 - v22 * 2);
    local v24 = v17.gutterCount * v21;
    local v25 = v18.gutterCount * v21;
    local v26 = math.max(0, (v23 - v24) / v17.colCount);
    local v27 = if v24 < v23 then math.floor(v26 * v18.colCount + v25) else 0;
    local v28 = UDim2.fromOffset(v27, 0);
    return v3.assign({
        full = v3.assign(v17, {
            margin = v22
        }), 
        margin = v22, 
        colWidth = v26, 
        gapHeight = v20, 
        gutterWidth = v21, 
        gridWidth = v23, 
        cellSize = v28, 
        cellWidth = v27
    }, v18);
end;