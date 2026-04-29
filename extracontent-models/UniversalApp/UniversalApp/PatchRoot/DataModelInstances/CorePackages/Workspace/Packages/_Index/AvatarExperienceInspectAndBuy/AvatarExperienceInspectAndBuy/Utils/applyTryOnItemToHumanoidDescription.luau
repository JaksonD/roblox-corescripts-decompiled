local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local AXCommon = require(AvatarExperienceInspectAndBuyParent.AXCommon)
local Cryo = require(AvatarExperienceInspectAndBuyParent.Cryo)
local Constants = AXCommon.Constants
local ItemTypeEnum = AXCommon.Enums.ItemTypeEnum
local ASSET_TYPE_TO_ACCESSORY_TYPE = Constants.ASSET_TYPE_TO_ACCESSORY_TYPE
local ASSET_TYPE_NAME_TO_ID_STRING = Constants.ASSET_TYPE_NAME_TO_ID_STRING
local ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = Constants.ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP
local LAYERED_CLOTHING_ORDER = Constants.LAYERED_CLOTHING_ORDER
local LAYERED_ASSET_TYPES = Constants.LAYERED_ASSET_TYPES
local BODY_BUNDLE_TYPE_ID = Constants.BODY_BUNDLE_TYPE_ID
local SHOES_BUNDLE_TYPE_ID = Constants.SHOES_BUNDLE_TYPE_ID
local DYNAMIC_HEAD_BUNDLE_TYPE_ID = Constants.DYNAMIC_HEAD_BUNDLE_TYPE_ID
local FFlagAXFix2DClothingTryOn = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags).FFlagAXFix2DClothingTryOn

require(AvatarExperienceInspectAndBuy.Types)

local function v16(t1: {[any]: any}, t2: {[any]: any}?) -- line: 61
	-- upvalues: ASSET_TYPE_TO_ACCESSORY_TYPE (copy), LAYERED_CLOTHING_ORDER (copy), LAYERED_ASSET_TYPES (copy)
	local t3 = {}

	for _, v26 in t1 do
		local assetType = v26.assetType
		local id = v26.id

		if assetType and id then
			local v29 = ASSET_TYPE_TO_ACCESSORY_TYPE[assetType]
			local v30 = true

			if t2 then
				v30 = false

				for _, v32 in t2 do
					if v29 == v32 then
						v30 = true

						break
					end
				end
			end

			if v30 and v29 then
				table.insert(t3, {
					AssetId = tonumber(id) or 0,
					Order = LAYERED_CLOTHING_ORDER[assetType],
					AccessoryType = ASSET_TYPE_TO_ACCESSORY_TYPE[assetType],
					IsLayered = LAYERED_ASSET_TYPES[assetType] ~= nil
				})
			end
		end
	end

	return t3
end
local function v17(p1, t4: {[any]: any}) -- line: 98
	-- upvalues: Cryo (copy)
	local Accessories = p1:GetAccessories(true)
	local t5 = {}

	for _, v38 in t4 do
		table.insert(t5, v38.AccessoryType)
	end

	local v39 = Cryo.List.filter(Accessories, function(p2) -- line: 48
		-- upvalues: t5 (copy)
		for _, v62 in t5 do
			if v62 == p2.AccessoryType then
				return false
			end
		end

		return true
	end)

	p1:SetAccessories(Cryo.List.join(v39, t4), true)
end

return function(p3, p4) -- line: 117
	-- upvalues: ItemTypeEnum (copy), ASSET_TYPE_TO_ACCESSORY_TYPE (copy), FFlagAXFix2DClothingTryOn (copy), ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP (copy), ASSET_TYPE_NAME_TO_ID_STRING (copy), LAYERED_CLOTHING_ORDER (copy), LAYERED_ASSET_TYPES (copy), v17 (copy), BODY_BUNDLE_TYPE_ID (copy), v16 (copy), SHOES_BUNDLE_TYPE_ID (copy), DYNAMIC_HEAD_BUNDLE_TYPE_ID (copy)
	if p3.itemType == ItemTypeEnum.Asset and (ASSET_TYPE_TO_ACCESSORY_TYPE[p3.itemSubType] or FFlagAXFix2DClothingTryOn and ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[p3.itemSubType]) then
		local itemSubType = p3.itemSubType
		local itemId = p3.itemId
		local v44 = if not FFlagAXFix2DClothingTryOn then nil else ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[itemSubType]

		if itemId and itemSubType ~= ASSET_TYPE_NAME_TO_ID_STRING.Gear and ASSET_TYPE_TO_ACCESSORY_TYPE[itemSubType] then
			local t6 = {{
				AssetId = tonumber(itemId) or 0,
				Order = LAYERED_CLOTHING_ORDER[itemSubType],
				AccessoryType = ASSET_TYPE_TO_ACCESSORY_TYPE[itemSubType],
				IsLayered = LAYERED_ASSET_TYPES[itemSubType] ~= nil
			}}

			v17(p4, t6)
		elseif FFlagAXFix2DClothingTryOn and v44 and itemId then
			p4[v44] = itemId
		end
	end

	if p3.itemType == ItemTypeEnum.Bundle and p3.assetsInBundle and p3.itemSubType == BODY_BUNDLE_TYPE_ID then
		local v46 = v16(p3.assetsInBundle, { Enum.AccessoryType.Hair })

		if #v46 > 0 then
			v17(p4, v46)
		end

		for _, v48 in p3.assetsInBundle do
			local assetType = v48.assetType

			if assetType then
				local v50 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[assetType]

				if ASSET_TYPE_TO_ACCESSORY_TYPE[assetType] ~= Enum.AccessoryType.Hair and v50 and v48.id then
					p4[v50] = v48.id
				end
			end
		end
	end

	if p3.itemSubType == SHOES_BUNDLE_TYPE_ID and p3.assetsInBundle then
		local v51 = v16(p3.assetsInBundle, {
			Enum.AccessoryType.LeftShoe,
			Enum.AccessoryType.RightShoe
		})

		if #v51 > 0 then
			v17(p4, v51)
		end
	end

	if p3.itemSubType == DYNAMIC_HEAD_BUNDLE_TYPE_ID and p3.assetsInBundle then
		for _, v53 in p3.assetsInBundle do
			local assetType = v53.assetType
			local id = v53.id

			if assetType then
				local v56 = ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP[assetType]

				if v56 and id then
					p4[v56] = id
				end
			end
		end
	end
end
