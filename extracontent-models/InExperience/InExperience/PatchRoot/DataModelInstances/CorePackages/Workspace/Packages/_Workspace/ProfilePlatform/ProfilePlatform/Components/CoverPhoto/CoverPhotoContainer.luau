local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local Constants = require(ProfilePlatformParent.UserLib).Utils.Constants
local Enums = require(ProfilePlatform.Common.Enums)
local useProfileFormFactor = require(ProfilePlatform.Hooks.useProfileFormFactor)
local useProfileJsonComponent = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local useProfileScrollContext = require(ProfilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local CoverPhoto = require(ProfilePlatform.Components.CoverPhoto.CoverPhoto)

return function(t1: {[any]: any}) --[[ CoverPhotoContainer ]] -- line: 22
	-- upvalues: useProfileJsonComponent (copy), Enums (copy), useProfileFormFactor (copy), useProfileScrollContext (copy), Constants (copy), React (copy), CoverPhoto (copy)
	local v11 = useProfileJsonComponent(Enums.Components.CoverPhoto) or {}
	local v12 = useProfileFormFactor()
	local v13 = useProfileScrollContext()
	local v14 = v13.scrollY / 2

	if v11.coverPhotoId == nil then
		return nil
	end

	local v15 = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", Constants.RbxthumbTypes.Asset, v11.coverPhotoId, 1440, 456)

	return React.createElement(CoverPhoto, {
		layoutOrder = t1.layoutOrder,
		coverPhotoThumbnail = v15,
		profileFormFactorInfo = v12,
		parallaxOffset = v14,
		peekViewOpenPercent = v13.peekViewOpenPercent
	})
end
