local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_RoactRodux_0 = v1.RoactRodux;
local l_RoactServiceTags_0 = v1.RoactServiceTags;
local l_RobloxAppHooks_0 = v1.RobloxAppHooks;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_NavigateDown_0 = v1.NavigationRodux.Thunks.NavigateDown;
local l_CloseCentralOverlay_0 = v1.CentralOverlay.Thunks.CloseCentralOverlay;
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = require(l_Parent_0.Common.otpLoginTypes);
local v11 = require(l_Parent_0.Common.otpLoginConstants);
local v12 = require(l_Parent_0.Utils.isStringValidEmail);
local v13 = require(l_Parent_0.Utils.debounce);
local v14 = require(script.Parent.EnterEmailView);
local v15 = require(script.Parent.EnterCodeView);
local v16 = require(l_Parent_0.Thunks.SendCode);
local v17 = require(l_Parent_0.Thunks.ResendCode);
local v18 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v19 = require(l_Parent_0.Analytics.EventConstants);
local v20 = game:DefineFastFlag("ShouldEnableOtpSignup", false);
local l_useState_0 = l_React_0.useState;
local v22 = {
    EnterEmail = "sendOtp", 
    EnterCode = "enterOtp"
};
return (l_RoactRodux_0.connect(function(v23, _) --[[ Line: 297 ]]
    return {
        screenSize = v23.screenSize
    };
end, function(v25) --[[ Line: 301 ]]
    -- upvalues: v16 (copy), v17 (copy), l_NavigateDown_0 (copy), l_CloseCentralOverlay_0 (copy)
    return {
        sendCode = function(v26, v27) --[[ Line: 303 ]] --[[ Name: sendCode ]]
            -- upvalues: v25 (copy), v16 (ref)
            return v25(v16(v26, v27));
        end, 
        resendCode = function(v28, v29) --[[ Line: 306 ]] --[[ Name: resendCode ]]
            -- upvalues: v25 (copy), v17 (ref)
            return v25(v17(v28, v29));
        end, 
        navigateToPage = function(v30) --[[ Line: 309 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v25 (copy), l_NavigateDown_0 (ref)
            return v25(l_NavigateDown_0(v30));
        end, 
        closeCentralOverlay = function() --[[ Line: 312 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v25 (copy), l_CloseCentralOverlay_0 (ref)
            return v25(l_CloseCentralOverlay_0());
        end
    };
end)(function(v31) --[[ Line: 54 ]] --[[ Name: EmailOtpOverlay ]]
    -- upvalues: l_useLocalization_0 (copy), v11 (copy), l_useState_0 (copy), v22 (copy), l_React_0 (copy), l_RobloxAppHooks_0 (copy), l_RoactServiceTags_0 (copy), v18 (copy), v19 (copy), v13 (copy), v12 (copy), v20 (copy), l_UserInputService_0 (copy), v14 (copy), v15 (copy)
    local v32 = l_useLocalization_0({
        enterEmailTitle = v31.enterEmailTitleKey, 
        enterEmailDescription = v31.enterEmailDescriptionKey, 
        enterCodeTitle = v31.enterCodeTitleKey, 
        enterCodeDescription = v31.enterCodeDescriptionKey
    });
    local v33 = l_useLocalization_0(v11.errorMessageKeys);
    local v34, v35 = l_useState_0(v22.EnterEmail);
    local v36, v37 = l_useState_0("");
    local v38, v39 = l_useState_0("");
    local v40, v41 = l_useState_0("");
    local v42, v43 = l_useState_0(false);
    local v44, v45 = l_useState_0(false);
    local v46, v47 = l_useState_0(0);
    local v48 = l_React_0.useRef(false);
    local v49 = l_RobloxAppHooks_0.useRoactService(l_RoactServiceTags_0.RoactNetworking);
    local v50 = nil;
    local v51 = l_React_0.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: v18 (ref), v19 (ref), v31 (copy), v35 (copy), v22 (ref)
        v18.sendButtonClickEvent(v19.ctx.enterOtp, v31.origin, v19.btn.changeEmail);
        v35(v22.EnterEmail);
    end, {
        v35, 
        v31.origin
    });
    local v52 = l_React_0.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v31 (copy)
        v31.navigateToPage({
            name = "GenericWebPage", 
            detail = "https://en.help.roblox.com/hc/articles/11014749736980", 
            extraProps = {
                title = "", 
                transitionAnimation = "SlideInFromBottom"
            }
        });
    end, {
        v31.navigateToPage
    });
    local v53 = l_React_0.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v41 (copy)
        v41("");
    end, {
        v41
    });
    local v55 = l_React_0.useCallback(v13(function(v54) --[[ Line: 96 ]]
        -- upvalues: v18 (ref), v19 (ref), v31 (copy), v53 (copy), v37 (copy), v12 (ref), v41 (copy), v33 (copy)
        v18.sendFormInteractionEvent(v19.ctx.sendOtp, v31.origin, v19.field.email);
        v53();
        if v54.Text then
            v37(v54.Text);
            if not v12(v54.Text) then
                v41(v33.InvalidEmail);
            end;
        end;
    end, 0.5), {
        v37, 
        v31.origin
    });
    local function v58(v56) --[[ Line: 109 ]]
        -- upvalues: v11 (ref), v33 (copy), v41 (copy), v34 (copy), v22 (ref), v18 (ref), v31 (copy), v19 (ref)
        local v57 = nil;
        if v56 then
            v57 = v11.statusCodeMap[v56];
        end;
        if v57 and v33[v57] then
            v41(v33[v57]);
            if v34 == v22.EnterEmail then
                v18.sendMsgShownEvent(v34, v31.origin, v19.field.errorMessage, v56);
                return;
            else
                v18.sendMsgShownEvent(v34, v31.origin, v19.field.resendErrorMessage, v56);
                return;
            end;
        else
            v41(v33.Unknown);
            if v34 == v22.EnterEmail then
                v18.sendMsgShownEvent(v34, v31.origin, v19.field.errorMessage, 1);
                return;
            else
                v18.sendMsgShownEvent(v34, v31.origin, v19.field.resendErrorMessage, 1);
                return;
            end;
        end;
    end;
    local function _(v59) --[[ Line: 141 ]]
        -- upvalues: v11 (ref)
        return v59 == "signup" and v11.otpServiceOriginSignup or v11.otpServiceOrigin;
    end;
    local function v66(v61) --[[ Line: 145 ]]
        -- upvalues: v43 (copy), v31 (copy), v11 (ref), v49 (copy), v39 (copy), v35 (copy), v22 (ref), v58 (copy)
        v43(true);
        local v62 = {
            origin = v31.origin == "signup" and v11.otpServiceOriginSignup or v11.otpServiceOrigin, 
            contactType = v11.otpServiceContactType, 
            contactValue = v61
        };
        local v63 = v31.sendCode(v49, v62);
        if v63 then
            v63:andThen(function(v64) --[[ Line: 155 ]]
                -- upvalues: v43 (ref), v39 (ref), v35 (ref), v22 (ref)
                v43(false);
                v39(v64.otpSessionToken);
                v35(v22.EnterCode);
            end):catch(function(v65) --[[ Line: 160 ]]
                -- upvalues: v43 (ref), v58 (ref)
                v43(false);
                v58((tonumber(v65)));
            end);
        end;
    end;
    local v67 = l_React_0.useCallback(function() --[[ Line: 167 ]]
        -- upvalues: v18 (ref), v19 (ref), v31 (copy), v66 (copy), v36 (copy)
        v18.sendButtonClickEvent(v19.ctx.sendOtp, v31.origin, v19.btn.sendCode);
        v66(v36);
    end, {
        v36, 
        v31.origin
    });
    local function v73(v68) --[[ Line: 172 ]]
        -- upvalues: v31 (copy), v11 (ref), v49 (copy), v39 (copy), v58 (copy)
        local v69 = {
            origin = v31.origin == "signup" and v11.otpServiceOriginSignup or v11.otpServiceOrigin, 
            contactType = v11.otpServiceContactType, 
            otpSessionToken = v68
        };
        local v70 = v31.resendCode(v49, v69);
        if v70 then
            v70:andThen(function(v71) --[[ Line: 181 ]]
                -- upvalues: v39 (ref)
                v39(v71.otpSessionToken);
            end):catch(function(v72) --[[ Line: 184 ]]
                -- upvalues: v58 (ref)
                v58((tonumber(v72)));
            end);
        end;
    end;
    local v74 = l_React_0.useCallback(function() --[[ Line: 190 ]]
        -- upvalues: v18 (ref), v19 (ref), v31 (copy), v73 (copy), v38 (copy)
        v18.sendButtonClickEvent(v19.ctx.enterOtp, v31.origin, v19.btn.resendCode);
        v73(v38);
    end, {
        v38, 
        v31.origin
    });
    local v81 = l_React_0.useCallback(function(v75) --[[ Line: 195 ]]
        -- upvalues: v18 (ref), v19 (ref), v31 (copy), v43 (copy), v48 (copy), v38 (copy), v20 (ref), v11 (ref), v58 (copy), v41 (copy), v33 (copy)
        v18.sendButtonClickEvent(v19.ctx.enterOtp, v31.origin, v19.btn.login);
        v43(true);
        v48.current = true;
        local v76 = v31.onSubmitCode(v38, v75);
        if v20 then
            if v76 then
                if v31.origin == v11.otpServiceOriginSignup then
                    v76:andThen(function() --[[ Line: 209 ]]

                    end):catch(function(v77) --[[ Line: 212 ]]
                        -- upvalues: v58 (ref), v48 (ref)
                        v58((tonumber(v77)));
                        v48.current = false;
                    end);
                end;
                v43(false);
                return;
            end;
        else
            v76:andThen(function(v78) --[[ Line: 222 ]]
                -- upvalues: v11 (ref), v41 (ref), v33 (ref), v48 (ref), v43 (ref)
                if v78 and type(v78) == "string" then
                    for v79, v80 in v11.errorMessageKeys do
                        if v78 == v80 then
                            v41(v33[v79]);
                        end;
                    end;
                    v48.current = false;
                end;
                v43(false);
            end);
        end;
    end, {
        v38, 
        v31.origin
    });
    local function v82() --[[ Line: 236 ]]
        -- upvalues: v18 (ref), v34 (copy), v31 (copy), v19 (ref)
        v18.sendButtonClickEvent(v34, v31.origin, v19.btn.cancel);
        v31.closeCentralOverlay();
    end;
    l_React_0.useEffect(function() --[[ Line: 241 ]]
        -- upvalues: v50 (ref), l_UserInputService_0 (ref), v45 (copy), v47 (copy), v48 (copy), v31 (copy)
        v50 = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 243 ]]
            -- upvalues: v45 (ref), l_UserInputService_0 (ref), v47 (ref)
            v45(l_UserInputService_0.OnScreenKeyboardVisible);
            v47(l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0);
        end);
        return function() --[[ Line: 250 ]]
            -- upvalues: v50 (ref), v48 (ref), v31 (ref)
            if v50 then
                v50:Disconnect();
            end;
            v50 = nil;
            if not v48.current then
                v31.onModalAbandoned();
            end;
        end;
    end, {});
    local l_createElement_0 = l_React_0.createElement;
    local l_Fragment_0 = l_React_0.Fragment;
    local v85 = nil;
    local v86 = {};
    local v87 = false;
    if v34 == v22.EnterEmail then
        v87 = l_React_0.createElement(v14, {
            origin = v31.origin, 
            enterEmailTitle = v32.enterEmailTitle, 
            enterEmailDescription = v32.enterEmailDescription, 
            email = v36, 
            onEmailTextChange = v55, 
            errorMessage = v40, 
            handleContinue = v67, 
            onClose = v82, 
            isDisabled = v42, 
            isKeyboardShowing = v44, 
            keyboardHeight = v46, 
            screenSize = v31.screenSize
        });
    end;
    v86.EnterEmail = v87;
    v87 = false;
    if v34 == v22.EnterCode then
        v87 = l_React_0.createElement(v15, {
            origin = v31.origin, 
            enterCodeTitle = v32.enterCodeTitle, 
            enterCodeDescription = v32.enterCodeDescription, 
            email = v36, 
            errorMessage = v40, 
            clearErrorMessage = v53, 
            onResendCode = v74, 
            onSubmitCode = v81, 
            complianceCheckboxMessageKey = v31.complianceCheckboxMessageKey, 
            returnToEnterEmail = v51, 
            navigateToHelp = v52, 
            onClose = v82, 
            isDisabled = v42, 
            isKeyboardShowing = v44, 
            keyboardHeight = v46, 
            screenSize = v31.screenSize
        });
    end;
    v86.EnterCode = v87;
    return l_createElement_0(l_Fragment_0, v85, v86);
end));