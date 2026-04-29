local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useEffectOnce = RoactUtils.Hooks.useEffectOnce
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local NetworkingPresence = require(ProfilePlatform.Networking.NetworkingPresence)
local myRoduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
local IconName = require(ProfilePlatformParent.Foundation).Enums.IconName
local NavigateDown = require(ProfilePlatformParent.NavigationRodux).Thunks.NavigateDown
local NetworkStatus = myRoduxNetworking.Enum.NetworkStatus
local Enums = require(ProfilePlatform.Common.Enums)
local useProfileActions = require(ProfilePlatform.Hooks.useProfileActions)
local useProfileJsonComponent = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local FFlagProfilePlatformUpdateUXForNonSocialCommunities = require(ProfilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local FFlagEnableProfilePlatformDisabledActions = require(ProfilePlatformParent.SharedFlags).FFlagEnableProfilePlatformDisabledActions
local FFlagEnableCommunityVerificationModal = require(ProfilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local FFlagPortEnableCommunityVerificationModal = require(ProfilePlatform.Flags.FFlagPortEnableCommunityVerificationModal)
local FFlagEnableProfilePlatformDisabledReasonText = require(ProfilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)
local FFlagProfilePlatformEnableUserProfileButtonsBacktest = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUserProfileButtonsBacktest)
local FFlagProfilePlatformEnableCurrencyTransfer = require(ProfilePlatformParent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableEditAppearanceMenu = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEnableEditLook = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local FFlagProfilePlatformAddCurrentlyPlaying = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local FFlagProfilePlatformEnableUnlockChat = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat)
local Dash = require(ProfilePlatformParent.Dash)
local t1 = {
	[Enums.ProfileActions.AcceptFriendRequest] = true,
	[Enums.ProfileActions.AcceptOffNetworkFriendRequest] = true,
	[Enums.ProfileActions.AddFriend] = true,
	[Enums.ProfileActions.AddFriendFromContacts] = true,
	[Enums.ProfileActions.AddFriendFromContactsSent] = true,
	[Enums.ProfileActions.CannotAddFriend] = true,
	[Enums.ProfileActions.Chat] = true,
	[Enums.ProfileActions.UnlockChat] = not not FFlagProfilePlatformEnableUnlockChat or nil,
	[Enums.ProfileActions.EditAlias] = true,
	[Enums.ProfileActions.EditAppearance] = not not FFlagProfilePlatformEnableEditAppearanceMenu or nil,
	[Enums.ProfileActions.EditAvatar] = true,
	[Enums.ProfileActions.EditLook] = not not FFlagProfilePlatformEnableEditLook or nil,
	[Enums.ProfileActions.EditProfile] = true,
	[Enums.ProfileActions.JoinExperience] = true,
	[Enums.ProfileActions.PendingFriendRequest] = true,
	[Enums.ProfileActions.Unblock] = true,
	[Enums.ProfileActions.JoinCommunity] = true,
	[Enums.ProfileActions.Follow] = not not FFlagProfilePlatformUpdateUXForNonSocialCommunities or nil,
	[Enums.ProfileActions.CancelJoinCommunityRequest] = true,
	[Enums.ProfileActions.ViewCommunity] = true,
	[Enums.ProfileActions.ViewFullProfile] = not not FFlagProfilePlatformUpdateUXForNonSocialCommunities or nil,
	[Enums.ProfileActions.ShareProfile] = true,
	[Enums.ProfileActions.Unfriend] = true,
	[Enums.ProfileActions.CurrencyTransfer] = not not FFlagProfilePlatformEnableCurrencyTransfer or nil
}

function isJoinExperience(p1) -- line: 77
	-- upvalues: Enums (copy)
	for _, v31 in p1 do
		if v31.type == Enums.ProfileActions.JoinExperience then
			return true
		end
	end

	return false
end

return function(s1: string) -- line: 86
	-- upvalues: useDispatch (copy), useProfileJsonComponent (copy), Enums (copy), useSelector (copy), NetworkingPresence (copy), NetworkStatus (copy), useProfileActions (copy), FFlagProfilePlatformAddCurrentlyPlaying (copy), React (copy), useEffectOnce (copy), FFlagProfilePlatformEnableUserProfileButtonsBacktest (copy), Dash (copy), t1 (copy), FFlagProfilePlatformEnableEditAppearanceMenu (copy), FFlagEnableProfilePlatformDisabledActions (copy), FFlagEnableCommunityVerificationModal (copy), FFlagPortEnableCommunityVerificationModal (copy), IconName (copy), NavigateDown (copy), FFlagEnableProfilePlatformDisabledReasonText (copy)
	local v33 = useDispatch()
	local v34 = useProfileJsonComponent(Enums.Components.Actions) or {}
	local v35 = useSelector(function(p2) -- line: 90
		-- upvalues: NetworkingPresence (copy), s1 (copy), NetworkStatus (copy)
		return NetworkingPresence.GetPresencesFromUserIds.getStatus(p2, s1) == NetworkStatus.NotStarted
	end)
	local v36 = useProfileActions(Enums.ButtonSurface.Actions)
	local t2 = {}
	local t3 = {}
	local t4 = {}

	if FFlagProfilePlatformAddCurrentlyPlaying then
		React.useEffect(function() -- line: 103
			-- upvalues: v34 (copy), v33 (copy), NetworkingPresence (copy), s1 (copy)
			if isJoinExperience(v34.buttons) then
				v33(NetworkingPresence.GetPresencesFromUserIds.API({ s1 }))
			end
		end, {
			v34.buttons,
			v33,
			s1
		})
	else
		useEffectOnce(function() -- line: 109
			-- upvalues: v33 (copy), NetworkingPresence (copy), s1 (copy)
			v33(NetworkingPresence.GetPresencesFromUserIds.API({ s1 }))
		end, isJoinExperience(v34.buttons) and v35)
	end

	local v40 = FFlagProfilePlatformEnableUserProfileButtonsBacktest and Dash.find(v34.buttons, function(p3) -- line: 115
		-- upvalues: Enums (copy)
		return p3.type == Enums.ProfileActions.JoinExperience
	end)

	for _, v in ipairs(v34.buttons) do
		if not v40 or v.type == Enums.ProfileActions.JoinExperience or not t1[v.type] then
			local v43 = v36[v.type]

			if FFlagProfilePlatformEnableEditAppearanceMenu and v.subActions then
				local t5 = {}

				for _, v46 in v.subActions do
					local v47 = v36[v46]

					if v47 then
						table.insert(t5, {
							id = v46,
							text = v47.text,
							icon = v47.icon,
							onActivated = v47.onActivated
						})
					end
				end

				if #t5 > 0 then
					v43.menuItems = t5
				end
			end

			if FFlagEnableProfilePlatformDisabledActions and v.disabledReason then
				if FFlagEnableCommunityVerificationModal and v.type == Enums.ProfileActions.JoinCommunity and (v.disabledReason == Enums.DisabledReasons.InsufficientVerificationLevelLow or v.disabledReason == Enums.DisabledReasons.InsufficientVerificationLevelMedium or v.disabledReason == Enums.DisabledReasons.InsufficientVerificationLevelHigh) then
					v43.icon = if not FFlagEnableCommunityVerificationModal or not FFlagPortEnableCommunityVerificationModal then nil else IconName.LockClosed

					function v43.onActivated() -- line: 164
						-- upvalues: v33 (copy), NavigateDown (copy), Enums (copy), v (copy)
						return v33(NavigateDown({
							name = Enums.Screens.CommunityVerificationModal,
							extraProps = {
								disabledReason = v.disabledReason
							}
						}))
					end
				else
					v43.isDisabled = true
					v43.disabledReason = if not FFlagEnableProfilePlatformDisabledReasonText then nil else v.disabledReason
				end
			end

			if t1[v.type] then
				table.insert(t3, v43)
			else
				table.insert(t4, v43)
			end
		end
	end

	if #t3 > 0 then
		t2.primary = t3
	end

	if #t4 > 0 then
		t2.secondary = t4
	end

	return t2, not not v34.contextual
end
