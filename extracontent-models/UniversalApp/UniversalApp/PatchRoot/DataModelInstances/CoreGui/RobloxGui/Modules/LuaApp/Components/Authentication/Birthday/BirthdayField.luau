local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_TextInputBoxWithBorder_0 = v2.Components.TextInputBoxWithBorder;
local l_AuthStatefulRoundCornerBorder_0 = v2.Components.AuthStatefulRoundCornerBorder;
local v5 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v8 = require(l_Modules_0.LuaApp.Components.Authentication.Birthday.AgeAndMonthInput);
local v9 = require(l_Modules_0.LuaApp.Components.Authentication.Birthday.MonthAndYearInput);
local v10 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v11 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = {
    Age = 1, 
    AgeMonth = 2, 
    MonthYear = 3
};
return (l_RoactServices_0.connect({
    analytics = v11
})(function(v14) --[[ Line: 39 ]] --[[ Name: BirthdayField ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v5 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), v13 (copy), v10 (copy), l_TextInputBoxWithBorder_0 (copy), v8 (copy), v9 (copy)
    local v15 = l_useStyle_0();
    local v16 = l_useLocalization_0({
        ageLabel = "Authentication.SignUp.Label.Age", 
        helpText = "Authentication.SignUp.Description.BirthdayValuePropC", 
        errorMessage = "Authentication.SignUp.Response.InvalidBirthday"
    });
    local v17, v18 = v5.useState(l_AuthStatefulRoundCornerBorder_0.BorderState.Default);
    local v19, v20 = v5.useState(false);
    local function v22() --[[ Line: 49 ]]
        -- upvalues: v14 (copy)
        if v14.ageTextFieldRef and v14.ageTextFieldRef.current then
            local l_Text_0 = v14.ageTextFieldRef.current.Text;
            if string.len(l_Text_0) > 2 then
                v14.ageTextFieldRef.current.Text = string.sub(l_Text_0, 1, 2);
            end;
        end;
        v14.onAgeChange(v14.ageTextFieldRef.current.Text);
    end;
    local function v23() --[[ Line: 59 ]]
        -- upvalues: v14 (copy), v13 (ref), v18 (copy), l_AuthStatefulRoundCornerBorder_0 (ref), v10 (ref), v20 (copy)
        if not v14.hasBirthdayError and v14.variant == v13.Age then
            v18(l_AuthStatefulRoundCornerBorder_0.BorderState.Focused);
        end;
        v14.analytics.reportAgeFocus(v10.Context.SinglePageSignUpScreen);
        v20(true);
    end;
    local function v24() --[[ Line: 67 ]]
        -- upvalues: v14 (copy), v13 (ref), v18 (copy), l_AuthStatefulRoundCornerBorder_0 (ref), v20 (copy)
        if not v14.hasBirthdayError and v14.variant == v13.Age then
            v18(l_AuthStatefulRoundCornerBorder_0.BorderState.Default);
        end;
        v20(false);
    end;
    local function v25() --[[ Line: 74 ]]
        -- upvalues: v14 (copy), v10 (ref), v20 (copy)
        v14.analytics.reportYearFocus(v10.Context.SinglePageSignUpScreen);
        v20(true);
    end;
    local function v26() --[[ Line: 79 ]]
        -- upvalues: v20 (copy)
        v20(false);
    end;
    local function v27() --[[ Line: 83 ]]
        -- upvalues: v14 (copy), v10 (ref)
        v14.analytics.reportButtonClicked(v10.Context.SinglePageSignUpScreen, v10.Button.ConfirmBirthdayMonth);
    end;
    v5.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v14 (copy), v18 (copy), l_AuthStatefulRoundCornerBorder_0 (ref)
        if v14.hasBirthdayError then
            v18(l_AuthStatefulRoundCornerBorder_0.BorderState.Error);
            return;
        else
            v18(l_AuthStatefulRoundCornerBorder_0.BorderState.Default);
            return;
        end;
    end, {
        v14.hasBirthdayError
    });
    v5.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v14 (copy), v13 (ref)
        if v14.variant == v13.Age and v14.ageTextFieldRef and v14.ageTextFieldRef.current then
            v14.ageTextFieldRef.current:CaptureFocus();
        end;
    end, {
        v14.variant, 
        v14.ageTextFieldRef.current
    });
    local l_createElement_0 = v5.createElement;
    local v29 = "Frame";
    local v30 = {
        BackgroundTransparency = 1, 
        LayoutOrder = v14.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ZIndex = 4
    };
    local v31 = {
        UIListLayout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, -10)
        })
    };
    local v32 = false;
    if v14.variant == v13.Age then
        v32 = v5.createElement(l_TextInputBoxWithBorder_0, {
            textInputType = Enum.TextInputType.Number, 
            textInputHeight = v14.textInputHeight, 
            textInputListPadding = 6, 
            placeholderText = v16.ageLabel, 
            labelText = v16.ageLabel, 
            borderState = v17, 
            onChangeTextCallback = v22, 
            errorText = v14.hasBirthdayError and v16.errorMessage or "", 
            layoutOrder = 3, 
            onFocused = v23, 
            onFocusLost = v24, 
            textBoxRef = v14.ageTextFieldRef
        });
    end;
    v31.AgeInput = v32;
    v32 = false;
    if v14.variant == v13.AgeMonth then
        v32 = v5.createElement(v8, {
            layoutOrder = 3, 
            errorText = v14.hasBirthdayError and v16.errorMessage or "", 
            textInputHeight = v14.textInputHeight, 
            onAgeAndMonthChange = v14.onAgeAndMonthChange, 
            onFocused = v23, 
            onFocusLost = v24, 
            onMonthInputConfirmed = v27, 
            screenSize = v14.screenSize, 
            textBoxRef = v14.ageTextFieldRef
        });
    end;
    v31.AgeAndMonthInput = v32;
    v32 = false;
    if v14.variant == v13.MonthYear then
        v32 = v5.createElement(v9, {
            layoutOrder = 3, 
            errorText = v14.hasBirthdayError and v16.errorMessage or "", 
            textInputHeight = v14.textInputHeight, 
            onMonthAndYearChange = v14.onMonthAndYearChange, 
            onFocused = v25, 
            onFocusLost = v26, 
            onMonthInputConfirmed = v27, 
            screenSize = v14.screenSize, 
            textBoxRef = v14.ageTextFieldRef
        });
    end;
    v31.MonthAndYearInput = v32;
    v31.Padding = v14.hasBirthdayError and v5.createElement("Frame", {
        Size = UDim2.new(0, 0, 0, 21), 
        BackgroundTransparency = 1, 
        LayoutOrder = 5
    });
    v31.ValueProp = v19 and v5.createElement("TextLabel", {
        Text = v16.helpText, 
        Font = v15.Font.CaptionBody.Font, 
        TextSize = v15.Font.BaseSize * v15.Font.CaptionBody.RelativeSize, 
        TextColor3 = v15.Theme.TextDefault.Color, 
        TextTransparency = v15.Theme.TextDefault.Transparency, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ZIndex = 0, 
        LayoutOrder = 6
    });
    return l_createElement_0(v29, v30, v31);
end));