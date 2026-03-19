local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RobloxLocaleId_0 = game:GetService("LocalizationService").RobloxLocaleId;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UserActivationFramework);
local v5 = require(l_Parent_0.AuthCommon);
local v6 = require(l_Parent_0.AuthSignup);
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_script_FirstAncestor_0.Utils.debounce);
local l_Birthday_0 = v5.Models.Birthday;
local l_BirthdayPicker_0 = v6.Components.BirthdayPicker;
local l_FullPageActivationFrameworkContext_0 = v4.Context.FullPageActivationFrameworkContext;
local l_ActivationFrameworkWrapper_0 = v4.Components.ActivationFrameworkWrapper;
local l_CallbackStatus_0 = v4.Enums.CallbackStatus;
local l_PayloadKey_0 = v4.Enums.PayloadKey;
local l_StyledTextLabel_0 = v7.App.Text.StyledTextLabel;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_TitleAndParagraph_0 = v5.Components.TitleAndParagraph;
local l_DisclaimerLinks_0 = v5.Components.DisclaimerLinks;
local l_GetFFlagEnableSignupFoundationText_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSignupFoundationText;
local v22 = require(l_Parent_0.Foundation);
local l_Text_0 = v22.Text;
local v24 = require(l_Parent_0.SharedFlags);
local l_FIntSignupMinimumAge_0 = v24.FIntSignupMinimumAge;
local v26 = require(l_script_FirstAncestor_0.Analytics.MultiPageSignupConstants);
local v27 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v27.EventStreamConstants;
local l_authMsgShown_0 = v27.Events.authMsgShown;
local l_authFormInteraction_0 = v27.Events.authFormInteraction;
local l_GetFFlagEnableMultiPageSignupV2Updates_0 = v24.GetFFlagEnableMultiPageSignupV2Updates;
local l_DateHelper_0 = require(l_Parent_0.Time).DateHelper;
return function(v33) --[[ Line: 51 ]]
    -- upvalues: v3 (copy), l_FullPageActivationFrameworkContext_0 (copy), l_DateHelper_0 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_Birthday_0 (copy), l_authFormInteraction_0 (copy), v26 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (copy), l_RobloxLocaleId_0 (copy), v8 (copy), l_authMsgShown_0 (copy), l_EventStreamConstants_0 (copy), l_FIntSignupMinimumAge_0 (copy), l_ActivationFrameworkWrapper_0 (copy), l_PayloadKey_0 (copy), l_CallbackStatus_0 (copy), l_TitleAndParagraph_0 (copy), l_DisclaimerLinks_0 (copy), l_BirthdayPicker_0 (copy), l_GetFFlagEnableSignupFoundationText_0 (copy), l_Text_0 (copy), l_StyledTextLabel_0 (copy), v22 (copy)
    local v34, v35 = v3.useState(nil);
    local v36, v37 = v3.useState(nil);
    local v38, v39 = v3.useState(false);
    local v40, v41 = v3.useState("");
    local l_activationFrameworkState_0 = v3.useContext(l_FullPageActivationFrameworkContext_0).activationFrameworkState;
    local v43 = nil;
    if v34 then
        v43 = l_DateHelper_0.MonthsLocalizationKeys[v34.Month] or nil;
    end;
    local v44 = l_useLocalization_0({
        monthText = v43, 
        dayAffix = l_DateHelper_0.DayAffixLocalizationKey, 
        yearAffix = l_DateHelper_0.YearAffixLocalizationKey, 
        birthdayHint = "Authentication.SignUp.Label.SelectYourBirthday", 
        birthdayLabel = "Authentication.SignUp.Label.Birthday", 
        invalidBirthdayText = "Authentication.SignUp.Label.Error.MinimumAge5", 
        nextButtonText = "Authentication.SignUp.Action.NextWord", 
        ageText = {
            "Authentication.SignUp.Label.YearsOld"; 
            yearsOld = if v36 then tostring(v36) else ""
        }
    });
    local v45 = l_useLocalization_0({
        fullDateString = {
            "Authentication.SignUp.Label.FullDateString"; 
            Month = v44.monthText, 
            Day = if v34 then tostring(v34.Day) else "", 
            Year = if v34 then tostring(v34.Year) else ""
        }
    });
    local v46 = l_useStyle_0();
    local v47 = l_useDesignTokens_0();
    local v52 = v3.useCallback(function(v48, v49, v50) --[[ Line: 91 ]]
        -- upvalues: v34 (copy), l_DateHelper_0 (ref), l_Birthday_0 (ref), l_authFormInteraction_0 (ref), v26 (ref), v35 (copy), v37 (copy)
        if (v34 == nil or v34.Month ~= v48 or v34.Day ~= v49 or v34.Year ~= v50) and l_DateHelper_0:isValidDate(v48, v49, v50) then
            local v51 = l_Birthday_0.new({
                Month = v48, 
                Day = v49, 
                Year = v50
            });
            l_authFormInteraction_0(v26.ctx.multiPageSignup, v26.field.updateBirthday, v26.state.enterBirthdayComponent);
            v35(v51);
            v37(v51:GetAgeInYears());
        end;
    end, {
        v34
    });
    v3.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: v34 (copy), v41 (copy), v44 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (ref), v45 (copy), l_DateHelper_0 (ref), l_RobloxLocaleId_0 (ref)
        if v34 == nil then
            v41(v44.birthdayHint);
            return;
        elseif l_GetFFlagEnableMultiPageSignupV2Updates_0() then
            v41(v45.fullDateString .. " " .. v44.ageText);
            return;
        else
            local v53 = if v34 then l_DateHelper_0:GetFormattedFullString(v44.monthText, v34.Day, v44.dayAffix, v34.Year, v44.yearAffix, " ", l_RobloxLocaleId_0) else "";
            v41(v53 .. " " .. v44.ageText);
            return;
        end;
    end, {
        v44.monthText, 
        v44.dayAffix, 
        v44.yearAffix, 
        v34
    });
    local v55 = v3.useCallback(v8(function(v54) --[[ Line: 136 ]]
        -- upvalues: l_authMsgShown_0 (ref), v33 (copy), l_activationFrameworkState_0 (copy), l_EventStreamConstants_0 (ref)
        if v54 then
            l_authMsgShown_0(v33.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.InvalidBirthday);
        end;
    end, 1), {});
    v3.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: v36 (copy), l_FIntSignupMinimumAge_0 (ref), v39 (copy), v55 (copy)
        if v36 == nil then
            return;
        else
            local v56 = v36 < l_FIntSignupMinimumAge_0;
            v39(v56);
            v55(v56);
            return;
        end;
    end, {
        v36
    });
    local v57 = v34 and not v38 or false;
    return v3.createElement(l_ActivationFrameworkWrapper_0, {
        namespace = v33.namespace, 
        titleTextKey = "Authentication.SignUp.Label.BirthdayHeaderB", 
        bodyTextKey = "Authentication.SignUp.Description.BirthdayHelp3", 
        headingTextKey = "Authentication.SignUp.Action.CreateAccount", 
        primaryButton = {
            buttonTextKey = "Authentication.SignUp.Action.NextWord", 
            shouldShowButton = true, 
            isButtonEnabled = v57, 
            onButtonClicked = function() --[[ Line: 169 ]] --[[ Name: onButtonClicked ]]
                -- upvalues: l_PayloadKey_0 (ref), l_Birthday_0 (ref), v34 (copy), v36 (copy), l_CallbackStatus_0 (ref)
                return {
                    payloadAddendum = {
                        [l_PayloadKey_0.SignupBirthdayTimestampUtc] = l_Birthday_0.FormatForEndpoint(v34), 
                        [l_PayloadKey_0.SignupAge] = tostring(v36)
                    }, 
                    status = l_CallbackStatus_0.Success
                };
            end
        }, 
        shouldExpandMiddleContent = true, 
        subFooterContent = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Padding = UDim.new(0, v47.Global.Space_50)
            }), 
            DisclaimerText = v3.createElement(l_TitleAndParagraph_0, {
                LayoutOrder = 1, 
                textXAlignment = Enum.TextXAlignment.Left, 
                paragraphTextKeys = {
                    "Authentication.SignUp.Description.ClickNextAgreeToTerms"
                }, 
                paragraphTextArgs = {
                    {}
                }
            }), 
            DisclaimerLinks = v3.createElement(l_DisclaimerLinks_0, {
                ctx = v33.namespace, 
                state = l_activationFrameworkState_0.currentState, 
                LayoutOrder = 2
            })
        }), 
        navigation = v33.navigation
    }, {
        Content = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v47.Global.Space_50)
            }), 
            BirthdayPicker = v3.createElement(l_BirthdayPicker_0, {
                LayoutOrder = 1, 
                skipUpdateOnMount = false, 
                minAgeAllowed = l_FIntSignupMinimumAge_0, 
                updateBirthday = v52, 
                shouldExpandTapTarget = true, 
                tapTargetExpansionSize = 200
            }), 
            ErrorSpacing = v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v47.Global.Space_100)
            }), 
            ErrorTextLabel = if l_GetFFlagEnableSignupFoundationText_0() then v3.createElement(l_Text_0, {
                LayoutOrder = 3, 
                Text = if v38 then v44.invalidBirthdayText else "", 
                textStyle = {
                    Color3 = v46.Theme.Alert.Color, 
                    Transparency = v46.Theme.Alert.Transparency
                }, 
                tag = "text-body-small text-align-x-center size-full-0 auto-y", 
                TextWrapped = true
            }) else v3.createElement(l_StyledTextLabel_0, {
                layoutOrder = 3, 
                text = if v38 then v44.invalidBirthdayText else "", 
                fontStyle = v46.Font.BodySmall, 
                colorStyle = v46.Theme.Alert, 
                automaticSize = Enum.AutomaticSize.XY, 
                textWrapped = true
            })
        }), 
        SelectedBirthdayText = v3.createElement(v22.Text, {
            Text = v40, 
            tag = "text-label-medium text-align-x-center size-full-0 auto-y position-bottom-center anchor-bottom-center"
        })
    });
end;