local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoduxUsers);
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
return v2.config({
    keyPath = l_RODUX_KEY_0 .. ".Users"
});