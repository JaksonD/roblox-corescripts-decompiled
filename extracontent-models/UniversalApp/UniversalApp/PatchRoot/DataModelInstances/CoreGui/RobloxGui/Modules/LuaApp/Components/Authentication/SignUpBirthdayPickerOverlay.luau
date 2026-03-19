local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v4.Button;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_ButtonSize_0 = v4.Enums.ButtonSize;
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_Constants_0 = v9.App.Style.Constants;
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local v13 = require(l_Modules_0.LuaApp.withLocalization);
local l_Birthday_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Models.Birthday;
local v15 = require(l_Modules_0.LuaApp.FitChildren);
local l_BirthdayPicker_0 = require(l_CorePackages_0.Workspace.Packages.AuthSignup).Components.BirthdayPicker;
local l_useSignUpPageNavigationBindings_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Hooks.useSignUpPageNavigationBindings;
local v18 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v20 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetButton_0 = v9.Core.ImageSet.ImageSetButton;
local v26 = require(l_CorePackages_0.Packages.Otter);
local v27 = require(l_Modules_0.LuaApp.Constants);
local v28 = game:DefineFastInt("SinglePageSignupMinimumAge", 5);
local l_DateHelper_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateHelper;
local v30 = UDim2.new(0, 36, 0, 36);
local v31 = l_Images_0["icons/navigation/close"];
local v32 = Vector2.new(540, 360);
local v33 = Vector2.new(100, 340);
local v34 = game:DefineFastFlag("BirthdayPickerOverlayForceDarkTheme", false);
local v35 = v2.PureComponent:extend("SignUpBirthdayPickerOverlay");
v35.init = function(v36) --[[ Line: 59 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v27 (copy), v26 (copy), l_Birthday_0 (copy), l_DateHelper_0 (copy), v28 (copy)
    local l_initialBirthday_0 = v36.props.initialBirthday;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    if l_initialBirthday_0 then
        v38 = l_initialBirthday_0.Month;
        v39 = l_initialBirthday_0.Day;
        v40 = l_initialBirthday_0.Year;
    end;
    local l_screenSize_0 = v36.props.screenSize;
    v36.state = {
        month = v38, 
        day = v39, 
        year = v40, 
        hasValidDate = false, 
        closingOverlay = false, 
        shouldReturnBirthdayOnClose = false
    };
    v36.backButtonRef = v2.createRef();
    v36.confirmButtonRef = v2.createRef();
    local v42, v43 = v2.createBinding(l_screenSize_0.Y);
    v36.currentYOffset = v42;
    v36.updateCurrentYOffset = v43;
    v36.updatePositionFromAnimation = function(v44) --[[ Line: 88 ]]
        -- upvalues: v36 (copy), l_screenSize_0 (copy), v27 (ref)
        v36.updateCurrentYOffset((1 - v44) * l_screenSize_0.Y - v27.BOTTOM_BAR_SIZE);
    end;
    v36.onCloseOverlay = function(v45) --[[ Line: 92 ]]
        -- upvalues: v36 (copy), v26 (ref)
        if v36.isMounted and not v36.state.closingOverlay then
            if v36.props.navigateBackWithoutSelection and not v45 then
                v36.isMounted = false;
                v36.props.closeCentralOverlay();
                v36.props.navigateBack();
                return;
            else
                v36.motor:setGoal(v26.spring(0, v36.springOptions));
                spawn(function() --[[ Line: 100 ]]
                    -- upvalues: v36 (ref), v45 (copy)
                    if v36.isMounted then
                        v36:setState({
                            shouldReturnBirthdayOnClose = v45, 
                            closingOverlay = true
                        });
                    end;
                end);
            end;
        end;
    end;
    v36.onOverlayAnimatedOut = function() --[[ Line: 112 ]]
        -- upvalues: v36 (copy), l_Birthday_0 (ref), v26 (ref)
        local l_onClose_0 = v36.props.onClose;
        local l_closeCentralOverlay_0 = v36.props.closeCentralOverlay;
        local l_month_0 = v36.state.month;
        local l_day_0 = v36.state.day;
        local l_year_0 = v36.state.year;
        local l_hasValidDate_0 = v36.state.hasValidDate;
        local v52 = v36.state.shouldReturnBirthdayOnClose and l_hasValidDate_0 and l_Birthday_0.new({
            Month = l_month_0, 
            Day = l_day_0, 
            Year = l_year_0
        }) or nil;
        v36.motor:setGoal(v26.spring(0, v36.springOptions));
        if l_onClose_0 then
            l_onClose_0(v52);
        end;
        l_closeCentralOverlay_0();
    end;
    v36.updateBirthday = function(v53, v54, v55) --[[ Line: 139 ]]
        -- upvalues: l_DateHelper_0 (ref), v28 (ref), l_Birthday_0 (ref), v36 (copy)
        local v56 = l_DateHelper_0:isValidDate(v53, v54, v55);
        if v28 > l_Birthday_0.new({
            Month = v53, 
            Day = v54, 
            Year = v55
        }):GetAgeInYears() then
            v56 = false;
        end;
        spawn(function() --[[ Line: 152 ]]
            -- upvalues: v36 (ref), v53 (copy), v54 (copy), v55 (copy), v56 (ref)
            if v36.isMounted then
                v36:setState({
                    month = v53, 
                    day = v54, 
                    year = v55, 
                    hasValidDate = v56
                });
            end;
        end);
    end;
    v36.springOptions = {
        frequency = 3
    };
    v36.isMounted = false;
end;
v35.didMount = function(v57) --[[ Line: 171 ]] --[[ Name: didMount ]]
    -- upvalues: v26 (copy)
    v57.isMounted = true;
    v57.motor = v26.createSingleMotor(0);
    v57.motor:onStep(function(v58) --[[ Line: 176 ]]
        -- upvalues: v57 (copy)
        v57.updatePositionFromAnimation(v58);
        if v57.state.closingOverlay and v58 <= 0.1 then
            spawn(function() --[[ Line: 180 ]]
                -- upvalues: v57 (ref)
                if v57.isMounted then
                    v57:setState({
                        closingOverlay = false
                    });
                end;
            end);
            v57.onOverlayAnimatedOut();
        end;
    end);
    delay(0, function() --[[ Line: 191 ]]
        -- upvalues: v57 (copy), v26 (ref)
        v57.motor:setGoal(v26.spring(1, v57.springOptions));
    end);
end;
v35.willUnmount = function(v59) --[[ Line: 196 ]] --[[ Name: willUnmount ]]
    v59.isMounted = false;
    v59.motor:destroy();
end;
v35.renderContent = function(v60) --[[ Line: 201 ]] --[[ Name: renderContent ]]
    -- upvalues: l_withStyle_0 (copy), v13 (copy), l_FormFactor_0 (copy), v28 (copy), v2 (copy), l_ImageSetLabel_0 (copy), v32 (copy), l_GetImageData_0 (copy), v33 (copy), l_ImageSetButton_0 (copy), v30 (copy), v31 (copy), v20 (copy), v15 (copy), l_BirthdayPicker_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local l_hasValidDate_1 = v60.state.hasValidDate;
    return l_withStyle_0(function(v62) --[[ Line: 204 ]]
        -- upvalues: v13 (ref), v60 (copy), l_FormFactor_0 (ref), v28 (ref), v2 (ref), l_ImageSetLabel_0 (ref), v32 (ref), l_GetImageData_0 (ref), v33 (ref), l_ImageSetButton_0 (ref), v30 (ref), v31 (ref), v20 (ref), v15 (ref), l_BirthdayPicker_0 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref), l_hasValidDate_1 (copy)
        return v13({
            confirmBirthdayText = "Authentication.SignUp.Label.ConfirmBirthday", 
            titleText = "Authentication.SignUp.Label.Birthday"
        })(function(v63) --[[ Line: 208 ]]
            -- upvalues: v60 (ref), l_FormFactor_0 (ref), v28 (ref), v2 (ref), l_ImageSetLabel_0 (ref), v32 (ref), l_GetImageData_0 (ref), v62 (copy), v33 (ref), l_ImageSetButton_0 (ref), v30 (ref), v31 (ref), v20 (ref), v15 (ref), l_BirthdayPicker_0 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref), l_hasValidDate_1 (ref)
            local v64 = v60.props.formFactor == l_FormFactor_0.WIDE;
            local v65 = v64 and 0.5 or 1;
            local v66 = v64 and 0.5 or 1;
            local l_v28_0 = v28;
            return v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(1, 0, 0, v32.Y), 
                Position = v60.currentYOffset:map(function(v68) --[[ Line: 217 ]]
                    -- upvalues: v66 (copy)
                    return UDim2.new(0.5, 0, v66, v68);
                end), 
                AnchorPoint = Vector2.new(0.5, v65), 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(9, 9, 9, 9), 
                Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                ImageColor3 = v62.Theme.BackgroundUIDefault.Color, 
                ClipsDescendants = true, 
                ref = v60.props.eventHandlerRef
            }, {
                SizeConstraint = v64 and v2.createElement("UISizeConstraint", {
                    MaxSize = v32, 
                    MinSize = v33
                }), 
                HeaderFrame = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    Text = nil
                }, {
                    BackButton = v2.createElement(l_ImageSetButton_0, {
                        Size = v30, 
                        AutoButtonColor = false, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 12, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = v31, 
                        ImageColor3 = v62.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0, 
                        [v2.Ref] = v60.backButtonRef, 
                        [v2.Event.Activated] = function() --[[ Line: 256 ]]
                            -- upvalues: v60 (ref)
                            v60.onCloseOverlay(false);
                        end
                    }), 
                    Title = v63.titleText and v2.createElement(v20, {
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        fitAxis = v15.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        Text = v63.titleText or "", 
                        TextWrapped = true, 
                        Font = v62.Font.CaptionHeader.Font, 
                        TextSize = v62.Font.BaseSize * v62.Font.Header1.RelativeSize, 
                        TextColor3 = v62.Theme.TextEmphasis.Color, 
                        TextTransparency = v62.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    })
                }), 
                Divider = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0.5, 0, 0, 48), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v62.Theme.UIEmphasis.Color
                }), 
                ContentFrame = v2.createElement(v15.FitFrame, {
                    Size = UDim2.new(1, 0, 1, -49), 
                    Position = UDim2.new(0.5, 0, 0, 49), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    fitAxis = v15.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = nil
                }, {
                    ListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 20), 
                        PaddingRight = UDim.new(0, 20), 
                        PaddingTop = UDim.new(0, 20), 
                        PaddingBottom = UDim.new(0, 20)
                    }), 
                    Content = v2.createElement(l_BirthdayPicker_0, {
                        layoutOrder = 1, 
                        minAgeAllowed = l_v28_0, 
                        updateBirthday = v60.updateBirthday, 
                        initialMonth = v60.state.month, 
                        initialDay = v60.state.day, 
                        initialYear = v60.state.year, 
                        NextSelectionUp = v60.backButtonRef, 
                        NextSelectionDown = v60.confirmButtonRef
                    }), 
                    Spacing = v2.createElement("Frame", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 30), 
                        BackgroundTransparency = 1
                    }), 
                    ConfirmBirthdayButton = v2.createElement(l_Button_0, {
                        variant = l_ButtonVariant_0.SubEmphasis, 
                        size = l_ButtonSize_0.Medium, 
                        text = v63.confirmBirthdayText, 
                        isDisabled = not l_hasValidDate_1, 
                        onActivated = function() --[[ Line: 322 ]] --[[ Name: onActivated ]]
                            -- upvalues: l_hasValidDate_1 (ref), v60 (ref)
                            if l_hasValidDate_1 then
                                v60.onCloseOverlay(true);
                            end;
                        end, 
                        width = UDim.new(1, 0), 
                        ref = v60.confirmButtonRef, 
                        LayoutOrder = 3
                    })
                })
            });
        end);
    end);
end;
v35.render = function(v69) --[[ Line: 337 ]] --[[ Name: render ]]
    -- upvalues: v34 (copy), v2 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy)
    if not v34 then
        return v69:renderContent();
    else
        local l_forceDarkTheme_0 = v69.props.forceDarkTheme;
        local v71 = v69:renderContent();
        if l_forceDarkTheme_0 then
            return v2.createElement(l_UiModeStyleProvider_0, {
                style = {
                    themeName = l_Constants_0.ThemeName.Dark, 
                    fontName = l_Constants_0.FontName.Gotham
                }
            }, {
                Child = v71
            });
        else
            return v71;
        end;
    end;
end;
v35 = v3.connect(function(v72, _) --[[ Line: 359 ]]
    return {
        screenSize = v72.ScreenSize, 
        formFactor = v72.FormFactor
    };
end, function(v74) --[[ Line: 364 ]]
    -- upvalues: v18 (copy), v19 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 366 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v74 (copy), v18 (ref)
            v74(v18());
        end, 
        navigateBack = function() --[[ Line: 369 ]] --[[ Name: navigateBack ]]
            -- upvalues: v74 (copy), v19 (ref)
            return v74(v19());
        end
    };
end)(v35);
return function(v75) --[[ Line: 375 ]]
    -- upvalues: l_useSignUpPageNavigationBindings_0 (copy), v2 (copy), v35 (ref), v8 (copy)
    local v76 = l_useSignUpPageNavigationBindings_0();
    return v2.createElement(v35, v8.Dictionary.join(v75, {
        eventHandlerRef = v76
    }));
end;