local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_script_FirstAncestor_0.Utility.Responsive.BreakpointConfig);
local v5 = require(l_script_FirstAncestor_0.Utility.Responsive.GridConfig);
local v6 = require(l_Parent_0.ResponsiveContext);
local v7 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v8 = {
    config = {
        breakpoint = v4, 
        grid = v5
    }
};
return function(v9) --[[ Line: 26 ]] --[[ Name: ResponsiveProvider ]]
    -- upvalues: v7 (copy), v8 (copy), v3 (copy), v6 (copy)
    local v10 = v7(v9, v8);
    return v3.createElement(v6.Provider, {
        value = v10
    }, v10.children);
end;