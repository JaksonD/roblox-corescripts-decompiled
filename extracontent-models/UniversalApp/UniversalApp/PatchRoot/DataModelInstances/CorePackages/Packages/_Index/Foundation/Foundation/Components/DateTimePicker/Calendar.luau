local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local BuilderIcons = require(FoundationParent.BuilderIcons)
local React = require(FoundationParent.React)
local CalendarDay = require(script.Parent.CalendarDay)
local DateTimeUtilities = require(script.Parent.DateTimeUtilities)
local Icon = BuilderIcons.Icon
local ButtonVariant = require(Foundation.Enums.ButtonVariant)
local Flags = require(Foundation.Utility.Flags)
local IconButton = require(Foundation.Components.IconButton)
local InputSize = require(Foundation.Enums.InputSize)
local Text = require(Foundation.Components.Text)
local TextInput = require(Foundation.Components.TextInput)
local TimeDropdown = require(script.Parent.TimeDropdown)
local View = require(Foundation.Components.View)
local useScaledValue = require(Foundation.Utility.useScaledValue)
local useTokens = require(Foundation.Providers.Style.useTokens)
local FoundationDateTimePickerDefaultDateFix = Flags.FoundationDateTimePickerDefaultDateFix

return function(t1: {[any]: any}) --[[ Calendar ]] -- line: 56
	-- upvalues: useTokens (copy), useScaledValue (copy), React (copy), FoundationDateTimePickerDefaultDateFix (copy), DateTimeUtilities (copy), Text (copy), CalendarDay (copy), View (copy), IconButton (copy), Icon (copy), InputSize (copy), ButtonVariant (copy), TimeDropdown (copy), TextInput (copy)
	local v20 = useTokens()
	local v21 = useScaledValue(272)
	local v22 = React.useRef(false)
	local v23 = if not FoundationDateTimePickerDefaultDateFix or t1.defaultDates then t1.defaultDates else { DateTime.now() }

	if FoundationDateTimePickerDefaultDateFix then
		React.useEffect(function() -- line: 69
			-- upvalues: t1 (copy), v23 (copy)
			t1.onSelectedDateChanged(v23)
		end, {
			v23,
			t1.defaultDates,
			t1.onSelectedDateChanged
		})
	end

	local v24, v25 = React.useState(v23)
	local v26 = React.useRef(nil)
	local v27, v28 = React.useState(if not t1.showEndDateTimeCalendarInput then {
		startDateTimeInput = true,
		endDateTimeInput = false
	} else {
		startDateTimeInput = false,
		endDateTimeInput = true
	})

	React.useEffect(function() -- line: 83
		-- upvalues: t1 (copy), v27 (copy), v26 (copy)
		if t1.showEndDateTimeCalendarInput and (v27.endDateTimeInput and v26.current) then
			v26.current.focus()
		end
	end, { v27 })

	local v29, v30 = React.useState(DateTimeUtilities.formatLocalTime(v23[1]))
	local v31, v32 = React.useState(not v23[2] and "" or DateTimeUtilities.formatLocalTime(v23[2]))

	React.useEffect(function() -- line: 98
		-- upvalues: v22 (copy)
		v22.current = true
	end, {})

	local v33, v34 = React.useState({
		month = v23[1]:ToLocalTime().Month,
		year = v23[1]:ToLocalTime().Year
	})
	local t2 = {}

	for _, v37 in v24 do
		table.insert(t2, v37:ToLocalTime())
	end

	local v38 = React.useCallback(function() -- line: 150
		-- upvalues: DateTimeUtilities (copy), v33 (copy), v34 (copy)
		local v50, v51 = DateTimeUtilities.getNextMonthInfo(v33.month, v33.year)

		v34({
			month = v50,
			year = v51
		})
	end, { v33 })
	local v39 = React.useCallback(function() -- line: 155
		-- upvalues: DateTimeUtilities (copy), v33 (copy), v34 (copy)
		local v52, v53 = DateTimeUtilities.getPrevMonthInfo(v33.month, v33.year)

		v34({
			month = v52,
			year = v53
		})
	end, { v33 })
	local v40 = React.useCallback(function(n1: number, n2: number, n3: number) -- line: 161
		-- upvalues: v24 (copy), t1 (copy), v27 (copy), v30 (copy), DateTimeUtilities (copy), v28 (copy), v32 (copy), v34 (copy), v25 (copy)
		local dateTime = DateTime.fromLocalTime(n3, n2, n1, v24[1]:ToLocalTime().Hour, v24[1]:ToLocalTime().Minute)

		if t1.showStartDateTimeCalendarInput then
			if t1.showEndDateTimeCalendarInput then
				if v27.startDateTimeInput then
					v30(DateTimeUtilities.formatLocalTime(dateTime))
					v28({
						startDateTimeInput = false,
						endDateTimeInput = true
					})
				elseif v27.endDateTimeInput then
					v32(DateTimeUtilities.formatLocalTime(dateTime))
					v28({
						startDateTimeInput = false,
						endDateTimeInput = false
					})
				else
					v30(DateTimeUtilities.formatLocalTime(dateTime))
					v32("")
					v28({
						startDateTimeInput = false,
						endDateTimeInput = true
					})
				end
			else
				v30(DateTimeUtilities.formatLocalTime(dateTime))
			end

			v34({
				month = n2,
				year = n3
			})

			return
		end

		v34({
			month = n2,
			year = n3
		})
		v25({ dateTime })
		t1.onSelectedDateChanged({ dateTime })
	end, {
		t1.showStartDateTimeCalendarInput,
		t1.showEndDateTimeCalendarInput,
		v24,
		v27,
		v26
	})
	local v41 = React.useCallback(function(p1) -- line: 206
		-- upvalues: t2 (copy)
		local v59 = p1:ToLocalTime()

		for _, v61 in t2 do
			if v61.Day == v59.Day and v61.Month == v59.Month and v61.Year == v59.Year then
				return true
			end
		end

		return false
	end, { t2 })
	local v42 = React.useCallback(function(p2) -- line: 220
		-- upvalues: t1 (copy), v24 (copy), DateTimeUtilities (copy)
		return t1.showEndDateTimeCalendarInput and (v24[1] and (v24[2] and DateTimeUtilities.isDateWithinRange(p2, {
			startDate = v24[1],
			endDate = v24[2]
		})))
	end, {
		t1.showEndDateTimeCalendarInput,
		v24
	})
	local v43 = React.useCallback(function(p3) -- line: 231
		-- upvalues: t1 (copy), DateTimeUtilities (copy), v27 (copy), v24 (copy)
		if t1.selectableDateRange and not DateTimeUtilities.isDateWithinRange(p3, t1.selectableDateRange) then
			return false
		end

		if t1.showEndDateTimeCalendarInput then
			if v27.endDateTimeInput and DateTimeUtilities.roundToStartOfDay(p3) < DateTimeUtilities.roundToStartOfDay(v24[1]) then
				return false
			end

			if v27.startDateTimeInput and v24[2] and DateTimeUtilities.roundToStartOfDay(p3) > DateTimeUtilities.roundToStartOfDay(v24[2]) then
				return false
			end
		end

		return true
	end, {
		v24,
		t1.selectableDateRange,
		v27,
		t1.showEndDateTimeCalendarInput
	})
	local v44 = React.useCallback(function(s1: string) -- line: 265
		-- upvalues: v22 (copy), v30 (copy), DateTimeUtilities (copy), t1 (copy), v24 (copy), v34 (copy), v25 (copy)
		if not v22.current then
			return
		end

		v30(s1)

		local v65 = DateTimeUtilities.getDateTimeFromText(s1)

		if v65 then
			local v66 = if not t1.showEndDateTimeCalendarInput then { v65 } else {
				v65,
				v24[2]
			}
			local v67 = v65:ToLocalTime()

			v34({
				month = v67.Month,
				year = v67.Year
			})
			v25(v66)
			t1.onSelectedDateChanged(v66)
		end
	end, {
		t1.onSelectedDateChanged,
		t1.showEndDateTimeCalendarInput,
		v43,
		v24,
		v22
	})
	local v45 = React.useCallback(function(s2: string) -- line: 296
		-- upvalues: v22 (copy), v32 (copy), DateTimeUtilities (copy), v24 (copy), v34 (copy), v25 (copy), t1 (copy)
		if not v22.current then
			return
		end

		v32(s2)

		local v69 = DateTimeUtilities.getDateTimeFromText(s2)

		if v69 then
			if v24[1] and DateTimeUtilities.roundToStartOfDay(v69) < DateTimeUtilities.roundToStartOfDay(v24[1]) then
				return
			end

			local t3 = {
				v24[1],
				v69
			}
			local v71 = v69:ToLocalTime()

			v34({
				month = v71.Month,
				year = v71.Year
			})
			v25(t3)
			t1.onSelectedDateChanged(t3)

			return
		end

		if s2 == "" then
			v25(function(p4) -- line: 322
				-- upvalues: t1 (copy)
				t1.onSelectedDateChanged({ p4[1] })

				return { p4[1] }
			end)

			return
		end
	end, {
		t1.onSelectedDateChanged,
		v24,
		v43,
		v22
	})
	local v46 = React.useMemo(function() -- line: 331
		-- upvalues: React (copy), v20 (copy), v21 (copy), DateTimeUtilities (copy), Text (copy), v33 (copy), CalendarDay (copy), v42 (copy), v43 (copy), v41 (copy), v40 (copy), t1 (copy)
		local t4 = {}

		table.insert(t4, React.createElement("UIGridLayout", {
			CellPadding = UDim2.fromOffset(v20.Padding.None, v20.Padding.None),
			CellSize = UDim2.fromOffset(v21 / 7, v21 / 7),
			FillDirection = Enum.FillDirection.Horizontal,
			FillDirectionMaxCells = 7,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			key = "layout",
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}))

		local n4 = 1

		for _, v75 in DateTimeUtilities.weekdays do
			table.insert(t4, React.createElement(Text, {
				key = v75,
				LayoutOrder = n4,
				Text = v75,
				tag = "text-body-small text-align-x-center text-align-y-center"
			}))
			n4 += 1
		end

		local v76 = DateTimeUtilities.getFirstDayOfWeek(v33.month, v33.year)
		local v77, v78 = DateTimeUtilities.getPrevMonthInfo(v33.month, v33.year)
		local v79 = DateTimeUtilities.getDaysInMonth(DateTimeUtilities.getPrevMonthInfo(v33.month, v33.year))
		local v80 = if v76 ~= 0 then v76 else 7

		for i = 1, v80 do
			local v82 = v79 - v80 + i
			local dateTime = DateTime.fromLocalTime(v78, v77, v82)

			table.insert(t4, React.createElement(CalendarDay, {
				highlight = v42(dateTime),
				isSelectable = v43(dateTime),
				isSelected = v41(dateTime),
				key = "prev-month-day-" .. v82,
				LayoutOrder = n4,
				onActivated = function() --[[ onActivated ]] -- line: 390
					-- upvalues: v40 (copy), v82 (copy), v77 (copy), v78 (copy)
					v40(v82, v77, v78)
				end,
				Text = tostring(v82),
				testId = `{ t1.testId }--prev-month-calendar-day-{ v82 }`
			}))
			n4 += 1
		end

		for i = 1, DateTimeUtilities.getDaysInMonth(v33.month, v33.year) do
			local v85 = v43(DateTime.fromLocalTime(v33.year, v33.month, i))
			local v86 = v41(DateTime.fromLocalTime(v33.year, v33.month, i))

			table.insert(t4, React.createElement(CalendarDay, {
				emphasizeText = v85 and not v86,
				highlight = v42(DateTime.fromLocalTime(v33.year, v33.month, i)),
				isSelectable = v85,
				isSelected = v86,
				key = "current-month-day-" .. i,
				LayoutOrder = n4,
				onActivated = function() --[[ onActivated ]] -- line: 421
					-- upvalues: v40 (copy), i (copy), v33 (copy)
					v40(i, v33.month, v33.year)
				end,
				Text = tostring(i),
				testId = `{ t1.testId }--current-month-calendar-day-{ i }`
			}))
			n4 += 1
		end

		local v87 = DateTimeUtilities.getLastDayOfWeek(v33.month, v33.year)
		local v88, v89 = DateTimeUtilities.getNextMonthInfo(v33.month, v33.year)
		local v90 = 7 - (v87 + 1)

		if v90 == 0 then
			v90 = 7
		end

		if v90 + #t4 < 50 then
			v90 += 50 - #t4 - v90
		end

		for i = 1, v90 do
			local dateTime = DateTime.fromLocalTime(v89, v88, i)

			table.insert(t4, React.createElement(CalendarDay, {
				highlight = v42(dateTime),
				isSelectable = v43(dateTime),
				isSelected = v41(dateTime),
				key = "next-month-day-" .. i,
				LayoutOrder = n4,
				onActivated = function() --[[ onActivated ]] -- line: 459
					-- upvalues: v40 (copy), i (copy), v88 (copy), v89 (copy)
					v40(i, v88, v89)
				end,
				Text = tostring(i),
				testId = `{ t1.testId }--next-month-calendar-day-{ i }`
			}))
			n4 += 1
		end

		return t4
	end, {
		v41,
		v42,
		v43,
		v33,
		v24,
		v40,
		t1.selectableDateRange,
		t1.showEndDateTimeCalendarInput
	})
	local v47 = React.useCallback(function(p5) -- line: 484
		-- upvalues: v25 (copy), t1 (copy)
		local dateTime = DateTime.fromUnixTimestamp(p5)

		if os.date("*t", p5).isdst then
			local UnixTimestamp = dateTime.UnixTimestamp

			dateTime = DateTime.fromUnixTimestamp(UnixTimestamp - 3600)
		end

		v25({ dateTime })
		t1.onSelectedDateChanged({ dateTime })
	end, {
		v24,
		t1.onSelectedDateChanged
	})

	return React.createElement(View, {
		LayoutOrder = t1.LayoutOrder,
		tag = "col auto-y",
		Size = UDim2.fromOffset(v21, 0),
		testId = t1.testId
	}, {
		CalendarHeader = React.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y padding-y-small"
		}, {
			PreviousMonthButton = React.createElement(IconButton, {
				LayoutOrder = 1,
				icon = Icon.ChevronSmallLeft,
				isCircular = true,
				onActivated = v39,
				size = InputSize.Small,
				variant = ButtonVariant.Utility,
				testId = `{ t1.testId }--previous-month-button`
			}),
			MonthText = React.createElement(Text, {
				LayoutOrder = 2,
				Text = DateTimeUtilities.monthMap[v33.month],
				tag = "grow auto-xy text-align-x-right",
				testId = `{ t1.testId }--month-text`
			}),
			YearText = React.createElement(Text, {
				LayoutOrder = 3,
				Text = tostring(v33.year),
				tag = "grow auto-xy text-align-x-left",
				testId = `{ t1.testId }--year-text`
			}),
			NextMonthButton = React.createElement(IconButton, {
				LayoutOrder = 4,
				icon = Icon.ChevronSmallRight,
				isCircular = true,
				onActivated = v38,
				size = InputSize.Small,
				variant = ButtonVariant.Utility,
				testId = `{ t1.testId }--next-month-button`
			})
		}),
		TimeDropdown = if not t1.showTimeDropdown then nil else React.createElement(TimeDropdown, {
			dateTime = v24[1],
			layoutOrder = 2,
			onItemChanged = v47,
			width = UDim.new(1, 0),
			testId = `{ t1.testId }--time-dropdown`
		}),
		CalendarInputContainer = if not t1.showStartDateTimeCalendarInput then nil else React.createElement(View, {
			LayoutOrder = 3,
			tag = "row flex-x-fill align-y-center gap-small size-full-0 auto-y",
			testId = `{ t1.testId }--input`
		}, {
			StartDateTime = React.createElement(TextInput, {
				hasError = v29 ~= "" and DateTimeUtilities.getDateTimeFromText(v29) == nil,
				label = "",
				LayoutOrder = 1,
				onChanged = v44,
				onFocusLost = function() -- line: 116
					-- upvalues: DateTimeUtilities (copy), v29 (copy), v24 (copy), v30 (copy), v23 (copy)
					local v48 = DateTimeUtilities.getDateTimeFromText(v29)

					if not v48 and v24[1] or v48 and v24[2] and DateTimeUtilities.roundToStartOfDay(v48) > DateTimeUtilities.roundToStartOfDay(v24[2]) then
						v30(DateTimeUtilities.formatLocalTime(v23[1]))
					end
				end,
				placeholder = "MM/DD/YYYY",
				size = InputSize.Medium,
				text = v29,
				onFocusGained = function() --[[ onFocusGained ]] -- line: 567
					-- upvalues: v28 (copy)
					v28({
						startDateTimeInput = true,
						endDateTimeInput = false
					})
				end,
				testId = `{ t1.testId }--start-datetime-input`
			}),
			InputSeparator = if not t1.showEndDateTimeCalendarInput then nil else React.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy",
				Text = "-"
			}),
			EndDateTime = if not t1.showEndDateTimeCalendarInput then nil else React.createElement(TextInput, {
				hasError = v31 ~= "" and DateTimeUtilities.getDateTimeFromText(v31) == nil,
				isDisabled = not v24[1],
				label = "",
				LayoutOrder = 3,
				onChanged = v45,
				onFocusGained = function() --[[ onFocusGained ]] -- line: 587
					-- upvalues: v28 (copy)
					v28({
						startDateTimeInput = false,
						endDateTimeInput = true
					})
				end,
				onFocusLost = function() -- line: 135
					-- upvalues: DateTimeUtilities (copy), v31 (copy), v24 (copy), v32 (copy), v23 (copy)
					local v49 = DateTimeUtilities.getDateTimeFromText(v31)

					if not v49 and v24[2] or v49 and v24[1] and DateTimeUtilities.roundToStartOfDay(v49) < DateTimeUtilities.roundToStartOfDay(v24[1]) then
						v32(DateTimeUtilities.formatLocalTime(v23[2]))
					end
				end,
				placeholder = "MM/DD/YYYY",
				size = InputSize.Medium,
				text = v31,
				textBoxRef = v26,
				testId = `{ t1.testId }--end-datetime-input`
			})
		}),
		WeekAndDates = React.createElement(View, {
			LayoutOrder = 4,
			tag = "size-full-0 auto-y",
			testId = `{ t1.testId }--weekAndDates`
		}, v46)
	})
end
