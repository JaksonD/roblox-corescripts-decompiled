local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_TimeUnit_0 = require(l_CorePackages_0.Workspace.Packages.Time).TimeUnit;
local l_DateHelper_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateHelper;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = game:DefineFastFlag("EnableBirthdateDropDownMinimumAgeSelector", false);
local v8 = game:DefineFastInt("BirthdateDropDownMinimumAge", 5);
local l_Birthday_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Models.Birthday;
local v10 = require(l_Modules_0.LuaApp.Components.Authentication.DateDropdownSelector);
return function(v11) --[[ Line: 29 ]]
    -- upvalues: v2 (copy), l_useDesignTokens_0 (copy), l_useSelector_0 (copy), l_TimeUnit_0 (copy), l_Birthday_0 (copy), l_DateHelper_0 (copy), v7 (copy), v8 (copy), v10 (copy)
    local v12, v13 = v2.useState(nil);
    local l_SignUpView_0 = l_useDesignTokens_0().LuaApps.SignUpView;
    local v15 = v2.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: l_SignUpView_0 (copy)
        return {
            textCaptionHeaderSize = l_SignUpView_0.textCaptionHeaderSize, 
            textBodySize = l_SignUpView_0.textBodySize, 
            dropdownHeight = l_SignUpView_0.dropdownHeight, 
            dropdownHorizontalPadding = l_SignUpView_0.dropdownHorizontalPadding, 
            dropdownVerticalPadding = l_SignUpView_0.dropdownVerticalPadding, 
            dateDropdownWidth = l_SignUpView_0.dateDropdownWidth
        };
    end, {
        l_SignUpView_0
    });
    local v17 = l_useSelector_0(function(v16) --[[ Line: 43 ]]
        return v16.ScreenSize or Vector2.new(1920, 1080);
    end);
    local v24 = v2.useCallback(function(v18) --[[ Line: 46 ]]
        -- upvalues: l_TimeUnit_0 (ref), l_Birthday_0 (ref), l_DateHelper_0 (ref), v7 (ref), v8 (ref), v13 (copy), v11 (copy)
        local v19 = v18[l_TimeUnit_0.Years];
        local v20 = v18[l_TimeUnit_0.Months];
        local v21 = v18[l_TimeUnit_0.Days];
        if v19 ~= 0 and v20 ~= 0 and v21 ~= 0 then
            local v22 = l_Birthday_0.new({
                Year = v19, 
                Month = v20, 
                Day = v21
            });
            local v23 = false;
            if l_DateHelper_0:isValidDate(v20, v21, v19) then
                v23 = true;
                if l_DateHelper_0:isFutureDate(v20, v21, v19) then
                    v23 = false;
                elseif v7 and v22:GetAgeInYears() < v8 then
                    v23 = false;
                end;
            end;
            v13(v23);
            v11.onBirthdaySelected(v22, v23);
        end;
    end, {
        v11.onBirthdaySelected
    });
    local v25 = math.min(v17.Y, 480);
    local v26 = nil;
    local v27 = nil;
    if v7 then
        local v28 = l_DateHelper_0:getCurrentDate();
        v26 = v28[l_TimeUnit_0.Years] - v8;
        v27 = v28[l_TimeUnit_0.Years] - 100;
    end;
    return v2.createElement(v10, {
        size = UDim2.new(0.75, 0, 1, 0), 
        titleKey = "Authentication.SignUp.Label.Birthday", 
        errorTextKey = v12 == false and "Authentication.SignUp.Response.InvalidBirthday" or nil, 
        maxYear = v26, 
        minYear = v27, 
        onDateSelected = v24, 
        horizontalInnerPadding = UDim.new(0, 18), 
        fixedListHeight = v25, 
        alignment = v11.alignment, 
        layoutOrder = v11.layoutOrder, 
        designTokens = v15
    });
end;