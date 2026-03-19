local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.Orientation);
local v4 = require(script.Parent.OptionSelectorGroupContext);
return function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v4 (copy)
    return v2.useContext(v4);
end;