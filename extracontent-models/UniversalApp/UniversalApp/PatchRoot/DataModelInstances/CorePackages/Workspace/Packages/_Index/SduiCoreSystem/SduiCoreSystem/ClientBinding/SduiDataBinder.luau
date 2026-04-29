local LocalizationService = game:GetService("LocalizationService")
local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent

require(SduiCoreSystemParent.ServiceContractsProto)

local DataHydration = require(SduiCoreSystemParent.DataHydration)

require(SduiCoreSystemParent.Signals)

local Display = require(SduiCoreSystemParent.Display)
local Responsive = require(SduiCoreSystemParent.Responsive)
local SduiDataBindingResponsiveFieldName = require(SduiCoreSystem.ClientBinding.SduiDataBindingFieldNames).SduiDataBindingResponsiveFieldName
local tryGetPathFromData = require(SduiCoreSystem.ClientBinding.tryGetPathFromData)
local SduiDataBindingContentType = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local SduiDataBinderTransformUtils = require(SduiCoreSystem.ClientBinding.SduiDataBinderTransformUtils)
local getZendeskUrl = require(SduiCoreSystemParent.DiscoveryUtils).getZendeskUrl
local getSduiPolicyStore = require(SduiCoreSystem.ClientBinding.getSduiPolicyStore)
local resolveSduiPolicyField = require(SduiCoreSystem.ClientBinding.resolveSduiPolicyField)
local getSduiServiceDependenciesStore = require(SduiCoreSystem.ClientBinding.getSduiServiceDependenciesStore)

require(SduiCoreSystem.SduiBuilderTypes)

local SharedFlags = require(SduiCoreSystemParent.SharedFlags)
local FFlagLuaAppSduiBadgeDetailsComponents = SharedFlags.FFlagLuaAppSduiBadgeDetailsComponents
local FFlagSduiAppPolicyBindings = SharedFlags.FFlagSduiAppPolicyBindings
local FFlagSduiExperienceDetailsSupport = SharedFlags.FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = SharedFlags.FFlagSduiEventDetailsSupport
local FFlagSduiMarketplaceCatalogCategorySupport = SharedFlags.FFlagSduiMarketplaceCatalogCategorySupport
local FFlagSduiMarketplaceCatalogSortSupport = SharedFlags.FFlagSduiMarketplaceCatalogSortSupport
local FFlagSduiAddMarketplaceEntityDataHydration = SharedFlags.FFlagSduiAddMarketplaceEntityDataHydration
local FFlagSduiSongHydrationSupport = SharedFlags.FFlagSduiSongHydrationSupport
local protobufTimestampToLocalTimeString = SduiDataBinderTransformUtils.protobufTimestampToLocalTimeString

local function calculateBadgeDerivedField(s1: string, p1, _) -- line: 121
	-- upvalues: protobufTimestampToLocalTimeString (copy)
	if s1 == "created_time_formatted" then
		local v49 = p1 and (p1.created_time or p1.createdTime)

		return v49 and protobufTimestampToLocalTimeString(v49)
	end

	if s1 == "updated_time_formatted" then
		local v50 = p1 and (p1.updated_time or p1.updatedTime)

		return v50 and protobufTimestampToLocalTimeString(v50)
	end

	if s1 == "awarded_time_formatted" then
		local v51 = p1 and (p1.awarded_time or p1.awardedTime)

		return v51 and protobufTimestampToLocalTimeString(v51)
	end

	return nil
end
local function calculateUniverseDerivedField(s2: string, p3, _) -- line: 144
	-- upvalues: DataHydration (copy), FFlagSduiExperienceDetailsSupport (copy), LocalizationService (copy), getZendeskUrl (copy)
	if s2 == "rating_text_formatted_brief" then
		local v55 = tonumber(p3.totalUpVotes) or 0
		local v56 = tonumber(p3.totalDownVotes) or 0
		local v57 = DataHydration.Game.VotesUtils.calculateRating(v55, v56)
		local t1 = {
			upVotes = v55,
			downVotes = v56,
			rating = v57
		}

		return DataHydration.Game.VotesUtils.getRatingDisplayText(t1)
	end

	if FFlagSduiExperienceDetailsSupport and s2 == "refund_policy_learn_more_url" then
		local RobloxLocaleId = LocalizationService.RobloxLocaleId

		return getZendeskUrl(nil, RobloxLocaleId, p3 and p3.refund_article_id)
	end

	return nil
end
local function getDataObjectSignal(p5, _: {[any]: any}, s3: string, _: boolean?) -- line: 186
	-- upvalues: DataHydration (copy), FFlagLuaAppSduiBadgeDetailsComponents (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiEventDetailsSupport (copy), FFlagSduiMarketplaceCatalogCategorySupport (copy), FFlagSduiMarketplaceCatalogSortSupport (copy), FFlagSduiSongHydrationSupport (copy), FFlagSduiAddMarketplaceEntityDataHydration (copy)
	if p5 == "badge" then
		return DataHydration.Badges.getBadgeInfoStore(false).getBadgeInfo((tostring(s3)))
	end

	if FFlagLuaAppSduiBadgeDetailsComponents then
		if p5 == "creator" then
			return DataHydration.Creator.getCreatorInfoStore(false).getCreatorInfo(s3)
		end

		if p5 == "universe" then
			return DataHydration.Game.getGameInfoStore(false).getGameInfo(s3)
		end
	end

	if FFlagSduiExperienceDetailsSupport then
		if p5 == "ageRecommendation" then
			return DataHydration.Game.getAgeRecommendationStore(false).getAgeRecommendation(s3)
		end

		if p5 == "socialLink" then
			return DataHydration.SocialLink.getSocialLinkInfoStore(false).getSocialLinkInfo(s3)
		end

		if p5 == "mediaAsset" then
			return DataHydration.MediaAsset.getMediaAssetStore(false).getMediaAsset(s3)
		end

		if p5 == "gamePass" then
			return DataHydration.Game.getGamePassStore(false).getGamePassInfo((tostring(s3)))
		end

		if p5 == "playability" then
			return DataHydration.Game.getPlayabilityStore(false).getPlayability((tostring(s3)))
		end
	end

	if (FFlagSduiEventDetailsSupport or FFlagSduiExperienceDetailsSupport) and p5 == "event" then
		return DataHydration.ExperienceEvents.getExperienceEventInfoStore(false).getExperienceEventInfo(s3)
	end

	if FFlagSduiMarketplaceCatalogCategorySupport and p5 == "marketplaceCatalogCategory" then
		return DataHydration.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).getMarketplaceCatalogCategory(s3)
	end

	if FFlagSduiMarketplaceCatalogSortSupport and p5 == "marketplaceCatalogSort" then
		return DataHydration.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(s3)
	end

	if FFlagSduiSongHydrationSupport and p5 == "song" then
		return DataHydration.Song.getSongInfoStore(false).getSongInfo((tostring(s3)))
	end

	if FFlagSduiAddMarketplaceEntityDataHydration then
		if p5 == "marketplaceAsset" then
			return DataHydration.MarketplaceAsset.getMarketplaceAssetStore(false).getMarketplaceAssetInfo(s3)
		end

		if p5 == "marketplaceBundle" then
			return DataHydration.MarketplaceBundle.getMarketplaceBundleStore(false).getMarketplaceBundleInfo(s3)
		end

		if p5 == "marketplaceLook" then
			return DataHydration.MarketplaceLook.getMarketplaceLookStore(false).getMarketplaceLookInfo(s3)
		end
	end

	return nil
end

local t3 = {
	responsive = true,
	policy = not not FFlagSduiAppPolicyBindings or nil
}

local function calculateDerivedFieldValue(p6, s4: string, p7, p8) -- line: 322
	-- upvalues: calculateBadgeDerivedField (copy), FFlagSduiExperienceDetailsSupport (copy), calculateUniverseDerivedField (copy), DataHydration (copy), FFlagSduiEventDetailsSupport (copy), getSduiServiceDependenciesStore (copy)
	if p6 == "badge" then
		return (calculateBadgeDerivedField(s4, p7, p8))
	end

	if FFlagSduiExperienceDetailsSupport then
		if p6 == "universe" then
			return calculateUniverseDerivedField(s4, p7, p8)
		end

		if p6 == "ageRecommendation" then
			local v88

			if s4 == "content_rating_image" then
				v88 = p7 and p7.igrsRating

				if v88 then
					return (DataHydration.Game.AgeRecommendationUtils.getIgrsImage(v88))
				end
			else
				v88 = nil
			end

			return v88
		end
	end

	if (FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport) and p6 == "event" then
		local v89 = DataHydration.ExperienceEvents.getExperienceEventInfoStore(false)
		local localization = getSduiServiceDependenciesStore().getDependencies("SduiDataBinder").localization

		return v89.calculateDerivedField(s4, p7, p8, localization)
	end

	return nil
end
local function getDataHydrationField(p9, t4: {[any]: any}, s5: string, p10, b2: boolean?) -- line: 362
	-- upvalues: getDataObjectSignal (copy), tryGetPathFromData (copy), calculateDerivedFieldValue (copy)
	if #t4 < 2 then
		return nil, nil
	end

	local v96 = getDataObjectSignal(p9, t4, s5, b2)

	if not v96 then
		local v97 = table.concat(t4, ".")

		error(`No available data object for { p9 } { v97 } for id: { s5 }`)
	end

	local v98 = v96.data(p10)
	local v99 = v96.status(p10)

	if not v98 then
		return nil, v99
	end

	local v100, v101 = tryGetPathFromData(v98, t4, 2)

	if v100 then
		return v101, v99
	end

	if #t4 == 2 then
		local v102 = t4[2]

		return calculateDerivedFieldValue(p9, v102, v98, p10), v99
	end

	return nil, v99
end

local t5 = {
	badge = getDataHydrationField,
	creator = getDataHydrationField,
	universe = getDataHydrationField,
	ageRecommendation = if not FFlagSduiExperienceDetailsSupport then nil else getDataHydrationField,
	mediaAsset = if not FFlagSduiExperienceDetailsSupport then nil else getDataHydrationField,
	socialLink = if not FFlagSduiExperienceDetailsSupport then nil else getDataHydrationField,
	event = if not FFlagSduiExperienceDetailsSupport and not FFlagSduiEventDetailsSupport then nil else getDataHydrationField,
	marketplaceCatalogCategory = if not FFlagSduiMarketplaceCatalogCategorySupport then nil else getDataHydrationField,
	marketplaceCatalogSort = if not FFlagSduiMarketplaceCatalogSortSupport then nil else getDataHydrationField,
	marketplaceAsset = if not FFlagSduiAddMarketplaceEntityDataHydration then nil else getDataHydrationField,
	marketplaceBundle = if not FFlagSduiAddMarketplaceEntityDataHydration then nil else getDataHydrationField,
	marketplaceLook = if not FFlagSduiAddMarketplaceEntityDataHydration then nil else getDataHydrationField,
	song = if not FFlagSduiSongHydrationSupport then nil else getDataHydrationField,
	gamePass = if not FFlagSduiExperienceDetailsSupport then nil else getDataHydrationField,
	playability = if not FFlagSduiExperienceDetailsSupport then nil else getDataHydrationField
}

return {
	updateDataStores = function(t6: {[any]: any}) --[[ updateDataStores ]] -- line: 453
		-- upvalues: DataHydration (copy), FFlagLuaAppSduiBadgeDetailsComponents (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiEventDetailsSupport (copy), FFlagSduiMarketplaceCatalogCategorySupport (copy), FFlagSduiMarketplaceCatalogSortSupport (copy), FFlagSduiSongHydrationSupport (copy), FFlagSduiAddMarketplaceEntityDataHydration (copy)
		if t6.badge then
			local badge = t6.badge

			DataHydration.Badges.getBadgeInfoStore(false).updateBadges(badge)
		end

		if FFlagLuaAppSduiBadgeDetailsComponents then
			if t6.creator then
				local creator = t6.creator

				DataHydration.Creator.getCreatorInfoStore(false).updateCreatorInfos(creator)
			end

			if t6.universe then
				local universe = t6.universe

				DataHydration.Game.getGameInfoStore(false).updateGameInfos(universe)
			end
		end

		if FFlagSduiExperienceDetailsSupport then
			if t6.ageRecommendation then
				local ageRecommendation = t6.ageRecommendation

				DataHydration.Game.getAgeRecommendationStore(false).updateAgeRecommendations(ageRecommendation)
			end

			if t6.socialLink then
				local socialLink = t6.socialLink

				DataHydration.SocialLink.getSocialLinkInfoStore(false).updateSocialLinkInfos(socialLink)
			end

			if t6.mediaAsset then
				local mediaAsset = t6.mediaAsset

				DataHydration.MediaAsset.getMediaAssetStore(false).updateMediaAssets(mediaAsset)
			end

			if t6.gamePass then
				local gamePass = t6.gamePass

				DataHydration.Game.getGamePassStore(false).updateGamePassInfos(gamePass)
			end

			if t6.playability then
				local playability = t6.playability

				DataHydration.Game.getPlayabilityStore(false).updatePlayabilities(playability)
			end
		end

		if (FFlagSduiExperienceDetailsSupport or FFlagSduiEventDetailsSupport) and t6.event then
			local event = t6.event

			DataHydration.ExperienceEvents.getExperienceEventInfoStore(false).updateExperienceEventInfos(event)
		end

		if FFlagSduiMarketplaceCatalogCategorySupport and t6.marketplaceCatalogCategory then
			local marketplaceCatalogCategory = t6.marketplaceCatalogCategory

			DataHydration.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false).updateMarketplaceCatalogCategories(marketplaceCatalogCategory)
		end

		if FFlagSduiMarketplaceCatalogSortSupport and t6.catalogSort then
			local catalogSort = t6.catalogSort

			DataHydration.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).updateMarketplaceCatalogSorts(catalogSort)
		end

		if FFlagSduiSongHydrationSupport and t6.song then
			DataHydration.Song.getSongInfoStore(false).updateSongs(t6.song)
		end

		if FFlagSduiAddMarketplaceEntityDataHydration then
			if t6.marketplaceAsset then
				local marketplaceAsset = t6.marketplaceAsset

				DataHydration.MarketplaceAsset.getMarketplaceAssetStore(false).updateMarketplaceAssetInfos(marketplaceAsset)
			end

			if t6.marketplaceBundle then
				local marketplaceBundle = t6.marketplaceBundle

				DataHydration.MarketplaceBundle.getMarketplaceBundleStore(false).updateMarketplaceBundleInfos(marketplaceBundle)
			end

			if t6.marketplaceLook then
				local marketplaceLook = t6.marketplaceLook

				DataHydration.MarketplaceLook.getMarketplaceLookStore(false).updateMarketplaceLookInfos(marketplaceLook)
			end
		end
	end,
	getDataObjectSignal = getDataObjectSignal,
	getFieldValue = function(p11, t7: {[any]: any}, s6: string, p12, b3: boolean?) --[[ getFieldValue ]] -- line: 430
		-- upvalues: t5 (copy)
		if #t7 < 2 then
			return nil, nil
		end

		local v108 = t5[p11]

		if v108 == nil then
			return nil, nil
		end

		return v108(p11, t7, s6, p12, b3)
	end,
	calculateBadgeDerivedField = calculateBadgeDerivedField,
	calculateUniverseDerivedField = calculateUniverseDerivedField,
	isClientContentType = function(p13) --[[ isClientContentType ]] -- line: 256
		-- upvalues: t3 (copy)
		return t3[p13] or false
	end,
	getFieldValueForClientContentType = function(p14, t8: {[any]: any}, p15) --[[ getFieldValueForClientContentType ]] -- line: 260
		-- upvalues: SduiDataBindingContentType (copy), SduiDataBindingResponsiveFieldName (copy), Display (copy), Responsive (copy), FFlagSduiAppPolicyBindings (copy), getSduiPolicyStore (copy), resolveSduiPolicyField (copy), tryGetPathFromData (copy)
		if p14 == SduiDataBindingContentType.responsive then
			if #t8 ~= 2 then
				return nil
			end

			local v72 = t8[2]

			if v72 == SduiDataBindingResponsiveFieldName.screenWidth then
				return Display.GetDisplayStore(p15).getViewportSize(p15).X
			end

			if v72 == SduiDataBindingResponsiveFieldName.screenHeight then
				return Display.GetDisplayStore(p15).getViewportSize(p15).Y
			end

			if v72 == SduiDataBindingResponsiveFieldName.isPortrait then
				local v73 = Display.GetDisplayStore(p15).getViewportSize(p15)

				return v73.X < v73.Y
			end

			if v72 == SduiDataBindingResponsiveFieldName.isSpatial then
				return Display.GetDisplayStore(p15).getIsSpatial(p15)
			end

			if v72 == SduiDataBindingResponsiveFieldName.lastInput then
				return Responsive.GetInputModeStore(p15).getLastInputType(p15)
			end

			if v72 == SduiDataBindingResponsiveFieldName.preferredInput then
				return Responsive.GetInputModeStore(p15).getPreferredInputType(p15)
			end
		end

		if FFlagSduiAppPolicyBindings and p14 == SduiDataBindingContentType.policy then
			if #t8 < 2 then
				return nil
			end

			local v74 = getSduiPolicyStore().getAppPolicy(p15)

			if v74 == nil then
				local v75 = table.concat(t8, ".")

				error(`Failed to find policy table when binding value { v75 }`)
			end

			local v76 = t8[2]
			local v77, v78 = resolveSduiPolicyField(v74, v76)

			if v77 then
				return v78
			end

			local v79 = v74.getRawPolicy()

			if v79 then
				local v80, v81 = tryGetPathFromData(v79, t8, 2)

				if v80 then
					return v81
				end

				local v82 = table.concat(t8, ".")

				error(`Failed to find policy value for '{ v82 }'`)
			else
				local v83 = table.concat(t8, ".")

				error(`Failed to find rawPolicy table when binding value { v83 }`)
			end
		end

		return nil
	end,
	calculateAgeRecommendationDerivedField = function(s7: string, p16, _) --[[ calculateAgeRecommendationDerivedField ]] -- line: 173
		-- upvalues: DataHydration (copy)
		if s7 == "content_rating_image" then
			local v63 = p16 and p16.igrsRating

			return v63 and DataHydration.Game.AgeRecommendationUtils.getIgrsImage(v63)
		end

		return nil
	end
}
