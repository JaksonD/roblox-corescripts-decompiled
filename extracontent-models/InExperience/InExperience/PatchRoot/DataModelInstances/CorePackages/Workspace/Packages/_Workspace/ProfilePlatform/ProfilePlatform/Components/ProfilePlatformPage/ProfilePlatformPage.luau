local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local Cryo = require(ProfilePlatformParent.Cryo)
local UIBlox = require(ProfilePlatformParent.UIBlox)
local React = require(ProfilePlatformParent.React)
local useStyle = UIBlox.Core.Style.useStyle
local Enums = require(ProfilePlatform.Common.Enums)
local useProfileAnalyticsContext = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local useProfileFormFactor = require(ProfilePlatform.Hooks.useProfileFormFactor)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local useProfileScrollContext = require(ProfilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local getPeekViewOpenHeightByProfileType = require(ProfilePlatform.Utils.getPeekViewOpenHeightByProfileType)
local FFlagProfilePlatformEnableCommunityProfilePage = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCommunityProfilePage)
local FFlagProfilePlatformEnableImpressions = require(ProfilePlatformParent.SharedFlags).FFlagProfilePlatformEnableImpressions
local FFlagProfilePlatformEnableCoverPhoto = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCoverPhoto)

return function(t1: {[any]: any}) --[[ ProfilePlatformPage ]] -- line: 27
	-- upvalues: FFlagProfilePlatformEnableCommunityProfilePage (copy), useProfileWrapperContext (copy), FFlagProfilePlatformEnableCoverPhoto (copy), useProfileScrollContext (copy), useProfileFormFactor (copy), Enums (copy), useStyle (copy), FFlagProfilePlatformEnableImpressions (copy), useProfileAnalyticsContext (copy), Cryo (copy), React (copy), getPeekViewOpenHeightByProfileType (copy)
	local v17 = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else useProfileWrapperContext()
	local v18 = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else v17.profileType
	local v19 = if not FFlagProfilePlatformEnableCoverPhoto then nil else useProfileScrollContext()
	local v20 = useProfileFormFactor()
	local v21 = v20.formFactor == Enums.ProfileFormFactor.Wide
	local isFullView = v20.isFullView
	local Theme = useStyle().Theme
	local v24 = if not FFlagProfilePlatformEnableImpressions then nil else useProfileAnalyticsContext()
	local v25 = if not FFlagProfilePlatformEnableImpressions then nil else v24.scrollViewPositionChangedSignal
	local v26 = Cryo.Dictionary.join({
		bottomPadding = React.createElement("Frame", {
			Size = UDim2.fromOffset(0, 8),
			BackgroundTransparency = 1,
			LayoutOrder = 99999
		})
	}, t1.children)

	return React.createElement("Frame", {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, getPeekViewOpenHeightByProfileType(v18)),
		AutomaticSize = Enum.AutomaticSize.Y,
		BorderSizePixel = 0,
		BackgroundTransparency = if not FFlagProfilePlatformEnableCommunityProfilePage or (v18 ~= Enums.ProfileTypes.Community or (v21 or isFullView)) then Theme.BackgroundDefault.Transparency else Theme.BackgroundContrast.Transparency,
		BackgroundColor3 = if not FFlagProfilePlatformEnableCommunityProfilePage or (v18 ~= Enums.ProfileTypes.Community or (v21 or isFullView)) then Theme.BackgroundDefault.Color else Theme.BackgroundContrast.Color,
		[React.Change.AbsolutePosition] = if not FFlagProfilePlatformEnableImpressions and not FFlagProfilePlatformEnableCoverPhoto then nil else function(p1) -- line: 79
			-- upvalues: FFlagProfilePlatformEnableCoverPhoto (copy), v19 (copy), v25 (copy)
			if FFlagProfilePlatformEnableCoverPhoto then
				v19.setAbsoluteYPosition(p1.AbsolutePosition.Y)
			end

			v25:fire()
		end
	}, v26)
end
