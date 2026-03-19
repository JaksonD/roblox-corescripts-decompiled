local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
return game:DefineFastFlag("ProfilePlatformAboutBeforeActionClient", false) and l_FFlagProfilePlatformNewProfileHeader_0;