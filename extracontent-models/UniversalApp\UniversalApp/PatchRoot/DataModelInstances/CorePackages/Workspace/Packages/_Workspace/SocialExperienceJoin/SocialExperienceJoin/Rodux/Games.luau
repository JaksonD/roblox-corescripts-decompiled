local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
return require(l_Parent_0.LuaSocialLibrariesDeps).RoduxGames.config({
    keyPath = v2.RODUX_KEY .. ".Games"
});