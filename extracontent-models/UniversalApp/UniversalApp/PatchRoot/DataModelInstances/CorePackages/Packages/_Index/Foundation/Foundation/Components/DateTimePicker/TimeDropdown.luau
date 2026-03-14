local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.DateTimePicker.DateTimeUtilities);
local v4 = require(l_script_FirstAncestor_0.Components.Dropdown);
local v5 = require(l_script_FirstAncestor_0.Enums.InputSize);
local l_LocalizationService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.LocalizationService;
local v7 = require(l_script_FirstAncestor_0.Utility.Localization.Translator);
local v8 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v10 = {
    dateTime = DateTime.fromLocalTime(2000, 1, 1, 0, 0, 0), 
    testId = "--foundation-time-dropdown"
};
return function(v11) --[[ Line: 35 ]] --[[ Name: TimeSelector ]]
    -- upvalues: v9 (copy), v10 (copy), v3 (copy), v8 (copy), l_LocalizationService_0 (copy), v2 (copy), v4 (copy), v7 (copy), v5 (copy)
    local v12 = v9(v11, v10);
    local v13 = v3.roundDownToNearestMinute(v12.dateTime);
    local v14 = v13:ToLocalTime();
    local v15 = v8(200);
    local function v22() --[[ Line: 43 ]]
        -- upvalues: v14 (copy), v13 (copy), v3 (ref), l_LocalizationService_0 (ref)
        local v16 = {};
        local v17 = v14.Minute % 30 ~= 0;
        for v18 = 0, 47 do
            local v19 = math.floor(v18 / 2);
            local v20 = v18 % 2 * 30;
            local v21 = DateTime.fromLocalTime(v14.Year, v14.Month, v14.Day, v19, v20, v14.Second);
            if v17 and v13.UnixTimestamp < v21.UnixTimestamp then
                table.insert(v16, {
                    icon = nil, 
                    id = v13.UnixTimestamp, 
                    isChecked = true, 
                    isDisabled = true, 
                    text = v13:FormatLocalTime(v3.TIME_COMPOSITE_TOKEN, l_LocalizationService_0.RobloxLocaleId)
                });
                v17 = false;
            end;
            table.insert(v16, {
                icon = nil, 
                id = v21.UnixTimestamp, 
                isChecked = v21.UnixTimestamp == v13.UnixTimestamp, 
                isDisabled = v21.UnixTimestamp == v13.UnixTimestamp, 
                text = v21:FormatLocalTime(v3.TIME_COMPOSITE_TOKEN, l_LocalizationService_0.RobloxLocaleId)
            });
        end;
        return v16;
    end;
    return v2.createElement(v4.Root, {
        items = v22(), 
        label = "", 
        LayoutOrder = v12.layoutOrder, 
        maxHeight = v15, 
        onItemChanged = v12.onItemChanged, 
        placeholder = v7:FormatByKey("CommonUI.Controls.Label.SelectTheTime"), 
        size = v5.Medium, 
        testId = v12.testId, 
        width = v12.width, 
        value = v13.UnixTimestamp
    });
end;