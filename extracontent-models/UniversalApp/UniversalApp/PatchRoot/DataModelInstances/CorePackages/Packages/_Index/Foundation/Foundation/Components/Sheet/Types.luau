local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Enums.DialogSize);
local _ = require(l_Parent_0.React);
return {
    nonSelectable = v2.MODAL.DISABLE_SELECTION, 
    isolatedSelectionGroup = v2.MODAL.TRAP_FOCUS
};