local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local l_useStyleSheet_0 = require(l_script_FirstAncestor_0.Providers.Style.StyleSheetContext).useStyleSheet;
local _ = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local v6 = require(script.Parent.createGridStyleRules);
local v7 = require(l_script_FirstAncestor_0.Utility.getGridMetrics);
local v8 = require(l_script_FirstAncestor_0.Providers.Responsive.useResponsive);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v10 = {
    containerWidth = 0
};
return v3.memo(function(v11) --[[ Line: 25 ]] --[[ Name: GridStyleSheet ]]
    -- upvalues: v9 (copy), v10 (copy), v3 (copy), v8 (copy), l_useStyleSheet_0 (copy), v6 (copy), v2 (copy), v7 (copy)
    local v12 = v9(v11, v10);
    local v13 = v3.useRef(nil);
    local v14 = v8();
    local v15 = l_useStyleSheet_0();
    local l_breakpoint_0 = v14.config.breakpoint;
    local l_grid_0 = v14.config.grid;
    local v18 = l_breakpoint_0.order[#l_breakpoint_0.order];
    local v19 = l_grid_0.columns[v18];
    local v20 = v12.breakpoint or v18;
    local v21 = math.max(1, v12.containerWidth);
    local v22 = v3.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v6 (ref), v14 (copy)
        return v6(v14.config);
    end, {
        v14.config
    });
    local v23 = v3.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v2 (ref), v22 (copy), v20 (copy)
        return v2.join(v22.baseRules, v22.rulesByBreakpoint[v20]);
    end, {
        v22, 
        v20
    });
    v3.useLayoutEffect(function() --[[ Line: 47 ]]
        -- upvalues: v13 (copy), l_grid_0 (copy), v20 (copy), v19 (copy), v7 (ref), v14 (copy), v21 (copy)
        if v13.current then
            local v24 = l_grid_0.columns[v20];
            for v25 = 0, v19 do
                local v26 = math.min(v25, v24);
                local v27 = v7(v14.config, v20, v21, v26);
                local v28 = Vector2.new(v27.cellWidth, 0);
                local v29 = Vector2.new(v27.cellWidth, 1e999);
                v13.current:SetAttribute("Col" .. v25, v27.cellSize);
                v13.current:SetAttribute("ColMin" .. v25, v28);
                v13.current:SetAttribute("ColMax" .. v25, v29);
            end;
        end;
    end, {
        v14.config, 
        v21, 
        v20
    });
    v3.useLayoutEffect(function() --[[ Line: 70 ]]
        -- upvalues: v13 (copy), v15 (copy)
        if v13.current then
            v13.current:SetDerives({
                v15
            });
        end;
    end, {
        v15
    });
    return v3.createElement(v3.Fragment, nil, {
        GridStyleSheet = v3.createElement("StyleSheet", {
            ref = v13
        }, v23), 
        GridStyleLink = v3.createElement("StyleLink", {
            StyleSheet = v13.current
        })
    });
end);