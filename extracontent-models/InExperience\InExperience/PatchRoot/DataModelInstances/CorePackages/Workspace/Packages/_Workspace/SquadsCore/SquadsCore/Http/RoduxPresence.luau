local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
return (require(l_Parent_0.LuaSocialLibrariesDeps).RoduxPresence.config({
    keyPath = l_RODUX_KEY_0 .. ".Presence"
}));