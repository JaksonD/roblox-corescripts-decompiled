local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.CalendarDay);
local v5 = require(script.Parent.DateTimeUtilities);
local l_Icon_0 = v2.Icon;
local v7 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v8 = require(l_script_FirstAncestor_0.Utility.Flags);
local v9 = require(l_script_FirstAncestor_0.Components.IconButton);
local v10 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v11 = require(l_script_FirstAncestor_0.Components.Text);
local v12 = require(l_script_FirstAncestor_0.Components.TextInput);
local v13 = require(script.Parent.TimeDropdown);
local v14 = require(l_script_FirstAncestor_0.Components.View);
local v15 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v16 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_FFlagFoundationDateTimePickerDSTFix_0 = v8.FFlagFoundationDateTimePickerDSTFix;
local l_FoundationDateTimePickerDefaultDateFix_0 = v8.FoundationDateTimePickerDefaultDateFix;
return function(v19) --[[ Line: 57 ]] --[[ Name: Calendar ]]
    -- upvalues: v16 (copy), v15 (copy), v3 (copy), l_FoundationDateTimePickerDefaultDateFix_0 (copy), v5 (copy), v11 (copy), v4 (copy), l_FFlagFoundationDateTimePickerDSTFix_0 (copy), v14 (copy), v9 (copy), l_Icon_0 (copy), v10 (copy), v7 (copy), v13 (copy), v12 (copy)
    local v20 = v16();
    local v21 = v15(272);
    local v22 = v3.useRef(false);
    local v23 = if not l_FoundationDateTimePickerDefaultDateFix_0 or v19.defaultDates then v19.defaultDates else {
        DateTime.now()
    };
    if l_FoundationDateTimePickerDefaultDateFix_0 then
        v3.useEffect(function() --[[ Line: 70 ]]
            -- upvalues: v19 (copy), v23 (copy)
            v19.onSelectedDateChanged(v23);
        end, {
            v23, 
            v19.defaultDates, 
            v19.onSelectedDateChanged
        });
    end;
    local v24, v25 = v3.useState(v23);
    local v26 = v3.useRef(nil);
    local v27, v28 = v3.useState(if v19.showEndDateTimeCalendarInput then {
        startDateTimeInput = false, 
        endDateTimeInput = true
    } else {
        startDateTimeInput = true, 
        endDateTimeInput = false
    });
    v3.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v19 (copy), v27 (copy), v26 (copy)
        if v19.showEndDateTimeCalendarInput and v27.endDateTimeInput and v26.current then
            v26.current.focus();
        end;
    end, {
        v27
    });
    local v29, v30 = v3.useState(v5.formatLocalTime(v23[1]));
    local v31, v32 = v3.useState(if v23[2] then v5.formatLocalTime(v23[2]) else "");
    v3.useEffect(function() --[[ Line: 99 ]]
        -- upvalues: v22 (copy)
        v22.current = true;
    end, {});
    local v33, v34 = v3.useState({
        month = v23[1]:ToLocalTime().Month, 
        year = v23[1]:ToLocalTime().Year
    });
    local v35 = {};
    for _, v37 in v24 do
        table.insert(v35, v37:ToLocalTime());
    end;
    local function v39() --[[ Line: 117 ]]
        -- upvalues: v5 (ref), v29 (copy), v24 (copy), v30 (copy), v23 (copy)
        local v38 = v5.getDateTimeFromText(v29);
        if not v38 and v24[1] or v38 and v24[2] and v5.roundToStartOfDay(v38) > v5.roundToStartOfDay(v24[2]) then
            v30(v5.formatLocalTime(v23[1]));
        end;
    end;
    local function v41() --[[ Line: 136 ]]
        -- upvalues: v5 (ref), v31 (copy), v24 (copy), v32 (copy), v23 (copy)
        local v40 = v5.getDateTimeFromText(v31);
        if not v40 and v24[2] or v40 and v24[1] and v5.roundToStartOfDay(v40) < v5.roundToStartOfDay(v24[1]) then
            v32(v5.formatLocalTime(v23[2]));
        end;
    end;
    local v44 = v3.useCallback(function() --[[ Line: 151 ]]
        -- upvalues: v5 (ref), v33 (copy), v34 (copy)
        local v42, v43 = v5.getNextMonthInfo(v33.month, v33.year);
        v34({
            month = v42, 
            year = v43
        });
    end, {
        v33
    });
    local v47 = v3.useCallback(function() --[[ Line: 156 ]]
        -- upvalues: v5 (ref), v33 (copy), v34 (copy)
        local v45, v46 = v5.getPrevMonthInfo(v33.month, v33.year);
        v34({
            month = v45, 
            year = v46
        });
    end, {
        v33
    });
    local v52 = v3.useCallback(function(v48, v49, v50) --[[ Line: 162 ]]
        -- upvalues: v24 (copy), v19 (copy), v27 (copy), v30 (copy), v5 (ref), v28 (copy), v32 (copy), v34 (copy), v25 (copy)
        local v51 = DateTime.fromLocalTime(v50, v49, v48, v24[1]:ToLocalTime().Hour, v24[1]:ToLocalTime().Minute);
        if v19.showStartDateTimeCalendarInput then
            if v19.showEndDateTimeCalendarInput then
                if v27.startDateTimeInput then
                    v30(v5.formatLocalTime(v51));
                    v28({
                        startDateTimeInput = false, 
                        endDateTimeInput = true
                    });
                elseif v27.endDateTimeInput then
                    v32(v5.formatLocalTime(v51));
                    v28({
                        startDateTimeInput = false, 
                        endDateTimeInput = false
                    });
                else
                    v30(v5.formatLocalTime(v51));
                    v32("");
                    v28({
                        startDateTimeInput = false, 
                        endDateTimeInput = true
                    });
                end;
            else
                v30(v5.formatLocalTime(v51));
            end;
            v34({
                month = v49, 
                year = v50
            });
            return;
        else
            v34({
                month = v49, 
                year = v50
            });
            v25({
                v51
            });
            v19.onSelectedDateChanged({
                v51
            });
            return;
        end;
    end, {
        v19.showStartDateTimeCalendarInput, 
        v19.showEndDateTimeCalendarInput, 
        v24, 
        v27, 
        v26
    });
    local v57 = v3.useCallback(function(v53) --[[ Line: 207 ]]
        -- upvalues: v35 (copy)
        local v54 = v53:ToLocalTime();
        for _, v56 in v35 do
            if v56.Day == v54.Day and v56.Month == v54.Month and v56.Year == v54.Year then
                return true;
            end;
        end;
        return false;
    end, {
        v35
    });
    local v59 = v3.useCallback(function(v58) --[[ Line: 221 ]]
        -- upvalues: v19 (copy), v24 (copy), v5 (ref)
        return v19.showEndDateTimeCalendarInput and v24[1] and v24[2] and v5.isDateWithinRange(v58, {
            startDate = v24[1], 
            endDate = v24[2]
        });
    end, {
        v19.showEndDateTimeCalendarInput, 
        v24
    });
    local v61 = v3.useCallback(function(v60) --[[ Line: 232 ]]
        -- upvalues: v19 (copy), v5 (ref), v27 (copy), v24 (copy)
        if v19.selectableDateRange and not v5.isDateWithinRange(v60, v19.selectableDateRange) then
            return false;
        else
            if v19.showEndDateTimeCalendarInput then
                if v27.endDateTimeInput and v5.roundToStartOfDay(v60) < v5.roundToStartOfDay(v24[1]) then
                    return false;
                elseif v27.startDateTimeInput and v24[2] and v5.roundToStartOfDay(v60) > v5.roundToStartOfDay(v24[2]) then
                    return false;
                end;
            end;
            return true;
        end;
    end, {
        v24, 
        v19.selectableDateRange, 
        v27, 
        v19.showEndDateTimeCalendarInput
    });
    local v66 = v3.useCallback(function(v62) --[[ Line: 266 ]]
        -- upvalues: v22 (copy), v30 (copy), v5 (ref), v19 (copy), v24 (copy), v34 (copy), v25 (copy)
        if not v22.current then
            return;
        else
            v30(v62);
            local v63 = v5.getDateTimeFromText(v62);
            if v63 then
                local v64 = if v19.showEndDateTimeCalendarInput then {
                    v63, 
                    v24[2]
                } else {
                    v63
                };
                local v65 = v63:ToLocalTime();
                v34({
                    month = v65.Month, 
                    year = v65.Year
                });
                v25(v64);
                v19.onSelectedDateChanged(v64);
            end;
            return;
        end;
    end, {
        v19.onSelectedDateChanged, 
        v19.showEndDateTimeCalendarInput, 
        v61, 
        v24, 
        v22
    });
    local v72 = v3.useCallback(function(v67) --[[ Line: 297 ]]
        -- upvalues: v22 (copy), v32 (copy), v5 (ref), v24 (copy), v34 (copy), v25 (copy), v19 (copy)
        if not v22.current then
            return;
        else
            v32(v67);
            local v68 = v5.getDateTimeFromText(v67);
            if v68 then
                if v24[1] and v5.roundToStartOfDay(v68) < v5.roundToStartOfDay(v24[1]) then
                    return;
                else
                    local v69 = {
                        v24[1], 
                        v68
                    };
                    local v70 = v68:ToLocalTime();
                    v34({
                        month = v70.Month, 
                        year = v70.Year
                    });
                    v25(v69);
                    v19.onSelectedDateChanged(v69);
                    return;
                end;
            elseif v67 == "" then
                v25(function(v71) --[[ Line: 323 ]]
                    -- upvalues: v19 (ref)
                    v19.onSelectedDateChanged({
                        v71[1]
                    });
                    return {
                        v71[1]
                    };
                end);
                return;
            else
                return;
            end;
        end;
    end, {
        v19.onSelectedDateChanged, 
        v24, 
        v61, 
        v22
    });
    local v93 = v3.useMemo(function() --[[ Line: 332 ]]
        -- upvalues: v3 (ref), v20 (copy), v21 (copy), v5 (ref), v11 (ref), v33 (copy), v4 (ref), v59 (copy), v61 (copy), v57 (copy), v52 (copy), v19 (copy)
        local v73 = {};
        table.insert(v73, v3.createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(v20.Padding.None, v20.Padding.None), 
            CellSize = UDim2.fromOffset(v21 / 7, v21 / 7), 
            FillDirection = Enum.FillDirection.Horizontal, 
            FillDirectionMaxCells = 7, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            key = "layout", 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }));
        local v74 = 1;
        for _, v76 in v5.weekdays do
            table.insert(v73, v3.createElement(v11, {
                key = v76, 
                LayoutOrder = v74, 
                Text = v76, 
                tag = "text-align-x-center text-align-y-center text-body-small"
            }));
            v74 = v74 + 1;
        end;
        local v77 = v5.getFirstDayOfWeek(v33.month, v33.year);
        local v78, v79 = v5.getPrevMonthInfo(v33.month, v33.year);
        local v80 = v5.getDaysInMonth(v5.getPrevMonthInfo(v33.month, v33.year));
        local v81 = v77 == 0 and 7 or v77;
        for v82 = 1, v81 do
            local v83 = v80 - v81 + v82;
            local v84 = DateTime.fromLocalTime(v79, v78, v83);
            table.insert(v73, v3.createElement(v4, {
                highlight = v59(v84), 
                isSelectable = v61(v84), 
                isSelected = v57(v84), 
                key = "prev-month-day-" .. v83, 
                LayoutOrder = v74, 
                onActivated = function() --[[ Line: 391 ]] --[[ Name: onActivated ]]
                    -- upvalues: v52 (ref), v83 (copy), v78 (copy), v79 (copy)
                    v52(v83, v78, v79);
                end, 
                Text = tostring(v83), 
                testId = ("%*--prev-month-calendar-day-%*"):format(v19.testId, v83)
            }));
            v74 = v74 + 1;
        end;
        for v85 = 1, v5.getDaysInMonth(v33.month, v33.year) do
            local v86 = v61(DateTime.fromLocalTime(v33.year, v33.month, v85));
            local v87 = v57(DateTime.fromLocalTime(v33.year, v33.month, v85));
            table.insert(v73, v3.createElement(v4, {
                emphasizeText = v86 and not v87, 
                highlight = v59(DateTime.fromLocalTime(v33.year, v33.month, v85)), 
                isSelectable = v86, 
                isSelected = v87, 
                key = "current-month-day-" .. v85, 
                LayoutOrder = v74, 
                onActivated = function() --[[ Line: 422 ]] --[[ Name: onActivated ]]
                    -- upvalues: v52 (ref), v85 (copy), v33 (ref)
                    v52(v85, v33.month, v33.year);
                end, 
                Text = tostring(v85), 
                testId = ("%*--current-month-calendar-day-%*"):format(v19.testId, v85)
            }));
            v74 = v74 + 1;
        end;
        local v88 = v5.getLastDayOfWeek(v33.month, v33.year);
        local v89, v90 = v5.getNextMonthInfo(v33.month, v33.year);
        v81 = 7 - (v88 + 1);
        if v81 == 0 then
            v81 = 7;
        end;
        if v81 + #v73 < 50 then
            v81 = v81 + (50 - #v73 - v81);
        end;
        for v91 = 1, v81 do
            local v92 = DateTime.fromLocalTime(v90, v89, v91);
            table.insert(v73, v3.createElement(v4, {
                highlight = v59(v92), 
                isSelectable = v61(v92), 
                isSelected = v57(v92), 
                key = "next-month-day-" .. v91, 
                LayoutOrder = v74, 
                onActivated = function() --[[ Line: 460 ]] --[[ Name: onActivated ]]
                    -- upvalues: v52 (ref), v91 (copy), v89 (copy), v90 (copy)
                    v52(v91, v89, v90);
                end, 
                Text = tostring(v91), 
                testId = ("%*--next-month-calendar-day-%*"):format(v19.testId, v91)
            }));
            v74 = v74 + 1;
        end;
        return v73;
    end, {
        v57, 
        v59, 
        v61, 
        v33, 
        v24, 
        v52, 
        v19.selectableDateRange, 
        v19.showEndDateTimeCalendarInput
    });
    local v98 = v3.useCallback(function(v94) --[[ Line: 485 ]]
        -- upvalues: l_FFlagFoundationDateTimePickerDSTFix_0 (ref), v25 (copy), v19 (copy)
        local v95 = DateTime.fromUnixTimestamp(v94);
        if os.date("*t", v94).isdst then
            if l_FFlagFoundationDateTimePickerDSTFix_0 then
                local l_UnixTimestamp_0 = v95.UnixTimestamp;
                v95 = DateTime.fromUnixTimestamp(l_UnixTimestamp_0 - 3600);
            else
                local v97 = v95:ToLocalTime();
                v95 = DateTime.fromLocalTime(v97.Year, v97.Month, v97.Day, v97.Hour == 0 and 23 or v97.Hour - 1, v97.Minute, v97.Second);
            end;
        end;
        v25({
            v95
        });
        v19.onSelectedDateChanged({
            v95
        });
    end, {
        v24, 
        v19.onSelectedDateChanged
    });
    local l_createElement_0 = v3.createElement;
    local l_v14_0 = v14;
    local v101 = {
        LayoutOrder = v19.LayoutOrder, 
        tag = "col auto-y", 
        Size = UDim2.fromOffset(v21, 0), 
        testId = v19.testId
    };
    local v102 = {
        CalendarHeader = v3.createElement(v14, {
            LayoutOrder = 1, 
            tag = "row size-full-0 auto-y gap-small align-y-center padding-y-small"
        }, {
            PreviousMonthButton = v3.createElement(v9, {
                LayoutOrder = 1, 
                icon = l_Icon_0.ChevronSmallLeft, 
                isCircular = true, 
                onActivated = v47, 
                size = v10.Small, 
                variant = v7.Utility, 
                testId = ("%*--previous-month-button"):format(v19.testId)
            }), 
            MonthText = v3.createElement(v11, {
                LayoutOrder = 2, 
                Text = v5.monthMap[v33.month], 
                tag = "grow text-align-x-right auto-xy", 
                testId = ("%*--month-text"):format(v19.testId)
            }), 
            YearText = v3.createElement(v11, {
                LayoutOrder = 3, 
                Text = tostring(v33.year), 
                tag = "grow text-align-x-left auto-xy", 
                testId = ("%*--year-text"):format(v19.testId)
            }), 
            NextMonthButton = v3.createElement(v9, {
                LayoutOrder = 4, 
                icon = l_Icon_0.ChevronSmallRight, 
                isCircular = true, 
                onActivated = v44, 
                size = v10.Small, 
                variant = v7.Utility, 
                testId = ("%*--next-month-button"):format(v19.testId)
            })
        }), 
        TimeDropdown = if v19.showTimeDropdown then v3.createElement(v13, {
            dateTime = v24[1], 
            layoutOrder = 2, 
            onItemChanged = v98, 
            width = UDim.new(1, 0), 
            testId = ("%*--time-dropdown"):format(v19.testId)
        }) else nil
    };
    local v103;
    if v19.showStartDateTimeCalendarInput then
        v103 = v3.createElement;
        local l_v14_1 = v14;
        local v105 = {
            LayoutOrder = 3, 
            tag = "flex-x-fill size-full-0 auto-y row gap-small align-y-center", 
            testId = ("%*--input"):format(v19.testId)
        };
        local v106 = {};
        local l_createElement_1 = v3.createElement;
        local l_v12_0 = v12;
        local v109 = {};
        local v110 = false;
        if v29 ~= "" then
            v110 = v5.getDateTimeFromText(v29) == nil;
        end;
        v109.hasError = v110;
        v109.label = "";
        v109.LayoutOrder = 1;
        v109.onChanged = v66;
        v109.onFocusLost = v39;
        v109.placeholder = "MM/DD/YYYY";
        v109.size = v10.Medium;
        v109.text = v29;
        v109.onFocusGained = function() --[[ Line: 580 ]] --[[ Name: onFocusGained ]]
            -- upvalues: v28 (copy)
            v28({
                startDateTimeInput = true, 
                endDateTimeInput = false
            });
        end;
        v109.testId = ("%*--start-datetime-input"):format(v19.testId);
        v106.StartDateTime = l_createElement_1(l_v12_0, v109);
        v106.InputSeparator = if v19.showEndDateTimeCalendarInput then v3.createElement(v11, {
            LayoutOrder = 2, 
            tag = "auto-xy", 
            Text = "-"
        }) else nil;
        if v19.showEndDateTimeCalendarInput then
            l_createElement_1 = v3.createElement;
            l_v12_0 = v12;
            v109 = {};
            v110 = false;
            if v31 ~= "" then
                v110 = v5.getDateTimeFromText(v31) == nil;
            end;
            v109.hasError = v110;
            v109.isDisabled = not v24[1];
            v109.label = "";
            v109.LayoutOrder = 3;
            v109.onChanged = v72;
            v109.onFocusGained = function() --[[ Line: 600 ]] --[[ Name: onFocusGained ]]
                -- upvalues: v28 (copy)
                v28({
                    startDateTimeInput = false, 
                    endDateTimeInput = true
                });
            end;
            v109.onFocusLost = v41;
            v109.placeholder = "MM/DD/YYYY";
            v109.size = v10.Medium;
            v109.text = v31;
            v109.textBoxRef = v26;
            v109.testId = ("%*--end-datetime-input"):format(v19.testId);
            l_createElement_1 = l_createElement_1(l_v12_0, v109);
        else
            l_createElement_1 = nil;
        end;
        v106.EndDateTime = l_createElement_1;
        v103 = v103(l_v14_1, v105, v106);
    else
        v103 = nil;
    end;
    v102.CalendarInputContainer = v103;
    v102.WeekAndDates = v3.createElement(v14, {
        LayoutOrder = 4, 
        tag = "size-full-0 auto-y", 
        testId = ("%*--weekAndDates"):format(v19.testId)
    }, v93);
    return l_createElement_0(l_v14_0, v101, v102);
end;