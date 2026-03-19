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
return function(v18) --[[ Line: 56 ]] --[[ Name: Calendar ]]
    -- upvalues: v16 (copy), v15 (copy), v3 (copy), v5 (copy), v11 (copy), v4 (copy), l_FFlagFoundationDateTimePickerDSTFix_0 (copy), v14 (copy), v9 (copy), l_Icon_0 (copy), v10 (copy), v7 (copy), v13 (copy), v12 (copy)
    local v19 = v16();
    local v20 = v15(272);
    local v21 = v3.useRef(false);
    local v22, v23 = v3.useState(v18.defaultDates);
    local v24 = v3.useRef(nil);
    local v25, v26 = v3.useState(if v18.showEndDateTimeCalendarInput then {
        startDateTimeInput = false, 
        endDateTimeInput = true
    } else {
        startDateTimeInput = true, 
        endDateTimeInput = false
    });
    v3.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v18 (copy), v25 (copy), v24 (copy)
        if v18.showEndDateTimeCalendarInput and v25.endDateTimeInput and v24.current then
            v24.current.focus();
        end;
    end, {
        v25
    });
    local v27, v28 = v3.useState(v5.formatLocalTime(v18.defaultDates[1]));
    local v29, v30 = v3.useState(if v18.defaultDates[2] then v5.formatLocalTime(v18.defaultDates[2]) else "");
    v3.useEffect(function() --[[ Line: 87 ]]
        -- upvalues: v21 (copy)
        v21.current = true;
    end, {});
    local v31, v32 = v3.useState({
        month = v18.defaultDates[1]:ToLocalTime().Month, 
        year = v18.defaultDates[1]:ToLocalTime().Year
    });
    local v33 = {};
    for _, v35 in v22 do
        table.insert(v33, v35:ToLocalTime());
    end;
    local function v37() --[[ Line: 105 ]]
        -- upvalues: v5 (ref), v27 (copy), v22 (copy), v28 (copy), v18 (copy)
        local v36 = v5.getDateTimeFromText(v27);
        if not v36 and v22[1] or v36 and v22[2] and v5.roundToStartOfDay(v36) > v5.roundToStartOfDay(v22[2]) then
            v28(v5.formatLocalTime(v18.defaultDates[1]));
        end;
    end;
    local function v39() --[[ Line: 124 ]]
        -- upvalues: v5 (ref), v29 (copy), v22 (copy), v30 (copy), v18 (copy)
        local v38 = v5.getDateTimeFromText(v29);
        if not v38 and v22[2] or v38 and v22[1] and v5.roundToStartOfDay(v38) < v5.roundToStartOfDay(v22[1]) then
            v30(v5.formatLocalTime(v18.defaultDates[2]));
        end;
    end;
    local v42 = v3.useCallback(function() --[[ Line: 139 ]]
        -- upvalues: v5 (ref), v31 (copy), v32 (copy)
        local v40, v41 = v5.getNextMonthInfo(v31.month, v31.year);
        v32({
            month = v40, 
            year = v41
        });
    end, {
        v31
    });
    local v45 = v3.useCallback(function() --[[ Line: 144 ]]
        -- upvalues: v5 (ref), v31 (copy), v32 (copy)
        local v43, v44 = v5.getPrevMonthInfo(v31.month, v31.year);
        v32({
            month = v43, 
            year = v44
        });
    end, {
        v31
    });
    local v50 = v3.useCallback(function(v46, v47, v48) --[[ Line: 150 ]]
        -- upvalues: v22 (copy), v18 (copy), v25 (copy), v28 (copy), v5 (ref), v26 (copy), v30 (copy), v32 (copy), v23 (copy)
        local v49 = DateTime.fromLocalTime(v48, v47, v46, v22[1]:ToLocalTime().Hour, v22[1]:ToLocalTime().Minute);
        if v18.showStartDateTimeCalendarInput then
            if v18.showEndDateTimeCalendarInput then
                if v25.startDateTimeInput then
                    v28(v5.formatLocalTime(v49));
                    v26({
                        startDateTimeInput = false, 
                        endDateTimeInput = true
                    });
                elseif v25.endDateTimeInput then
                    v30(v5.formatLocalTime(v49));
                    v26({
                        startDateTimeInput = false, 
                        endDateTimeInput = false
                    });
                else
                    v28(v5.formatLocalTime(v49));
                    v30("");
                    v26({
                        startDateTimeInput = false, 
                        endDateTimeInput = true
                    });
                end;
            else
                v28(v5.formatLocalTime(v49));
            end;
            v32({
                month = v47, 
                year = v48
            });
            return;
        else
            v32({
                month = v47, 
                year = v48
            });
            v23({
                v49
            });
            v18.onSelectedDateChanged({
                v49
            });
            return;
        end;
    end, {
        v18.showStartDateTimeCalendarInput, 
        v18.showEndDateTimeCalendarInput, 
        v22, 
        v25, 
        v24
    });
    local v55 = v3.useCallback(function(v51) --[[ Line: 195 ]]
        -- upvalues: v33 (copy)
        local v52 = v51:ToLocalTime();
        for _, v54 in v33 do
            if v54.Day == v52.Day and v54.Month == v52.Month and v54.Year == v52.Year then
                return true;
            end;
        end;
        return false;
    end, {
        v33
    });
    local v57 = v3.useCallback(function(v56) --[[ Line: 209 ]]
        -- upvalues: v18 (copy), v22 (copy), v5 (ref)
        return v18.showEndDateTimeCalendarInput and v22[1] and v22[2] and v5.isDateWithinRange(v56, {
            startDate = v22[1], 
            endDate = v22[2]
        });
    end, {
        v18.showEndDateTimeCalendarInput, 
        v22
    });
    local v59 = v3.useCallback(function(v58) --[[ Line: 220 ]]
        -- upvalues: v18 (copy), v5 (ref), v25 (copy), v22 (copy)
        if v18.selectableDateRange and not v5.isDateWithinRange(v58, v18.selectableDateRange) then
            return false;
        else
            if v18.showEndDateTimeCalendarInput then
                if v25.endDateTimeInput and v5.roundToStartOfDay(v58) < v5.roundToStartOfDay(v22[1]) then
                    return false;
                elseif v25.startDateTimeInput and v22[2] and v5.roundToStartOfDay(v58) > v5.roundToStartOfDay(v22[2]) then
                    return false;
                end;
            end;
            return true;
        end;
    end, {
        v22, 
        v18.selectableDateRange, 
        v25, 
        v18.showEndDateTimeCalendarInput
    });
    local v64 = v3.useCallback(function(v60) --[[ Line: 254 ]]
        -- upvalues: v21 (copy), v28 (copy), v5 (ref), v18 (copy), v22 (copy), v32 (copy), v23 (copy)
        if not v21.current then
            return;
        else
            v28(v60);
            local v61 = v5.getDateTimeFromText(v60);
            if v61 then
                local v62 = if v18.showEndDateTimeCalendarInput then {
                    v61, 
                    v22[2]
                } else {
                    v61
                };
                local v63 = v61:ToLocalTime();
                v32({
                    month = v63.Month, 
                    year = v63.Year
                });
                v23(v62);
                v18.onSelectedDateChanged(v62);
            end;
            return;
        end;
    end, {
        v18.onSelectedDateChanged, 
        v18.showEndDateTimeCalendarInput, 
        v59, 
        v22, 
        v21
    });
    local v70 = v3.useCallback(function(v65) --[[ Line: 285 ]]
        -- upvalues: v21 (copy), v30 (copy), v5 (ref), v22 (copy), v32 (copy), v23 (copy), v18 (copy)
        if not v21.current then
            return;
        else
            v30(v65);
            local v66 = v5.getDateTimeFromText(v65);
            if v66 then
                if v22[1] and v5.roundToStartOfDay(v66) < v5.roundToStartOfDay(v22[1]) then
                    return;
                else
                    local v67 = {
                        v22[1], 
                        v66
                    };
                    local v68 = v66:ToLocalTime();
                    v32({
                        month = v68.Month, 
                        year = v68.Year
                    });
                    v23(v67);
                    v18.onSelectedDateChanged(v67);
                    return;
                end;
            elseif v65 == "" then
                v23(function(v69) --[[ Line: 311 ]]
                    -- upvalues: v18 (ref)
                    v18.onSelectedDateChanged({
                        v69[1]
                    });
                    return {
                        v69[1]
                    };
                end);
                return;
            else
                return;
            end;
        end;
    end, {
        v18.onSelectedDateChanged, 
        v22, 
        v59, 
        v21
    });
    local v91 = v3.useMemo(function() --[[ Line: 320 ]]
        -- upvalues: v3 (ref), v19 (copy), v20 (copy), v5 (ref), v11 (ref), v31 (copy), v4 (ref), v57 (copy), v59 (copy), v55 (copy), v50 (copy), v18 (copy)
        local v71 = {};
        table.insert(v71, v3.createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(v19.Padding.None, v19.Padding.None), 
            CellSize = UDim2.fromOffset(v20 / 7, v20 / 7), 
            FillDirection = Enum.FillDirection.Horizontal, 
            FillDirectionMaxCells = 7, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            key = "layout", 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }));
        local v72 = 1;
        for _, v74 in v5.weekdays do
            table.insert(v71, v3.createElement(v11, {
                key = v74, 
                LayoutOrder = v72, 
                Text = v74, 
                tag = "text-align-x-center text-align-y-center text-body-small"
            }));
            v72 = v72 + 1;
        end;
        local v75 = v5.getFirstDayOfWeek(v31.month, v31.year);
        local v76, v77 = v5.getPrevMonthInfo(v31.month, v31.year);
        local v78 = v5.getDaysInMonth(v5.getPrevMonthInfo(v31.month, v31.year));
        local v79 = v75 == 0 and 7 or v75;
        for v80 = 1, v79 do
            local v81 = v78 - v79 + v80;
            local v82 = DateTime.fromLocalTime(v77, v76, v81);
            table.insert(v71, v3.createElement(v4, {
                highlight = v57(v82), 
                isSelectable = v59(v82), 
                isSelected = v55(v82), 
                key = "prev-month-day-" .. v81, 
                LayoutOrder = v72, 
                onActivated = function() --[[ Line: 379 ]] --[[ Name: onActivated ]]
                    -- upvalues: v50 (ref), v81 (copy), v76 (copy), v77 (copy)
                    v50(v81, v76, v77);
                end, 
                Text = tostring(v81), 
                testId = ("%*--prev-month-calendar-day-%*"):format(v18.testId, v81)
            }));
            v72 = v72 + 1;
        end;
        for v83 = 1, v5.getDaysInMonth(v31.month, v31.year) do
            local v84 = v59(DateTime.fromLocalTime(v31.year, v31.month, v83));
            local v85 = v55(DateTime.fromLocalTime(v31.year, v31.month, v83));
            table.insert(v71, v3.createElement(v4, {
                emphasizeText = v84 and not v85, 
                highlight = v57(DateTime.fromLocalTime(v31.year, v31.month, v83)), 
                isSelectable = v84, 
                isSelected = v85, 
                key = "current-month-day-" .. v83, 
                LayoutOrder = v72, 
                onActivated = function() --[[ Line: 410 ]] --[[ Name: onActivated ]]
                    -- upvalues: v50 (ref), v83 (copy), v31 (ref)
                    v50(v83, v31.month, v31.year);
                end, 
                Text = tostring(v83), 
                testId = ("%*--current-month-calendar-day-%*"):format(v18.testId, v83)
            }));
            v72 = v72 + 1;
        end;
        local v86 = v5.getLastDayOfWeek(v31.month, v31.year);
        local v87, v88 = v5.getNextMonthInfo(v31.month, v31.year);
        v79 = 7 - (v86 + 1);
        if v79 == 0 then
            v79 = 7;
        end;
        if v79 + #v71 < 50 then
            v79 = v79 + (50 - #v71 - v79);
        end;
        for v89 = 1, v79 do
            local v90 = DateTime.fromLocalTime(v88, v87, v89);
            table.insert(v71, v3.createElement(v4, {
                highlight = v57(v90), 
                isSelectable = v59(v90), 
                isSelected = v55(v90), 
                key = "next-month-day-" .. v89, 
                LayoutOrder = v72, 
                onActivated = function() --[[ Line: 448 ]] --[[ Name: onActivated ]]
                    -- upvalues: v50 (ref), v89 (copy), v87 (copy), v88 (copy)
                    v50(v89, v87, v88);
                end, 
                Text = tostring(v89), 
                testId = ("%*--next-month-calendar-day-%*"):format(v18.testId, v89)
            }));
            v72 = v72 + 1;
        end;
        return v71;
    end, {
        v55, 
        v57, 
        v59, 
        v31, 
        v22, 
        v50, 
        v18.selectableDateRange, 
        v18.showEndDateTimeCalendarInput
    });
    local v96 = v3.useCallback(function(v92) --[[ Line: 473 ]]
        -- upvalues: l_FFlagFoundationDateTimePickerDSTFix_0 (ref), v23 (copy), v18 (copy)
        local v93 = DateTime.fromUnixTimestamp(v92);
        if os.date("*t", v92).isdst then
            if l_FFlagFoundationDateTimePickerDSTFix_0 then
                local l_UnixTimestamp_0 = v93.UnixTimestamp;
                v93 = DateTime.fromUnixTimestamp(l_UnixTimestamp_0 - 3600);
            else
                local v95 = v93:ToLocalTime();
                v93 = DateTime.fromLocalTime(v95.Year, v95.Month, v95.Day, v95.Hour == 0 and 23 or v95.Hour - 1, v95.Minute, v95.Second);
            end;
        end;
        v23({
            v93
        });
        v18.onSelectedDateChanged({
            v93
        });
    end, {
        v22, 
        v18.onSelectedDateChanged
    });
    local l_createElement_0 = v3.createElement;
    local l_v14_0 = v14;
    local v99 = {
        LayoutOrder = v18.LayoutOrder, 
        tag = "col auto-y", 
        Size = UDim2.fromOffset(v20, 0), 
        testId = v18.testId
    };
    local v100 = {
        CalendarHeader = v3.createElement(v14, {
            LayoutOrder = 1, 
            tag = "row size-full-0 auto-y gap-small align-y-center padding-y-small"
        }, {
            PreviousMonthButton = v3.createElement(v9, {
                LayoutOrder = 1, 
                icon = l_Icon_0.ChevronSmallLeft, 
                isCircular = true, 
                onActivated = v45, 
                size = v10.Small, 
                variant = v7.Utility, 
                testId = ("%*--previous-month-button"):format(v18.testId)
            }), 
            MonthText = v3.createElement(v11, {
                LayoutOrder = 2, 
                Text = v5.monthMap[v31.month], 
                tag = "grow text-align-x-right auto-xy", 
                testId = ("%*--month-text"):format(v18.testId)
            }), 
            YearText = v3.createElement(v11, {
                LayoutOrder = 3, 
                Text = tostring(v31.year), 
                tag = "grow text-align-x-left auto-xy", 
                testId = ("%*--year-text"):format(v18.testId)
            }), 
            NextMonthButton = v3.createElement(v9, {
                LayoutOrder = 4, 
                icon = l_Icon_0.ChevronSmallRight, 
                isCircular = true, 
                onActivated = v42, 
                size = v10.Small, 
                variant = v7.Utility, 
                testId = ("%*--next-month-button"):format(v18.testId)
            })
        }), 
        TimeDropdown = if v18.showTimeDropdown then v3.createElement(v13, {
            dateTime = v22[1], 
            layoutOrder = 2, 
            onItemChanged = v96, 
            width = UDim.new(1, 0), 
            testId = ("%*--time-dropdown"):format(v18.testId)
        }) else nil
    };
    local v101;
    if v18.showStartDateTimeCalendarInput then
        v101 = v3.createElement;
        local l_v14_1 = v14;
        local v103 = {
            LayoutOrder = 3, 
            tag = "flex-x-fill size-full-0 auto-y row gap-small align-y-center", 
            testId = ("%*--input"):format(v18.testId)
        };
        local v104 = {};
        local l_createElement_1 = v3.createElement;
        local l_v12_0 = v12;
        local v107 = {};
        local v108 = false;
        if v27 ~= "" then
            v108 = v5.getDateTimeFromText(v27) == nil;
        end;
        v107.hasError = v108;
        v107.label = "";
        v107.LayoutOrder = 1;
        v107.onChanged = v64;
        v107.onFocusLost = v37;
        v107.placeholder = "MM/DD/YYYY";
        v107.size = v10.Medium;
        v107.text = v27;
        v107.onFocusGained = function() --[[ Line: 568 ]] --[[ Name: onFocusGained ]]
            -- upvalues: v26 (copy)
            v26({
                startDateTimeInput = true, 
                endDateTimeInput = false
            });
        end;
        v107.testId = ("%*--start-datetime-input"):format(v18.testId);
        v104.StartDateTime = l_createElement_1(l_v12_0, v107);
        v104.InputSeparator = if v18.showEndDateTimeCalendarInput then v3.createElement(v11, {
            LayoutOrder = 2, 
            tag = "auto-xy", 
            Text = "-"
        }) else nil;
        if v18.showEndDateTimeCalendarInput then
            l_createElement_1 = v3.createElement;
            l_v12_0 = v12;
            v107 = {};
            v108 = false;
            if v29 ~= "" then
                v108 = v5.getDateTimeFromText(v29) == nil;
            end;
            v107.hasError = v108;
            v107.isDisabled = not v22[1];
            v107.label = "";
            v107.LayoutOrder = 3;
            v107.onChanged = v70;
            v107.onFocusGained = function() --[[ Line: 588 ]] --[[ Name: onFocusGained ]]
                -- upvalues: v26 (copy)
                v26({
                    startDateTimeInput = false, 
                    endDateTimeInput = true
                });
            end;
            v107.onFocusLost = v39;
            v107.placeholder = "MM/DD/YYYY";
            v107.size = v10.Medium;
            v107.text = v29;
            v107.textBoxRef = v24;
            v107.testId = ("%*--end-datetime-input"):format(v18.testId);
            l_createElement_1 = l_createElement_1(l_v12_0, v107);
        else
            l_createElement_1 = nil;
        end;
        v104.EndDateTime = l_createElement_1;
        v101 = v101(l_v14_1, v103, v104);
    else
        v101 = nil;
    end;
    v100.CalendarInputContainer = v101;
    v100.WeekAndDates = v3.createElement(v14, {
        LayoutOrder = 4, 
        tag = "size-full-0 auto-y", 
        testId = ("%*--weekAndDates"):format(v18.testId)
    }, v91);
    return l_createElement_0(l_v14_0, v99, v100);
end;