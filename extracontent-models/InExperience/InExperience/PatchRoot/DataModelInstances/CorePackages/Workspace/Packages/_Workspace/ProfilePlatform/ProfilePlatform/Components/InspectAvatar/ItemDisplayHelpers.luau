local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local Enums = require(ProfilePlatform.Common.Enums)
local UserLib = require(ProfilePlatformParent.UserLib)
local AvatarExperienceInspectAndBuy = require(ProfilePlatformParent.AvatarExperienceInspectAndBuy)
local Constants = AvatarExperienceInspectAndBuy.Constants
local getPriceStatusInShop = AvatarExperienceInspectAndBuy.Utils.getPriceStatusInShop
local PriceStatus = AvatarExperienceInspectAndBuy.Enums.PriceStatus
local Constants2 = UserLib.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = UserLib.Utils.getRbxthumbWithTypeSizeAndOptions

require(ProfilePlatform.Common.Types)

local Asset = Constants2.RbxthumbTypes.Asset
local BundleThumbnail = Constants2.RbxthumbTypes.BundleThumbnail
local t1 = {
	Shirt = "Classic Shirt",
	Pants = "Classic Pants",
	TShirt = "Classic T-Shirt",
	TShirtAccessory = "T-Shirt",
	DressSkirtAccessory = "Dresses & Skirts"
}

local function getAssetTypeDisplayName(s1: string?, t2: {[any]: any}?) -- line: 47
	-- upvalues: t1 (copy)
	if not s1 then
		return ""
	end

	if t2 and t2[s1] then
		return t2[s1]
	end

	local num = tonumber(s1)

	if not num then
		return t1[s1] or s1
	end

	for _, v23 in Enum.AvatarAssetType:GetEnumItems() do
		if num == v23.Value then
			return t1[v23.Name] or v23.Name:gsub("(%l)(%u)", "%1 %2")
		end
	end

	return ""
end

return {
	isPurchasableStatus = function(s2: string) --[[ isPurchasableStatus ]] -- line: 32
		-- upvalues: PriceStatus (copy)
		return s2 == PriceStatus.Free or (s2 == PriceStatus.PurchaseFromRoblox or s2 == PriceStatus.PurchaseFromResale)
	end,
	getPriceStatus = function(p1) --[[ getPriceStatus ]] -- line: 96
		-- upvalues: getPriceStatusInShop (copy)
		return getPriceStatusInShop(p1)
	end,
	PriceStatusEnum = PriceStatus,
	getThumbnailUrl = function(p2) --[[ getThumbnailUrl ]] -- line: 42
		-- upvalues: Enums (copy), BundleThumbnail (copy), Asset (copy), getRbxthumbWithTypeSizeAndOptions (copy)
		local v18 = if not (p2.itemType == Enums.ItemTypes.Bundle or p2.itemType == "Bundle") then Asset else BundleThumbnail

		return getRbxthumbWithTypeSizeAndOptions(p2.id, v18, 150)
	end,
	getItemTypeDisplayName = function(p3, p4) --[[ getItemTypeDisplayName ]] -- line: 69
		-- upvalues: Enums (copy), getAssetTypeDisplayName (copy)
		if p3.taxonomyName then
			return p3.taxonomyName
		end

		local assetTypeNames = p4.assetTypeNames

		if p3.itemType == Enums.ItemTypes.Bundle or p3.itemType == "Bundle" then
			if p3.itemSubType and assetTypeNames and assetTypeNames[p3.itemSubType] then
				return assetTypeNames[p3.itemSubType]
			end

			if p4 and p4.bundle then
				return p4.bundle
			end

			return "Bundle"
		end

		return (getAssetTypeDisplayName(p3.itemSubType, assetTypeNames))
	end,
	shouldShowBundleParts = function(p5) --[[ shouldShowBundleParts ]] -- line: 86
		-- upvalues: getPriceStatusInShop (copy), PriceStatus (copy)
		local v28 = getPriceStatusInShop(p5)

		if p5.isOwned or v28 ~= PriceStatus.Free and (v28 ~= PriceStatus.PurchaseFromRoblox and v28 ~= PriceStatus.PurchaseFromResale) then
			return false
		end

		return p5.bundlePartsCount ~= nil and p5.bundlePartsCount > 0
	end,
	ASSET_TYPE_LOCALIZATION_KEYS = Constants.AssetLocalizationKeys,
	BUNDLE_TYPE_LOCALIZATION_KEYS = Constants.BundleLocalizationKeys,
	PRICE_STATUS_LOCALIZATION_KEYS = Constants.PriceStatusLocalizationKeys
}
