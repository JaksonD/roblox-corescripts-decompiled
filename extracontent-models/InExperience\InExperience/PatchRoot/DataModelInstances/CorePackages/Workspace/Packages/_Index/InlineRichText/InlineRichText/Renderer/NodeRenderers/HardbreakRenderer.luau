local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HardBreakElement_0 = require(l_Parent_0.InlineLayout).Components.InlineLayoutElements.HardBreakElement;
local _ = require(l_script_FirstAncestor_0.Types);
return function(_, _) --[[ Line: 9 ]]
    -- upvalues: l_HardBreakElement_0 (copy)
    return {
        l_HardBreakElement_0
    };
end;