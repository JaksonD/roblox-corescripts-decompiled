local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local AXPrefetchMarketplaceIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useMarketplaceResultsFetcher = require(script.Parent.useMarketplaceResultsFetcher)
local useMarketplaceResultsFetcherSdui = require(script.Parent.useMarketplaceResultsFetcherSdui)
local useResultsAreSduiEnabled = require(script.Parent.useResultsAreSduiEnabled)
local useIsHomepageReady = require(script.Parent.useIsHomepageReady)
local useGetSelectedCategoryAndSubcategoryId = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local v12 = game:DefineFastFlag("AXDebugForceIsRecentMarketplaceEnabled", false)

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local Constants = require(Modules.AvatarExperience.Common.Constants)
local sendAXCounterV2 = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXStrictCheckForPrefetchMarketplace = AvatarExperienceFlags.FFlagAXStrictCheckForPrefetchMarketplace
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlags.FFlagAXMigrateAllTabToSduiDev
local FFlagsAXPrefetchMarketplaceThumbnailsXP = AvatarExperienceFlags.FFlagsAXPrefetchMarketplaceThumbnailsXP
local v19 = FFlagAXStrictCheckForPrefetchMarketplace and FFlagsAXPrefetchMarketplaceThumbnailsXP.UserIsInExperiment
local usePrefetchMarketplaceThumbnails = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.usePrefetchMarketplaceThumbnails)
local v21 = game:DefineFastFlag("AXAppLaunchedCounterEnabled", false)
local FFlagAXFixPrefetchMarketplaceStartupCrash = AvatarExperienceFlags.FFlagAXFixPrefetchMarketplaceStartupCrash

local function selectIsRecentMarketplaceUser(p1) -- line: 71
	-- upvalues: v12 (copy), FFlagAXFixPrefetchMarketplaceStartupCrash (copy)
	if v12 then
		return true
	end

	if FFlagAXFixPrefetchMarketplaceStartupCrash and (not p1.AvatarExperience or not p1.AvatarExperience.Catalog or not p1.AvatarExperience.Catalog.Metadata) then
		return false
	end

	return p1.AvatarExperience.Catalog.Metadata.isRecentMarketplaceUser
end

return function() --[[ usePrefetchMarketplace ]] -- line: 103
	-- upvalues: AXPrefetchMarketplaceIXP (copy), IxpUtils (copy), useIsHomepageReady (copy), useSelector (copy), selectIsRecentMarketplaceUser (copy), useMarketplaceResultsFetcher (copy), FFlagAXMigrateAllTabToSduiDev (copy), useGetSelectedCategoryAndSubcategoryId (copy), useMarketplaceResultsFetcherSdui (copy), Constants (copy), useResultsAreSduiEnabled (copy), FFlagAXStrictCheckForPrefetchMarketplace (copy), React (copy), v19 (copy), usePrefetchMarketplaceThumbnails (copy), v21 (copy), sendAXCounterV2 (copy)
	local v25 = if not AXPrefetchMarketplaceIXP.isEnabled() then nil else IxpUtils.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser)
	local v26 = useIsHomepageReady()
	local v27 = useSelector(selectIsRecentMarketplaceUser)
	local v28 = useMarketplaceResultsFetcher()
	local hasFetched = v28.hasFetched
	local isFetching = v28.isFetching
	local fetchMarketplace = v28.fetchMarketplace

	if FFlagAXMigrateAllTabToSduiDev then
		local v32, _ = useGetSelectedCategoryAndSubcategoryId()
		local v34 = useMarketplaceResultsFetcherSdui({
			categoryId = v32 or Constants.DefaultCatalogCategoryId
		})

		if useResultsAreSduiEnabled() then
			hasFetched = v34.hasFetched
			isFetching = v34.isFetching
			fetchMarketplace = v34.fetchMarketplace
		end
	end

	local v35 = if not FFlagAXStrictCheckForPrefetchMarketplace then nil else React.useRef(false)
	local u36 = nil
	local u37 = nil

	if v19 then
		u37 = React.useRef(false)
		u36 = usePrefetchMarketplaceThumbnails()
	end

	if v21 then
		React.useEffect(function() -- line: 153
			-- upvalues: sendAXCounterV2 (copy), Constants (copy)
			sendAXCounterV2(Constants.Counter.PrefetchMarketplace.appLaunched)
		end, {})
	end

	React.useEffect(function() -- line: 170
		-- upvalues: FFlagAXStrictCheckForPrefetchMarketplace (copy), v35 (copy), v25 (copy), v27 (copy), hasFetched (ref), isFetching (ref), v26 (copy), sendAXCounterV2 (copy), Constants (copy), fetchMarketplace (ref)
		if FFlagAXStrictCheckForPrefetchMarketplace and (v35 and v35.current) then
			return
		end

		if not v25 then
			return
		end

		if not v27 then
			return
		end

		if hasFetched or isFetching then
			return
		end

		if not v26 then
			return
		end

		sendAXCounterV2(Constants.Counter.PrefetchMarketplace.isRecentMarketplaceUser)
		fetchMarketplace()

		if FFlagAXStrictCheckForPrefetchMarketplace and v35 then
			v35.current = true
		end
	end, {
		hasFetched,
		isFetching,
		v26,
		v25,
		v27,
		if not FFlagAXMigrateAllTabToSduiDev then nil else fetchMarketplace
	})

	if v19 then
		React.useEffect(function() -- line: 231
			-- upvalues: u37 (ref), v35 (copy), hasFetched (ref), u36 (ref)
			if u37.current then
				return
			end

			if v35 and not v35.current then
				return
			end

			if not hasFetched then
				return
			end

			if u36 then
				u36()
				u37.current = true
			end
		end, {
			u36,
			hasFetched
		})
	end
end
