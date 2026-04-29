local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local DiscoveryTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local OmniFeedTypes = DiscoveryTypes.OmniFeedTypes
local OmniFeedConstants = DiscoveryTypes.OmniFeedConstants

require(CorePackages.Workspace.Packages.AppCommonLib)
require(CorePackages.Workspace.Packages.ServerDrivenUi)

local Cryo = require(CorePackages.Packages.Cryo)
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local useStyle = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local RobloxAppEnums = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local AppPage = RobloxAppEnums.AppPage
local UiMode = RobloxAppEnums.UiMode
local useUiModeInfo = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo

require(CorePackages.Workspace.Packages.VideoUtils)

local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OmniFeedItem = require(Modules.Personalization.OmniFeed.OmniFeedItem)
local FFlagUpdateDividerStartBounds = require(Modules.Personalization.Flags.FFlagUpdateDividerStartBounds)
local Modules2 = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local FeedItemModel = Modules2.Personalization.OmniFeed.DataStore.FeedItemModel
local OmniFeedProps = Modules2.Personalization.OmniFeed.OmniFeedProps
local CompositionTags = require(CorePackages.Workspace.Packages.AppComposition).CompositionTags
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaAppCompositionSupport = SharedFlags.FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = SharedFlags.FFlagLuaAppCompositionAlways
local FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding = SharedFlags.FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding
local FFlagLuaAppUseSortsWithDividersFString = SharedFlags.FFlagLuaAppUseSortsWithDividersFString
local isSubjectToDesktopPolicies = SharedFlags.isSubjectToDesktopPolicies
local FStringLuaAppSortsWithDividers = SharedFlags.FStringLuaAppSortsWithDividers
local FFlagUseOmniFeedDividerOverrides = SharedFlags.FFlagUseOmniFeedDividerOverrides
local FIntOmniFeedDividerHeightOverride = SharedFlags.FIntOmniFeedDividerHeightOverride
local FIntOmniFeedDividerPaddingOverride = SharedFlags.FIntOmniFeedDividerPaddingOverride
local FFlagLuaAppEnableRelativeGuiHomeForAll = SharedFlags.FFlagLuaAppEnableRelativeGuiHomeForAll
local FFlagLuaAppEnableRelativeGuiHomeWithIxp = SharedFlags.FFlagLuaAppEnableRelativeGuiHomeWithIxp
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = SharedFlags.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = SharedFlags.FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppGameCarouselAmpUpsellAction = SharedFlags.FFlagLuaAppGameCarouselAmpUpsellAction
local t1 = {}

if FFlagLuaAppUseSortsWithDividersFString then
	for match in FStringLuaAppSortsWithDividers:gmatch("(%w+)") do
		t1[match] = true
	end
end

local SORT_INDEX_SELECTION_ORDER_MULTIPLIER = DiscoveryTypes.Constants.SORT_INDEX_SELECTION_ORDER_MULTIPLIER
local SORT_SELECTION_ORDER_BASE = DiscoveryTypes.Constants.SORT_SELECTION_ORDER_BASE

local function shouldAddDividerOrExtraPadding(n1: number, n2: number, n3: number, p1, t2: {[any]: any}, s1: string, b1: boolean) -- line: 95
	-- upvalues: FFlagUpdateDividerStartBounds (copy), FFlagLuaAppUseSortsWithDividersFString (copy), t1 (copy), OmniFeedTypes (copy), isSubjectToDesktopPolicies (copy), OmniFeedConstants (copy), AppPage (copy)
	local v51 = false
	local v52 = false

	if n3 > ((if not FFlagUpdateDividerStartBounds then not b1 and 1 or 0 else 0)) + n1 - 1 and n3 < n2 then
		local v53 = t2[n3 - 1]
		local v54 = t2[n3]
		local v55 = t2[n3 + 1]

		if v53 and v53.pageSection ~= v54.pageSection then
			v53 = nil
		end

		if v55 and v55.pageSection ~= v54.pageSection then
			v55 = nil
		end

		if FFlagLuaAppUseSortsWithDividersFString and (v54.itemId and v54.itemId.topicId and t1[v54.itemId.topicId] or v55 and v55.itemId and v55.itemId.topicId and t1[v55.itemId.topicId]) then
			v52 = true
		end

		if p1.treatmentType == OmniFeedTypes.HomeGameGrid and v55 and v55.treatmentType ~= OmniFeedTypes.HomeGameGrid or p1.treatmentType ~= OmniFeedTypes.HomeGameGrid and v53 and v53.treatmentType == OmniFeedTypes.HomeGameGrid and v55 and v55.treatmentType == OmniFeedTypes.HomeGameGrid then
			v52 = true
		elseif b1 then
			v51 = true
		elseif isSubjectToDesktopPolicies() then
			v51 = false

			if p1.treatmentType == OmniFeedTypes.Carousel then
				v51 = false

				if v55 ~= nil then
					v51 = false

					if v55.treatmentType == OmniFeedTypes.HomeGameGrid then
						local v56 = p1.treatmentProps.topicLayoutData and p1.treatmentProps.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]

						v51 = v56 == OmniFeedConstants.ComponentTypeDataKeys.GridTile or v56 == OmniFeedConstants.ComponentTypeDataKeys.EventTile

						if v51 then
							local v57 = v55.treatmentProps.topicLayoutData and v55.treatmentProps.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]

							v51 = v57 == OmniFeedConstants.ComponentTypeDataKeys.GridTile or v57 == OmniFeedConstants.ComponentTypeDataKeys.EventTile
						end
					end
				end
			end
		end
	end

	if s1 == AppPage.SearchPage and n3 < n2 then
		v52 = true
	end

	return v52, v51
end

return React.memo(function(t3: {[any]: any}) -- line: 180
	-- upvalues: useDesignTokens (copy), useStyle (copy), useUiModeInfo (copy), UiMode (copy), React (copy), FFlagUseOmniFeedDividerOverrides (copy), FIntOmniFeedDividerPaddingOverride (copy), FIntOmniFeedDividerHeightOverride (copy), FeedItemModel (copy), SORT_SELECTION_ORDER_BASE (copy), SORT_INDEX_SELECTION_ORDER_MULTIPLIER (copy), OmniFeedProps (copy), FFlagLuaAppCompositionSupport (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), Cryo (copy), OmniFeedTypes (copy), OmniFeedItem (copy), FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding (copy), shouldAddDividerOrExtraPadding (copy), FFlagLuaAppEnableRelativeGuiHomeForAll (copy), FFlagLuaAppEnableRelativeGuiHomeWithIxp (copy), FFlagLuaAppCompositionAlways (copy), CompositionTags (copy)
	local v59 = useDesignTokens()
	local BackgroundContrastColor = useStyle().Theme.BackgroundContrast.Color
	local v61 = useUiModeInfo().uiMode == UiMode.TenFoot
	local t4 = {
		Layout = React.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	local n4 = 1
	local v64 = t3.layoutPadding or 0
	local v65 = v64 / 2

	if FFlagUseOmniFeedDividerOverrides then
		if FIntOmniFeedDividerPaddingOverride >= 0 then
			v64 = FIntOmniFeedDividerPaddingOverride * v59.Global.Stroke_100
		end

		if FIntOmniFeedDividerHeightOverride >= 0 then
			v65 = FIntOmniFeedDividerHeightOverride * v59.Global.Stroke_100
		end
	end

	local omniFeedItems = t3.omniFeedItems
	local v67 = nil
	local v68 = nil

	for i = 1, #omniFeedItems do
		if omniFeedItems[i].pageSection == t3.omniFeedPageSection then
			if not v67 then
				v67 = i
			end

			v68 = i
		end
	end

	local v70 = v67 or 1
	local v71 = v68 or #omniFeedItems
	local v72 = t3.numberOfItemsToBeRendered or v71 - v70 + 1
	local n5 = 1
	local pageContext = t3.pageContext
	local v75 = t3.topMargin or 0
	local v76 = t3.bottomMargin or 0
	local v77 = true

	for v78, v79 in omniFeedItems do
		if v72 < v78 - v70 + 1 then
			break
		end

		local v80 = v79.treatmentProps or {}
		local v81 = FeedItemModel.getUniqueNameForAnalytics(v79)
		local v82 = SORT_SELECTION_ORDER_BASE + v78 * SORT_INDEX_SELECTION_ORDER_MULTIPLIER
		local v83 = OmniFeedProps.new(v78, n5, t3.onItemsUpdatedSignalRef and t3.onItemsUpdatedSignalRef.current, t3.refreshSignalRef and t3.refreshSignalRef.current, pageContext, t3.scrollingFrameRef, t3.sduiContext, v82, t3.defaultContainerSize, if not FFlagLuaAppCompositionSupport then nil else t3.appCompositionEnabled, if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t3.onTileImageLoaded, if not FFlagLuaAppHomeTouchAutoplay then nil else t3.videoPlaybackContext, if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else t3.refreshFeed)
		local v84 = Cryo.Dictionary.join({
			[OmniFeedProps.key] = v83
		}, v80)

		if n5 then
			local v85 = FeedItemModel.getNumberOfRows(v79)

			n5 = if v85 then n5 + v85 else nil
		end

		if t3.omniFeedPageSection == v79.pageSection then
			local v86 = not v77
			local v87 = v86 and v79.treatmentType == OmniFeedTypes.UpsellCard
			local v88 = if not v79.itemId then nil else v79.itemId.sortIndex
			local v89 = if not v88 or not t3.sortsData then nil else t3.sortsData[v88]

			if v89 and (not v89.topic or v89.topic == "") then
				v86 = false
			end

			if v86 then
				t4["feedPaddingTop_" .. tostring(v78)] = React.createElement("Frame", {
					Size = if not v87 then UDim2.new(1, 0, 0, v64) else UDim2.new(1, 0, 0, v59.Global.Space_150),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = n4
				})
				n4 += 1
			end

			t4["feedItem_" .. tostring(v78)] = React.createElement(OmniFeedItem, {
				omniFeedItemType = v79.treatmentType,
				layoutOrder = n4,
				feedItemNameId = v81,
				itemProps = v84,
				itemIndex = v78,
				impressionsTag = t3.impressionsTag,
				zIndex = v72 - v78
			})
			n4 += 1

			if not FFlagLuaAppRemoveOmniFeedDividersAndExtraPadding then
				local v90, v91 = shouldAddDividerOrExtraPadding(v70, v71, v78, v79, omniFeedItems, pageContext, v61)

				if v90 or v91 then
					t4["feedPaddingBottom_" .. tostring(v78)] = React.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, v64),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = n4
					})
					n4 += 1
				end

				if v90 then
					t4["feedDivider_" .. tostring(v78)] = React.createElement("Frame", {
						Size = UDim2.new(1, 0, 0, v65),
						BackgroundTransparency = 0,
						BackgroundColor3 = BackgroundContrastColor,
						BorderSizePixel = 0,
						LayoutOrder = n4
					})
					n4 += 1
				end
			end

			if v72 == v78 - v70 + 1 and t3.hasNextPage then
				t4["loadingBlank_" .. tostring(v78)] = React.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 10),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = n4
				})
				n4 += 1
			end

			if v77 then
				v77 = false
			end
		end
	end

	t4.Padding = React.createElement(React.Fragment, nil, {
		PaddingTop = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, v75),
			BackgroundTransparency = 1,
			LayoutOrder = 0
		}),
		PaddingBottom = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, v76),
			BackgroundTransparency = 1,
			LayoutOrder = n4
		})
	})

	local v92 = not FFlagLuaAppEnableRelativeGuiHomeForAll and not FFlagLuaAppEnableRelativeGuiHomeWithIxp and "Frame" or (not t3.enableRelativeGui and "Frame" or "RelativeGui")

	return React.createElement(v92, {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[React.Tag] = if not FFlagLuaAppCompositionAlways and (not FFlagLuaAppCompositionSupport or not t3.appCompositionEnabled) then nil else t3.contentTag or CompositionTags.ContentRegion.Body
	}, t4)
end)
