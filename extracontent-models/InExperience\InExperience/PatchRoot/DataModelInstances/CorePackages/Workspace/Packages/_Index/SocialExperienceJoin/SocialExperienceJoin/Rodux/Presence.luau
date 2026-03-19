local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
return require(l_Parent_0.LuaSocialLibrariesDeps).RoduxPresence.config({
    keyPath = v2.RODUX_KEY .. ".Presence"
});