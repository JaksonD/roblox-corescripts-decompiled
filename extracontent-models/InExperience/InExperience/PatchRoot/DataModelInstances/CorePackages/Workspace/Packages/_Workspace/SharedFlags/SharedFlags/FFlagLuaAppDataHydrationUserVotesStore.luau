local l_script_FirstAncestor_0 = script:FindFirstAncestor("SharedFlags");
local v1 = require(l_script_FirstAncestor_0.FFlagLuaAppDataHydrationDataCacheUpdateItem);
local v2 = require(l_script_FirstAncestor_0.FFlagLuaAppDataHydrationSupportsMultiGet);
return v1 and v2 and game:DefineFastFlag("LuaAppDataHydrationUserVotesStore2", false);