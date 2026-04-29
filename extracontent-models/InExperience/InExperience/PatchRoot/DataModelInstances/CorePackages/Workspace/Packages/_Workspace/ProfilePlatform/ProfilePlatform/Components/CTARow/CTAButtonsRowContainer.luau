local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local HorizontalPageMargin = require(ProfilePlatformParent.UIBlox).App.Container.HorizontalPageMargin
local CTAButtonsRow = require(ProfilePlatform.Components.CTARow.CTAButtonsRow)
local useMapJsonToButtonList = require(ProfilePlatform.Components.CTARow.useMapJsonToButtonList)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)

return function(t1: {[any]: any}) --[[ CTAButtonRowContainer ]] -- line: 17
	-- upvalues: useProfileWrapperContext (copy), useMapJsonToButtonList (copy), React (copy), HorizontalPageMargin (copy), CTAButtonsRow (copy)
	local profileId = useProfileWrapperContext().profileId
	local v10 = useMapJsonToButtonList(profileId)

	return React.createElement(HorizontalPageMargin, {
		size = UDim2.new(1, 0, 0, 0),
		backgroundTransparency = 1,
		layoutOrder = t1.layoutOrder,
		useAutomaticSizing = true
	}, {
		Content = React.createElement(CTAButtonsRow, {
			buttonList = v10,
			layoutOrder = 1
		})
	})
end
