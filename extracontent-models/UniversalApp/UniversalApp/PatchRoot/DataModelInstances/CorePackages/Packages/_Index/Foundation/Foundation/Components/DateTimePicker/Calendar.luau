local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.CalendarDay);
local v5 = require(script.Parent.DateTimeUtilities);
local l_Icon_0 = v2.Icon;
local v7 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v8 = require(l_script_FirstAncestor_0.Components.IconButton);
local v9 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v10 = require(l_script_FirstAncestor_0.Components.Text);
local v11 = require(l_script_FirstAncestor_0.Components.TextInput);
local v12 = require(script.Parent.TimeDropdown);
local v13 = require(l_script_FirstAncestor_0.Components.View);
local v14 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v15 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
return function(v16) --[[ Line: 53 ]] --[[ Name: Calendar ]]
    -- upvalues: v15 (copy), v14 (copy), v3 (copy), v5 (copy), v10 (copy), v4 (copy), v13 (copy), v8 (copy), l_Icon_0 (copy), v9 (copy), v7 (copy), v12 (copy), v11 (copy)
    local v17 = v15();
    local v18 = v14(272);
    local v19 = v3.useRef(false);
    local v20, v21 = v3.useState(v16.defaultDates);
    local v22 = v3.useRef(nil);
    local v23, v24 = v3.useState(if v16.showEndDateTimeCalendarInput then {
        startDateTimeInput = false, 
        endDateTimeInput = true
    } else {
        startDateTimeInput = true, 
        endDateTimeInput = false
    });
    v3.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v16 (copy), v23 (copy), v22 (copy)
        if v16.showEndDateTimeCalendarInput and v23.endDateTimeInput and v22.current then
            v22.current.focus();
        end;
    end, {
        v23
    });
    local v25, v26 = v3.useState(v5.formatLocalTime(v16.defaultDates[1]));
    local v27, v28 = v3.useState(if v16.defaultDates[2] then v5.formatLocalTime(v16.defaultDates[2]) else "");
    v3.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v19 (copy)
        v19.current = true;
    end, {});
    local v29, v30 = v3.useState({
        month = v16.defaultDates[1]:ToLocalTime().Month, 
        year = v16.defaultDates[1]:ToLocalTime().Year
    });
    local v31 = {};
    for _, v33 in v20 do
        table.insert(v31, v33:ToLocalTime());
    end;
    local function v35() --[[ Line: 102 ]]
        -- upvalues: v5 (ref), v25 (copy), v20 (copy), v26 (copy), v16 (copy)
        local v34 = v5.getDateTimeFromText(v25);
        if not v34 and v20[1] or v34 and v20[2] and v5.roundToStartOfDay(v34) > v5.roundToStartOfDay(v20[2]) then
            v26(v5.formatLocalTime(v16.defaultDates[1]));
        end;
    end;
    local function v37() --[[ Line: 121 ]]
        -- upvalues: v5 (ref), v27 (copy), v20 (copy), v28 (copy), v16 (copy)
        local v36 = v5.getDateTimeFromText(v27);
        if not v36 and v20[2] or v36 and v20[1] and v5.roundToStartOfDay(v36) < v5.roundToStartOfDay(v20[1]) then
            v28(v5.formatLocalTime(v16.defaultDates[2]));
        end;
    end;
    local v40 = v3.useCallback(function() --[[ Line: 136 ]]
        -- upvalues: v5 (ref), v29 (copy), v30 (copy)
        local v38, v39 = v5.getNextMonthInfo(v29.month, v29.year);
        v30({
            month = v38, 
            year = v39
        });
    end, {
        v29
    });
    local v43 = v3.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v5 (ref), v29 (copy), v30 (copy)
        local v41, v42 = v5.getPrevMonthInfo(v29.month, v29.year);
        v30({
            month = v41, 
            year = v42
        });
    end, {
        v29
    });
    local v48 = v3.useCallback(function(v44, v45, v46) --[[ Line: 147 ]]
        -- upvalues: v20 (copy), v16 (copy), v23 (copy), v26 (copy), v5 (ref), v24 (copy), v28 (copy), v30 (copy), v21 (copy)
        local v47 = DateTime.fromLocalTime(v46, v45, v44, v20[1]:ToLocalTime().Hour, v20[1]:ToLocalTime().Minute);
        if v16.showStartDateTimeCalendarInput then
            if v16.showEndDateTimeCalendarInput then
                if v23.startDateTimeInput then
                    v26(v5.formatLocalTime(v47));
                    v24({
                        startDateTimeInput = false, 
                        endDateTimeInput = true
                    });
                elseif v23.endDateTimeInput then
                    v28(v5.formatLocalTime(v47));
                    v24({
                        startDateTimeInput = false, 
                        endDateTimeInput = false
                    });
                else
                    v26(v5.formatLocalTime(v47));
                    v28("");
                    v24({
                        startDateTimeInput = false, 
                        endDateTimeInput = true
                    });
                end;
            else
                v26(v5.formatLocalTime(v47));
            end;
            v30({
                month = v45, 
                year = v46
            });
            return;
        else
            v30({
                month = v45, 
                year = v46
            });
            v21({
                v47
            });
            v16.onSelectedDateChanged({
                v47
            });
            return;
        end;
    end, {
        v16.showStartDateTimeCalendarInput, 
        v16.showEndDateTimeCalendarInput, 
        v20, 
        v23, 
        v22
    });
    local v53 = v3.useCallback(function(v49) --[[ Line: 192 ]]
        -- upvalues: v31 (copy)
        local v50 = v49:ToLocalTime();
        for _, v52 in v31 do
            if v52.Day == v50.Day and v52.Month == v50.Month and v52.Year == v50.Year then
                return true;
            end;
        end;
        return false;
    end, {
        v31
    });
    local v55 = v3.useCallback(function(v54) --[[ Line: 206 ]]
        -- upvalues: v16 (copy), v20 (copy), v5 (ref)
        return v16.showEndDateTimeCalendarInput and v20[1] and v20[2] and v5.isDateWithinRange(v54, {
            startDate = v20[1], 
            endDate = v20[2]
        });
    end, {
        v16.showEndDateTimeCalendarInput, 
        v20
    });
    local v57 = v3.useCallback(function(v56) --[[ Line: 217 ]]
        -- upvalues: v16 (copy), v5 (ref), v23 (copy), v20 (copy)
        if v16.selectableDateRange and not v5.isDateWithinRange(v56, v16.selectableDateRange) then
            return false;
        else
            if v16.showEndDateTimeCalendarInput then
                if v23.endDateTimeInput and v5.roundToStartOfDay(v56) < v5.roundToStartOfDay(v20[1]) then
                    return false;
                elseif v23.startDateTimeInput and v20[2] and v5.roundToStartOfDay(v56) > v5.roundToStartOfDay(v20[2]) then
                    return false;
                end;
            end;
            return true;
        end;
    end, {
        v20, 
        v16.selectableDateRange, 
        v23, 
        v16.showEndDateTimeCalendarInput
    });
    local v62 = v3.useCallback(function(v58) --[[ Line: 251 ]]
        -- upvalues: v19 (copy), v26 (copy), v5 (ref), v16 (copy), v20 (copy), v30 (copy), v21 (copy)
        if not v19.current then
            return;
        else
            v26(v58);
            local v59 = v5.getDateTimeFromText(v58);
            if v59 then
                local v60 = if v16.showEndDateTimeCalendarInput then {
                    v59, 
                    v20[2]
                } else {
                    v59
                };
                local v61 = v59:ToLocalTime();
                v30({
                    month = v61.Month, 
                    year = v61.Year
                });
                v21(v60);
                v16.onSelectedDateChanged(v60);
            end;
            return;
        end;
    end, {
        v16.onSelectedDateChanged, 
        v16.showEndDateTimeCalendarInput, 
        v57, 
        v20, 
        v19
    });
    local v68 = v3.useCallback(function(v63) --[[ Line: 282 ]]
        -- upvalues: v19 (copy), v28 (copy), v5 (ref), v20 (copy), v30 (copy), v21 (copy), v16 (copy)
        if not v19.current then
            return;
        else
            v28(v63);
            local v64 = v5.getDateTimeFromText(v63);
            if v64 then
                if v20[1] and v5.roundToStartOfDay(v64) < v5.roundToStartOfDay(v20[1]) then
                    return;
                else
                    local v65 = {
                        v20[1], 
                        v64
                    };
                    local v66 = v64:ToLocalTime();
                    v30({
                        month = v66.Month, 
                        year = v66.Year
                    });
                    v21(v65);
                    v16.onSelectedDateChanged(v65);
                    return;
                end;
            elseif v63 == "" then
                v21(function(v67) --[[ Line: 308 ]]
                    -- upvalues: v16 (ref)
                    v16.onSelectedDateChanged({
                        v67[1]
                    });
                    return {
                        v67[1]
                    };
                end);
                return;
            else
                return;
            end;
        end;
    end, {
        v16.onSelectedDateChanged, 
        v20, 
        v57, 
        v19
    });
    local v89 = v3.useMemo(function() --[[ Line: 317 ]]
        -- upvalues: v3 (ref), v17 (copy), v18 (copy), v5 (ref), v10 (ref), v29 (copy), v4 (ref), v55 (copy), v57 (copy), v53 (copy), v48 (copy), v16 (copy)
        local v69 = {};
        table.insert(v69, v3.createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(v17.Padding.None, v17.Padding.None), 
            CellSize = UDim2.fromOffset(v18 / 7, v18 / 7), 
            FillDirection = Enum.FillDirection.Horizontal, 
            FillDirectionMaxCells = 7, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            key = "layout", 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }));
        local v70 = 1;
        for _, v72 in v5.weekdays do
            table.insert(v69, v3.createElement(v10, {
                key = v72, 
                LayoutOrder = v70, 
                Text = v72, 
                tag = "text-align-x-center text-align-y-center text-body-small"
            }));
            v70 = v70 + 1;
        end;
        local v73 = v5.getFirstDayOfWeek(v29.month, v29.year);
        local v74, v75 = v5.getPrevMonthInfo(v29.month, v29.year);
        local v76 = v5.getDaysInMonth(v5.getPrevMonthInfo(v29.month, v29.year));
        local v77 = v73 == 0 and 7 or v73;
        for v78 = 1, v77 do
            local v79 = v76 - v77 + v78;
            local v80 = DateTime.fromLocalTime(v75, v74, v79);
            table.insert(v69, v3.createElement(v4, {
                highlight = v55(v80), 
                isSelectable = v57(v80), 
                isSelected = v53(v80), 
                key = "prev-month-day-" .. v79, 
                LayoutOrder = v70, 
                onActivated = function() --[[ Line: 376 ]] --[[ Name: onActivated ]]
                    -- upvalues: v48 (ref), v79 (copy), v74 (copy), v75 (copy)
                    v48(v79, v74, v75);
                end, 
                Text = tostring(v79), 
                testId = ("%*--prev-month-calendar-day-%*"):format(v16.testId, v79)
            }));
            v70 = v70 + 1;
        end;
        for v81 = 1, v5.getDaysInMonth(v29.month, v29.year) do
            local v82 = v57(DateTime.fromLocalTime(v29.year, v29.month, v81));
            local v83 = v53(DateTime.fromLocalTime(v29.year, v29.month, v81));
            table.insert(v69, v3.createElement(v4, {
                emphasizeText = v82 and not v83, 
                highlight = v55(DateTime.fromLocalTime(v29.year, v29.month, v81)), 
                isSelectable = v82, 
                isSelected = v83, 
                key = "current-month-day-" .. v81, 
                LayoutOrder = v70, 
                onActivated = function() --[[ Line: 407 ]] --[[ Name: onActivated ]]
                    -- upvalues: v48 (ref), v81 (copy), v29 (ref)
                    v48(v81, v29.month, v29.year);
                end, 
                Text = tostring(v81), 
                testId = ("%*--current-month-calendar-day-%*"):format(v16.testId, v81)
            }));
            v70 = v70 + 1;
        end;
        local v84 = v5.getLastDayOfWeek(v29.month, v29.year);
        local v85, v86 = v5.getNextMonthInfo(v29.month, v29.year);
        v77 = 7 - (v84 + 1);
        if v77 == 0 then
            v77 = 7;
        end;
        if v77 + #v69 < 50 then
            v77 = v77 + (50 - #v69 - v77);
        end;
        for v87 = 1, v77 do
            local v88 = DateTime.fromLocalTime(v86, v85, v87);
            table.insert(v69, v3.createElement(v4, {
                highlight = v55(v88), 
                isSelectable = v57(v88), 
                isSelected = v53(v88), 
                key = "next-month-day-" .. v87, 
                LayoutOrder = v70, 
                onActivated = function() --[[ Line: 445 ]] --[[ Name: onActivated ]]
                    -- upvalues: v48 (ref), v87 (copy), v85 (copy), v86 (copy)
                    v48(v87, v85, v86);
                end, 
                Text = tostring(v87), 
                testId = ("%*--next-month-calendar-day-%*"):format(v16.testId, v87)
            }));
            v70 = v70 + 1;
        end;
        return v69;
    end, {
        v53, 
        v55, 
        v57, 
        v29, 
        v20, 
        v48, 
        v16.selectableDateRange, 
        v16.showEndDateTimeCalendarInput
    });
    local v93 = v3.useCallback(function(v90) --[[ Line: 470 ]]
        -- upvalues: v21 (copy), v16 (copy)
        local v91 = DateTime.fromUnixTimestamp(v90);
        if os.date("*t", v90).isdst then
            local v92 = v91:ToLocalTime();
            v91 = DateTime.fromLocalTime(v92.Year, v92.Month, v92.Day, v92.Hour == 0 and 23 or v92.Hour - 1, v92.Minute, v92.Second);
        end;
        v21({
            v91
        });
        v16.onSelectedDateChanged({
            v91
        });
    end, {
        v20, 
        v16.onSelectedDateChanged
    });
    local l_createElement_0 = v3.createElement;
    local l_v13_0 = v13;
    local v96 = {
        LayoutOrder = v16.LayoutOrder, 
        tag = "col auto-y", 
        Size = UDim2.fromOffset(v18, 0), 
        testId = v16.testId
    };
    local v97 = {
        CalendarHeader = v3.createElement(v13, {
            LayoutOrder = 1, 
            tag = "row size-full-0 auto-y gap-small align-y-center padding-y-small"
        }, {
            PreviousMonthButton = v3.createElement(v8, {
                LayoutOrder = 1, 
                icon = l_Icon_0.ChevronSmallLeft, 
                isCircular = true, 
                onActivated = v43, 
                size = v9.Small, 
                variant = v7.Utility, 
                testId = ("%*--previous-month-button"):format(v16.testId)
            }), 
            MonthText = v3.createElement(v10, {
                LayoutOrder = 2, 
                Text = v5.monthMap[v29.month], 
                tag = "grow text-align-x-right auto-xy", 
                testId = ("%*--month-text"):format(v16.testId)
            }), 
            YearText = v3.createElement(v10, {
                LayoutOrder = 3, 
                Text = tostring(v29.year), 
                tag = "grow text-align-x-left auto-xy", 
                testId = ("%*--year-text"):format(v16.testId)
            }), 
            NextMonthButton = v3.createElement(v8, {
                LayoutOrder = 4, 
                icon = l_Icon_0.ChevronSmallRight, 
                isCircular = true, 
                onActivated = v40, 
                size = v9.Small, 
                variant = v7.Utility, 
                testId = ("%*--next-month-button"):format(v16.testId)
            })
        }), 
        TimeDropdown = if v16.showTimeDropdown then v3.createElement(v12, {
            dateTime = v20[1], 
            layoutOrder = 2, 
            onItemChanged = v93, 
            width = UDim.new(1, 0), 
            testId = ("%*--time-dropdown"):format(v16.testId)
        }) else nil
    };
    local v98;
    if v16.showStartDateTimeCalendarInput then
        v98 = v3.createElement;
        local l_v13_1 = v13;
        local v100 = {
            LayoutOrder = 3, 
            tag = "flex-x-fill size-full-0 auto-y row gap-small align-y-center", 
            testId = ("%*--input"):format(v16.testId)
        };
        local v101 = {};
        local l_createElement_1 = v3.createElement;
        local l_v11_0 = v11;
        local v104 = {};
        local v105 = false;
        if v25 ~= "" then
            v105 = v5.getDateTimeFromText(v25) == nil;
        end;
        v104.hasError = v105;
        v104.label = "";
        v104.LayoutOrder = 1;
        v104.onChanged = v62;
        v104.onFocusLost = v35;
        v104.placeholder = "MM/DD/YYYY";
        v104.size = v9.Medium;
        v104.text = v25;
        v104.onFocusGained = function() --[[ Line: 560 ]] --[[ Name: onFocusGained ]]
            -- upvalues: v24 (copy)
            v24({
                startDateTimeInput = true, 
                endDateTimeInput = false
            });
        end;
        v104.testId = ("%*--start-datetime-input"):format(v16.testId);
        v101.StartDateTime = l_createElement_1(l_v11_0, v104);
        v101.InputSeparator = if v16.showEndDateTimeCalendarInput then v3.createElement(v10, {
            LayoutOrder = 2, 
            tag = "auto-xy", 
            Text = "-"
        }) else nil;
        if v16.showEndDateTimeCalendarInput then
            l_createElement_1 = v3.createElement;
            l_v11_0 = v11;
            v104 = {};
            v105 = false;
            if v27 ~= "" then
                v105 = v5.getDateTimeFromText(v27) == nil;
            end;
            v104.hasError = v105;
            v104.isDisabled = not v20[1];
            v104.label = "";
            v104.LayoutOrder = 3;
            v104.onChanged = v68;
            v104.onFocusGained = function() --[[ Line: 580 ]] --[[ Name: onFocusGained ]]
                -- upvalues: v24 (copy)
                v24({
                    startDateTimeInput = false, 
                    endDateTimeInput = true
                });
            end;
            v104.onFocusLost = v37;
            v104.placeholder = "MM/DD/YYYY";
            v104.size = v9.Medium;
            v104.text = v27;
            v104.textBoxRef = v22;
            v104.testId = ("%*--end-datetime-input"):format(v16.testId);
            l_createElement_1 = l_createElement_1(l_v11_0, v104);
        else
            l_createElement_1 = nil;
        end;
        v101.EndDateTime = l_createElement_1;
        v98 = v98(l_v13_1, v100, v101);
    else
        v98 = nil;
    end;
    v97.CalendarInputContainer = v98;
    v97.WeekAndDates = v3.createElement(v13, {
        LayoutOrder = 4, 
        tag = "size-full-0 auto-y", 
        testId = ("%*--weekAndDates"):format(v16.testId)
    }, v89);
    return l_createElement_0(l_v13_0, v96, v97);
end;