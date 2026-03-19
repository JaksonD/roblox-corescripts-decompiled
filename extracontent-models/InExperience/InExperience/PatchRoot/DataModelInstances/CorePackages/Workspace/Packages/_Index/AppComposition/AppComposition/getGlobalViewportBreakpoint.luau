local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppComposition");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Display);
local v3 = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.Foundation);
local v5 = require(l_script_FirstAncestor_0.resolveBreakpoint);
return (v3.createComputed(function(v6) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v5 (copy)
    local v7 = v2.GetDisplayStore(v6).getDesignSpaceViewportWidth(v6);
    return v5(v7);
end));