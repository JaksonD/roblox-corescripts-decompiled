local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Enums.DialogSize);
local _ = require(l_script_FirstAncestor_0.Enums.OnCloseCallbackReason);
return {
    nonSelectable = v1.MODAL.DISABLE_SELECTION, 
    isolatedSelectionGroup = v1.MODAL.TRAP_FOCUS
};