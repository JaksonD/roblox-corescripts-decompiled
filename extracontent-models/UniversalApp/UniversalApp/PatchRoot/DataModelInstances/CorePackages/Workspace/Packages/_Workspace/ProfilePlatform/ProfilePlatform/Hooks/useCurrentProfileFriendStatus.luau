local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Enums = require(ProfilePlatform.Common.Enums)
local convertPrimaryActionToFriendStatus = require(ProfilePlatform.Hooks.convertPrimaryActionToFriendStatus)
local useProfileJsonComponent = require(ProfilePlatform.Hooks.useProfileJsonComponent)

return function() -- line: 8
	-- upvalues: useProfileJsonComponent (copy), Enums (copy), convertPrimaryActionToFriendStatus (copy)
	local buttons = useProfileJsonComponent(Enums.Components.Actions).buttons
	local v6 = if not buttons or not buttons[1] then nil else buttons[1].type

	return convertPrimaryActionToFriendStatus(v6)
end
