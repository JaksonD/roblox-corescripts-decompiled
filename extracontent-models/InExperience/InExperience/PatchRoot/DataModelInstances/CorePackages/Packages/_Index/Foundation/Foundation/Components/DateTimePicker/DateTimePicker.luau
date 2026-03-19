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
local v22 = require(l_script_FirstAncestor_0.Enums.DateTimePickerVariant);
local v23 = {
    defaultDates = {
        DateTime.now()
    }, 
    variant = v22.Single, 
    testId = "--foundation-date-time-picker"
};
return v3.memo(function(v24) --[[ Line: 73 ]] --[[ Name: DateTimePicker ]]
    -- upvalues: v20 (copy), v23 (copy), v18 (copy), v3 (copy), v22 (copy), v6 (copy), l_FoundationDateTimePickerScreenSize_0 (copy), l_GuiService_0 (copy), v12 (copy), v14 (copy), v19 (copy), l_Icon_0 (copy), v15 (copy), v11 (copy), v13 (copy), v17 (copy), v5 (copy), v7 (copy), v8 (copy)
    local v25 = v20(v24, v23);
    local v26 = v18();
    local v27, v28 = v3.useState(false);
    local v29 = v3.useRef(nil);
    if v25.defaultDates and typeof(v25.defaultDates) ~= "table" then
        v25.defaultDates = {
            v25.defaultDates
        };
    end;
    local v30, v31 = v3.useState(if v25.defaultDates then if v25.variant == v22.Dual then ("%* - %*"):format(v6.formatLocalTime(v25.defaultDates[1]), if v25.defaultDates[2] then v6.formatLocalTime(v25.defaultDates[2]) else "") else v6.formatLocalTime(v25.defaultDates[1], v25.variant == v22.SingleWithTime) else "");
    local v32, v33 = v3.useState(v25.defaultDates);
    local v34 = v3.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v28 (copy)
        v28(false);
    end, {});
    local v35 = v3.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: v28 (copy)
        v28(true);
    end, {});
    local v36 = if l_FoundationDateTimePickerScreenSize_0 then v3.useCallback(function() --[[ Line: 111 ]]
        -- upvalues: l_GuiService_0 (ref), v35 (copy)
        if l_GuiService_0.ViewportDisplaySize ~= Enum.DisplaySize.Small then
            v35();
        end;
    end, {
        v35, 
        l_GuiService_0.ViewportDisplaySize
    }) else nil;
    local v43 = v3.useCallback(function(v37) --[[ Line: 119 ]]
        -- upvalues: v31 (copy), v25 (copy), v22 (ref), v6 (ref)
        v31(v37);
        if v37:match("^%s*$") then
            return;
        elseif v25.variant == v22.Dual then
            local v38 = v37:split("-");
            local v39 = v6.getDateTimeFromText(v38[1]);
            local v40 = v6.getDateTimeFromText(v38[2]);
            v25.onChanged(v39, v40);
            return;
        else
            local v41 = v37:match("^%s*(.-)%s*$") or "";
            local v42 = v6.getDateTimeFromText(v41);
            v25.onChanged(v42);
            return;
        end;
    end, {
        v25.onChanged
    });
    local v46 = v3.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v25 (copy), v22 (ref), v6 (ref), v32 (copy), v31 (copy), v34 (copy)
        if v25.variant == v22.Dual then
            local v44 = v6.formatLocalTime(v32[1]);
            local v45 = if v32[2] then v6.formatLocalTime(v32[2]) else "";
            v31(v44 .. " - " .. v45);
        else
            v31(v6.formatLocalTime(v32[1], v25.variant == v22.SingleWithTime));
        end;
        v34();
    end, {
        v32, 
        v34
    });
    local function _() --[[ Line: 167 ]]
        -- upvalues: v25 (copy), v22 (ref), v32 (copy)
        if v25.variant == v22.Single or v25.variant == v22.SingleWithTime then
            return v32[1] == nil;
        elseif v25.variant == v22.Dual then
            local v47 = true;
            if v32[1] ~= nil then
                v47 = true;
                if v32[2] ~= nil then
                    v47 = v32[1].UnixTimestamp > v32[2].UnixTimestamp;
                end;
            end;
            return v47;
        else
            return false;
        end;
    end;
    return v3.createElement(v12.Root, {
        isOpen = v27, 
        testId = v25.testId
    }, {
        DateInput = v3.createElement(v14, v19(v25, {
            hasError = v25.hasError, 
            hint = v25.hint, 
            iconTrailing = {
                name = l_Icon_0.Calendar, 
                onActivated = v35
            }, 
            isDisabled = v25.isDisabled, 
            isRequired = v25.isRequired, 
            key = "date-input", 
            label = v25.label, 
            onChanged = v43, 
            onFocusGained = if l_FoundationDateTimePickerScreenSize_0 then v36 else v35, 
            placeholder = v15:FormatByKey("CommonUI.Controls.Label.SelectDate"), 
            ref = v29, 
            selectableDateRange = v25.selectableDateRange, 
            size = v11.Medium, 
            text = v30, 
            testId = ("%*--text-input"):format(v25.testId), 
            width = v25.width
        })), 
        Anchor = v3.createElement(v12.Anchor, {
            anchorRef = v29
        }), 
        Calendar = v3.createElement(v12.Content, {
            hasArrow = false, 
            onPressedOutside = v34, 
            side = {
                position = v13.Bottom, 
                offset = v26.Stroke.Standard + v26.Padding.Small
            }, 
            selection = v25.selection, 
            selectionGroup = v25.selectionGroup
        }, v27 and v3.createElement(v17, {
            tag = "padding-large col stroke-default radius-medium auto-xy"
        }, {
            Calendar = v3.createElement(v5, {
                defaultDates = v32, 
                LayoutOrder = 1, 
                onSelectedDateChanged = v33, 
                selectableDateRange = v25.selectableDateRange, 
                showStartDateTimeCalendarInput = v25.variant ~= v22.SingleWithTime, 
                showEndDateTimeCalendarInput = v25.variant == v22.Dual, 
                showTimeDropdown = v25.variant == v22.SingleWithTime, 
                testId = "--foundation-calendar"
            }), 
            BottomBar = v3.createElement(v17, {
                LayoutOrder = 2, 
                tag = "row size-full-0 auto-y flex-fill gap-small padding-top-large"
            }, {
                ApplyButton = v3.createElement(v7, {
                    isDisabled = if not (v25.variant ~= v22.Single) or v25.variant == v22.SingleWithTime then v32[1] == nil else v25.variant == v22.Dual and (v32[1] == nil or v32[2] == nil or v32[1].UnixTimestamp > v32[2].UnixTimestamp), 
                    onActivated = v46, 
                    text = v15:FormatByKey("CommonUI.Controls.Action.Apply"), 
                    variant = v8.Emphasis, 
                    testId = ("%*--apply-button"):format(v25.testId)
                }), 
                CancelButton = v3.createElement(v7, {
                    onActivated = v34, 
                    text = v15:FormatByKey("CommonUI.Controls.Action.Cancel"), 
                    variant = v8.Standard, 
                    testId = ("%*--cancel-button"):format(v25.testId)
                })
            })
        }))
    });
end);