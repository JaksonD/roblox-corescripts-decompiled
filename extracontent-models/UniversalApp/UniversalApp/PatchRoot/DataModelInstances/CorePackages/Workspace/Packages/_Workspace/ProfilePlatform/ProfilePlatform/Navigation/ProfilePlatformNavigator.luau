local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local Enums = require(ProfilePlatform.Common.Enums)
local EditProfile = require(ProfilePlatformParent.EditProfile)
local SetAlias = require(ProfilePlatformParent.SetAlias)
local ProfileContextualMenu = require(ProfilePlatform.Components.ProfileContextualMenu)
local EditProfilePage = EditProfile.EditProfilePage
local EditProfileLanding = EditProfile.EditProfileLanding
local EditDisplayNameModal = EditProfile.EditDisplayNameModal
local EditDisplayNameErrorModal = EditProfile.EditDisplayNameErrorModal
local UsernameInsufficientFundsModal = EditProfile.UsernameInsufficientFundsModal
local EditDescriptionModal = EditProfile.EditDescriptionModal
local Enums2 = EditProfile.Enums
local ProfilePlatformViewAdaptor = require(ProfilePlatform.Components.ProfilePlatformViewAdaptor)
local VideoFullscreenPage = require(ProfilePlatform.Components.Videos.VideoFullscreenPage)
local SetAliasModal = SetAlias.SetAliasModal
local EditProfileScreenViewAdapter = EditProfile.EditProfileScreenViewAdapter
local EditProfileToastScreen = EditProfile.EditProfileToastScreen
local EditProfileBackgroundContainer = require(ProfilePlatform.Components.EditProfileBackgroundContainer)
local CommunityVerificationModal = require(ProfilePlatform.Components.CommunityVerificationModal)
local InspectAvatarSheetContainer = require(ProfilePlatform.Components.InspectAvatar.InspectAvatarSheetContainer)
local PurchaseConfirmationModal = require(ProfilePlatform.Components.InspectAvatar.PurchaseConfirmationModal)
local FFlagSocialEnableProfileInspectAndBuy = require(ProfilePlatformParent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local RoactNavigation = require(ProfilePlatformParent.RoactNavigation)
local FFlagAddVideoToCommunityProfile = require(ProfilePlatformParent.SharedFlags).FFlagAddVideoToCommunityProfile
local FFlagEditProfileBackgroundEnabled = require(ProfilePlatformParent.SharedFlags).FFlagEditProfileBackgroundEnabled
local FFlagEnableCommunityVerificationModal = require(ProfilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local FFlagEditProfileMigration = EditProfile.Flags.FFlagEditProfileMigration
local t1 = {
	overlayEnabled = true,
	overlayTransparency = 0.5,
	absorbInput = true
}
local t2 = {
	{
		[Enums.Screens.ProfileMain] = ProfilePlatformViewAdaptor
	},
	{
		[Enums.Screens.EditProfilePage] = {
			screen = if not FFlagEditProfileMigration then EditProfilePage else EditProfileLanding,
			navigationOptions = t1
		}
	},
	{
		[Enums.Screens.EditDisplayNameModal] = {
			screen = EditDisplayNameModal,
			navigationOptions = t1
		}
	},
	{
		[Enums.Screens.EditDescriptionModal] = {
			screen = EditDescriptionModal,
			navigationOptions = t1
		}
	},
	{
		[Enums.Screens.EditDisplayNameErrorModal] = {
			screen = EditDisplayNameErrorModal,
			navigationOptions = t1
		}
	},
	{
		[Enums.Screens.UsernameInsufficientFundsModal] = {
			screen = UsernameInsufficientFundsModal,
			navigationOptions = t1
		}
	},
	{
		[Enums.Screens.SetAliasModal] = {
			screen = SetAliasModal,
			navigationOptions = t1
		}
	},
	{
		[Enums.Screens.ContextualMenu] = {
			screen = ProfileContextualMenu,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = false
			}
		}
	}
}

if FFlagAddVideoToCommunityProfile then
	table.insert(t2, {
		[Enums.Screens.VideoFullscreen] = {
			screen = VideoFullscreenPage,
			navigationOptions = t1
		}
	})
end

if FFlagEnableCommunityVerificationModal then
	table.insert(t2, {
		[Enums.Screens.CommunityVerificationModal] = {
			screen = CommunityVerificationModal,
			navigationOptions = t1
		}
	})
end

if FFlagEditProfileBackgroundEnabled then
	table.insert(t2, {
		[Enums.Screens.EditProfileBackground] = {
			screen = EditProfileBackgroundContainer,
			navigationOptions = {
				overlayEnabled = false,
				absorbInput = true,
				renderUnderlyingPage = true
			}
		}
	})
end

if FFlagEditProfileMigration then
	table.insert(t2, {
		[Enums2.Screens.EditProfileSubScreen] = {
			screen = EditProfileScreenViewAdapter,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 0.5,
				absorbInput = false
			}
		}
	})
	table.insert(t2, {
		[Enums2.Screens.EditProfileToast] = {
			screen = EditProfileToastScreen,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = false
			}
		}
	})
end

if FFlagSocialEnableProfileInspectAndBuy then
	table.insert(t2, {
		[Enums.Screens.InspectAvatarSheet] = {
			screen = InspectAvatarSheetContainer,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = true
			}
		}
	})
	table.insert(t2, {
		[Enums.Screens.PurchaseConfirmationModal] = {
			screen = PurchaseConfirmationModal,
			navigationOptions = t1
		}
	})
end

return (RoactNavigation.createRobloxStackNavigator(t2, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		absorbInput = true,
		overlayTransparency = 1,
		disableBackButton = true
	},
	mode = RoactNavigation.StackPresentationStyle.Overlay
}))
