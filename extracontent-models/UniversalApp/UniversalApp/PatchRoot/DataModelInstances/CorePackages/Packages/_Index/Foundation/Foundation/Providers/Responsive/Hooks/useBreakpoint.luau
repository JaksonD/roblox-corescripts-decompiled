local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local l_usePrevious_0 = require(l_Parent_0.ReactUtils).usePrevious;
local l_Instance_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Instance;
local _ = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local v7 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Providers.Responsive.ResponsiveContext);
local v9 = require(l_script_FirstAncestor_0.Providers.Responsive.useResponsive);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = function(v11, v12) --[[ Line: 28 ]] --[[ Name: calculateBreakpointFromWidth ]]
    local v13 = v11.order[#v11.order];
    for _, v15 in v11.order do
        if v12 <= v11.widths[v15] then
            return v15;
        end;
    end;
    return v13;
end;
local function _(v17, v18) --[[ Line: 41 ]] --[[ Name: getBreakpointIndex ]]
    -- upvalues: v2 (copy)
    return v2.findIndex(v17.order, function(v19) --[[ Line: 42 ]]
        -- upvalues: v18 (copy)
        return v19 == v18;
    end);
end;
local function _(v21, v22, v23, v24) --[[ Line: 47 ]] --[[ Name: shouldChangeBreakpoint ]]
    -- upvalues: v2 (copy)
    if not v24 then
        return true;
    elseif v23 == v24 then
        return false;
    elseif v2.findIndex(v21.order, function(v25) --[[ Line: 42 ]]
        -- upvalues: v24 (copy)
        return v25 == v24;
    end) < v2.findIndex(v21.order, function(v26) --[[ Line: 42 ]]
        -- upvalues: v23 (copy)
        return v26 == v23;
    end) then
        return v21.widths[v24] + 5 < v22;
    else
        return v22 < v21.widths[v23] - 5;
    end;
end;
return function(v28, v29) --[[ Line: 74 ]] --[[ Name: useBreakpoint ]]
    -- upvalues: v10 (copy), v7 (copy), v9 (copy), v3 (copy), l_usePrevious_0 (copy), v2 (copy), l_Instance_0 (copy)
    local v30 = v10(v29 or {}, {
        throttleTime = v7.DEFAULT_DELAY_TIME
    });
    local l_breakpoint_0 = v9().config.breakpoint;
    local v32, v33 = v3.useState(Vector2.zero);
    local l_X_0 = v32.X;
    local v35 = l_breakpoint_0.order[#l_breakpoint_0.order];
    for _, v37 in l_breakpoint_0.order do
        if l_X_0 <= l_breakpoint_0.widths[v37] then
            v35 = v37;
            break;
        end;
    end;
    local l_v35_0 = v35;
    l_X_0, v35 = v3.useState(l_v35_0);
    local v39 = l_usePrevious_0(l_X_0);
    local v40 = v3.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v2 (ref), v33 (copy), v30 (copy)
        return v2.throttle(v33, v30.throttleTime, {
            leading = true, 
            trailing = true
        });
    end, {
        v30.throttleTime
    });
    v3.useEffect(function() --[[ Line: 94 ]]
        -- upvalues: v28 (copy), l_Instance_0 (ref), v40 (copy), v33 (copy)
        local v41 = nil;
        if v28 then
            v41 = l_Instance_0.GetPropertyChangedSignal(v28, "AbsoluteSize"):Connect(function() --[[ Line: 98 ]]
                -- upvalues: v40 (ref), v28 (ref)
                v40(v28.AbsoluteSize);
            end);
            v33(v28.AbsoluteSize);
        end;
        return function() --[[ Line: 104 ]]
            -- upvalues: v41 (ref)
            if v41 then
                v41:Disconnect();
            end;
        end;
    end, {
        v28
    });
    v3.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: l_breakpoint_0 (copy), v32 (copy), l_v35_0 (copy), v39 (copy), v2 (ref), v35 (copy)
        local l_l_breakpoint_0_0 = l_breakpoint_0;
        local l_X_1 = v32.X;
        local l_l_v35_0_0 = l_v35_0;
        local l_v39_0 = v39;
        if not l_v39_0 or not (l_l_v35_0_0 == l_v39_0) and if v2.findIndex(l_l_breakpoint_0_0.order, function(v46) --[[ Line: 42 ]]
            -- upvalues: l_v39_0 (copy)
            return v46 == l_v39_0;
        end) < v2.findIndex(l_l_breakpoint_0_0.order, function(v47) --[[ Line: 42 ]]
            -- upvalues: l_l_v35_0_0 (copy)
            return v47 == l_l_v35_0_0;
        end) then l_l_breakpoint_0_0.widths[l_v39_0] + 5 < l_X_1 else l_X_1 < l_l_breakpoint_0_0.widths[l_l_v35_0_0] - 5 then
            v35(l_v35_0);
        end;
    end, {
        l_breakpoint_0, 
        v32.X, 
        l_v35_0, 
        v39
    });
    return l_X_0, v32;
end;