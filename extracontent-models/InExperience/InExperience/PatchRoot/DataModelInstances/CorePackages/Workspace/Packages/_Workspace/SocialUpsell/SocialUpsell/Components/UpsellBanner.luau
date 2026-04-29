local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local SocialUpsellParent = SocialUpsell.Parent
local HttpService = game:GetService("HttpService")
local React = require(SocialUpsellParent.React)
local useEffect = React.useEffect
local AppBlox = require(SocialUpsellParent.AppBlox)
local Foundation = require(SocialUpsellParent.Foundation)
local useCallback = React.useCallback
local Cryo = require(SocialUpsellParent.Cryo)

require(SocialUpsell.Types)

local Constants = require(SocialUpsell.Constants)

require(SocialUpsell.Enum.SocialUpsellType)

local isCompactUpsellBanner = require(SocialUpsell.Utils.isCompactUpsellBanner)
local getUpsellSignalStore = require(SocialUpsell.SignalStores.getUpsellSignalStore)
local SocialUpsellAnalytics = require(SocialUpsell.Analytics.SocialUpsellAnalytics)
local UpsellComponent = require(SocialUpsell.Analytics.Enum.UpsellComponent)
local EventTypes = require(SocialUpsellParent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local FFlagAddUpsellEntryComponentToAnalytics = require(SocialUpsell.Flag.FFlagAddUpsellEntryComponentToAnalytics)
local UPSELL_BUTTON_ACTION = Constants.UPSELL_BUTTON_ACTION
local ButtonVariant = Foundation.Enums.ButtonVariant
local Banner = AppBlox.Banner
local t1 = {
	isContained = true
}

local function getBannerPropsFromConfig(p1, t2: {[any]: any}) -- line: 84
	-- upvalues: isCompactUpsellBanner (copy), UPSELL_BUTTON_ACTION (copy), ButtonVariant (copy), Constants (copy), Foundation (copy)
	local t3 = {}
	local t4 = {}

	if p1.buttons then
		for _, v30 in p1.buttons do
			local t5 = {
				text = v30.text
			}
			local v32 = isCompactUpsellBanner(p1)

			t5.variant = if not v30.action then nil else if v30.action ~= UPSELL_BUTTON_ACTION.Primary then if v30.action ~= UPSELL_BUTTON_ACTION.Secondary then nil else ButtonVariant.Utility else if not v32 then ButtonVariant.Emphasis else ButtonVariant.SoftEmphasis
			t5.onActivated = t2[v30.action]
			table.insert(t4, t5)
		end
	end

	if p1.labelItems then
		for _, v34 in p1.labelItems do
			if v34.type == Constants.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN then
				table.insert(t3, {
					text = v34.text,
					icon = {
						variant = Foundation.Enums.IconVariant.Filled,
						position = Foundation.Enums.IconPosition.Left,
						name = Foundation.Enums.IconName.Clock
					},
					variant = Foundation.Enums.BadgeVariant.Neutral
				})
			end
		end
	end

	return {
		title = p1.title,
		body = p1.body,
		badges = t3,
		buttons = t4,
		onDismiss = if not p1.isDismissable then nil else t2[UPSELL_BUTTON_ACTION.Dismiss],
		image = p1.image,
		icon = if not p1.image then p1.icon else nil
	}
end

return function(t6: {[any]: any}) --[[ UpsellBanner ]] -- line: 125
	-- upvalues: Cryo (copy), t1 (copy), React (copy), HttpService (copy), getUpsellSignalStore (copy), SocialUpsellAnalytics (copy), UpsellComponent (copy), useEffect (copy), EventTypes (copy), FFlagAddUpsellEntryComponentToAnalytics (copy), useCallback (copy), UPSELL_BUTTON_ACTION (copy), getBannerPropsFromConfig (copy), Banner (copy)
	local v36 = Cryo.Dictionary.union(t1, t6)
	local v37 = React.useMemo(function() -- line: 128
		-- upvalues: v36 (copy), HttpService (copy)
		return v36.impressionId or HttpService:GenerateGUID(false)
	end, {
		v36.impressionId,
		v36.config.type
	})
	local v38 = React.useRef(nil)
	local v39 = getUpsellSignalStore()
	local v40 = React.useMemo(function() -- line: 135
		-- upvalues: SocialUpsellAnalytics (copy), v36 (copy), UpsellComponent (copy)
		return SocialUpsellAnalytics.evaluateUpsellStage(v36.upsellEntrySurface, UpsellComponent.Banner, v36.upsellEntryComponent)
	end, {
		v36.upsellEntrySurface,
		v36.upsellEntryComponent
	})

	useEffect(function() -- line: 144
		-- upvalues: v37 (copy), v38 (copy), SocialUpsellAnalytics (copy), EventTypes (copy), v36 (copy), v40 (copy), UpsellComponent (copy), FFlagAddUpsellEntryComponentToAnalytics (copy)
		if v37 and v38.current ~= v37 then
			SocialUpsellAnalytics.logUpsellEvent(EventTypes.SocialUpsellShown, {
				upsellPurpose = v36.config.type,
				upsellEntrySurface = v36.upsellEntrySurface,
				upsellStage = v40,
				upsellImpressionId = v37,
				upsellComponent = UpsellComponent.Banner,
				conversationId = v36.conversationId,
				upsellEntryComponent = if not FFlagAddUpsellEntryComponentToAnalytics then nil else v36.upsellEntryComponent
			})
			v38.current = v37
		end
	end, {
		v36.config.type,
		v36.upsellEntrySurface,
		v40,
		v37,
		if not FFlagAddUpsellEntryComponentToAnalytics then nil else v36.upsellEntryComponent
	})
	useEffect(function() -- line: 170
		-- upvalues: v36 (copy), v39 (copy)
		local type = v36.config.type
		local upsellEntrySurface = v36.upsellEntrySurface

		v39.setUpsellBannerData(type, upsellEntrySurface, v36.config)

		return function() -- line: 175
			-- upvalues: v39 (copy), type (copy), upsellEntrySurface (copy)
			v39.setUpsellBannerData(type, upsellEntrySurface, nil)
		end
	end, {
		v36.upsellEntrySurface,
		v36.config,
		v39
	})

	local v41 = useCallback(function(p2: ((...any) -> ...any), p3) -- line: 182
		-- upvalues: SocialUpsellAnalytics (copy), EventTypes (copy), v36 (copy), v40 (copy), v37 (copy), UpsellComponent (copy), FFlagAddUpsellEntryComponentToAnalytics (copy)
		return function() -- line: 183
			-- upvalues: SocialUpsellAnalytics (copy), EventTypes (copy), v36 (copy), v40 (copy), v37 (copy), UpsellComponent (copy), p3 (copy), FFlagAddUpsellEntryComponentToAnalytics (copy), p2 (copy)
			SocialUpsellAnalytics.logUpsellEvent(EventTypes.SocialUpsellButtonClick, {
				upsellPurpose = v36.config.type,
				upsellEntrySurface = v36.upsellEntrySurface,
				upsellStage = v40,
				upsellImpressionId = v37,
				upsellComponent = UpsellComponent.Banner,
				btn = p3,
				conversationId = v36.conversationId,
				upsellEntryComponent = if not FFlagAddUpsellEntryComponentToAnalytics then nil else v36.upsellEntryComponent
			})
			p2(v37)
		end
	end, {
		v36.upsellEntrySurface,
		v36.config.type,
		v40,
		v37,
		if not FFlagAddUpsellEntryComponentToAnalytics then nil else v36.upsellEntryComponent
	})
	local v42 = useCallback(v41(v36.onPrimaryAction, UPSELL_BUTTON_ACTION.Primary), {
		v41,
		v36.onPrimaryAction
	})
	local v43 = useCallback(v41(v36.onSecondaryAction, UPSELL_BUTTON_ACTION.Secondary), {
		v41,
		v36.onSecondaryAction
	})
	local v44 = useCallback(v41(v36.onDismiss, "Dismiss"), {
		v41,
		v36.onDismiss
	})
	local v45 = React.useMemo(function() -- line: 225
		-- upvalues: getBannerPropsFromConfig (copy), v36 (copy), UPSELL_BUTTON_ACTION (copy), v42 (copy), v43 (copy), v44 (copy)
		return (getBannerPropsFromConfig(v36.config, {
			[UPSELL_BUTTON_ACTION.Primary] = v42,
			[UPSELL_BUTTON_ACTION.Secondary] = v43,
			[UPSELL_BUTTON_ACTION.Dismiss] = v44
		}))
	end, {
		v36.config,
		v42,
		v43,
		v44
	})

	return React.createElement(Banner, Cryo.Dictionary.join(v45, {
		isContained = v36.isContained
	}))
end
