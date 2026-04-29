local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local BuilderIcons = require(FoundationParent.BuilderIcons)
local React = require(FoundationParent.React)
local Icon = BuilderIcons.Icon
local Calendar = require(script.Parent.Calendar)
local DateTimeUtilities = require(script.Parent.DateTimeUtilities)
local Button = require(Foundation.Components.Button)
local ButtonVariant = require(Foundation.Enums.ButtonVariant)
local Flags = require(Foundation.Utility.Flags)
local GuiService = require(Foundation.Utility.Wrappers.Services).GuiService
local InputSize = require(Foundation.Enums.InputSize)
local Popover = require(Foundation.Components.Popover)
local PopoverSide = require(Foundation.Enums.PopoverSide)
local TextInput = require(Foundation.Components.TextInput)
local Translator = require(Foundation.Utility.Localization.Translator)

require(Foundation.Components.Types)

local View = require(Foundation.Components.View)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local FoundationDateTimePickerDefaultDateFix = Flags.FoundationDateTimePickerDefaultDateFix
local DateTimePickerVariant = require(Foundation.Enums.DateTimePickerVariant)
local t1 = {
	defaultDates = if not FoundationDateTimePickerDefaultDateFix then { DateTime.now() } else nil,
	variant = DateTimePickerVariant.Single,
	testId = "--foundation-date-time-picker"
}

return React.memo(function(p1) --[[ DateTimePicker ]] -- line: 72
	-- upvalues: withDefaults (copy), t1 (copy), useTokens (copy), React (copy), FoundationDateTimePickerDefaultDateFix (copy), DateTimePickerVariant (copy), DateTimeUtilities (copy), GuiService (copy), Popover (copy), TextInput (copy), withCommonProps (copy), Icon (copy), Translator (copy), InputSize (copy), PopoverSide (copy), View (copy), Calendar (copy), Button (copy), ButtonVariant (copy)
	local v25 = withDefaults(p1, t1)
	local v26 = useTokens()
	local v27, v28 = React.useState(false)
	local v29 = React.useRef(nil)
	local v30

	if FoundationDateTimePickerDefaultDateFix then
		v30 = React.useMemo(function() -- line: 81
			-- upvalues: v25 (copy)
			local defaultDates = v25.defaultDates

			if defaultDates then
				if typeof(defaultDates) ~= "table" then
					return { defaultDates }
				end

				return defaultDates
			end

			return nil
		end, { v25.defaultDates })
	else
		v30 = v25.defaultDates

		if v25.defaultDates and typeof(v25.defaultDates) ~= "table" then
			v30 = { v25.defaultDates }
		end
	end

	local v31, v32 = React.useState(not v30 and "" or if v25.variant ~= DateTimePickerVariant.Dual then DateTimeUtilities.formatLocalTime(v30[1], v25.variant == DateTimePickerVariant.SingleWithTime) else `{ DateTimeUtilities.formatLocalTime(v30[1]) } - { not v30[2] and "" or DateTimeUtilities.formatLocalTime(v30[2]) }`)
	local v33, v34 = React.useState(v30)
	local v35 = React.useCallback(function() -- line: 116
		-- upvalues: v28 (copy)
		v28(false)
	end, {})
	local v36 = React.useCallback(function() -- line: 120
		-- upvalues: v28 (copy)
		v28(true)
	end, {})
	local v37 = React.useCallback(function() -- line: 124
		-- upvalues: GuiService (copy), v36 (copy)
		if GuiService.ViewportDisplaySize ~= Enum.DisplaySize.Small then
			v36()
		end
	end, {
		v36,
		GuiService.ViewportDisplaySize
	})
	local v38 = React.useCallback(function(s1: string) -- line: 131
		-- upvalues: v32 (copy), v25 (copy), DateTimePickerVariant (copy), DateTimeUtilities (copy)
		v32(s1)

		if s1:match("^%s*$") then
			return
		end

		if v25.variant == DateTimePickerVariant.Dual then
			local parts = s1:split("-")
			local v43 = DateTimeUtilities.getDateTimeFromText(parts[1])
			local v44 = DateTimeUtilities.getDateTimeFromText(parts[2])

			v25.onChanged(v43, v44)

			return
		end

		local v45 = s1:match("^%s*(.-)%s*$") or ""
		local v46 = DateTimeUtilities.getDateTimeFromText(v45)

		v25.onChanged(v46)
	end, { v25.onChanged })
	local v39 = React.useCallback(function() -- line: 155
		-- upvalues: v25 (copy), DateTimePickerVariant (copy), DateTimeUtilities (copy), v33 (copy), v32 (copy), v35 (copy)
		if v25.variant == DateTimePickerVariant.Dual then
			local v47 = DateTimeUtilities.formatLocalTime(v33[1])
			local v48 = not v33[2] and "" or DateTimeUtilities.formatLocalTime(v33[2])

			v32(v47 .. " - " .. v48)
		else
			v32(DateTimeUtilities.formatLocalTime(v33[1], v25.variant == DateTimePickerVariant.SingleWithTime))
		end

		v35()
	end, {
		v33,
		v35
	})

	return React.createElement(Popover.Root, {
		isOpen = v27,
		testId = v25.testId
	}, {
		DateInput = React.createElement(TextInput, withCommonProps(v25, {
			hasError = v25.hasError,
			hint = v25.hint,
			iconTrailing = {
				name = Icon.Calendar,
				onActivated = v36
			},
			isDisabled = v25.isDisabled,
			isRequired = v25.isRequired,
			key = "date-input",
			label = v25.label,
			onChanged = v38,
			onFocusGained = v37,
			placeholder = Translator:FormatByKey("CommonUI.Controls.Label.SelectDate"),
			ref = v29,
			selectableDateRange = v25.selectableDateRange,
			size = InputSize.Medium,
			text = v31,
			testId = `{ v25.testId }--text-input`,
			width = v25.width
		})),
		Anchor = React.createElement(Popover.Anchor, {
			anchorRef = v29
		}),
		Calendar = React.createElement(Popover.Content, {
			hasArrow = false,
			onPressedOutside = v35,
			side = {
				position = PopoverSide.Bottom,
				offset = v26.Stroke.Standard + v26.Padding.Small
			},
			selection = v25.selection,
			selectionGroup = v25.selectionGroup
		}, v27 and React.createElement(View, {
			tag = "col auto-xy padding-large stroke-default radius-medium"
		}, {
			Calendar = React.createElement(Calendar, {
				defaultDates = v33,
				LayoutOrder = 1,
				onSelectedDateChanged = v34,
				selectableDateRange = v25.selectableDateRange,
				showStartDateTimeCalendarInput = v25.variant ~= DateTimePickerVariant.SingleWithTime,
				showEndDateTimeCalendarInput = v25.variant == DateTimePickerVariant.Dual,
				showTimeDropdown = v25.variant == DateTimePickerVariant.SingleWithTime,
				testId = "--foundation-calendar"
			}),
			BottomBar = React.createElement(View, {
				LayoutOrder = 2,
				tag = "row flex-fill gap-small size-full-0 auto-y padding-top-large"
			}, {
				ApplyButton = React.createElement(Button, {
					isDisabled = (function() -- line: 179
						-- upvalues: FoundationDateTimePickerDefaultDateFix (copy), v33 (copy), v25 (copy), DateTimePickerVariant (copy)
						if FoundationDateTimePickerDefaultDateFix and not v33 then
							return false
						end

						if v25.variant == DateTimePickerVariant.Single or v25.variant == DateTimePickerVariant.SingleWithTime then
							return v33[1] == nil
						end

						if v25.variant == DateTimePickerVariant.Dual then
							return v33[1] == nil or (v33[2] == nil or v33[1].UnixTimestamp > v33[2].UnixTimestamp)
						end

						return false
					end)(),
					onActivated = v39,
					text = Translator:FormatByKey("CommonUI.Controls.Action.Apply"),
					variant = ButtonVariant.Emphasis,
					testId = `{ v25.testId }--apply-button`
				}),
				CancelButton = React.createElement(Button, {
					onActivated = v35,
					text = Translator:FormatByKey("CommonUI.Controls.Action.Cancel"),
					variant = ButtonVariant.Standard,
					testId = `{ v25.testId }--cancel-button`
				})
			})
		}))
	})
end)
