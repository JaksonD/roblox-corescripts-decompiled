local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(script.Parent.AccordionContext);
return function() --[[ Line: 22 ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.useContext(v5);
end;