local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local Foundation = require(ProfilePlatformParent.Foundation)
local SharedFlags = require(ProfilePlatformParent.SharedFlags)
local SocialStopwatch = require(ProfilePlatformParent.SocialStopwatch)
local ButtonVariant = Foundation.Enums.ButtonVariant
local refreshProfilePlatformUserInfo = require(ProfilePlatform.Networking.refreshProfilePlatformUserInfo)
local Enums = require(ProfilePlatform.Common.Enums)

require(ProfilePlatform.Components.CTARow.Types)

local EventNames = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = Enums.ProfileTypes
local FFlagMoveInExperienceModeToEditProfile = SharedFlags.FFlagMoveInExperienceModeToEditProfile

return {
	[Enums.ProfileActions.EditProfile] = function(p1) -- line: 19
		-- upvalues: ButtonVariant (copy), Enums (copy), ProfileTypes (copy), SocialStopwatch (copy), EventNames (copy), refreshProfilePlatformUserInfo (copy), FFlagMoveInExperienceModeToEditProfile (copy)
		return {
			variant = ButtonVariant.Standard,
			text = p1.localized[Enums.ProfileActions.EditProfile],
			onActivated = {
				[ProfileTypes.User] = function() -- line: 24
					-- upvalues: SocialStopwatch (copy), p1 (copy), EventNames (copy), Enums (copy), refreshProfilePlatformUserInfo (copy), FFlagMoveInExperienceModeToEditProfile (copy)
					SocialStopwatch.Stopwatch.start(SocialStopwatch.Events.EditProfileOpened)
					p1.analytics.fireAnalyticsEvent(EventNames.CTAButtonOpenEditProfilePage, {
						buttonSurface = p1.buttonSurface
					})
					p1.navigation.navigate(Enums.Screens.EditProfilePage, {
						profileScreens = Enums.Screens,
						navigateToEditUsername = function(p2) --[[ navigateToEditUsername ]] -- line: 31
							-- upvalues: p1 (copy), refreshProfilePlatformUserInfo (copy)
							p1.navigateTo.editUsername({
								showToast = p2,
								onUsernameChanged = function() --[[ onUsernameChanged ]] -- line: 34
									-- upvalues: p1 (copy), refreshProfilePlatformUserInfo (copy)
									p1.dispatch(refreshProfilePlatformUserInfo(p1.profileId))
								end
							})
						end,
						onIdentityChange = function() --[[ onIdentityChange ]] -- line: 39
							-- upvalues: p1 (copy), refreshProfilePlatformUserInfo (copy)
							p1.dispatch(refreshProfilePlatformUserInfo(p1.profileId))
						end,
						onToggleInExperienceMode = if not FFlagMoveInExperienceModeToEditProfile then nil else function() -- line: 43
							-- upvalues: p1 (copy), refreshProfilePlatformUserInfo (copy), EventNames (copy)
							p1.dispatch(refreshProfilePlatformUserInfo(p1.profileId))
							p1.analytics.fireAnalyticsEvent(EventNames.ToggleInExperienceModeButton, {})
						end
					})
				end
			}
		}
	end
}
