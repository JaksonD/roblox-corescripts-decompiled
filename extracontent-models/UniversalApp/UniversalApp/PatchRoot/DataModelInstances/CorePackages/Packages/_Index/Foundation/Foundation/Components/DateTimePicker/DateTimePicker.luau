local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local l_Icon_0 = v2.Icon;
local v5 = require(script.Parent.Calendar);
local v6 = require(script.Parent.DateTimeUtilities);
local v7 = require(l_script_FirstAncestor_0.Components.Button);
local v8 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v9 = require(l_script_FirstAncestor_0.Utility.Flags);
local l_GuiService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers.Services).GuiService;
local v11 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v12 = require(l_script_FirstAncestor_0.Components.Popover);
local v13 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v14 = require(l_script_FirstAncestor_0.Components.TextInput);
local v15 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v17 = require(l_script_FirstAncestor_0.Components.View);
local v18 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v19 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v20 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_FoundationDateTimePickerScreenSize_0 = v9.FoundationDateTimePickerScreenSize;
local l_FoundationDateTimePickerDefaultDateFix_0 = v9.FoundationDateTimePickerDefaultDateFix;
local v23 = require(l_script_FirstAncestor_0.Enums.DateTimePickerVariant);
local v24 = {
    defaultDates = if l_FoundationDateTimePickerDefaultDateFix_0 then nil else {
        DateTime.now()
    }, 
    variant = v23.Single, 
    testId = "--foundation-date-time-picker"
};
return v3.memo(function(v25) --[[ Line: 74 ]] --[[ Name: DateTimePicker ]]
    -- upvalues: v20 (copy), v24 (copy), v18 (copy), v3 (copy), l_FoundationDateTimePickerDefaultDateFix_0 (copy), v23 (copy), v6 (copy), l_FoundationDateTimePickerScreenSize_0 (copy), l_GuiService_0 (copy), v12 (copy), v14 (copy), v19 (copy), l_Icon_0 (copy), v15 (copy), v11 (copy), v13 (copy), v17 (copy), v5 (copy), v7 (copy), v8 (copy)
    local v26 = v20(v25, v24);
    local v27 = v18();
    local v28, v29 = v3.useState(false);
    local v30 = v3.useRef(nil);
    local v31 = nil;
    if l_FoundationDateTimePickerDefaultDateFix_0 then
        v31 = v3.useMemo(function() --[[ Line: 83 ]]
            -- upvalues: v26 (copy)
            local l_defaultDates_0 = v26.defaultDates;
            if l_defaultDates_0 then
                if typeof(l_defaultDates_0) ~= "table" then
                    return {
                        l_defaultDates_0
                    };
                else
                    return l_defaultDates_0;
                end;
            else
                return nil;
            end;
        end, {
            v26.defaultDates
        });
    else
        v31 = v26.defaultDates;
        if v26.defaultDates and typeof(v26.defaultDates) ~= "table" then
            v31 = {
                v26.defaultDates
            };
        end;
    end;
    local v33, v34 = v3.useState(if v31 then if v26.variant == v23.Dual then ("%* - %*"):format(v6.formatLocalTime(v31[1]), if v31[2] then v6.formatLocalTime(v31[2]) else "") else v6.formatLocalTime(v31[1], v26.variant == v23.SingleWithTime) else "");
    local v35, v36 = v3.useState(v31);
    local v37 = v3.useCallback(function() --[[ Line: 118 ]]
        -- upvalues: v29 (copy)
        v29(false);
    end, {});
    local v38 = v3.useCallback(function() --[[ Line: 122 ]]
        -- upvalues: v29 (copy)
        v29(true);
    end, {});
    local v39 = if l_FoundationDateTimePickerScreenSize_0 then v3.useCallback(function() --[[ Line: 127 ]]
        -- upvalues: l_GuiService_0 (ref), v38 (copy)
        if l_GuiService_0.ViewportDisplaySize ~= Enum.DisplaySize.Small then
            v38();
        end;
    end, {
        v38, 
        l_GuiService_0.ViewportDisplaySize
    }) else nil;
    local v46 = v3.useCallback(function(v40) --[[ Line: 135 ]]
        -- upvalues: v34 (copy), v26 (copy), v23 (ref), v6 (ref)
        v34(v40);
        if v40:match("^%s*$") then
            return;
        elseif v26.variant == v23.Dual then
            local v41 = v40:split("-");
            local v42 = v6.getDateTimeFromText(v41[1]);
            local v43 = v6.getDateTimeFromText(v41[2]);
            v26.onChanged(v42, v43);
            return;
        else
            local v44 = v40:match("^%s*(.-)%s*$") or "";
            local v45 = v6.getDateTimeFromText(v44);
            v26.onChanged(v45);
            return;
        end;
    end, {
        v26.onChanged
    });
    local v49 = v3.useCallback(function() --[[ Line: 159 ]]
        -- upvalues: v26 (copy), v23 (ref), v6 (ref), v35 (copy), v34 (copy), v37 (copy)
        if v26.variant == v23.Dual then
            local v47 = v6.formatLocalTime(v35[1]);
            local v48 = if v35[2] then v6.formatLocalTime(v35[2]) else "";
            v34(v47 .. " - " .. v48);
        else
            v34(v6.formatLocalTime(v35[1], v26.variant == v23.SingleWithTime));
        end;
        v37();
    end, {
        v35, 
        v37
    });
    local function v51() --[[ Line: 183 ]]
        -- upvalues: l_FoundationDateTimePickerDefaultDateFix_0 (ref), v35 (copy), v26 (copy), v23 (ref)
        if l_FoundationDateTimePickerDefaultDateFix_0 and not v35 then
            return false;
        elseif v26.variant == v23.Single or v26.variant == v23.SingleWithTime then
            return v35[1] == nil;
        elseif v26.variant == v23.Dual then
            local v50 = true;
            if v35[1] ~= nil then
                v50 = true;
                if v35[2] ~= nil then
                    v50 = v35[1].UnixTimestamp > v35[2].UnixTimestamp;
                end;
            end;
            return v50;
        else
            return false;
        end;
    end;
    return v3.createElement(v12.Root, {
        isOpen = v28, 
        testId = v26.testId
    }, {
        DateInput = v3.createElement(v14, v19(v26, {
            hasError = v26.hasError, 
            hint = v26.hint, 
            iconTrailing = {
                name = l_Icon_0.Calendar, 
                onActivated = v38
            }, 
            isDisabled = v26.isDisabled, 
            isRequired = v26.isRequired, 
            key = "date-input", 
            label = v26.label, 
            onChanged = v46, 
            onFocusGained = if l_FoundationDateTimePickerScreenSize_0 then v39 else v38, 
            placeholder = v15:FormatByKey("CommonUI.Controls.Label.SelectDate"), 
            ref = v30, 
            selectableDateRange = v26.selectableDateRange, 
            size = v11.Medium, 
            text = v33, 
            testId = ("%*--text-input"):format(v26.testId), 
            width = v26.width
        })), 
        Anchor = v3.createElement(v12.Anchor, {
            anchorRef = v30
        }), 
        Calendar = v3.createElement(v12.Content, {
            hasArrow = false, 
            onPressedOutside = v37, 
            side = {
                position = v13.Bottom, 
                offset = v27.Stroke.Standard + v27.Padding.Small
            }, 
            selection = v26.selection, 
            selectionGroup = v26.selectionGroup
        }, v28 and v3.createElement(v17, {
            tag = "padding-large col stroke-default radius-medium auto-xy"
        }, {
            Calendar = v3.createElement(v5, {
                defaultDates = v35, 
                LayoutOrder = 1, 
                onSelectedDateChanged = v36, 
                selectableDateRange = v26.selectableDateRange, 
                showStartDateTimeCalendarInput = v26.variant ~= v23.SingleWithTime, 
                showEndDateTimeCalendarInput = v26.variant == v23.Dual, 
                showTimeDropdown = v26.variant == v23.SingleWithTime, 
                testId = "--foundation-calendar"
            }), 
            BottomBar = v3.createElement(v17, {
                LayoutOrder = 2, 
                tag = "row size-full-0 auto-y flex-fill gap-small padding-top-large"
            }, {
                ApplyButton = v3.createElement(v7, {
                    isDisabled = v51(), 
                    onActivated = v49, 
                    text = v15:FormatByKey("CommonUI.Controls.Action.Apply"), 
                    variant = v8.Emphasis, 
                    testId = ("%*--apply-button"):format(v26.testId)
                }), 
                CancelButton = v3.createElement(v7, {
                    onActivated = v37, 
                    text = v15:FormatByKey("CommonUI.Controls.Action.Cancel"), 
                    variant = v8.Standard, 
                    testId = ("%*--cancel-button"):format(v26.testId)
                })
            })
        }))
    });
end);