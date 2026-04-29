local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local dependencyArray = require(ProfilePlatformParent.RoactUtils).Hooks.dependencyArray

require(ProfilePlatformParent.SocialCommon)
require(ProfilePlatform.Types.Component)

local Enums = require(ProfilePlatform.Common.Enums)
local getAvailableUserComponents = require(ProfilePlatform.Hooks.getAvailableUserComponents)
local getAvailableCommunityComponents = require(ProfilePlatform.Hooks.getAvailableCommunityComponents)
local getAvailableContactComponents = require(ProfilePlatform.Hooks.getAvailableContactComponents)
local getDeepValue = require(ProfilePlatform.Utils.getDeepValue)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local useAreWebViewsSupported = require(ProfilePlatform.Hooks.useAreWebViewsSupported)
local useIsProfileQrCodeEnabled = require(ProfilePlatform.Hooks.useIsProfileQrCodeEnabled)
local useCanRenderTransferOnProfile = require(ProfilePlatform.Hooks.useCanRenderTransferOnProfile)
local useLocalUserId = require(ProfilePlatformParent.RobloxAppHooks).useLocalUserId
local FFlagProfilePlatformEnableCommunityProfilePage = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCommunityProfilePage)
local FFlagProfilePlatformEnableVR = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableVR)
local FFlagProfilePlatformEnableCurrencyTransfer = require(ProfilePlatformParent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagRemoveDependencyArrayAntipattern = require(ProfilePlatformParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local FFlagProfilePlatformCTAsRefactor = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

return function() -- line: 29
	-- upvalues: useProfileWrapperContext (copy), getDeepValue (copy), useAreWebViewsSupported (copy), useIsProfileQrCodeEnabled (copy), useCanRenderTransferOnProfile (copy), FFlagProfilePlatformCTAsRefactor (copy), useLocalUserId (copy), React (copy), Enums (copy), getAvailableUserComponents (copy), FFlagProfilePlatformEnableVR (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagProfilePlatformEnableCommunityProfilePage (copy), getAvailableCommunityComponents (copy), getAvailableContactComponents (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy)
	local v20 = useProfileWrapperContext()
	local profileType = v20.profileType
	local v22 = getDeepValue(v20, "sourceInfo.contextualInfoType")
	local v23 = useAreWebViewsSupported()
	local v24 = useIsProfileQrCodeEnabled()
	local v25 = useCanRenderTransferOnProfile()
	local v26 = if not FFlagProfilePlatformCTAsRefactor then nil else useLocalUserId()
	local v27 = not not FFlagProfilePlatformCTAsRefactor and tostring(v20.profileId) == tostring(v26)

	return (React.useMemo(function() -- line: 43
		-- upvalues: profileType (copy), Enums (copy), getAvailableUserComponents (copy), v22 (copy), FFlagProfilePlatformEnableVR (copy), v23 (copy), v24 (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), v25 (copy), FFlagProfilePlatformCTAsRefactor (copy), v27 (copy), FFlagProfilePlatformEnableCommunityProfilePage (copy), getAvailableCommunityComponents (copy), getAvailableContactComponents (copy)
		if profileType == Enums.ProfileTypes.User then
			return getAvailableUserComponents(v22, if not FFlagProfilePlatformEnableVR then {
				canRenderTransferInProfile = not not FFlagProfilePlatformEnableCurrencyTransfer and v25,
				isSelfView = if not FFlagProfilePlatformCTAsRefactor then nil else v27
			} else {
				areWebViewsSupported = v23,
				isProfileQrCodeEnabled = v24,
				canRenderTransferInProfile = not not FFlagProfilePlatformEnableCurrencyTransfer and v25,
				isSelfView = if not FFlagProfilePlatformCTAsRefactor then nil else v27
			})
		end

		if FFlagProfilePlatformEnableCommunityProfilePage and profileType == Enums.ProfileTypes.Community then
			return getAvailableCommunityComponents()
		end

		if profileType == Enums.ProfileTypes.Contact then
			return getAvailableContactComponents()
		end

		return {}
	end, if not FFlagProfilePlatformEnableVR then if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(profileType, v22, v23, v24, if not FFlagProfilePlatformCTAsRefactor then nil else v27, if not FFlagProfilePlatformEnableCurrencyTransfer then nil else v25) else {
		profileType,
		v22,
		v23,
		v24,
		if not FFlagProfilePlatformCTAsRefactor then nil else v27,
		if not FFlagProfilePlatformEnableCurrencyTransfer then nil else v25
	} else if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(profileType, v22, if not FFlagProfilePlatformCTAsRefactor then nil else v27, if not FFlagProfilePlatformEnableCurrencyTransfer then nil else v25) else {
		profileType,
		v22,
		if not FFlagProfilePlatformCTAsRefactor then nil else v27,
		if not FFlagProfilePlatformEnableCurrencyTransfer then nil else v25
	}))
end
