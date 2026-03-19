local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v6 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v7 = game:DefineFastFlag("ShouldEnableAuthBirthdayBarUpdates", false);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v8.Style.withStyle;
local v10 = require(l_Modules_0.LuaApp.withLocalization);
local l_Images_0 = v8.App.ImageSet.Images;
local l_ImageSetLabel_0 = v8.Core.ImageSet.ImageSetLabel;
local v13 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v15 = require(l_Modules_0.LuaApp.FitChildren);
local v16 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v17 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v18 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_AuthStatefulRoundCornerBorder_0 = v18.Components.AuthStatefulRoundCornerBorder;
local l_BirthdayDropdown_0 = require(l_CorePackages_0.Workspace.Packages.AuthSignup).Components.BirthdayDropdown;
local l_RegisterAuditContent_0 = v18.Components.RegisterAuditContent;
local v22 = if v7 then require(l_CorePackages_0.Workspace.Packages.Time).DateHelper else require(l_Modules_0.LuaApp.Util.DateHelper);
local l_Birthday_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Models.Birthday;
local v24 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v25 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v27 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForSignUpBirthdayPicker);
local v28 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagUseBirthdayDropdownForGamepad_0 = v28.FFlagUseBirthdayDropdownForGamepad;
local l_FIntSignupMinimumAge_0 = v28.FIntSignupMinimumAge;
local l_GetFFlagEnableAuditForSinglePageSignUp_0 = v28.GetFFlagEnableAuditForSinglePageSignUp;
local v32 = l_Images_0["icons/actions/calendar"];
local v33 = v3.PureComponent:extend("AuthBirthdayBar");
v33.init = function(v34) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagUseBirthdayDropdownForGamepad_0 (copy), v5 (copy), v6 (copy), l_Birthday_0 (copy), v24 (copy), v7 (copy)
    v34.state = {
        isFocused = false, 
        isHovering = false, 
        selectedBirthday = nil, 
        age = nil
    };
    v34.isMounted = false;
    v34.showBirthdayDropdown = l_FFlagUseBirthdayDropdownForGamepad_0 and v34.props.preferredInput == v5.Input.Directional;
    v34.updateState = function(v35) --[[ Line: 72 ]]
        -- upvalues: v34 (copy)
        spawn(function() --[[ Line: 73 ]]
            -- upvalues: v34 (ref), v35 (copy)
            if v34.isMounted then
                v34:setState(v35);
            end;
        end);
    end;
    v34.onBirthdayPickerClose = function(v36) --[[ Line: 79 ]]
        -- upvalues: v6 (ref), l_Birthday_0 (ref), v34 (copy), v24 (ref), v7 (ref)
        local v37 = {
            isFocused = false
        };
        if v36 ~= nil then
            v6.assert(l_Birthday_0.is(v36), "CentralOverlayForSignUpBirthdayPicker should pass back a Birthday when closing.");
            local l_onBirthdaySelected_0 = v34.props.onBirthdaySelected;
            if l_onBirthdaySelected_0 then
                v34.props.analytics.reportButtonClicked(v24.Context.SinglePageSignUpScreen, v24.Button.ConfirmBirthday);
                l_onBirthdaySelected_0(v36);
            end;
            v37.selectedBirthday = v36;
            if v7 and v36.Day ~= nil and v36.Month ~= nil and v36.Year ~= nil then
                local l_v36_AgeInYears_0 = v36:GetAgeInYears();
                v37.age = l_v36_AgeInYears_0;
                if l_v36_AgeInYears_0 ~= nil and v34.props.shouldUseBirthdayAgeLabel then
                    v34.props.analytics.reportAuthFormInteraction(v24.Context.SignupForm, v24.Field.BirthdayAgeLabel, (tostring(l_v36_AgeInYears_0)));
                end;
            end;
        end;
        if v34.props.onBirthdayFocused then
            v34.props.onBirthdayFocused(false);
        end;
        v34.updateState(v37);
    end;
    v34.onBirthdaySelected = function(v40, v41, v42) --[[ Line: 123 ]]
        -- upvalues: v6 (ref), l_Birthday_0 (ref), v34 (copy)
        v6.assert(l_Birthday_0.is(v40), "BirthdayDropdown should pass a Birthday.");
        local v43 = {
            selectedBirthday = v40, 
            age = v41
        };
        local l_onBirthdaySelected_1 = v34.props.onBirthdaySelected;
        if l_onBirthdaySelected_1 then
            l_onBirthdaySelected_1(v40, v42);
        end;
        v34.updateState(v43);
    end;
    v34.onActivated = function() --[[ Line: 139 ]]
        -- upvalues: v34 (copy), v24 (ref)
        v34.props.analytics.reportFocus(v24.Context.SinglePageSignUpScreen, v24.Field.Birthday);
        v34.props.openCentralOverlayForSignUpBirthdayPicker({
            initialBirthday = v34.state.selectedBirthday, 
            onClose = v34.onBirthdayPickerClose, 
            navigateBackWithoutSelection = v34.props.autoFocusOnMount and not v34.state.selectedBirthday, 
            forceDarkTheme = v34.props.forceDarkTheme
        });
        if v34.props.onBirthdayFocused then
            v34.props.onBirthdayFocused(true);
        end;
        spawn(function() --[[ Line: 155 ]]
            -- upvalues: v34 (ref)
            if v34.isMounted then
                v34:setState({
                    isFocused = true
                });
            end;
        end);
    end;
    v34.onMouseEnter = function() --[[ Line: 164 ]]
        -- upvalues: v34 (copy)
        if v34.isMounted then
            v34:setState({
                isHovering = true
            });
        end;
    end;
    v34.onMouseLeave = function() --[[ Line: 172 ]]
        -- upvalues: v34 (copy)
        if v34.isMounted then
            v34:setState({
                isHovering = false
            });
        end;
    end;
end;
v33.didMount = function(v45) --[[ Line: 181 ]] --[[ Name: didMount ]]
    v45.isMounted = true;
    if v45.showBirthdayDropdown then
        return;
    else
        if v45.props.autoFocusOnMount then
            spawn(v45.onActivated);
        end;
        return;
    end;
end;
v33.willUnmount = function(v46) --[[ Line: 191 ]] --[[ Name: willUnmount ]]
    v46.isMounted = false;
end;
v33.render = function(v47) --[[ Line: 195 ]] --[[ Name: render ]]
    -- upvalues: l_LocalizationService_0 (copy), v22 (copy), v7 (copy), l_withStyle_0 (copy), v10 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), v3 (copy), v15 (copy), v16 (copy), l_RegisterAuditContent_0 (copy), l_BirthdayDropdown_0 (copy), l_FIntSignupMinimumAge_0 (copy), v24 (copy), v17 (copy), l_ImageSetLabel_0 (copy), v32 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local l_layoutOrder_0 = v47.props.layoutOrder;
    local l_isFocused_0 = v47.state.isFocused;
    local l_isHovering_0 = v47.state.isHovering;
    local l_selectedBirthday_0 = v47.state.selectedBirthday;
    local l_buttonRef_0 = v47.props.buttonRef;
    local l_birthdayContainerRef_0 = v47.props.birthdayContainerRef;
    local v55 = l_selectedBirthday_0 and v22.MonthsLocalizationKeys[l_selectedBirthday_0.Month] or nil;
    local v56 = if v7 then tostring(v47.state.age or 0) else "";
    return l_withStyle_0(function(v57) --[[ Line: 209 ]]
        -- upvalues: v10 (ref), v55 (copy), v22 (ref), v7 (ref), v56 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v47 (copy), l_AuthStatefulRoundCornerBorder_0 (ref), l_selectedBirthday_0 (copy), l_RobloxLocaleId_0 (copy), l_isFocused_0 (copy), l_isHovering_0 (copy), v3 (ref), v15 (ref), l_layoutOrder_0 (copy), l_birthdayContainerRef_0 (copy), v16 (ref), l_RegisterAuditContent_0 (ref), l_BirthdayDropdown_0 (ref), l_FIntSignupMinimumAge_0 (ref), v24 (ref), v17 (ref), l_buttonRef_0 (copy), l_ImageSetLabel_0 (ref), v32 (ref)
        return v10({
            monthText = v55, 
            dayAffix = v22.DayAffixLocalizationKey, 
            yearAffix = v22.YearAffixLocalizationKey, 
            titleText = "Authentication.SignUp.Label.Birthday", 
            datePlaceholder = "CommonUI.Controls.Birthdaypicker.Label.Date", 
            titleTextWithAge = if v7 then {
                "Authentication.SignUp.Label.BirthdayWithAge"; 
                yearsOld = v56
            } else nil, 
            titleTextWithAgeTemplate = l_GetFFlagEnableAuditForSinglePageSignUp_0() and "Authentication.SignUp.Label.BirthdayWithAge" or nil
        })(function(v58) --[[ Line: 224 ]]
            -- upvalues: v57 (copy), v7 (ref), v47 (ref), v56 (ref), l_AuthStatefulRoundCornerBorder_0 (ref), l_selectedBirthday_0 (ref), v22 (ref), l_RobloxLocaleId_0 (ref), l_isFocused_0 (ref), l_isHovering_0 (ref), v3 (ref), v15 (ref), l_layoutOrder_0 (ref), l_birthdayContainerRef_0 (ref), v16 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), l_RegisterAuditContent_0 (ref), l_BirthdayDropdown_0 (ref), l_FIntSignupMinimumAge_0 (ref), v24 (ref), v17 (ref), l_buttonRef_0 (ref), l_ImageSetLabel_0 (ref), v32 (ref)
            local l_datePlaceholder_0 = v58.datePlaceholder;
            local l_Color_0 = v57.Theme.TextDefault.Color;
            local l_Transparency_0 = v57.Theme.TextDefault.Transparency;
            local l_Color_1 = v57.Theme.IconDefault.Color;
            local l_Transparency_1 = v57.Theme.IconDefault.Transparency;
            local l_titleText_0 = v58.titleText;
            local v65 = "Authentication.SignUp.Label.Birthday";
            local v66 = nil;
            local l_titleText_1 = v58.titleText;
            if v7 and v47.state.age ~= nil and v47.props.shouldUseBirthdayAgeLabel then
                l_titleText_0 = v58.titleTextWithAge;
                v65 = "Authentication.SignUp.Label.BirthdayWithAge";
                v66 = {
                    yearsOld = v56
                };
                l_titleText_1 = v58.titleTextWithAgeTemplate;
            end;
            local l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
            if l_selectedBirthday_0 then
                l_datePlaceholder_0 = v22:GetFormattedFullString(v58.monthText, l_selectedBirthday_0.Day, v58.dayAffix, l_selectedBirthday_0.Year, v58.yearAffix, " ", l_RobloxLocaleId_0);
                l_Color_0 = v57.Theme.TextDefault.Color;
                l_Transparency_0 = v57.Theme.TextDefault.Transparency;
            end;
            if l_isFocused_0 then
                l_Color_1 = v57.Theme.TextDefault.Color;
                l_Transparency_1 = v57.Theme.TextDefault.Transparency;
                l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Focused;
            elseif l_isHovering_0 then
                l_Color_1 = v57.Theme.IconDefault.Color;
                l_Transparency_1 = v57.Theme.IconDefault.Transparency;
                l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Hover;
            end;
            return v3.createElement(v15.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v15.FitAxis.Height, 
                BackgroundTransparency = 1, 
                [v3.Ref] = l_birthdayContainerRef_0
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5), 
                    PaddingBottom = UDim.new(0, 5)
                }), 
                Title = v3.createElement(v16, {
                    LayoutOrder = 0, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v15.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = l_titleText_0, 
                    TextWrapped = true, 
                    Font = v57.Font.CaptionHeader.Font, 
                    TextSize = v57.Font.BaseSize * v57.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v57.Theme.TextEmphasis.Color, 
                    TextTransparency = v57.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                RegisterAuditContent = if l_GetFFlagEnableAuditForSinglePageSignUp_0() and l_RegisterAuditContent_0 and v47.props.enableAuditContentCapture then v3.createElement(l_RegisterAuditContent_0, {
                    translationKey = v65, 
                    translatedSourceString = l_titleText_1, 
                    parameters = v66
                }) else nil, 
                BirthdayDropdown = v47.showBirthdayDropdown and v3.createElement(l_BirthdayDropdown_0, {
                    localeId = l_RobloxLocaleId_0, 
                    layoutOrder = 1, 
                    onBirthdaySelected = v47.onBirthdaySelected, 
                    onDropdownOpened = v47.props.onBirthdayFocused, 
                    focusOnMount = true, 
                    minAgeAllowed = l_FIntSignupMinimumAge_0, 
                    analyticsEventContext = v24.Context.SinglePageSignUpScreen
                }), 
                TextInput = not v47.showBirthdayDropdown and v3.createElement(l_AuthStatefulRoundCornerBorder_0, {
                    layoutOrder = 1, 
                    size = UDim2.new(1, 0, 0, 36), 
                    borderState = l_Default_0
                }, {
                    Base = v3.createElement(v17, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Image = "LuaApp/buttons/buttonFill", 
                        ImageColor3 = v57.Theme.BackgroundUIContrast.Color, 
                        ImageTransparency = v57.Theme.BackgroundUIContrast.Transparency, 
                        BorderSizePixel = 0, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9), 
                        [v3.Ref] = l_buttonRef_0, 
                        [v3.Event.Activated] = v47.onActivated, 
                        [v3.Event.MouseEnter] = v47.onMouseEnter, 
                        [v3.Event.MouseLeave] = v47.onMouseLeave
                    }, {
                        UIPadding = v3.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 0), 
                            PaddingBottom = UDim.new(0, 0), 
                            PaddingLeft = UDim.new(0, 12), 
                            PaddingRight = UDim.new(0, 12)
                        }), 
                        TextLabel = v3.createElement("TextLabel", {
                            Size = UDim2.new(1, -16, 1, 0), 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            BackgroundTransparency = 1, 
                            Text = l_datePlaceholder_0, 
                            Font = v57.Font.Body.Font, 
                            TextSize = v57.Font.BaseSize * v57.Font.Body.RelativeSize, 
                            TextColor3 = l_Color_0, 
                            TextTransparency = l_Transparency_0
                        }), 
                        ImageLabel = v3.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, 16, 0, 16), 
                            Position = UDim2.new(1, 0, 0.5, 0), 
                            AnchorPoint = Vector2.new(1, 0.5), 
                            BackgroundTransparency = 1, 
                            Image = v32, 
                            ImageColor3 = l_Color_1, 
                            ImageTransparency = l_Transparency_1
                        })
                    })
                })
            });
        end);
    end);
end;
v33 = l_RoactServices_0.connect({
    analytics = v25
})(v33);
v33 = v4.connect(nil, function(v69) --[[ Line: 381 ]]
    -- upvalues: v27 (copy)
    return {
        openCentralOverlayForSignUpBirthdayPicker = function(v70) --[[ Line: 383 ]] --[[ Name: openCentralOverlayForSignUpBirthdayPicker ]]
            -- upvalues: v69 (copy), v27 (ref)
            v69(v27(v70));
        end
    };
end)(v33);
if v7 then
    v33 = v13.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.SignupLayer
    }, function(v71, _) --[[ Line: 392 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        return {
            shouldUseBirthdayAgeLabel = (v71[l_AppBtidLayers_0.SignupLayer] or {}).shouldUseBirthdayAgeLabel
        };
    end)(v33);
end;
return v33;