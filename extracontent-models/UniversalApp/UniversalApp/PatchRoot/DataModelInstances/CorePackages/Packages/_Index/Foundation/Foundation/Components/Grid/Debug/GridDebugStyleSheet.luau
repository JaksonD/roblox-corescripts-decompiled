local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useForwardRef_0 = require(l_Parent_0.ReactUtils).useForwardRef;
local v4 = require(l_script_FirstAncestor_0.StyleSheet.StyleRule);
local l_useStyleSheet_0 = require(l_script_FirstAncestor_0.Providers.Style.StyleSheetContext).useStyleSheet;
local _ = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local _ = require(l_script_FirstAncestor_0.Enums.BreakpointShortName);
local v8 = require(l_script_FirstAncestor_0.Providers.Responsive.useResponsive);
return v2.memo(v2.forwardRef(function(v9, v10) --[[ Line: 19 ]] --[[ Name: GridDebugStyleSheet ]]
    -- upvalues: v8 (copy), l_useStyleSheet_0 (copy), v2 (copy), l_useForwardRef_0 (copy), v4 (copy)
    local v11 = v8();
    local v12 = l_useStyleSheet_0();
    local v13, v14 = v2.useState(nil);
    local v15 = l_useForwardRef_0(v10, v14);
    local l_breakpoint_0 = v11.config.breakpoint;
    local l_grid_0 = v11.config.grid;
    local v18 = l_breakpoint_0.order[#l_breakpoint_0.order];
    local v19 = v9.breakpoint or v18;
    local v25 = v2.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: l_breakpoint_0 (copy), v19 (copy), l_grid_0 (copy), v2 (ref), v4 (ref)
        local v20 = l_breakpoint_0.shortNames[v19];
        local v21 = l_grid_0.columns[v19];
        local v22 = {};
        for v23 = 0, v21 do
            local v24 = if v20 then (".%*-col-%*"):format(v20, v23) else (".col-%*"):format(v23);
            v22[("DebugColColor$%*"):format(v23)] = v2.createElement(v4, {
                Selector = v24, 
                properties = {
                    BackgroundColor3 = Color3.fromRGB(math.floor(255 * (v23 / math.max(1, v21))), math.floor(255 * (1 - v23 / math.max(1, v21))), (math.floor(255 * (v23 % 3 / 2))))
                }
            });
        end;
        return v22;
    end, {
        v19, 
        l_breakpoint_0, 
        l_grid_0
    });
    v2.useLayoutEffect(function() --[[ Line: 54 ]]
        -- upvalues: v13 (copy), v12 (copy)
        if v13 then
            v13:SetDerives({
                v12
            });
        end;
    end, {
        v13, 
        v12
    });
    return v2.createElement(v2.Fragment, nil, {
        GridDebugStyleSheet = v2.createElement("StyleSheet", {
            ref = v15
        }, v25), 
        GridDebugStyleLink = v2.createElement("StyleLink", {
            StyleSheet = v13
        })
    });
end));