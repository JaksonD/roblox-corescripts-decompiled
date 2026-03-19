local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.AuthAnalytics);
local v6 = require(l_Parent_0.AuthCommon);
local v7 = require(l_Parent_0.Time);
local l_authFormInteraction_0 = v5.Events.authFormInteraction;
local l_EventStreamConstants_0 = v5.EventStreamConstants;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v11 = require(l_script_FirstAncestor_0.Util.validateBirthday);
local l_Birthday_0 = v6.Models.Birthday;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local l_useEffect_0 = v3.useEffect;
local l_useState_0 = v3.useState;
local l_TimeUnit_0 = v7.TimeUnit;
local l_DateHelper_0 = v7.DateHelper;
local l_DropdownWithPopover_0 = v6.Components.DropdownWithPopover;
local function v24(v21) --[[ Line: 34 ]]
    local v22 = {};
    for v23 = 1, 12 do
        table.insert(v22, {
            text = v21[v23], 
            value = v23
        });
    end;
    return v22;
end;
local v25 = {
    minAgeAllowed = 0, 
    maxAgeAllowed = 99
};
return v3.memo(function(v26) --[[ Line: 63 ]] --[[ Name: BirthdayDropdown ]]
    -- upvalues: v2 (copy), v25 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), l_DateHelper_0 (copy), l_useState_0 (copy), l_TimeUnit_0 (copy), v3 (copy), v24 (copy), l_useEffect_0 (copy), l_Birthday_0 (copy), v11 (copy), l_EventStreamConstants_0 (copy), l_authFormInteraction_0 (copy), l_View_0 (copy), l_DropdownWithPopover_0 (copy), l_Text_0 (copy)
    local v27 = v2.Dictionary.join(v25, v26);
    local v28 = l_useTokens_0();
    local v29 = l_useLocalization_0({
        errorText = "Authentication.SignUp.Response.InvalidBirthday", 
        monthLabel = "Authentication.SignUp.Label.Month", 
        dayLabel = "Authentication.SignUp.Label.Day", 
        yearLabel = "Authentication.SignUp.Label.Year"
    });
    local v30 = l_useLocalization_0(l_DateHelper_0.MonthsLocalizationKeys);
    local v31, v32 = l_useState_0(nil);
    local v33, v34 = l_useState_0(nil);
    local v35, v36 = l_useState_0(nil);
    local v37, v38 = l_useState_0(false);
    local v39 = l_DateHelper_0:getCurrentDate()[l_TimeUnit_0.Years];
    local l_minAgeAllowed_0 = v27.minAgeAllowed;
    local v41 = v39 - v27.maxAgeAllowed;
    local v42 = v39 - l_minAgeAllowed_0;
    local v43 = l_DateHelper_0.DateTypeOrder[v27.localeId];
    local v44 = v43[l_TimeUnit_0.Months];
    local v45 = v43[l_TimeUnit_0.Days];
    local v46 = v43[l_TimeUnit_0.Years];
    local v47 = v3.useMemo(function() --[[ Line: 91 ]]
        -- upvalues: l_DateHelper_0 (ref), v41 (copy), v42 (copy)
        return l_DateHelper_0:generateYearCellDatas(v41, v42);
    end, {
        v41, 
        v42
    });
    local v48 = v3.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v24 (ref), v30 (copy)
        return (v24(v30));
    end, {
        v30
    });
    local v49 = v3.useMemo(function() --[[ Line: 97 ]]
        -- upvalues: l_DateHelper_0 (ref)
        return l_DateHelper_0:generateDayCellDatas();
    end, {});
    local l_focusOnMount_0 = v27.focusOnMount;
    l_useEffect_0(function() --[[ Line: 103 ]]
        -- upvalues: v33 (copy), v31 (copy), v35 (copy), l_Birthday_0 (ref), v11 (ref), l_minAgeAllowed_0 (copy), v27 (copy), v38 (copy), l_EventStreamConstants_0 (ref), l_authFormInteraction_0 (ref)
        if v33 == nil or v31 == nil or v35 == nil then
            return;
        else
            local v51 = l_Birthday_0.new({
                Month = v33, 
                Day = v31, 
                Year = v35
            });
            if v11(v33, v31, v35, l_minAgeAllowed_0) then
                v27.onBirthdaySelected(v51, v51:GetAgeInYears(), true);
                v38(false);
                local v52 = l_EventStreamConstants_0.State.BirthdayDropdownBirthdaySelected .. "," .. v51:ToString(",");
                l_authFormInteraction_0(v27.analyticsEventContext, l_EventStreamConstants_0.Field.BirthdayDropdown, v52);
                return;
            else
                v27.onBirthdaySelected(v51, v51:GetAgeInYears(), false);
                v38(true);
                l_authFormInteraction_0(v27.analyticsEventContext, l_EventStreamConstants_0.Field.BirthdayDropdown, l_EventStreamConstants_0.State.BirthdayDropdownInvalidBirthdayError);
                return;
            end;
        end;
    end, {
        v33, 
        v31, 
        v35
    });
    return v3.createElement(l_View_0, {
        tag = "col size-full-0 auto-y gap-small align-x-start"
    }, {
        DropdownContainer = v3.createElement(l_View_0, {
            tag = "row size-full-0 flex-x-fill auto-y gap-medium"
        }, {
            MonthDropdown = v3.createElement(l_DropdownWithPopover_0, {
                placeholder = v29.monthLabel, 
                value = v33, 
                cellDatas = v48, 
                layoutOrder = v44, 
                onChange = v34, 
                errorState = v37, 
                focusOnMount = l_focusOnMount_0 and v44 == 1, 
                backgroundColorToken = v28.Color.Common.Shadow, 
                dropdownHeight = 40, 
                onDropdownOpened = v27.onDropdownOpened, 
                fixSizeToParent = true
            }), 
            DayDropdown = v3.createElement(l_DropdownWithPopover_0, {
                placeholder = v29.dayLabel, 
                value = v31, 
                cellDatas = v49, 
                layoutOrder = v45, 
                onChange = v32, 
                errorState = v37, 
                focusOnMount = l_focusOnMount_0 and v45 == 1, 
                backgroundColorToken = v28.Color.Common.Shadow, 
                dropdownHeight = 40, 
                onDropdownOpened = v27.onDropdownOpened, 
                fixSizeToParent = true
            }), 
            YearDropdown = v3.createElement(l_DropdownWithPopover_0, {
                placeholder = v29.yearLabel, 
                value = v35, 
                cellDatas = v47, 
                layoutOrder = v46, 
                onChange = v36, 
                errorState = v37, 
                focusOnMount = l_focusOnMount_0 and v46 == 1, 
                backgroundColorToken = v28.Color.Common.Shadow, 
                dropdownHeight = 40, 
                onDropdownOpened = v27.onDropdownOpened, 
                fixSizeToParent = true
            })
        }), 
        ErrorText = v37 and v3.createElement(l_Text_0, {
            Text = v29.errorText, 
            tag = "auto-xy text-body-small", 
            padding = {
                bottom = UDim.new(0, 0)
            }, 
            textStyle = v28.Color.System.Alert
        })
    });
end);