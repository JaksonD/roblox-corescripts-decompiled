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
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v25 = v2.PureComponent:extend(script.Name);
v25.defaultProps = {
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
v25.init = function(v26) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v21 (copy), v19 (copy), v23 (copy), v12 (copy), v22 (copy), v13 (copy), l_UrlBuilder_0 (copy), l_ButtonType_0 (copy)
    local l_PromptUpdateEmail_0 = v15.PromptUpdateEmail;
    if v26.props.emailAddress then
        l_PromptUpdateEmail_0 = v15.PromptCheckEmail;
    end;
    v26.potentialEmailAddress = nil;
    v26.password = nil;
    v26.emailWasUpdated = false;
    v26.state = {
        upsellState = l_PromptUpdateEmail_0, 
        emailAddress = v26.props.emailAddress or ""
    };
    v26.closeOverlay = function() --[[ Line: 69 ]]
        -- upvalues: v26 (copy)
        if v26.isMounted then
            v26.props.closeCentralOverlay();
            v26.props.authEventAnalytics.reportModalDismissedWithSection(v26.props.eventContext, v26.props.origin, v26.props.section);
        end;
    end;
    v26.onUpdateEmailSecondaryButtonPressed = function() --[[ Line: 80 ]]
        -- upvalues: v26 (copy), v21 (ref)
        if v26.isMounted and v26.props.onUpdateEmailSecondaryButtonPressed then
            v26.props.onUpdateEmailSecondaryButtonPressed();
            v26.props.authEventAnalytics.reportInteractWithAction(v26.props.eventContext, "", v21.ActionType.Click, v26.props.origin, v26.props.onUpdateEmailSecondaryButtonPressedEvent);
        end;
    end;
    v26.onPasswordChangedCallback = function(v28) --[[ Line: 93 ]]
        -- upvalues: v26 (copy)
        v26.password = v28.Text;
    end;
    v26.onEmailChangedCallback = function(v29) --[[ Line: 97 ]]
        -- upvalues: v26 (copy)
        v26.potentialEmailAddress = v29.Text;
    end;
    v26.onResendEmailPressed = function() --[[ Line: 101 ]]
        -- upvalues: v26 (copy), v21 (ref)
        if v26.isMounted then
            v26:setState({
                isInResendEmailCooldown = true
            });
            v26.props.sendVerificationEmailToUser(v26.props.networking):andThen(function() --[[ Line: 109 ]]
                -- upvalues: v26 (ref)
                spawn(function() --[[ Line: 111 ]]
                    -- upvalues: v26 (ref)
                    wait(20);
                    v26.resetResendEmailState(true);
                end);
            end):catch(function() --[[ Line: 117 ]]
                -- upvalues: v26 (ref)
                v26.resetResendEmailState(false);
            end);
            v26.props.authEventAnalytics.reportInteractWithActionAndSection(v26.props.eventContext, "", v21.ActionType.Click, v26.props.origin, v21.Button.ResendEmailConfirmation, "verifyEmail");
        end;
    end;
    v26.resetResendEmailState = function(v30) --[[ Line: 132 ]]
        -- upvalues: v26 (copy)
        local v31 = v30 and "" or "Feature.VerificationUpsell.Message.ConfirmationEmailNotSent";
        if v26.isMounted then
            if v31 ~= "" then
                v26.props.authEventAnalytics.reportErrorMessageShown(v26.props.eventContext, "", v26.props.origin);
            end;
            v26:setState({
                isInResendEmailCooldown = false, 
                errorMessageKey = v31
            });
        end;
    end;
    v26.onUpdateEmailSelected = function() --[[ Line: 147 ]]
        -- upvalues: v26 (copy), v15 (ref), v21 (ref)
        if v26.isMounted then
            v26:setState({
                upsellState = v15.PromptUpdateEmail, 
                errorMessageKey = ""
            });
            v26.props.authEventAnalytics.reportInteractWithActionAndSection(v26.props.eventContext, "", v21.ActionType.Click, v26.props.origin, v21.Button.ChangeEmail, "verifyEmail");
        end;
    end;
    v26.onEmailFocused = function() --[[ Line: 164 ]]
        -- upvalues: v26 (copy), v21 (ref)
        v26.props.authEventAnalytics.reportInteractWithActionAndSection(v26.props.eventContext, v21.Field.Email, v21.ActionType.Focus, v26.props.origin, "", v26.props.section);
    end;
    v26.onEmailUpdated = function() --[[ Line: 175 ]]
        -- upvalues: v26 (copy), v19 (ref), v21 (ref), v15 (ref)
        if v26.isMounted then
            local v32 = v19(v26.potentialEmailAddress);
            v26.props.authEventAnalytics.reportInteractWithActionAndSection(v26.props.eventContext, "", "", v26.props.origin, v21.Button.Continue, v26.props.section);
            if v32 then
                v26:setState({
                    errorMessageKey = ""
                });
                local l_potentialEmailAddress_0 = v26.potentialEmailAddress;
                v26.props.updateUserEmail(v26.props.networking, l_potentialEmailAddress_0, nil):andThen(function() --[[ Line: 197 ]]
                    -- upvalues: v26 (ref), l_potentialEmailAddress_0 (copy), v15 (ref)
                    if v26.isMounted then
                        v26.emailWasUpdated = true;
                        if v26.props.successCallback then
                            v26.props.successCallback(l_potentialEmailAddress_0);
                        end;
                        if v26.props.closeOnEmailUpdate then
                            v26.closeOverlay();
                            return;
                        else
                            v26:setState({
                                upsellState = v15.PromptCheckEmail, 
                                errorMessage = "", 
                                errorMessageKey = "", 
                                emailAddress = l_potentialEmailAddress_0, 
                                isInResendEmailCooldown = false
                            });
                        end;
                    end;
                end):catch(function(v34) --[[ Line: 218 ]]
                    -- upvalues: v26 (ref)
                    if v26.isMounted then
                        v26:setState({
                            errorMessageKey = "", 
                            errorMessage = v34 and v34.Message, 
                            isInResendEmailCooldown = false
                        });
                        v26.props.authEventAnalytics.reportModalShownWithSectionAndError(v26.props.eventContext, "errorMessage", v26.props.origin, v26.props.section, v34.ErrorCode);
                    end;
                end);
                return;
            else
                v26:setState({
                    errorMessageKey = "Feature.VerificationUpsell.Message.InvalidEmailAddress"
                });
                v26.props.authEventAnalytics.reportErrorMessageShown(v26.props.eventContext, "", v26.props.origin);
            end;
        end;
    end;
    v26.onPasswordEntered = function() --[[ Line: 246 ]]
        -- upvalues: v26 (copy), v15 (ref)
        if v26.isMounted then
            v26:setState({
                isInResendEmailCooldown = true
            });
            local l_potentialEmailAddress_1 = v26.potentialEmailAddress;
            v26.props.updateUserEmail(v26.props.networking, l_potentialEmailAddress_1, v26.password):andThen(function() --[[ Line: 256 ]]
                -- upvalues: v26 (ref), v15 (ref), l_potentialEmailAddress_1 (copy)
                v26:setState({
                    upsellState = v15.PromptCheckEmail, 
                    errorMessage = "", 
                    errorMessageKey = "", 
                    emailAddress = l_potentialEmailAddress_1, 
                    isInResendEmailCooldown = false
                });
            end):catch(function(v36) --[[ Line: 266 ]]
                -- upvalues: v26 (ref)
                local l_PasswordIncorrect_0 = v36.PasswordIncorrect;
                local v38 = "";
                if l_PasswordIncorrect_0 then
                    v38 = "Feature.VerificationUpsell.Message.WrongPassword";
                end;
                v26:setState({
                    errorMessageKey = v38, 
                    errorMessage = v36.Message, 
                    isInResendEmailCooldown = false
                });
            end);
        end;
    end;
    v26.shouldShowPrivacyPolicyLink = function() --[[ Line: 282 ]]
        -- upvalues: v23 (ref), v26 (copy), v15 (ref)
        if not v23() then
            return false;
        elseif v26.state.upsellState ~= v15.PromptUpdateEmail then
            return false;
        elseif v26.props.IsLocalUserUnder13 then
            return true;
        else
            return false;
        end;
    end;
    v26.onPrivacyPolicyLinkActivated = function() --[[ Line: 295 ]]
        -- upvalues: v26 (copy), v21 (ref), v12 (ref), v22 (ref), v13 (ref)
        if v26.isMounted then
            v26.props.authEventAnalytics.reportModalActionWithSection(v26.props.eventContext, v21.Field.PrivacyPolicy, "", v26.props.origin, v26.props.section);
            v26.props.navigateToPage({
                name = v12.GenericWebPage, 
                detail = v22(), 
                extraProps = {
                    title = "", 
                    transitionAnimation = v13.SlideInFromBottom
                }
            });
        end;
    end;
    v26.onTermsOfServiceLinkActivated = function() --[[ Line: 315 ]]
        -- upvalues: v26 (copy), v21 (ref), v12 (ref), l_UrlBuilder_0 (ref), v13 (ref)
        if v26.isMounted then
            v26.props.authEventAnalytics.reportModalActionWithSection(v26.props.eventContext, v21.Field.TermsOfService, "", v26.props.origin, v26.props.section);
            v26.props.navigateToPage({
                name = v12.GenericWebPage, 
                detail = l_UrlBuilder_0.static.about.terms(), 
                extraProps = {
                    title = "", 
                    transitionAnimation = v13.SlideInFromBottom
                }
            });
        end;
    end;
    v26.getLinks = function() --[[ Line: 335 ]]
        -- upvalues: v26 (copy), v15 (ref)
        if v26.state.upsellState ~= v15.PromptCheckEmail then
            return nil;
        else
            local l_onResendEmailPressed_0 = v26.onResendEmailPressed;
            if v26.state.isInResendEmailCooldown then
                l_onResendEmailPressed_0 = nil;
            end;
            if v26.props.useUpdatedModalDesign then
                return {
                    {
                        textKey = "Feature.VerificationUpsell.Action.ChangeEmail", 
                        onClicked = v26.onUpdateEmailSelected, 
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
                        onClicked = v26.onUpdateEmailSelected, 
                        isPrimaryLink = false
                    }
                };
            end;
        end;
    end;
    v26.getTitleTextKey = function() --[[ Line: 371 ]]
        -- upvalues: v26 (copy), v15 (ref)
        if v26.state.upsellState == v15.PromptCheckEmail then
            if v26.password and v26.password ~= "" then
                return "Feature.VerificationUpsell.Heading.VerifyEmail";
            else
                return v26.props.checkExistingEmailTitleKey;
            end;
        elseif v26.state.upsellState == v15.PromptUpdateEmail then
            return v26.props.addEmailTitleKey;
        elseif v26.state.upsellState == v15.PromptEnterPassword then
            return v26.props.addEmailTitleKey;
        else
            return nil;
        end;
    end;
    v26.getBodyTextKey = function() --[[ Line: 390 ]]
        -- upvalues: v26 (copy), v15 (ref)
        if v26.state.upsellState == v15.PromptCheckEmail then
            return {
                "Feature.VerificationUpsell.Description.VerifyEmailBody"; 
                emailAddress = v26.state.emailAddress
            };
        elseif v26.state.upsellState == v15.PromptUpdateEmail then
            if v26.props.IsLocalUserUnder13 then
                return v26.props.addEmailUnder13TextKey;
            else
                return v26.props.addEmailOver13TextKey;
            end;
        elseif v26.state.upsellState == v15.PromptEnterPassword then
            return "Feature.VerificationUpsell.Description.EnterPassword";
        else
            return nil;
        end;
    end;
    local v40 = v26.props.renameParentEmailForVerificationUpsell and v26.props.emailPlaceholderUnder13KeyV2 or v26.props.emailPlaceholderUnder13Key;
    local v41 = not v26.props.IsLocalUserUnder13;
    v26.stateDisplayInfo = {
        [v15.PromptCheckEmail] = {}, 
        [v15.PromptUpdateEmail] = {
            primaryButtonTextKey = "Feature.VerificationUpsell.Action.Continue", 
            secondaryButtonTextKey = v26.props.updateEmailSecondaryButtonText, 
            termsOfServiceKey = "CommonUI.Features.Label.Terms", 
            privacyPolicyKey = v26.props.useUpdatedModalDesign and "CommonUI.Features.Label.Privacy" or "Feature.VerificationUpsell.Action.PrivacyPolicy", 
            textFieldPlaceholderTextKey = v41 and v26.props.emailPlaceholderOver13Key or v40, 
            textFieldLabelTextKey = v41 and v26.props.textLabelOver13Key or v40, 
            onPrimaryButtonActivated = v26.onEmailUpdated, 
            onSecondaryButtonActivated = v26.onUpdateEmailSecondaryButtonPressed, 
            onChangeTextCallback = v26.onEmailChangedCallback, 
            textInputType = Enum.TextInputType.NoSuggestions
        }, 
        [v15.PromptEnterPassword] = {
            primaryButtonTextKey = "Feature.VerificationUpsell.Action.SendConfirmationEmail", 
            textFieldPlaceholderTextKey = "Feature.VerificationUpsell.Label.PasswordInputPlaceholder", 
            onPrimaryButtonActivated = v26.onPasswordEntered, 
            onChangeTextCallback = v26.onPasswordChangedCallback, 
            textInputType = Enum.TextInputType.Password
        }
    };
    if v26.props.useUpdatedModalDesign then
        v26.stateDisplayInfo[v15.PromptUpdateEmail].primaryButtonType = l_ButtonType_0.PrimaryContextual;
        v26.stateDisplayInfo[v15.PromptUpdateEmail].secondaryButtonType = l_ButtonType_0.Secondary;
        v26.stateDisplayInfo[v15.PromptCheckEmail] = {
            primaryButtonTextKey = "Feature.VerificationUpsell.Action.ResendConfirmationEmail", 
            secondaryButtonTextKey = "Feature.VerificationUpsell.Action.ContinueLogOut", 
            onPrimaryButtonActivated = v26.onResendEmailPressed, 
            onSecondaryButtonActivated = v26.onUpdateEmailSecondaryButtonPressed, 
            primaryButtonType = l_ButtonType_0.Secondary, 
            secondaryButtonType = l_ButtonType_0.Secondary
        };
    end;
end;
v25.willUnmount = function(v42) --[[ Line: 457 ]] --[[ Name: willUnmount ]]
    v42.isMounted = false;
    if not v42.emailWasUpdated and v42.props.failureCallback then
        v42.props.failureCallback();
    end;
end;
v25.didMount = function(v43) --[[ Line: 464 ]] --[[ Name: didMount ]]
    v43.isMounted = true;
    v43.props.authEventAnalytics.reportModalShownWithSection(v43.props.eventContext, v43.props.origin, v43.props.section);
end;
v25.render = function(v44) --[[ Line: 473 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v11 (copy), v2 (copy), v20 (copy)
    local v45 = v44.stateDisplayInfo[v44.state.upsellState];
    local l_primaryButtonTextKey_0 = v45.primaryButtonTextKey;
    local l_onPrimaryButtonActivated_0 = v45.onPrimaryButtonActivated;
    local l_secondaryButtonTextKey_0 = v45.secondaryButtonTextKey;
    local l_onSecondaryButtonActivated_0 = v45.onSecondaryButtonActivated;
    local l_termsOfServiceKey_0 = v45.termsOfServiceKey;
    local l_privacyPolicyKey_0 = v45.privacyPolicyKey;
    local l_textInputType_0 = v45.textInputType;
    local l_textFieldPlaceholderTextKey_0 = v45.textFieldPlaceholderTextKey;
    local l_textFieldLabelTextKey_0 = v45.textFieldLabelTextKey;
    local l_onChangeTextCallback_0 = v45.onChangeTextCallback;
    local l_primaryButtonType_0 = v45.primaryButtonType;
    local l_secondaryButtonType_0 = v45.secondaryButtonType;
    local l_errorMessageKey_0 = v44.state.errorMessageKey;
    local v59 = v44.getLinks();
    local v60 = v44.getBodyTextKey();
    local v61 = v44.getTitleTextKey();
    local v62 = {
        primaryButtonText = l_primaryButtonTextKey_0, 
        secondaryButtonText = l_secondaryButtonTextKey_0, 
        termsOfServiceLinkText = l_termsOfServiceKey_0, 
        privacyPolicyLinkText = l_privacyPolicyKey_0, 
        placeholderText = l_textFieldPlaceholderTextKey_0, 
        title = v61, 
        bodyText = v60, 
        textFieldLabelText = l_textFieldLabelTextKey_0
    };
    if l_errorMessageKey_0 and l_errorMessageKey_0 ~= "" then
        v62.errorText = l_errorMessageKey_0;
    end;
    return l_withStyle_0(function(_) --[[ Line: 510 ]]
        -- upvalues: v11 (ref), v62 (copy), v2 (ref), v20 (ref), l_primaryButtonType_0 (copy), l_secondaryButtonType_0 (copy), l_textInputType_0 (copy), l_termsOfServiceKey_0 (copy), l_privacyPolicyKey_0 (copy), v44 (copy), v59 (copy), l_onPrimaryButtonActivated_0 (copy), l_onSecondaryButtonActivated_0 (copy), l_onChangeTextCallback_0 (copy)
        return v11(v62)(function(v64) --[[ Line: 511 ]]
            -- upvalues: v2 (ref), v20 (ref), l_primaryButtonType_0 (ref), l_secondaryButtonType_0 (ref), l_textInputType_0 (ref), l_termsOfServiceKey_0 (ref), l_privacyPolicyKey_0 (ref), v44 (ref), v59 (ref), l_onPrimaryButtonActivated_0 (ref), l_onSecondaryButtonActivated_0 (ref), l_onChangeTextCallback_0 (ref)
            return v2.createElement(v20, {
                title = v64.title, 
                primaryButtonText = v64.primaryButtonText, 
                secondaryButtonText = v64.secondaryButtonText, 
                primaryButtonType = l_primaryButtonType_0, 
                secondaryButtonType = l_secondaryButtonType_0, 
                bodyText = v64.bodyText, 
                textInputType = l_textInputType_0, 
                textFieldPlaceholderText = v64.placeholderText, 
                textFieldLabelText = v64.textFieldLabelText, 
                termsOfServiceLinkKey = l_termsOfServiceKey_0, 
                privacyPolicyLinkKey = l_privacyPolicyKey_0, 
                privacyPolicyLinkText = v64.privacyPolicyLinkText, 
                errorMessage = v64.errorText or v44.state.errorMessage, 
                links = v59, 
                onPrimaryButtonActivated = l_onPrimaryButtonActivated_0, 
                onSecondaryButtonActivated = l_onSecondaryButtonActivated_0, 
                onPrivacyPolicyLinkActivated = v44.onPrivacyPolicyLinkActivated, 
                onTermsOfServiceLinkActivated = v44.onTermsOfServiceLinkActivated, 
                onChangeTextCallback = l_onChangeTextCallback_0, 
                onCloseClickedCallback = v44.closeOverlay, 
                onEmailFocused = v44.onEmailFocused, 
                isEmailModalCalledFromHomePage = v44.props.isEmailModalCalledFromHomePage, 
                shouldShowPrivacyPolicyLink = v44.shouldShowPrivacyPolicyLink, 
                useUpdatedModalDesign = v44.props.useUpdatedModalDesign
            });
        end);
    end);
end;
v25 = v3.connect(function(v65, _) --[[ Line: 542 ]]
    return {
        screenSize = v65.ScreenSize, 
        IsLocalUserUnder13 = v65.IsLocalUserUnder13
    };
end, function(v67) --[[ Line: 547 ]]
    -- upvalues: v14 (copy), v16 (copy), v17 (copy), v18 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 549 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v67 (copy), v14 (ref)
            return v67(v14());
        end, 
        updateUserEmail = function(v68, v69, v70) --[[ Line: 552 ]] --[[ Name: updateUserEmail ]]
            -- upvalues: v67 (copy), v16 (ref)
            return v67(v16(v68, v69, v70));
        end, 
        sendVerificationEmailToUser = function(v71) --[[ Line: 555 ]] --[[ Name: sendVerificationEmailToUser ]]
            -- upvalues: v67 (copy), v17 (ref)
            return v67(v17(v71));
        end, 
        navigateToPage = function(v72) --[[ Line: 558 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v67 (copy), v18 (ref)
            return v67(v18(v72));
        end
    };
end)(v25);
v25 = l_RoactServices_0.connect({
    networking = v4, 
    authEventAnalytics = v6
})(v25);
return (l_RoactAppPolicy_0.connect(function(v73, _) --[[ Line: 569 ]]
    return {
        renameParentEmailForVerificationUpsell = v73.getRenameParentEmailForVerificationUpsell()
    };
end)(v25));