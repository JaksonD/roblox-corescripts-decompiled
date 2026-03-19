local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.React);
local l_FitChildren_0 = require(l_Parent_0.AuthCommon).Components.FitChildren;
local v6 = require(l_Parent_0.ArgCheck);
local l_TimeUnit_0 = require(l_Parent_0.Time).TimeUnit;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v9 = require(l_Parent_0.ReactFocusNavigation);
local v10 = game:DefineFastFlag("SkipBirthdayPickerUpdateOnMount", false);
local v11 = game:DefineFastFlag("FixedSizeBirthdayPickerWheelContainer", false);
local v12 = game:DefineFastFlag("BirthdayPickerCenteringFix2", false);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v14 = require(l_Parent_0.InputHandlers);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ScrollingPicker_0 = require(l_Parent_0.AuthCommon).Components.ScrollingPicker;
local l_DateHelper_0 = require(l_Parent_0.Time).DateHelper;
local v19 = {
    Default = "Default", 
    Emphasized = "Emphasized", 
    Muted = "Muted"
};
local v20 = {};
for v21 = 1, 31 do
    table.insert(v20, v21);
end;
local v22 = {
    [Enum.KeyCode.ButtonA] = l_FocusNavigationEventNameEnum_0.Confirm, 
    [Enum.KeyCode.Return] = l_FocusNavigationEventNameEnum_0.Confirm
};
local l_ReasonDateInvalid_0 = l_DateHelper_0.ReasonDateInvalid;
local l_MonthsLocalizationKeys_0 = l_DateHelper_0.MonthsLocalizationKeys;
local l_DateTypeOrder_0 = l_DateHelper_0.DateTypeOrder;
local v26 = v3.PureComponent:extend("BirthdayPicker");
v26.defaultProps = {
    minAgeAllowed = 0, 
    maxAgeAllowed = 99, 
    NextSelectionUp = nil, 
    NextSelectionDown = nil, 
    skipUpdateOnMount = false, 
    shouldExpandTapTarget = false, 
    tapTargetExpansionSize = 0
};
local function v30(v27) --[[ Line: 78 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v9 (copy), v22 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v14 (copy)
    local v28 = v9.useEventMap(v22, v27);
    local v29 = v4.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v14 (ref)
        return {
            [l_FocusNavigationEventNameEnum_0.Confirm] = {
                handler = v14.onRelease(function() --[[ Line: 83 ]]

                end)
            }
        };
    end, {});
    return v9.useEventHandlerMap(v29, v28);
end;
v26.init = function(v31) --[[ Line: 90 ]] --[[ Name: init ]]
    -- upvalues: l_DateTime_0 (copy), l_TimeUnit_0 (copy), v6 (copy), v3 (copy), l_withStyle_0 (copy), v19 (copy), v11 (copy), l_FitChildren_0 (copy)
    v31.isMounted = false;
    local l_Values_0 = l_DateTime_0.now():GetValues();
    v31.currentDate = {
        [l_TimeUnit_0.Months] = v6.isNonNegativeNumber(l_Values_0.Month, "current month in BirthdayPicker"), 
        [l_TimeUnit_0.Days] = v6.isNonNegativeNumber(l_Values_0.Day, "current day in BirthdayPicker"), 
        [l_TimeUnit_0.Years] = v6.isNonNegativeNumber(l_Values_0.Year, "current year in BirthdayPicker")
    };
    local v33 = v31.currentDate[l_TimeUnit_0.Years];
    local l_minAgeAllowed_0 = v31.props.minAgeAllowed;
    local v35 = v33 - v31.props.maxAgeAllowed;
    local v36 = v33 - l_minAgeAllowed_0;
    v31.dummyYears = {};
    for v37 = v35, v36 do
        table.insert(v31.dummyYears, v37);
    end;
    local l_initialMonth_0 = v31.props.initialMonth;
    local l_initialDay_0 = v31.props.initialDay;
    local l_initialYear_0 = v31.props.initialYear;
    local v41 = nil;
    if l_initialYear_0 then
        v41 = math.clamp(l_initialYear_0, v35, v36) - v35 + 1;
    end;
    v31.state = {
        selectedMonthIndex = l_initialMonth_0 or 1, 
        selectedDayIndex = l_initialDay_0 or 1, 
        selectedYearIndex = v41 or #v31.dummyYears + -1, 
        continueButtonEnabled = true
    };
    v31.datePickerRef = v3.createRef();
    v31.defaultRef = v3.createRef();
    v31.shouldExpandTapTarget = v31.props.shouldExpandTapTarget;
    v31.tapTargetExpansionSize = v31.props.tapTargetExpansionSize;
    v31.renderEntryTextfunction = function(v42, v43) --[[ Line: 138 ]]
        -- upvalues: l_withStyle_0 (ref), v19 (ref), v3 (ref)
        return l_withStyle_0(function(v44) --[[ Line: 139 ]]
            -- upvalues: v43 (copy), v19 (ref), v3 (ref), v42 (copy)
            local l_Font_0 = v44.Font.Body.Font;
            local v46 = v44.Font.BaseSize * v44.Font.Body.RelativeSize;
            local l_Color_0 = v44.Theme.TextDefault.Color;
            local l_Transparency_0 = v44.Theme.TextDefault.Transparency;
            if v43 == v19.Muted then
                l_Color_0 = v44.Theme.TextMuted.Color;
                l_Transparency_0 = v44.Theme.TextMuted.Transparency;
            elseif v43 == v19.Emphasized then
                l_Font_0 = v44.Font.Header1.Font;
                v46 = v44.Font.BaseSize * v44.Font.Header1.RelativeSize;
                l_Color_0 = v44.Theme.TextEmphasis.Color;
                l_Transparency_0 = v44.Theme.TextEmphasis.Transparency;
            end;
            return v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = tostring(v42), 
                Font = l_Font_0, 
                TextSize = v46, 
                TextColor3 = l_Color_0, 
                TextTransparency = l_Transparency_0
            });
        end);
    end;
    v31.renderWheelContainerFunction = function(v49) --[[ Line: 168 ]]
        -- upvalues: v11 (ref), v3 (ref), v31 (copy), l_FitChildren_0 (ref)
        if v11 then
            return v3.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 200), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ClipsDescendants = not v31.shouldExpandTapTarget, 
                [v3.Ref] = v31.props.focusNavigationRef
            }, v49);
        else
            return v3.createElement(l_FitChildren_0.FitFrame, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = l_FitChildren_0.FitAxis.Height, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, v49);
        end;
    end;
    v31.onSelectedIndexChangedForMonth = function(v50) --[[ Line: 190 ]]
        -- upvalues: v31 (copy)
        if v31.state.selectedMonthIndex ~= v50 then
            spawn(function() --[[ Line: 194 ]]
                -- upvalues: v31 (ref), v50 (copy)
                if v31.isMounted then
                    v31:setState({
                        selectedMonthIndex = v50
                    });
                end;
            end);
        end;
    end;
    v31.onSelectedIndexChangedForDay = function(v51) --[[ Line: 204 ]]
        -- upvalues: v31 (copy)
        if v31.state.selectedDayIndex ~= v51 then
            spawn(function() --[[ Line: 208 ]]
                -- upvalues: v31 (ref), v51 (copy)
                if v31.isMounted then
                    v31:setState({
                        selectedDayIndex = v51
                    });
                end;
            end);
        end;
    end;
    v31.onSelectedIndexChangedForYear = function(v52) --[[ Line: 218 ]]
        -- upvalues: v31 (copy)
        if v31.state.selectedYearIndex ~= v52 then
            spawn(function() --[[ Line: 222 ]]
                -- upvalues: v31 (ref), v52 (copy)
                if v31.isMounted then
                    v31:setState({
                        selectedYearIndex = v52
                    });
                end;
            end);
        end;
    end;
    v31.onActivated = function(_) --[[ Line: 232 ]]
        -- upvalues: v31 (copy)
        if v31.props.focusedGuiObject and v31.datePickerRef and v31.defaultRef.current then
            v31.props.focusGuiObject(v31.defaultRef.current, true);
        end;
    end;
    v31.onEntryActivated = function() --[[ Line: 238 ]]
        -- upvalues: v31 (copy)
        if v31.props.focusedGuiObject and v31.datePickerRef and v31.datePickerRef.current then
            v31.props.focusGuiObject(v31.datePickerRef.current, true);
        end;
    end;
end;
v26.didMount = function(v54) --[[ Line: 245 ]] --[[ Name: didMount ]]
    -- upvalues: v10 (copy)
    local l_updateBirthday_0 = v54.props.updateBirthday;
    local l_selectedMonthIndex_0 = v54.state.selectedMonthIndex;
    local l_selectedDayIndex_0 = v54.state.selectedDayIndex;
    local l_selectedYearIndex_0 = v54.state.selectedYearIndex;
    local v59 = v54.dummyYears[l_selectedYearIndex_0];
    if l_updateBirthday_0 and (not v10 or not v54.props.skipUpdateOnMount) then
        l_updateBirthday_0(l_selectedMonthIndex_0, l_selectedDayIndex_0, v59);
    end;
    if v54.props.focusedGuiObject and v54.datePickerRef and v54.datePickerRef.current then
        v54.props.focusGuiObject(v54.datePickerRef.current, true);
    end;
    v54.isMounted = true;
end;
v26.willUnmount = function(v60) --[[ Line: 264 ]] --[[ Name: willUnmount ]]
    v60.isMounted = false;
end;
v26.updatePickerState = function(v61) --[[ Line: 268 ]] --[[ Name: updatePickerState ]]
    -- upvalues: l_DateHelper_0 (copy), l_ReasonDateInvalid_0 (copy)
    local l_selectedMonthIndex_1 = v61.state.selectedMonthIndex;
    local l_selectedDayIndex_1 = v61.state.selectedDayIndex;
    local l_selectedYearIndex_1 = v61.state.selectedYearIndex;
    local v65 = v61.dummyYears[l_selectedYearIndex_1];
    local v66 = false;
    local v67, v68 = l_DateHelper_0:isValidDate(l_selectedMonthIndex_1, l_selectedDayIndex_1, v65);
    if not v67 and v68 == l_ReasonDateInvalid_0.IsInvalidDayOfMonth then
        v66 = true;
        l_selectedDayIndex_1 = l_DateHelper_0:getLastDayOfTheMonthInYear(l_selectedMonthIndex_1, v65);
    end;
    spawn(function() --[[ Line: 284 ]]
        -- upvalues: v61 (copy), v66 (ref), l_selectedDayIndex_1 (ref), v67 (copy)
        if v61.isMounted then
            v61:setState({
                selectedDayIndex = v66 and l_selectedDayIndex_1 or nil, 
                continueButtonEnabled = v67
            });
        end;
    end);
end;
v26.didUpdate = function(v69) --[[ Line: 294 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_DateHelper_0 (copy)
    local l_updateBirthday_1 = v69.props.updateBirthday;
    local l_selectedMonthIndex_2 = v69.state.selectedMonthIndex;
    local l_selectedDayIndex_2 = v69.state.selectedDayIndex;
    local l_selectedYearIndex_2 = v69.state.selectedYearIndex;
    local v74 = v69.dummyYears[l_selectedYearIndex_2];
    if v69.state.continueButtonEnabled ~= l_DateHelper_0:isValidDate(l_selectedMonthIndex_2, l_selectedDayIndex_2, v74) then
        v69:updatePickerState();
    end;
    if l_updateBirthday_1 then
        l_updateBirthday_1(l_selectedMonthIndex_2, l_selectedDayIndex_2, v74);
    end;
end;
v26.render = function(v75) --[[ Line: 312 ]] --[[ Name: render ]]
    -- upvalues: l_LocalizationService_0 (copy), l_DateTypeOrder_0 (copy), v12 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), v3 (copy), l_FitChildren_0 (copy), l_ScrollingPicker_0 (copy), l_TimeUnit_0 (copy), v19 (copy), l_MonthsLocalizationKeys_0 (copy), l_DateHelper_0 (copy), v20 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v77 = l_DateTypeOrder_0[l_RobloxLocaleId_0];
    local v78 = v12 and (not v75.shouldExpandTapTarget or v75.tapTargetExpansionSize <= 0);
    local l_layoutOrder_0 = v75.props.layoutOrder;
    local l_selectedMonthIndex_3 = v75.state.selectedMonthIndex;
    local l_selectedDayIndex_3 = v75.state.selectedDayIndex;
    local l_selectedYearIndex_3 = v75.state.selectedYearIndex;
    return l_withStyle_0(function(_) --[[ Line: 325 ]]
        -- upvalues: l_withLocalization_0 (ref), v3 (ref), l_FitChildren_0 (ref), l_layoutOrder_0 (copy), v75 (copy), v78 (copy), l_ScrollingPicker_0 (ref), v77 (copy), l_TimeUnit_0 (ref), l_withStyle_0 (ref), v19 (ref), l_MonthsLocalizationKeys_0 (ref), l_selectedMonthIndex_3 (copy), l_DateHelper_0 (ref), l_RobloxLocaleId_0 (copy), v20 (ref), l_selectedDayIndex_3 (copy), l_selectedYearIndex_3 (copy)
        return l_withLocalization_0({
            continueText = "Authentication.SignUp.Label.Continue"
        })(function(_) --[[ Line: 328 ]]
            -- upvalues: v3 (ref), l_FitChildren_0 (ref), l_layoutOrder_0 (ref), v75 (ref), v78 (ref), l_ScrollingPicker_0 (ref), v77 (ref), l_TimeUnit_0 (ref), l_withStyle_0 (ref), l_withLocalization_0 (ref), v19 (ref), l_MonthsLocalizationKeys_0 (ref), l_selectedMonthIndex_3 (ref), l_DateHelper_0 (ref), l_RobloxLocaleId_0 (ref), v20 (ref), l_selectedDayIndex_3 (ref), l_selectedYearIndex_3 (ref)
            return v3.createElement(l_FitChildren_0.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = l_FitChildren_0.FitAxis.Height, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 14)
                }), 
                DatePickerWrap = v3.createElement(l_FitChildren_0.FitFrame, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = l_FitChildren_0.FitAxis.Height, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    CenterFrame = v3.createElement("ImageLabel", {
                        Size = UDim2.new(1, 0, 0, 50), 
                        Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/DatePickerDivider.png", 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(2, 2, 4, 4), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ZIndex = 2
                    }), 
                    DatePicker = v3.createElement(l_FitChildren_0.FitTextButton, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = l_FitChildren_0.FitAxis.Height, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Selectable = true, 
                        NextSelectionUp = v75.props.NextSelectionUp, 
                        NextSelectionDown = v75.props.NextSelectionDown, 
                        NextSelectionLeft = v75.datePickerRef.current, 
                        NextSelectionRight = v75.datePickerRef.current, 
                        Text = "", 
                        [v3.Ref] = v75.datePickerRef, 
                        [v3.Event.Activated] = v75.onActivated
                    }, {
                        ListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        WheelContainer = v75.renderWheelContainerFunction({
                            ListLayout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Horizontal, 
                                SortOrder = Enum.SortOrder.LayoutOrder, 
                                VerticalAlignment = if v78 then Enum.VerticalAlignment.Center else nil
                            }), 
                            Padding = v3.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 5), 
                                PaddingRight = UDim.new(0, 5), 
                                PaddingTop = UDim.new(0, 5), 
                                PaddingBottom = UDim.new(0, 5)
                            }), 
                            MonthWheel = v3.createElement(l_ScrollingPicker_0, {
                                layoutOrder = v77[l_TimeUnit_0.Months], 
                                size = UDim2.new(0.45, 0, 0, 200), 
                                renderEntry = function(v85) --[[ Line: 393 ]] --[[ Name: renderEntry ]]
                                    -- upvalues: l_withStyle_0 (ref), l_withLocalization_0 (ref), v75 (ref), v19 (ref), l_MonthsLocalizationKeys_0 (ref)
                                    return l_withStyle_0(function(_) --[[ Line: 394 ]]
                                        -- upvalues: l_withLocalization_0 (ref), v85 (copy), v75 (ref), v19 (ref), l_MonthsLocalizationKeys_0 (ref)
                                        return l_withLocalization_0({
                                            monthText = v85
                                        })(function(v87) --[[ Line: 397 ]]
                                            -- upvalues: v75 (ref), v19 (ref), v85 (ref), l_MonthsLocalizationKeys_0 (ref)
                                            local l_selectedMonthIndex_4 = v75.state.selectedMonthIndex;
                                            local l_Default_0 = v19.Default;
                                            if v85 == l_MonthsLocalizationKeys_0[l_selectedMonthIndex_4] then
                                                l_Default_0 = v19.Emphasized;
                                            end;
                                            return v75.renderEntryTextfunction(v87.monthText, l_Default_0);
                                        end);
                                    end);
                                end, 
                                getEntryWrapperProps = function(v90) --[[ Line: 412 ]] --[[ Name: getEntryWrapperProps ]]
                                    -- upvalues: v75 (ref), v3 (ref), l_MonthsLocalizationKeys_0 (ref)
                                    local l_selectedMonthIndex_5 = v75.state.selectedMonthIndex;
                                    return {
                                        [v3.Ref] = if v90 == l_MonthsLocalizationKeys_0[l_selectedMonthIndex_5] then v75.defaultRef else nil
                                    };
                                end, 
                                entries = l_MonthsLocalizationKeys_0, 
                                entrySizeOnScrollingAxis = 50, 
                                onSelectedIndexChanged = v75.onSelectedIndexChangedForMonth, 
                                parentSpecifiedTarget = l_selectedMonthIndex_3, 
                                onEntryActivated = v75.onEntryActivated, 
                                shouldExpandTapTarget = v75.shouldExpandTapTarget, 
                                tapTargetExpansionSize = v75.tapTargetExpansionSize
                            }), 
                            DayWheel = v3.createElement(l_ScrollingPicker_0, {
                                layoutOrder = v77[l_TimeUnit_0.Days], 
                                size = UDim2.new(0.2, 0, 0, 200), 
                                renderEntry = function(v92) --[[ Line: 432 ]] --[[ Name: renderEntry ]]
                                    -- upvalues: l_withLocalization_0 (ref), l_DateHelper_0 (ref), v75 (ref), l_RobloxLocaleId_0 (ref), v19 (ref)
                                    return l_withLocalization_0({
                                        dayAffix = l_DateHelper_0.DayAffixLocalizationKey
                                    })(function(v93) --[[ Line: 435 ]]
                                        -- upvalues: v75 (ref), l_DateHelper_0 (ref), v92 (copy), l_RobloxLocaleId_0 (ref), v19 (ref)
                                        local l_selectedMonthIndex_6 = v75.state.selectedMonthIndex;
                                        local v95 = v75.dummyYears[v75.state.selectedYearIndex];
                                        local l_selectedDayIndex_4 = v75.state.selectedDayIndex;
                                        local l_l_DateHelper_0_FormattedDayString_0 = l_DateHelper_0:GetFormattedDayString(v92, v93.dayAffix, l_RobloxLocaleId_0);
                                        local l_Default_1 = v19.Default;
                                        if l_DateHelper_0:isInvalidDayOfTheMonth(l_selectedMonthIndex_6, v92, v95) then
                                            l_Default_1 = v19.Muted;
                                        elseif v92 == l_selectedDayIndex_4 then
                                            l_Default_1 = v19.Emphasized;
                                        end;
                                        return v75.renderEntryTextfunction(l_l_DateHelper_0_FormattedDayString_0, l_Default_1);
                                    end);
                                end, 
                                entries = v20, 
                                entrySizeOnScrollingAxis = 50, 
                                onSelectedIndexChanged = v75.onSelectedIndexChangedForDay, 
                                parentSpecifiedTarget = l_selectedDayIndex_3, 
                                onEntryActivated = v75.onEntryActivated, 
                                shouldExpandTapTarget = v75.shouldExpandTapTarget, 
                                tapTargetExpansionSize = v75.tapTargetExpansionSize
                            }), 
                            YearWheel = v3.createElement(l_ScrollingPicker_0, {
                                layoutOrder = v77[l_TimeUnit_0.Years], 
                                size = UDim2.new(0.35, 0, 0, 200), 
                                renderEntry = function(v99) --[[ Line: 466 ]] --[[ Name: renderEntry ]]
                                    -- upvalues: l_withLocalization_0 (ref), l_DateHelper_0 (ref), v75 (ref), l_RobloxLocaleId_0 (ref), v19 (ref)
                                    return l_withLocalization_0({
                                        yearAffix = l_DateHelper_0.YearAffixLocalizationKey
                                    })(function(v100) --[[ Line: 469 ]]
                                        -- upvalues: v75 (ref), l_DateHelper_0 (ref), v99 (copy), l_RobloxLocaleId_0 (ref), v19 (ref)
                                        local v101 = v75.dummyYears[v75.state.selectedYearIndex];
                                        local l_l_DateHelper_0_FormattedYearString_0 = l_DateHelper_0:GetFormattedYearString(v99, v100.yearAffix, l_RobloxLocaleId_0);
                                        local l_Default_2 = v19.Default;
                                        if v99 == v101 then
                                            l_Default_2 = v19.Emphasized;
                                        end;
                                        return v75.renderEntryTextfunction(l_l_DateHelper_0_FormattedYearString_0, l_Default_2);
                                    end);
                                end, 
                                entries = v75.dummyYears, 
                                entrySizeOnScrollingAxis = 50, 
                                onSelectedIndexChanged = v75.onSelectedIndexChangedForYear, 
                                parentSpecifiedTarget = l_selectedYearIndex_3, 
                                onEntryActivated = v75.onEntryActivated, 
                                shouldExpandTapTarget = v75.shouldExpandTapTarget, 
                                tapTargetExpansionSize = v75.tapTargetExpansionSize
                            })
                        })
                    })
                })
            });
        end);
    end);
end;
return function(v104) --[[ Line: 500 ]]
    -- upvalues: v9 (copy), v30 (copy), v3 (copy), v26 (copy), v2 (copy)
    local v105 = v9.useFocusedGuiObject();
    local v106 = v9.useFocusGuiObject();
    local v107 = v30(nil);
    return v3.createElement(v26, v2.Dictionary.join(v104, {
        focusedGuiObject = v105, 
        focusGuiObject = v106, 
        focusNavigationRef = v107
    }));
end;