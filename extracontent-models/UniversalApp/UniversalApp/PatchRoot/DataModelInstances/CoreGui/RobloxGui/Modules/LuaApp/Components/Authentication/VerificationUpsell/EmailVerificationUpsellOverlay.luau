local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v8.Style.withStyle;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local v11 = require(l_Modules_0.LuaApp.withLocalization);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v14 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v15 = require(script.Parent.EmailVerificationUpsellState);
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.UpdateUserEmail);
local v17 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.SendVerificationEmailToUser);
local v18 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v19 = require(l_Modules_0.LuaApp.Util.isStringEmail);
local v20 = require(script.Parent.EmailVerificationUpsellStep);
local v21 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFStringPrivacyPolicyUrl);
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnablePrivacyPolicyForLogoutUpsell);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagEmailUpsellIncludePrivacyPolicy);
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v26 = v2.PureComponent:extend(script.Name);
local function _(v27) --[[ Line: 41 ]] --[[ Name: getEffectiveIsLocalUserUnder13 ]]
    -- upvalues: v24 (copy)
    if not v24() then
        return v27.IsLocalUserUnder13;
    else
        local l_emailUpsellLockedIsLocalUserUnder13_0 = v27.emailUpsellLockedIsLocalUserUnder13;
        if l_emailUpsellLockedIsLocalUserUnder13_0 ~= nil then
            return l_emailUpsellLockedIsLocalUserUnder13_0;
        else
            return v27.IsLocalUserUnder13;
        end;
    end;
end;
v26.defaultProps = {
    addEmailOver13TextKey = "Feature.VerificationUpsell.Description.AddEmailTextOver13", 
    addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.AddEmailTextUnder13", 
    addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail", 
    checkExistingEmailTitleKey = "Feature.VerificationUpsell.Heading.VerifyEmail", 
    eventContext = v21.Context.VerificationUpsell, 
    emailPlaceholderOver13Key = "Feature.VerificationUpsell.Label.EmailInputPlaceholderOver13", 
    textLabelOver13Key = "Authentication.SignUp.Label.EmailAddress", 
    emailPlaceholderUnder13Key = "Feature.VerificationUpsell.Label.EmailInputPlaceholderUnder13", 
    emailPlaceholderUnder13KeyV2 = "Feature.VerificationUpsell.Label.EmailInputPlaceholderUnder13V2", 
    useUpdatedModalDesign = false
};
v26.init = function(v30) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v21 (copy), v19 (copy), v23 (copy), v24 (copy), v12 (copy), v22 (copy), v13 (copy), l_UrlBuilder_0 (copy), l_ButtonType_0 (copy)
    local l_PromptUpdateEmail_0 = v15.PromptUpdateEmail;
    if v30.props.emailAddress then
        l_PromptUpdateEmail_0 = v15.PromptCheckEmail;
    end;
    v30.potentialEmailAddress = nil;
    v30.password = nil;
    v30.emailWasUpdated = false;
    v30.state = {
        upsellState = l_PromptUpdateEmail_0, 
        emailAddress = v30.props.emailAddress or ""
    };
    v30.closeOverlay = function() --[[ Line: 81 ]]
        -- upvalues: v30 (copy)
        if v30.isMounted then
            v30.props.closeCentralOverlay();
            v30.props.authEventAnalytics.reportModalDismissedWithSection(v30.props.eventContext, v30.props.origin, v30.props.section);
        end;
    end;
    v30.onUpdateEmailSecondaryButtonPressed = function() --[[ Line: 92 ]]
        -- upvalues: v30 (copy), v21 (ref)
        if v30.isMounted and v30.props.onUpdateEmailSecondaryButtonPressed then
            v30.props.onUpdateEmailSecondaryButtonPressed();
            v30.props.authEventAnalytics.reportInteractWithAction(v30.props.eventContext, "", v21.ActionType.Click, v30.props.origin, v30.props.onUpdateEmailSecondaryButtonPressedEvent);
        end;
    end;
    v30.onPasswordChangedCallback = function(v32) --[[ Line: 105 ]]
        -- upvalues: v30 (copy)
        v30.password = v32.Text;
    end;
    v30.onEmailChangedCallback = function(v33) --[[ Line: 109 ]]
        -- upvalues: v30 (copy)
        v30.potentialEmailAddress = v33.Text;
    end;
    v30.onResendEmailPressed = function() --[[ Line: 113 ]]
        -- upvalues: v30 (copy), v21 (ref)
        if v30.isMounted then
            v30:setState({
                isInResendEmailCooldown = true
            });
            v30.props.sendVerificationEmailToUser(v30.props.networking):andThen(function() --[[ Line: 121 ]]
                -- upvalues: v30 (ref)
                spawn(function() --[[ Line: 123 ]]
                    -- upvalues: v30 (ref)
                    wait(20);
                    v30.resetResendEmailState(true);
                end);
            end):catch(function() --[[ Line: 129 ]]
                -- upvalues: v30 (ref)
                v30.resetResendEmailState(false);
            end);
            v30.props.authEventAnalytics.reportInteractWithActionAndSection(v30.props.eventContext, "", v21.ActionType.Click, v30.props.origin, v21.Button.ResendEmailConfirmation, "verifyEmail");
        end;
    end;
    v30.resetResendEmailState = function(v34) --[[ Line: 144 ]]
        -- upvalues: v30 (copy)
        local v35 = v34 and "" or "Feature.VerificationUpsell.Message.ConfirmationEmailNotSent";
        if v30.isMounted then
            if v35 ~= "" then
                v30.props.authEventAnalytics.reportErrorMessageShown(v30.props.eventContext, "", v30.props.origin);
            end;
            v30:setState({
                isInResendEmailCooldown = false, 
                errorMessageKey = v35
            });
        end;
    end;
    v30.onUpdateEmailSelected = function() --[[ Line: 159 ]]
        -- upvalues: v30 (copy), v15 (ref), v21 (ref)
        if v30.isMounted then
            v30:setState({
                upsellState = v15.PromptUpdateEmail, 
                errorMessageKey = ""
            });
            v30.props.authEventAnalytics.reportInteractWithActionAndSection(v30.props.eventContext, "", v21.ActionType.Click, v30.props.origin, v21.Button.ChangeEmail, "verifyEmail");
        end;
    end;
    v30.onEmailFocused = function() --[[ Line: 176 ]]
        -- upvalues: v30 (copy), v21 (ref)
        v30.props.authEventAnalytics.reportInteractWithActionAndSection(v30.props.eventContext, v21.Field.Email, v21.ActionType.Focus, v30.props.origin, "", v30.props.section);
    end;
    v30.onEmailUpdated = function() --[[ Line: 187 ]]
        -- upvalues: v30 (copy), v19 (ref), v21 (ref), v15 (ref)
        if v30.isMounted then
            local v36 = v19(v30.potentialEmailAddress);
            v30.props.authEventAnalytics.reportInteractWithActionAndSection(v30.props.eventContext, "", "", v30.props.origin, v21.Button.Continue, v30.props.section);
            if v36 then
                v30:setState({
                    errorMessageKey = ""
                });
                local l_potentialEmailAddress_0 = v30.potentialEmailAddress;
                v30.props.updateUserEmail(v30.props.networking, l_potentialEmailAddress_0, nil):andThen(function() --[[ Line: 209 ]]
                    -- upvalues: v30 (ref), l_potentialEmailAddress_0 (copy), v15 (ref)
                    if v30.isMounted then
                        v30.emailWasUpdated = true;
                        if v30.props.successCallback then
                            v30.props.successCallback(l_potentialEmailAddress_0);
                        end;
                        if v30.props.closeOnEmailUpdate then
                            v30.closeOverlay();
                            return;
                        else
                            v30:setState({
                                upsellState = v15.PromptCheckEmail, 
                                errorMessage = "", 
                                errorMessageKey = "", 
                                emailAddress = l_potentialEmailAddress_0, 
                                isInResendEmailCooldown = false
                            });
                        end;
                    end;
                end):catch(function(v38) --[[ Line: 230 ]]
                    -- upvalues: v30 (ref)
                    if v30.isMounted then
                        v30:setState({
                            errorMessageKey = "", 
                            errorMessage = v38 and v38.Message, 
                            isInResendEmailCooldown = false
                        });
                        v30.props.authEventAnalytics.reportModalShownWithSectionAndError(v30.props.eventContext, "errorMessage", v30.props.origin, v30.props.section, v38.ErrorCode);
                    end;
                end);
                return;
            else
                v30:setState({
                    errorMessageKey = "Feature.VerificationUpsell.Message.InvalidEmailAddress"
                });
                v30.props.authEventAnalytics.reportErrorMessageShown(v30.props.eventContext, "", v30.props.origin);
            end;
        end;
    end;
    v30.onPasswordEntered = function() --[[ Line: 258 ]]
        -- upvalues: v30 (copy), v15 (ref)
        if v30.isMounted then
            v30:setState({
                isInResendEmailCooldown = true
            });
            local l_potentialEmailAddress_1 = v30.potentialEmailAddress;
            v30.props.updateUserEmail(v30.props.networking, l_potentialEmailAddress_1, v30.password):andThen(function() --[[ Line: 268 ]]
                -- upvalues: v30 (ref), v15 (ref), l_potentialEmailAddress_1 (copy)
                v30:setState({
                    upsellState = v15.PromptCheckEmail, 
                    errorMessage = "", 
                    errorMessageKey = "", 
                    emailAddress = l_potentialEmailAddress_1, 
                    isInResendEmailCooldown = false
                });
            end):catch(function(v40) --[[ Line: 278 ]]
                -- upvalues: v30 (ref)
                local l_PasswordIncorrect_0 = v40.PasswordIncorrect;
                local v42 = "";
                if l_PasswordIncorrect_0 then
                    v42 = "Feature.VerificationUpsell.Message.WrongPassword";
                end;
                v30:setState({
                    errorMessageKey = v42, 
                    errorMessage = v40.Message, 
                    isInResendEmailCooldown = false
                });
            end);
        end;
    end;
    v30.shouldShowPrivacyPolicyLink = function() --[[ Line: 294 ]]
        -- upvalues: v23 (ref), v30 (copy), v15 (ref), v24 (ref)
        if not v23() then
            return false;
        elseif v30.state.upsellState ~= v15.PromptUpdateEmail then
            return false;
        elseif v30.props.IsLocalUserUnder13 or v24() then
            return true;
        else
            return false;
        end;
    end;
    v30.onPrivacyPolicyLinkActivated = function() --[[ Line: 307 ]]
        -- upvalues: v30 (copy), v21 (ref), v12 (ref), v22 (ref), v13 (ref)
        if v30.isMounted then
            v30.props.authEventAnalytics.reportModalActionWithSection(v30.props.eventContext, v21.Field.PrivacyPolicy, "", v30.props.origin, v30.props.section);
            v30.props.navigateToPage({
                name = v12.GenericWebPage, 
                detail = v22(), 
                extraProps = {
                    title = "", 
                    transitionAnimation = v13.SlideInFromBottom
                }
            });
        end;
    end;
    v30.onTermsOfServiceLinkActivated = function() --[[ Line: 327 ]]
        -- upvalues: v30 (copy), v21 (ref), v12 (ref), l_UrlBuilder_0 (ref), v13 (ref)
        if v30.isMounted then
            v30.props.authEventAnalytics.reportModalActionWithSection(v30.props.eventContext, v21.Field.TermsOfService, "", v30.props.origin, v30.props.section);
            v30.props.navigateToPage({
                name = v12.GenericWebPage, 
                detail = l_UrlBuilder_0.static.about.terms(), 
                extraProps = {
                    title = "", 
                    transitionAnimation = v13.SlideInFromBottom
                }
            });
        end;
    end;
    v30.getLinks = function() --[[ Line: 347 ]]
        -- upvalues: v30 (copy), v15 (ref)
        if v30.state.upsellState ~= v15.PromptCheckEmail then
            return nil;
        else
            local l_onResendEmailPressed_0 = v30.onResendEmailPressed;
            if v30.state.isInResendEmailCooldown then
                l_onResendEmailPressed_0 = nil;
            end;
            if v30.props.useUpdatedModalDesign then
                return {
                    {
                        textKey = "Feature.VerificationUpsell.Action.ChangeEmail", 
                        onClicked = v30.onUpdateEmailSelected, 
                        isPrimaryLink = false
                    }
                };
            else
                return {
                    {
                        textKey = "Feature.VerificationUpsell.Action.ResendConfirmationEmail", 
                        onClicked = l_onResendEmailPressed_0, 
                        isPrimaryLink = true
                    }, 
                    {
                        textKey = "Feature.VerificationUpsell.Action.ChangeEmail", 
                        onClicked = v30.onUpdateEmailSelected, 
                        isPrimaryLink = false
                    }
                };
            end;
        end;
    end;
    v30.getTitleTextKey = function() --[[ Line: 383 ]]
        -- upvalues: v30 (copy), v15 (ref)
        if v30.state.upsellState == v15.PromptCheckEmail then
            if v30.password and v30.password ~= "" then
                return "Feature.VerificationUpsell.Heading.VerifyEmail";
            else
                return v30.props.checkExistingEmailTitleKey;
            end;
        elseif v30.state.upsellState == v15.PromptUpdateEmail then
            return v30.props.addEmailTitleKey;
        elseif v30.state.upsellState == v15.PromptEnterPassword then
            return v30.props.addEmailTitleKey;
        else
            return nil;
        end;
    end;
    v30.getBodyTextKey = function() --[[ Line: 402 ]]
        -- upvalues: v30 (copy), v15 (ref), v24 (ref)
        if v30.state.upsellState == v15.PromptCheckEmail then
            return {
                "Feature.VerificationUpsell.Description.VerifyEmailBody"; 
                emailAddress = v30.state.emailAddress
            };
        elseif v30.state.upsellState == v15.PromptUpdateEmail then
            local l_props_0 = v30.props;
            local v45;
            if not v24() then
                v45 = l_props_0.IsLocalUserUnder13;
            else
                local l_emailUpsellLockedIsLocalUserUnder13_1 = l_props_0.emailUpsellLockedIsLocalUserUnder13;
                v45 = if l_emailUpsellLockedIsLocalUserUnder13_1 ~= nil then l_emailUpsellLockedIsLocalUserUnder13_1 else l_props_0.IsLocalUserUnder13;
            end;
            if v45 then
                return v30.props.addEmailUnder13TextKey;
            else
                return v30.props.addEmailOver13TextKey;
            end;
        elseif v30.state.upsellState == v15.PromptEnterPassword then
            return "Feature.VerificationUpsell.Description.EnterPassword";
        else
            return nil;
        end;
    end;
    local v47 = v30.props.renameParentEmailForVerificationUpsell and v30.props.emailPlaceholderUnder13KeyV2 or v30.props.emailPlaceholderUnder13Key;
    local l_props_1 = v30.props;
    local v49;
    if not v24() then
        v49 = l_props_1.IsLocalUserUnder13;
    else
        local l_emailUpsellLockedIsLocalUserUnder13_2 = l_props_1.emailUpsellLockedIsLocalUserUnder13;
        v49 = if l_emailUpsellLockedIsLocalUserUnder13_2 ~= nil then l_emailUpsellLockedIsLocalUserUnder13_2 else l_props_1.IsLocalUserUnder13;
    end;
    local v51 = not v49;
    v30.stateDisplayInfo = {
        [v15.PromptCheckEmail] = {}, 
        [v15.PromptUpdateEmail] = {
            primaryButtonTextKey = "Feature.VerificationUpsell.Action.Continue", 
            secondaryButtonTextKey = v30.props.updateEmailSecondaryButtonText, 
            termsOfServiceKey = "CommonUI.Features.Label.Terms", 
            privacyPolicyKey = v30.props.useUpdatedModalDesign and "CommonUI.Features.Label.Privacy" or "Feature.VerificationUpsell.Action.PrivacyPolicy", 
            textFieldPlaceholderTextKey = v51 and v30.props.emailPlaceholderOver13Key or v47, 
            textFieldLabelTextKey = v51 and v30.props.textLabelOver13Key or v47, 
            onPrimaryButtonActivated = v30.onEmailUpdated, 
            onSecondaryButtonActivated = v30.onUpdateEmailSecondaryButtonPressed, 
            onChangeTextCallback = v30.onEmailChangedCallback, 
            textInputType = Enum.TextInputType.NoSuggestions
        }, 
        [v15.PromptEnterPassword] = {
            primaryButtonTextKey = "Feature.VerificationUpsell.Action.SendConfirmationEmail", 
            textFieldPlaceholderTextKey = "Feature.VerificationUpsell.Label.PasswordInputPlaceholder", 
            onPrimaryButtonActivated = v30.onPasswordEntered, 
            onChangeTextCallback = v30.onPasswordChangedCallback, 
            textInputType = Enum.TextInputType.Password
        }
    };
    if v30.props.useUpdatedModalDesign then
        v30.stateDisplayInfo[v15.PromptUpdateEmail].primaryButtonType = l_ButtonType_0.PrimaryContextual;
        v30.stateDisplayInfo[v15.PromptUpdateEmail].secondaryButtonType = l_ButtonType_0.Secondary;
        v30.stateDisplayInfo[v15.PromptCheckEmail] = {
            primaryButtonTextKey = "Feature.VerificationUpsell.Action.ResendConfirmationEmail", 
            secondaryButtonTextKey = "Feature.VerificationUpsell.Action.ContinueLogOut", 
            onPrimaryButtonActivated = v30.onResendEmailPressed, 
            onSecondaryButtonActivated = v30.onUpdateEmailSecondaryButtonPressed, 
            primaryButtonType = l_ButtonType_0.Secondary, 
            secondaryButtonType = l_ButtonType_0.Secondary
        };
    end;
end;
v26.willUnmount = function(v52) --[[ Line: 469 ]] --[[ Name: willUnmount ]]
    v52.isMounted = false;
    if not v52.emailWasUpdated and v52.props.failureCallback then
        v52.props.failureCallback();
    end;
end;
v26.didMount = function(v53) --[[ Line: 476 ]] --[[ Name: didMount ]]
    v53.isMounted = true;
    v53.props.authEventAnalytics.reportModalShownWithSection(v53.props.eventContext, v53.props.origin, v53.props.section);
end;
v26.render = function(v54) --[[ Line: 485 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v11 (copy), v2 (copy), v20 (copy)
    local v55 = v54.stateDisplayInfo[v54.state.upsellState];
    local l_primaryButtonTextKey_0 = v55.primaryButtonTextKey;
    local l_onPrimaryButtonActivated_0 = v55.onPrimaryButtonActivated;
    local l_secondaryButtonTextKey_0 = v55.secondaryButtonTextKey;
    local l_onSecondaryButtonActivated_0 = v55.onSecondaryButtonActivated;
    local l_termsOfServiceKey_0 = v55.termsOfServiceKey;
    local l_privacyPolicyKey_0 = v55.privacyPolicyKey;
    local l_textInputType_0 = v55.textInputType;
    local l_textFieldPlaceholderTextKey_0 = v55.textFieldPlaceholderTextKey;
    local l_textFieldLabelTextKey_0 = v55.textFieldLabelTextKey;
    local l_onChangeTextCallback_0 = v55.onChangeTextCallback;
    local l_primaryButtonType_0 = v55.primaryButtonType;
    local l_secondaryButtonType_0 = v55.secondaryButtonType;
    local l_errorMessageKey_0 = v54.state.errorMessageKey;
    local v69 = v54.getLinks();
    local v70 = v54.getBodyTextKey();
    local v71 = v54.getTitleTextKey();
    local v72 = {
        primaryButtonText = l_primaryButtonTextKey_0, 
        secondaryButtonText = l_secondaryButtonTextKey_0, 
        termsOfServiceLinkText = l_termsOfServiceKey_0, 
        privacyPolicyLinkText = l_privacyPolicyKey_0, 
        placeholderText = l_textFieldPlaceholderTextKey_0, 
        title = v71, 
        bodyText = v70, 
        textFieldLabelText = l_textFieldLabelTextKey_0
    };
    if l_errorMessageKey_0 and l_errorMessageKey_0 ~= "" then
        v72.errorText = l_errorMessageKey_0;
    end;
    return l_withStyle_0(function(_) --[[ Line: 522 ]]
        -- upvalues: v11 (ref), v72 (copy), v2 (ref), v20 (ref), l_primaryButtonType_0 (copy), l_secondaryButtonType_0 (copy), l_textInputType_0 (copy), l_termsOfServiceKey_0 (copy), l_privacyPolicyKey_0 (copy), v54 (copy), v69 (copy), l_onPrimaryButtonActivated_0 (copy), l_onSecondaryButtonActivated_0 (copy), l_onChangeTextCallback_0 (copy)
        return v11(v72)(function(v74) --[[ Line: 523 ]]
            -- upvalues: v2 (ref), v20 (ref), l_primaryButtonType_0 (ref), l_secondaryButtonType_0 (ref), l_textInputType_0 (ref), l_termsOfServiceKey_0 (ref), l_privacyPolicyKey_0 (ref), v54 (ref), v69 (ref), l_onPrimaryButtonActivated_0 (ref), l_onSecondaryButtonActivated_0 (ref), l_onChangeTextCallback_0 (ref)
            return v2.createElement(v20, {
                title = v74.title, 
                primaryButtonText = v74.primaryButtonText, 
                secondaryButtonText = v74.secondaryButtonText, 
                primaryButtonType = l_primaryButtonType_0, 
                secondaryButtonType = l_secondaryButtonType_0, 
                bodyText = v74.bodyText, 
                textInputType = l_textInputType_0, 
                textFieldPlaceholderText = v74.placeholderText, 
                textFieldLabelText = v74.textFieldLabelText, 
                termsOfServiceLinkKey = l_termsOfServiceKey_0, 
                privacyPolicyLinkKey = l_privacyPolicyKey_0, 
                privacyPolicyLinkText = v74.privacyPolicyLinkText, 
                errorMessage = v74.errorText or v54.state.errorMessage, 
                links = v69, 
                onPrimaryButtonActivated = l_onPrimaryButtonActivated_0, 
                onSecondaryButtonActivated = l_onSecondaryButtonActivated_0, 
                onPrivacyPolicyLinkActivated = v54.onPrivacyPolicyLinkActivated, 
                onTermsOfServiceLinkActivated = v54.onTermsOfServiceLinkActivated, 
                onChangeTextCallback = l_onChangeTextCallback_0, 
                onCloseClickedCallback = v54.closeOverlay, 
                onEmailFocused = v54.onEmailFocused, 
                isEmailModalCalledFromHomePage = v54.props.isEmailModalCalledFromHomePage, 
                shouldShowPrivacyPolicyLink = v54.shouldShowPrivacyPolicyLink, 
                useUpdatedModalDesign = v54.props.useUpdatedModalDesign
            });
        end);
    end);
end;
v26 = v3.connect(function(v75, _) --[[ Line: 554 ]]
    return {
        screenSize = v75.ScreenSize, 
        IsLocalUserUnder13 = v75.IsLocalUserUnder13
    };
end, function(v77) --[[ Line: 559 ]]
    -- upvalues: v14 (copy), v16 (copy), v17 (copy), v18 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 561 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v77 (copy), v14 (ref)
            return v77(v14());
        end, 
        updateUserEmail = function(v78, v79, v80) --[[ Line: 564 ]] --[[ Name: updateUserEmail ]]
            -- upvalues: v77 (copy), v16 (ref)
            return v77(v16(v78, v79, v80));
        end, 
        sendVerificationEmailToUser = function(v81) --[[ Line: 567 ]] --[[ Name: sendVerificationEmailToUser ]]
            -- upvalues: v77 (copy), v17 (ref)
            return v77(v17(v81));
        end, 
        navigateToPage = function(v82) --[[ Line: 570 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v77 (copy), v18 (ref)
            return v77(v18(v82));
        end
    };
end)(v26);
v26 = l_RoactServices_0.connect({
    networking = v4, 
    authEventAnalytics = v6
})(v26);
return (l_RoactAppPolicy_0.connect(function(v83, _) --[[ Line: 581 ]]
    return {
        renameParentEmailForVerificationUpsell = v83.getRenameParentEmailForVerificationUpsell()
    };
end)(v26));