local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local getDeepValue = require(ProfilePlatform.Utils.getDeepValue)
local Enums = require(ProfilePlatform.Common.Enums)
local FriendStatus = require(ProfilePlatform.Analytics.FriendStatus)
local v5 = game:DefineFastFlag("ProfilePlatformFixSelfAnalytics", false)

return function(p1) -- line: 10
	-- upvalues: getDeepValue (copy), Enums (copy), FriendStatus (copy), v5 (copy)
	local v7 = getDeepValue(p1, `responseBody.components.{ Enums.Components.Actions }.buttons`)
	local v8 = if not v7 or not v7[1] then nil else v7[1].type

	if not v8 then
		return FriendStatus.Unknown
	end

	if v8 == Enums.ProfileActions.PendingFriendRequest then
		return FriendStatus.RequestSent
	end

	if v8 == Enums.ProfileActions.AcceptFriendRequest then
		return FriendStatus.RequestReceived
	end

	if v8 == Enums.ProfileActions.Chat or v8 == Enums.ProfileActions.JoinExperience or v8 == Enums.ProfileActions.EditAlias then
		return FriendStatus.Friends
	end

	if v8 == Enums.ProfileActions.EditProfile or v5 and v8 == Enums.ProfileActions.EditAvatar or v5 and v8 == Enums.ProfileActions.EditAppearance then
		return FriendStatus.Self
	end

	if v8 == Enums.ProfileActions.Unfriend then
		return FriendStatus.Ineligible
	end

	return FriendStatus.NotFriends
end
