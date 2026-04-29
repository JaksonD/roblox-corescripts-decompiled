local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local AvatarExperienceCatalogParent = AvatarExperienceCatalog.Parent
local Rodux = require(AvatarExperienceCatalogParent.Rodux)

require(AvatarExperienceCatalog.Stores.createAXShoppingCartStore)

local AvatarExperienceFlags = require(AvatarExperienceCatalogParent.AvatarExperienceFlags)
local FFlagAXFixAvatarLooksSaveWithMakeupItems = AvatarExperienceFlags.FFlagAXFixAvatarLooksSaveWithMakeupItems
local FFlagAXMISSaveWearFix = AvatarExperienceFlags.FFlagAXMISSaveWearFix

return Rodux.makeActionCreator(script.Name, function(t1: {[any]: any}) -- line: 57
	-- upvalues: FFlagAXFixAvatarLooksSaveWithMakeupItems (copy), FFlagAXMISSaveWearFix (copy)
	return {
		equippableAssets = t1.equippableAssets,
		items = t1.items,
		replaceAllEquippedAssets = t1.replaceAllEquippedAssets,
		shouldClearEquippedMakeup = if not FFlagAXFixAvatarLooksSaveWithMakeupItems then nil else t1.shouldClearEquippedMakeup,
		bodyColor3s = t1.bodyColor3s,
		bodyScales = t1.bodyScales,
		bodyPartColorRangeIds = t1.bodyPartColorRangeIds,
		makeupAssetsOnHumanoid = if not FFlagAXMISSaveWearFix then nil else t1.makeupAssetsOnHumanoid
	}
end)
