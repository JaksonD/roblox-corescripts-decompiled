local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.React);
local l_Icon_0 = v2.Icon;
local v5 = require(script.Parent.Calendar);
local v6 = require(script.Parent.DateTimeUtilities);
local v7 = require(l_script_FirstAncestor_0.Components.Button);
local v8 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local v9 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v10 = require(l_script_FirstAncestor_0.Components.Popover);
local v11 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v12 = require(l_script_FirstAncestor_0.Components.TextInput);
local v13 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v15 = require(l_script_FirstAncestor_0.Components.View);
local v16 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v17 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v18 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v19 = require(l_script_FirstAncestor_0.Enums.DateTimePickerVariant);
local v20 = {
    defaultDates = {
        DateTime.now()
    }, 
    variant = v19.Single, 
    testId = "--foundation-date-time-picker"
};
return v3.memo(function(v21) --[[ Line: 69 ]] --[[ Name: DateTimePicker ]]
    -- upvalues: v18 (copy), v20 (copy), v16 (copy), v3 (copy), v19 (copy), v6 (copy), v10 (copy), v12 (copy), v17 (copy), l_Icon_0 (copy), v13 (copy), v9 (copy), v11 (copy), v15 (copy), v5 (copy), v7 (copy), v8 (copy)
    local v22 = v18(v21, v20);
    local v23 = v16();
    local v24, v25 = v3.useState(false);
    local v26 = v3.useRef(nil);
    if v22.defaultDates and typeof(v22.defaultDates) ~= "table" then
        v22.defaultDates = {
            v22.defaultDates
        };
    end;
    local v27, v28 = v3.useState(if v22.defaultDates then if v22.variant == v19.Dual then ("%* - %*"):format(v6.formatLocalTime(v22.defaultDates[1]), if v22.defaultDates[2] then v6.formatLocalTime(v22.defaultDates[2]) else "") else v6.formatLocalTime(v22.defaultDates[1], v22.variant == v19.SingleWithTime) else "");
    local v29, v30 = v3.useState(v22.defaultDates);
    local v31 = v3.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v25 (copy)
        v25(false);
    end, {});
    local v32 = v3.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v25 (copy)
        v25(true);
    end, {});
    local v39 = v3.useCallback(function(v33) --[[ Line: 107 ]]
        -- upvalues: v28 (copy), v22 (copy), v19 (ref), v6 (ref)
        v28(v33);
        if v33:match("^%s*$") then
            return;
        elseif v22.variant == v19.Dual then
            local v34 = v33:split("-");
            local v35 = v6.getDateTimeFromText(v34[1]);
            local v36 = v6.getDateTimeFromText(v34[2]);
            v22.onChanged(v35, v36);
            return;
        else
            local v37 = v33:match("^%s*(.-)%s*$") or "";
            local v38 = v6.getDateTimeFromText(v37);
            v22.onChanged(v38);
            return;
        end;
    end, {
        v22.onChanged
    });
    local v42 = v3.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: v22 (copy), v19 (ref), v6 (ref), v29 (copy), v28 (copy), v31 (copy)
        if v22.variant == v19.Dual then
            local v40 = v6.formatLocalTime(v29[1]);
            local v41 = if v29[2] then v6.formatLocalTime(v29[2]) else "";
            v28(v40 .. " - " .. v41);
        else
            v28(v6.formatLocalTime(v29[1], v22.variant == v19.SingleWithTime));
        end;
        v31();
    end, {
        v29, 
        v31
    });
    local function _() --[[ Line: 155 ]]
        -- upvalues: v22 (copy), v19 (ref), v29 (copy)
        if v22.variant == v19.Single or v22.variant == v19.SingleWithTime then
            return v29[1] == nil;
        elseif v22.variant == v19.Dual then
            local v43 = true;
            if v29[1] ~= nil then
                v43 = true;
                if v29[2] ~= nil then
                    v43 = v29[1].UnixTimestamp > v29[2].UnixTimestamp;
                end;
            end;
            return v43;
        else
            return false;
        end;
    end;
    return v3.createElement(v10.Root, {
        isOpen = v24, 
        testId = v22.testId
    }, {
        DateInput = v3.createElement(v12, v17(v22, {
            hasError = v22.hasError, 
            hint = v22.hint, 
            iconTrailing = {
                name = l_Icon_0.Calendar, 
                onActivated = v32
            }, 
            isDisabled = v22.isDisabled, 
            isRequired = v22.isRequired, 
            key = "date-input", 
            label = v22.label, 
            onChanged = v39, 
            onFocusGained = v32, 
            placeholder = v13:FormatByKey("CommonUI.Controls.Label.SelectDate"), 
            ref = v26, 
            selectableDateRange = v22.selectableDateRange, 
            size = v9.Medium, 
            text = v27, 
            testId = ("%*--text-input"):format(v22.testId), 
            width = v22.width
        })), 
        Anchor = v3.createElement(v10.Anchor, {
            anchorRef = v26
        }), 
        Calendar = v3.createElement(v10.Content, {
            hasArrow = false, 
            onPressedOutside = v31, 
            side = {
                position = v11.Bottom, 
                offset = v23.Stroke.Standard + v23.Padding.Small
            }, 
            selection = v22.selection, 
            selectionGroup = v22.selectionGroup
        }, v24 and v3.createElement(v15, {
            tag = "padding-large col stroke-default radius-medium auto-xy"
        }, {
            Calendar = v3.createElement(v5, {
                defaultDates = v29, 
                LayoutOrder = 1, 
                onSelectedDateChanged = v30, 
                selectableDateRange = v22.selectableDateRange, 
                showStartDateTimeCalendarInput = v22.variant ~= v19.SingleWithTime, 
                showEndDateTimeCalendarInput = v22.variant == v19.Dual, 
                showTimeDropdown = v22.variant == v19.SingleWithTime, 
                testId = "--foundation-calendar"
            }), 
            BottomBar = v3.createElement(v15, {
                LayoutOrder = 2, 
                tag = "row size-full-0 auto-y flex-fill gap-small padding-top-large"
            }, {
                ApplyButton = v3.createElement(v7, {
                    isDisabled = if not (v22.variant ~= v19.Single) or v22.variant == v19.SingleWithTime then v29[1] == nil else v22.variant == v19.Dual and (v29[1] == nil or v29[2] == nil or v29[1].UnixTimestamp > v29[2].UnixTimestamp), 
                    onActivated = v42, 
                    text = v13:FormatByKey("CommonUI.Controls.Action.Apply"), 
                    variant = v8.Emphasis, 
                    testId = ("%*--apply-button"):format(v22.testId)
                }), 
                CancelButton = v3.createElement(v7, {
                    onActivated = v31, 
                    text = v13:FormatByKey("CommonUI.Controls.Action.Cancel"), 
                    variant = v8.Standard, 
                    testId = ("%*--cancel-button"):format(v22.testId)
                })
            })
        }))
    });
end);