local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local _ = require(l_script_FirstAncestor_0.Enums.BreakpointShortName);
local v4 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Providers.Responsive.ResponsiveContext);
local v6 = require(l_script_FirstAncestor_0.StyleSheet.StyleRule);
local function v10(v7, v8) --[[ Line: 13 ]] --[[ Name: createGridStyleRule ]]
    -- upvalues: v4 (copy), v6 (copy)
    local v9 = if v8 then (".%*-col-%*"):format(v8, v7) else (".col-%*"):format(v7);
    return v4.createElement(v6, {
        Selector = ("%* ::UISizeConstraint"):format(v9), 
        properties = {
            MinSize = ("$ColMin%*"):format(v7), 
            MaxSize = ("$ColMax%*"):format(v7)
        }
    });
end;
return function(v11) --[[ Line: 24 ]] --[[ Name: createGridStyleRules ]]
    -- upvalues: v10 (copy), v4 (copy), v6 (copy)
    local l_breakpoint_0 = v11.breakpoint;
    local l_grid_0 = v11.grid;
    local v14 = l_breakpoint_0.order[#l_breakpoint_0.order];
    local v15 = l_grid_0.columns[v14];
    local v16 = {};
    local v17 = {};
    for v18 = 0, v15 do
        v17[("Col%*"):format(v18)] = v10(v18);
        if v18 == 0 then
            v17.ColVisible0 = v4.createElement(v6, {
                Selector = ".col-0", 
                properties = {
                    Visible = false
                }
            });
        end;
    end;
    for _, v20 in l_breakpoint_0.order do
        local v21 = l_breakpoint_0.shortNames[v20];
        local v22 = l_grid_0.columns[v20];
        local v23 = {};
        for v24 = 0, v22 do
            v23[("%*Col%*"):format(v20, v24)] = v10(v24, v21);
            if v24 == 0 then
                v23[("%*ColVisible0"):format(v20)] = v4.createElement(v6, {
                    Selector = (".%*-col-0"):format(v21), 
                    properties = {
                        Visible = false
                    }
                });
            end;
        end;
        v16[v20] = v23;
    end;
    return {
        baseRules = v17, 
        rulesByBreakpoint = v16
    };
end;