local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local CorePackages = game:GetService("CorePackages")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local FFlagAXEnableInspectAndBuyBulkPurchase = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase
local FIntBulkPurchaseRequestLimit = require(CorePackages.Workspace.Packages.SharedFlags).FIntBulkPurchaseRequestLimit
local FIntBulkPurchaseThrottleLimit = require(CorePackages.Workspace.Packages.SharedFlags).FIntBulkPurchaseThrottleLimit
local FFlagFilterOutShopOnlyItemsOnBulkPurchase = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFilterOutShopOnlyItemsOnBulkPurchase
local FFlagAXEnableTimedOptionsServerScript = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableTimedOptionsServerScript

if FFlagAXEnableInspectAndBuyBulkPurchase then
	local RemoteEvent = Instance.new("RemoteEvent")

	RemoteEvent.Name = "ServerSideBulkPurchaseEvent"
	RemoteEvent.Parent = RobloxReplicatedStorage

	local t1 = {}
	local t2 = {
		MyExperiencesOnly = "MyExperiencesOnly",
		ExperiencesById = "ExperiencesById",
		ExperiencesDevApiOnly = "ExperiencesDevApiOnly"
	}
	local v16 = if not FFlagFilterOutShopOnlyItemsOnBulkPurchase then nil else {
		ShopOnly = "ShopOnly"
	}
	local t3 = {
		Limited = "Limited",
		LimitedUnique = "LimitedUnique",
		Collectible = "Collectible"
	}
	local t4 = {
		Bundle = Enum.MarketplaceProductType.AvatarBundle,
		Asset = Enum.MarketplaceProductType.AvatarAsset
	}

	local function isLimited(p1) -- line: 121
		-- upvalues: t3 (copy)
		local itemRestrictions = p1.itemRestrictions
		local v27 = itemRestrictions and table.find(itemRestrictions, t3.Limited)
		local v28 = itemRestrictions and table.find(itemRestrictions, t3.LimitedUnique)
		local v29 = itemRestrictions and table.find(itemRestrictions, t3.Collectible)

		return v27 ~= nil or (v28 ~= nil or v29 ~= nil)
	end
	local function validateItem(t5: {[any]: any}) -- line: 143
		if type(t5) ~= "table" or (t5.id == nil or t5.itemType == nil or type(t5.itemType) ~= "number" or type(t5.id) ~= "number" or t5.id == 0) or t5.itemType ~= Enum.AvatarItemType.Asset.Value and t5.itemType ~= Enum.AvatarItemType.Bundle.Value then
			return false
		end

		return true
	end
	local function validateIncomingItems(t6: {[any]: any}) -- line: 161
		-- upvalues: FIntBulkPurchaseRequestLimit (copy), validateItem (copy), FFlagAXEnableTimedOptionsServerScript (copy)
		local t7 = {}

		if not t6 then
			return nil
		end

		if type(t6) ~= "table" then
			return nil
		end

		if #t6 > FIntBulkPurchaseRequestLimit then
			return nil
		end

		local n1 = 0

		for _, v36 in t6 do
			if n1 >= FIntBulkPurchaseRequestLimit then
				return t7
			end

			if validateItem(v36) then
				table.insert(t7, {
					id = v36.id,
					itemType = v36.itemType,
					PurchaseOptions = if not FFlagAXEnableTimedOptionsServerScript then nil else v36.PurchaseOptions
				})
				n1 += 1
			end
		end

		return t7
	end

	Players.PlayerRemoving:Connect(function(player) -- line: 204
		-- upvalues: t1 (copy)
		t1[player] = nil
	end)
	RemoteEvent.OnServerEvent:Connect(function(player, t8: {[any]: any}) -- line: 208
		-- upvalues: t1 (copy), FIntBulkPurchaseThrottleLimit (copy), validateIncomingItems (copy), Url (copy), FFlagAXEnableTimedOptionsServerScript (copy), HttpService (copy), HttpRbxApiService (copy), t2 (copy), isLimited (copy), FFlagFilterOutShopOnlyItemsOnBulkPurchase (copy), v16 (copy), t4 (copy), MarketplaceService (copy)
		if not player.UserId or player.UserId <= 0 then
			return
		end

		local v42 = t1[player]
		local v43

		if v42 and v42 > tick() then
			v43 = true
		else
			t1[player] = tick() + FIntBulkPurchaseThrottleLimit
			v43 = false
		end

		if v43 then
			return
		end

		local v44 = validateIncomingItems(t8)

		if v44 == nil or #v44 == 0 then
			return
		end

		local ok, result = pcall(function() -- line: 78
			-- upvalues: Url (copy), FFlagAXEnableTimedOptionsServerScript (copy), v44 (copy), HttpService (copy), HttpRbxApiService (copy)
			local v60 = Url.CATALOG_URL .. "v1/catalog/items/details"
			local json

			if FFlagAXEnableTimedOptionsServerScript then
				local t9 = {}

				for _, v63 in v44 do
					table.insert(t9, {
						id = v63.id,
						itemType = v63.itemType
					})
				end

				json = HttpService:JSONEncode({
					items = t9
				})
			else
				json = HttpService:JSONEncode({
					items = v44
				})
			end

			local v65 = HttpRbxApiService:PostAsyncFullUrl(v60, json, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson)

			return HttpService:JSONDecode(v65)
		end)
		local v47 = if not ok then nil else result
		local v48 = if not FFlagAXEnableTimedOptionsServerScript then nil else {}

		if FFlagAXEnableTimedOptionsServerScript then
			for _, v50 in v44 do
				if v50.PurchaseOptions and v48 then
					v48[v50.id] = v50.PurchaseOptions
				end
			end
		end

		local t10 = {}

		if v47 ~= nil then
			for _, v53 in v47.data do
				if (v53.saleLocationType ~= t2.MyExperiencesOnly and v53.saleLocationType ~= t2.ExperiencesById and v53.saleLocationType ~= t2.ExperiencesDevApiOnly or v53.unitsAvailableForConsumption == 0 and isLimited(v53)) and (not FFlagFilterOutShopOnlyItemsOnBulkPurchase or not v16 or v53.saleLocationType ~= v16.ShopOnly or v53.unitsAvailableForConsumption == 0 and isLimited(v53)) then
					table.insert(t10, {
						Id = tostring(v53.id),
						Type = t4[v53.itemType],
						PurchaseOptions = if not FFlagAXEnableTimedOptionsServerScript or (not v48 or not v48[v53.id]) then nil else v48[v53.id]
					})
				end
			end
		end

		if #t10 > 0 then
			MarketplaceService:PromptBulkPurchase(player, t10, {})
		end
	end)
end
