local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local _ = require(l_script_FirstAncestor_0.Providers.Responsive.ResponsiveContext);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(script.Parent.useBreakpoint);
local v5 = require(l_script_FirstAncestor_0.Providers.Responsive.useResponsive);
return function(v6, v7) --[[ Line: 14 ]] --[[ Name: useResponsiveValue ]]
    -- upvalues: v4 (copy), v5 (copy)
    local v8 = v4(v6);
    return v7[v5().config.breakpoint.shortNames[v8]];
end;