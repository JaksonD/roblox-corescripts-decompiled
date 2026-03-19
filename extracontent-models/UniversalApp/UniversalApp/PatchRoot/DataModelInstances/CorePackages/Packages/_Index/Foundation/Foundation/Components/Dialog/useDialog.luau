local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v4 = require(script.Parent.DialogContext);
return function() --[[ Line: 23 ]] --[[ Name: useDialog ]]
    -- upvalues: v2 (copy), v4 (copy)
    return v2.useContext(v4);
end;