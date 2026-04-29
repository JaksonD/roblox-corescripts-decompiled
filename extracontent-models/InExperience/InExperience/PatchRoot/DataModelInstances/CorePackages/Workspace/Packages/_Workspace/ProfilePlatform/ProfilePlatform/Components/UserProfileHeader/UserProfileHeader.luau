local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local SharedFlags = require(ProfilePlatformParent.SharedFlags)
local View = require(ProfilePlatformParent.Foundation).View
local Constants = require(ProfilePlatform.Common.Constants)
local Enums = require(ProfilePlatform.Common.Enums)
local SocialIdentityContainer = require(ProfilePlatform.Components.UserProfileHeader.SocialIdentityContainer)
local ContextualInformation = require(ProfilePlatform.Components.UserProfileHeader.ContextualInformation)
local SocialChipCountsRowContainer = require(ProfilePlatform.Components.UserProfileHeader.SocialChipCountsRow).SocialChipCountsRowContainer
local UserProfileAvatar = require(ProfilePlatform.Components.UserProfileHeader.UserProfileAvatar)
local UserProfileSettingsToggle = require(ProfilePlatform.Components.UserProfileHeader.UserProfileSettingsToggle)
local AvatarHeadshotComponent = require(ProfilePlatform.Components.UserProfileHeader.AvatarHeadshotComponent)
local FFlagMoveInExperienceModeToEditProfile = require(ProfilePlatformParent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local v15 = game:DefineFastFlag("DisableStreamerModeToggle", false)
local FFlagProfilePlatformNewProfileHeader = SharedFlags.FFlagProfilePlatformNewProfileHeader
local FFlagSwitchProfileWidthHookToSocialCommon = SharedFlags.FFlagSwitchProfileWidthHookToSocialCommon
local FFlagAddPlatformNameToProfileHeader = SharedFlags.FFlagAddPlatformNameToProfileHeader
local useProfileScrollContext = require(ProfilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local useProfileFormFactor = require(ProfilePlatform.Hooks.useProfileFormFactor)
local useProfileCardWidth = require(ProfilePlatform.Hooks.useProfileCardWidth)
local useProfileCardWidth2 = require(ProfilePlatformParent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local useShouldShowContextualInformation = require(ProfilePlatform.Hooks.useShouldShowContextualInformation)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local Presence = require(ProfilePlatform.Rodux.Presence)
local convertPresenceEnum = require(ProfilePlatform.Utils.convertPresenceEnum)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useEffectOnMount = RoactUtils.Hooks.useEffectOnMount
local NetworkingPresence = require(ProfilePlatform.Networking.NetworkingPresence)
local FFlagSocialEnableProfileInspectAndBuy = require(ProfilePlatformParent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local useNavigation = require(ProfilePlatformParent.Navigation).useNavigation

return function(p1) --[[ UserProfileHeader ]] -- line: 67
	-- upvalues: FFlagSocialEnableProfileInspectAndBuy (copy), useNavigation (copy), FFlagProfilePlatformNewProfileHeader (copy), useProfileScrollContext (copy), useProfileFormFactor (copy), Enums (copy), FFlagSwitchProfileWidthHookToSocialCommon (copy), useProfileCardWidth2 (copy), useProfileCardWidth (copy), useProfileWrapperContext (copy), useDispatch (copy), useEffectOnMount (copy), NetworkingPresence (copy), useSelector (copy), Presence (copy), convertPresenceEnum (copy), useShouldShowContextualInformation (copy), React (copy), View (copy), UserProfileAvatar (copy), AvatarHeadshotComponent (copy), FFlagAddPlatformNameToProfileHeader (copy), ContextualInformation (copy), SocialChipCountsRowContainer (copy), Constants (copy), SocialIdentityContainer (copy), FFlagMoveInExperienceModeToEditProfile (copy), v15 (copy), UserProfileSettingsToggle (copy)
	local userThumbnail = p1.userThumbnail
	local v38 = nil
	local v39 = nil
	local v40 = false
	local v41 = nil
	local v42 = if not FFlagSocialEnableProfileInspectAndBuy then nil else useNavigation()

	if FFlagProfilePlatformNewProfileHeader then
		local v43 = useProfileScrollContext()
		local v44 = v43 and v43.peekViewOpenPercent or 0

		v38 = useProfileFormFactor().formFactor == Enums.ProfileFormFactor.PeekView

		local v45 = useProfileFormFactor().formFactor == Enums.ProfileFormFactor.Wide
		local v46 = if not FFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth(v45) else useProfileCardWidth2()
		local profileId = useProfileWrapperContext().profileId
		local v48 = useDispatch()

		useEffectOnMount(function() -- line: 91
			-- upvalues: v48 (copy), NetworkingPresence (copy), profileId (copy)
			v48(NetworkingPresence.GetPresencesFromUserIds.API({ profileId })):catch(function(_) -- line: 92
			end)
		end)

		local v49 = useSelector(function(p3) -- line: 95
			-- upvalues: Presence (copy), profileId (copy)
			return Presence.Selectors.getUserPresenceByUserId(p3, profileId) or {
				userPresenceType = Presence.Enums.PresenceType.Offline,
				lastLocation = ""
			}
		end)

		v41 = convertPresenceEnum(v49.userPresenceType, v49.universeId)
		v40 = useShouldShowContextualInformation(v41)

		local v50 = v46 * 0.75
		local v51 = math.max(0, (math.min(1, v44)))
		local v52 = v51 * 3 * v51 - v51 * 2 * v51 * v51

		v39 = if not v45 then v50 + (v46 - v50) * v52 else v46
	end

	if FFlagProfilePlatformNewProfileHeader then
		return React.createElement(View, {
			tag = "col gap-large size-full-0 auto-y",
			BackgroundTransparency = 1,
			LayoutOrder = p1.layoutOrder
		}, {
			UserProfileAvatar = if not FFlagSocialEnableProfileInspectAndBuy then React.createElement(UserProfileAvatar, {
				userThumbnail = userThumbnail,
				userId = p1.userId,
				isPeekView = v38,
				height = v39,
				layoutOrder = 1
			}) else React.createElement("TextButton", {
				Size = UDim2.new(1, 0, 0, v39 or 0),
				BackgroundTransparency = 1,
				Text = "",
				LayoutOrder = 1,
				[React.Event.Activated] = function() -- line: 129
					-- upvalues: v42 (copy), Enums (copy)
					v42.navigate(Enums.Screens.InspectAvatarSheet)
				end
			}, {
				Avatar = React.createElement(UserProfileAvatar, {
					userThumbnail = userThumbnail,
					userId = p1.userId,
					isPeekView = v38,
					height = v39,
					layoutOrder = 1
				})
			}),
			AvatarHeadshotContainer = React.createElement(View, {
				tag = {
					["size-full-0 auto-y"] = true
				},
				BackgroundTransparency = 1,
				LayoutOrder = 2
			}, {
				AvatarHeadshotComponent = React.createElement(AvatarHeadshotComponent, {
					layoutOrder = 1,
					userId = tostring(p1.userId),
					primaryName = p1.primaryName,
					username = p1.username,
					userPresenceType = v41,
					isPremium = p1.isPremium,
					isVerified = p1.isVerified,
					isRobloxAdmin = p1.isRobloxAdmin,
					platformName = if not FFlagAddPlatformNameToProfileHeader then nil else p1.platformName
				})
			}),
			ContextualInformation = if not v40 then nil else React.createElement(ContextualInformation, {
				size = UDim2.fromScale(1, 0),
				layoutOrder = 3
			}),
			SocialCountsRow = if not p1.shouldDisplayCounts then nil else React.createElement(SocialChipCountsRowContainer, {
				size = UDim2.fromScale(1, 0),
				layoutOrder = 4
			})
		})
	end

	return React.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, Constants.USER_PROFILE_HEADER_HEIGHT),
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder
	}, {
		UserProfileAvatar = if not FFlagSocialEnableProfileInspectAndBuy then React.createElement(UserProfileAvatar, {
			userThumbnail = userThumbnail,
			userId = p1.userId
		}) else React.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			[React.Event.Activated] = function() -- line: 192
				-- upvalues: v42 (copy), Enums (copy)
				v42.navigate(Enums.Screens.InspectAvatarSheet)
			end
		}, {
			Avatar = React.createElement(UserProfileAvatar, {
				userThumbnail = userThumbnail,
				userId = p1.userId
			})
		}),
		ProfileTextFrame = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = 1,
			ZIndex = 10
		}, {
			UIListLayoutOrder = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 8)
			}),
			SocialIdentity = React.createElement(SocialIdentityContainer, {
				size = UDim2.fromScale(1, 0),
				layoutOrder = 1,
				primaryName = p1.primaryName,
				username = p1.username,
				isPremium = p1.isPremium,
				isVerified = p1.isVerified,
				isRobloxAdmin = p1.isRobloxAdmin,
				isEdited = p1.isEdited,
				openEditName = p1.openEditName,
				platformName = if not FFlagAddPlatformNameToProfileHeader then nil else p1.platformName
			}),
			UserProfileSettingsToggle = if FFlagMoveInExperienceModeToEditProfile or (v15 or not p1.shouldDisplayUserProfileSettings) then nil else React.createElement(UserProfileSettingsToggle, {
				size = UDim2.new(1, 0, 0, 30),
				layoutOrder = 2,
				isInExperienceNameEnabled = p1.isInExperienceNameEnabled
			}),
			ContextualInformation = React.createElement(ContextualInformation, {
				size = UDim2.fromScale(1, 0),
				layoutOrder = not FFlagMoveInExperienceModeToEditProfile and 3 or 2
			}),
			SocialCountsRow = if not p1.shouldDisplayCounts then nil else React.createElement(SocialChipCountsRowContainer, {
				size = UDim2.fromScale(1, 0),
				layoutOrder = not FFlagMoveInExperienceModeToEditProfile and 4 or 3
			})
		})
	})
end
