local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent

require(AvatarExperienceInspectAndBuy.Types)

local AXCommon = require(AvatarExperienceInspectAndBuyParent.AXCommon)
local Constants = AXCommon.Constants
local ASSET_TYPE_TO_ACCESSORY_TYPE = Constants.ASSET_TYPE_TO_ACCESSORY_TYPE
local ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = Constants.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP
local LAYERED_ASSET_TYPES = Constants.LAYERED_ASSET_TYPES
local AVATAR_ANIMATIONS_BUNDLE_TYPE_ID = Constants.AVATAR_ANIMATIONS_BUNDLE_TYPE_ID
local SHOES_BUNDLE_TYPE_ID = Constants.SHOES_BUNDLE_TYPE_ID
local ItemTypeEnum = AXCommon.Enums.ItemTypeEnum

return function(p1, p2) --[[ isItemAvailableForTryOn ]] -- line: 20
	-- upvalues: ItemTypeEnum (copy), AVATAR_ANIMATIONS_BUNDLE_TYPE_ID (copy), SHOES_BUNDLE_TYPE_ID (copy), ASSET_TYPE_TO_ACCESSORY_TYPE (copy), ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP (copy), LAYERED_ASSET_TYPES (copy)
	local itemSubType = p2.itemSubType
	local v14 = p1 and (p1.Humanoid and p1.Humanoid.RigType == Enum.HumanoidRigType.R6)

	if p2.itemType == ItemTypeEnum.Bundle and itemSubType == AVATAR_ANIMATIONS_BUNDLE_TYPE_ID then
		return false
	end

	if p2.itemType == ItemTypeEnum.Bundle and itemSubType == SHOES_BUNDLE_TYPE_ID and v14 then
		return false
	end

	if p2.itemType == ItemTypeEnum.Asset then
		if not itemSubType then
			return false
		end

		local v15 = ASSET_TYPE_TO_ACCESSORY_TYPE[itemSubType] ~= nil or ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[itemSubType] ~= nil
		local v16 = v14 and LAYERED_ASSET_TYPES[itemSubType] ~= nil

		return v15 and not v16
	end

	return true
end
