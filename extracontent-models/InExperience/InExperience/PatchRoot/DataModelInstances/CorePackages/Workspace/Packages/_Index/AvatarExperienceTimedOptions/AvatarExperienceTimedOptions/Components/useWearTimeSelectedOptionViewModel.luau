local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local AvatarExperienceFlags = require(Parent.AvatarExperienceFlags)
local React = require(Parent.React)
local Foundation = require(Parent.Foundation)
local Localization = require(Parent.Localization)
local Localization2 = require(Parent.RobloxAppLocales).Localization
local useLocalization = Localization.Hooks.useLocalization
local useTokens = Foundation.Hooks.useTokens

require(Parent.AvatarExperienceCommon)

local CombinedFFlagShouldUseLegacyGamepadFocus = AvatarExperienceFlags.CombinedFFlagShouldUseLegacyGamepadFocus
local FFlagAXDurablesForMIS = AvatarExperienceFlags.FFlagAXDurablesForMIS
local FFlagAXBlackbirdRoot = AvatarExperienceFlags.FFlagAXBlackbirdRoot

return function(t1: {[any]: any}) --[[ useWearTimeSelectedOptionViewModel ]] -- line: 65
	-- upvalues: useTokens (copy), React (copy), Localization2 (copy), LocalizationService (copy), FFlagAXDurablesForMIS (copy), useLocalization (copy), CombinedFFlagShouldUseLegacyGamepadFocus (copy), FFlagAXBlackbirdRoot (copy)
	local v17 = useTokens()
	local v18 = React.useMemo(function() -- line: 68
		-- upvalues: Localization2 (copy), LocalizationService (copy)
		return Localization2.new(LocalizationService.RobloxLocaleId)
	end, {})
	local v19, v20 = React.useState(nil)

	React.useEffect(function() -- line: 75
		-- upvalues: FFlagAXDurablesForMIS (copy), t1 (copy), v20 (copy)
		if FFlagAXDurablesForMIS and t1.selectedTimedOptionIndexInReducer ~= nil then
			v20(t1.selectedTimedOptionIndexInReducer)

			return
		end

		for v35, v36 in t1.options do
			if v36.selected then
				v20(v35)

				return
			end
		end
	end, {
		t1.options,
		if not FFlagAXDurablesForMIS then nil else t1.selectedTimedOptionIndexInReducer
	})

	local v21 = if not v19 then nil else t1.options[v19]
	local v22 = not v21 and 0 or v21.days
	local v23 = useLocalization({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = {
			"Feature.Durables.BottomBar.RentalDuration",
			num = v22
		},
		xDays = {
			"Feature.Durables.BottomBar.RentalDurationPlural",
			num = v22
		},
		xDayList = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = v22
		},
		xDaysList = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = v22
		}
	})
	local v24, v25 = React.useState(false)
	local v26 = React.useRef(nil)
	local g30 = nil
	local price = nil

	if CombinedFFlagShouldUseLegacyGamepadFocus and t1.triggerRef then
		v26 = t1.triggerRef
	end

	if v21 then
		price = v21.price
	else
		for _, v29 in t1.options do
			if v29.days == 0 then
				price = v29.price
				g30 = true
			end

			if g30 then
				break
			end
		end

		if not g30 then
			price = 0
		end
	end

	g30 = false

	local infinite, infinite2

	if v22 == 0 then
		infinite = v23.infinite
		infinite2 = v23.infinite
	elseif v22 == 1 then
		infinite = v23.xDay
		infinite2 = v23.xDayList
	else
		infinite = v23.xDays
		infinite2 = v23.xDaysList
	end

	local v33 = React.useCallback(function(n1: number) -- line: 119
		-- upvalues: v20 (copy), t1 (copy), v25 (copy)
		v20(n1)

		if t1.onOptionActivated then
			t1.onOptionActivated(n1)
		end

		v25(false)
	end, { t1.onOptionActivated })
	local v34 = React.useMemo(function() -- line: 127
		-- upvalues: t1 (copy), v19 (copy), FFlagAXBlackbirdRoot (copy)
		local t2 = {}

		for v39, v40 in t1.options do
			t2[v39] = {
				days = v40.days,
				price = v40.price,
				selected = v39 == v19,
				discountInformation = if not FFlagAXBlackbirdRoot then nil else v40.discountInformation
			}
		end

		return t2
	end, {
		t1.options,
		v19
	})

	return {
		tokens = v17,
		localization = v18,
		selectedIndex = v19,
		setSelectedIndex = v20,
		selectedOption = v21,
		days = v22,
		localizedText = v23,
		isOpen = v24,
		setIsOpen = v25,
		anchorRef = v26,
		price = price,
		subLabelText = infinite,
		listLabelText = infinite2,
		handleOptionActivated = v33,
		updatedOptions = v34,
		disableOptionSelection = t1.disableOptionSelection
	}
end
