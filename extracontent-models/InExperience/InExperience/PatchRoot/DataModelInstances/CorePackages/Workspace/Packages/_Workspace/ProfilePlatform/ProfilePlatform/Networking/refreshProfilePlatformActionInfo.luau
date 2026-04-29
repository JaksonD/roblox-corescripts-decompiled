local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Enums = require(ProfilePlatform.Common.Enums)
local getProfilePlatform = require(ProfilePlatform.Networking.getProfilePlatform)

require(ProfilePlatform.Types.Component)

local FFlagProfilePlatformAddCurrentlyPlaying = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local FFlagProfilePlatformCTAsRefactor = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

function GetProfilePlatform(s1: string) -- line: 13
	-- upvalues: Enums (copy), FFlagProfilePlatformCTAsRefactor (copy), FFlagProfilePlatformAddCurrentlyPlaying (copy), getProfilePlatform (copy)
	local t1 = {
		{
			component = Enums.Components.UserProfileHeader
		},
		{
			component = Enums.Components.Actions,
			isActionsV2Supported = not not FFlagProfilePlatformCTAsRefactor or nil
		}
	}

	if FFlagProfilePlatformAddCurrentlyPlaying then
		table.insert(t1, {
			component = Enums.Components.CurrentlyPlaying
		})
	end

	return getProfilePlatform.API({
		profileId = s1,
		profileType = Enums.ProfileTypes.User,
		components = t1,
		includeComponentOrdering = false
	})
end

return GetProfilePlatform
