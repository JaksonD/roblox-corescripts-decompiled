local l_script_FirstAncestor_0 = script:FindFirstAncestor("SharedFlags");
local v1 = require(l_script_FirstAncestor_0.FFlagLuaAppDataHydrationFavoritesStore);
local v2 = require(l_script_FirstAncestor_0.FFlagLuaAppDataHydrationFollowingsStore);
local v3 = require(l_script_FirstAncestor_0.FFlagLuaAppDataHydrationUserVoteFeedbackMetadataStore);
local v4 = require(l_script_FirstAncestor_0.FFlagLuaAppDataHydrationUserVotesStore);
return v1 and v2 and v3 and v4 and game:DefineFastFlag("LuaAppSduiExperienceDetailsComponents2", false);