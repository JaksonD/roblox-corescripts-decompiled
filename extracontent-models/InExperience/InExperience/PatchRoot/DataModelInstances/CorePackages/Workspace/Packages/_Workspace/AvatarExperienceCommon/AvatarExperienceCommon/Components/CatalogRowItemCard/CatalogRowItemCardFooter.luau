local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local AvatarExperienceCommonParent = AvatarExperienceCommon.Parent
local React = require(AvatarExperienceCommonParent.React)
local Foundation = require(AvatarExperienceCommonParent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local FoundationText = Foundation.Text
local VerifiedBadges = require(AvatarExperienceCommonParent.VerifiedBadges)
local AvatarExperienceUIKit = require(AvatarExperienceCommonParent.AvatarExperienceUIKit)
local ItemCardPriceLine = AvatarExperienceUIKit.ItemCardComponents.ItemCardPriceLine
local ItemCardTitle = AvatarExperienceUIKit.ItemCardComponents.ItemCardTitle
local Cryo = require(AvatarExperienceCommonParent.Cryo)

require(AvatarExperienceCommon.Types.TimedOptionType)

local AvatarExperienceFlags = require(AvatarExperienceCommonParent.AvatarExperienceFlags)
local FFlagAXEnableTimedOptionsForCatalogRowCard = AvatarExperienceFlags.FFlagAXEnableTimedOptionsForCatalogRowCard
local FFlagAXDurablesForMIS = AvatarExperienceFlags.FFlagAXDurablesForMIS
local Icon = Foundation.Icon
local IconSize = Foundation.Enums.IconSize

return function(t1: {[any]: any}) --[[ CatalogRowItemCardFooter ]] -- line: 55
	-- upvalues: useTokens (copy), FFlagAXDurablesForMIS (copy), FFlagAXEnableTimedOptionsForCatalogRowCard (copy), React (copy), Cryo (copy), IconSize (copy), Foundation (copy), ItemCardPriceLine (copy), ItemCardTitle (copy), FoundationText (copy), Icon (copy), VerifiedBadges (copy)
	local v18 = useTokens()
	local selectedTimedOptionPrice = nil
	local setSelectedTimedOptionPrice = nil

	if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then
		selectedTimedOptionPrice = t1.selectedTimedOptionPrice
		setSelectedTimedOptionPrice = t1.setSelectedTimedOptionPrice
	end

	local v21 = React.useMemo(function() -- line: 66
		-- upvalues: t1 (copy), Cryo (copy), FFlagAXDurablesForMIS (copy), FFlagAXEnableTimedOptionsForCatalogRowCard (copy), selectedTimedOptionPrice (ref), v18 (copy), IconSize (copy), React (copy), Foundation (copy), ItemCardPriceLine (copy)
		local t2 = {}

		if t1.priceLineContent and #t1.priceLineContent > 0 then
			for v24, v25 in t1.priceLineContent do
				local v26 = Cryo.Dictionary.omit(v25, { "strikethrough" })

				if (FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard) and selectedTimedOptionPrice and v25.type == "price" then
					if v25.isOriginalPrice and t1.timedOptions then
						local v27 = selectedTimedOptionPrice

						for _, v29 in t1.timedOptions do
							if v29.price == selectedTimedOptionPrice and v29.discountInformation then
								v27 = v29.discountInformation.originalPrice

								break
							end
						end

						v26 = Cryo.Dictionary.join(v26, {
							price = v27
						})

						if v27 == selectedTimedOptionPrice then
							continue
						end
					else
						v26 = Cryo.Dictionary.join(v26, {
							price = selectedTimedOptionPrice
						})
					end
				end

				if (FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard) and v25.strikethrough then
					v26 = Cryo.Dictionary.join(v26, {
						colorStyle = v18.Color.Content.Muted,
						iconSize = IconSize.XSmall,
						fontStyle = v18.Typography.BodySmall
					})
				end

				t2[`PriceLine{ v24 }`] = React.createElement(Foundation.View, {
					tag = "auto-xy",
					LayoutOrder = v24
				}, {
					ItemCardPriceLine = React.createElement(ItemCardPriceLine, {
						content = v26
					}),
					Strikethrough = if not v25.strikethrough then nil else React.createElement(Foundation.View, {
						tag = "bg-system-neutral anchor-center-center position-center-center size-full-50"
					})
				})
			end
		end

		return t2
	end, {
		t1.priceLineContent,
		if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else selectedTimedOptionPrice,
		if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else t1.timedOptions,
		if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else v18
	})
	local v22 = nil

	if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then
		v22 = t1.priceLineContent and #t1.priceLineContent > 0 or t1.timedOptions
	end

	return React.createElement(Foundation.View, {
		Size = t1.Size,
		AutomaticSize = t1.AutomaticSize,
		LayoutOrder = t1.LayoutOrder,
		tag = "fill self-stretch"
	}, {
		TopSection = React.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		}, {
			TopLayout = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, v18.Gap.XSmall)
			}),
			ItemCardFooterTitle = React.createElement(ItemCardTitle, {
				title = t1.title or "",
				LayoutOrder = 1
			}),
			ItemCardFooterInfo = if not t1.itemSubType and not t1.creatorName then nil else React.createElement("Frame", {
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2
			}, {
				ItemCardFooterInfoLayout = React.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, v18.Gap.XXSmall)
				}),
				ItemSubType = if not t1.itemSubType then nil else React.createElement(FoundationText, {
					textStyle = v18.Color.Content.Default,
					fontStyle = v18.Typography.BodyMedium,
					LayoutOrder = 1,
					Text = t1.itemSubType,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}),
				Spacer = if not t1.itemSubType then nil else React.createElement(Icon, {
					name = "icons/controls/keys/period",
					size = IconSize.Small,
					LayoutOrder = 2
				}),
				CreatorName = if not t1.creatorName then nil else React.createElement(FoundationText, {
					tag = "fill self-stretch",
					textStyle = v18.Color.Content.Default,
					fontStyle = v18.Typography.BodyMedium,
					LayoutOrder = 3,
					Text = if not t1.creatorHasVerifiedBadge then t1.creatorName else `{ t1.creatorName }{ VerifiedBadges.emoji.verified }`,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				})
			}),
			BundleParts = if not t1.bundlePartsText then nil else React.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundColor3 = v18.Color.Surface.Surface_100.Color3,
				BackgroundTransparency = v18.Color.Surface.Surface_100.Transparency,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UICorner = React.createElement("UICorner", {
					CornerRadius = UDim.new(0, v18.Radius.Small)
				}),
				UIPadding = React.createElement("UIPadding", {
					PaddingTop = UDim.new(0, v18.Padding.XSmall),
					PaddingLeft = UDim.new(0, v18.Padding.XSmall),
					PaddingRight = UDim.new(0, v18.Padding.XSmall),
					PaddingBottom = UDim.new(0, v18.Padding.XSmall)
				}),
				Text = React.createElement(FoundationText, {
					textStyle = v18.Color.Content.Default,
					fontStyle = v18.Typography.BodySmall,
					Text = t1.bundlePartsText,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				})
			})
		}),
		BottomPrice = if FFlagAXDurablesForMIS or (FFlagAXEnableTimedOptionsForCatalogRowCard or (not t1.priceLineContent or not (#t1.priceLineContent > 0))) then nil else React.createElement(Foundation.View, {
			tag = "auto-xy row gap-xsmall position-bottom-left anchor-bottom-left"
		}, v21),
		BottomContent = if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard or not v22 then nil else React.createElement(Foundation.View, {
			tag = "auto-xy row gap-xsmall align-y-center position-bottom-left anchor-bottom-left"
		}, Cryo.Dictionary.join(v21, {
			WearTimeOptions = if not t1.timedOptions or not not t1.isOwned and not t1.expirationTime then nil else React.createElement(Foundation.View, {
				tag = "auto-xy padding-left-small",
				LayoutOrder = 100
			}, {
				WearTimeSelectedOptionInList = if not t1.wearTimeSelectedOptionInList then nil else React.createElement(t1.wearTimeSelectedOptionInList, {
					options = t1.timedOptions,
					selectedTimedOptionIndexInReducer = if not FFlagAXDurablesForMIS then nil else t1.selectedTimedOptionIndexInReducer,
					onOptionActivated = function(p1) --[[ onOptionActivated ]] -- line: 267
						-- upvalues: t1 (copy), setSelectedTimedOptionPrice (ref)
						local v31 = t1.timedOptions[p1]

						if v31 then
							if setSelectedTimedOptionPrice then
								setSelectedTimedOptionPrice(v31.price)
							end

							if t1.onTimedOptionPriceChanged then
								local v32 = if v31.days ~= 0 then v31.days else nil

								t1.onTimedOptionPriceChanged(v31.price, v32)
							end
						end
					end
				})
			})
		}))
	})
end
