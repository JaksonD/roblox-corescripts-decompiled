local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Analytics.Events.buttonClick);
local v2 = require(l_Modules_0.LuaApp.Analytics.Events.formInteraction);
local v3 = require(l_Modules_0.LuaApp.Analytics.Events.modalAction);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.crossDeviceEnterCodeButtonClick);
local v5 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.upsellCardModalAction);
local v6 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.upsellCardButtonClick);
local v7 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.upsellCardFormInteraction);
local v8 = require(l_Modules_0.LuaApp.Analytics.Events.screenLoaded);
local v9 = require(l_Modules_0.LuaApp.Analytics.Events.formFieldValidation);
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v11 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v12 = require(l_Modules_0.LuaApp.Analytics.Events.usernameSuggestionClick);
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagAuthNewModalSchematization);
local v14 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v15 = require(l_Modules_0.LuaApp.Components.Authentication.Flags.FFlagSignupDisplayNameLogging);
local v16 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authPageLoad);
local v17 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authClientError);
local v18 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authModalShown);
local v19 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authButtonClick);
local v20 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.usernameSuggestionShown);
local v21 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.authFormInteraction);
return {
    get = function(v22) --[[ Line: 34 ]] --[[ Name: get ]]
        -- upvalues: v10 (copy), v8 (copy), v16 (copy), v18 (copy), v17 (copy), v19 (copy), v3 (copy), v11 (copy), v13 (copy), v5 (copy), v2 (copy), v15 (copy), v21 (copy), v9 (copy), v7 (copy), v1 (copy), v4 (copy), v6 (copy), v12 (copy), v20 (copy), v14 (copy)
        local v23 = v10.get(v22);
        local v89 = {
            reportScreenLoaded = function(v24) --[[ Line: 41 ]] --[[ Name: reportScreenLoaded ]]
                -- upvalues: v8 (ref), v23 (copy)
                v8(v23.EventStream, v24);
            end, 
            reportAuthPageload = function(v25, v26, v27) --[[ Line: 45 ]] --[[ Name: reportAuthPageload ]]
                -- upvalues: v16 (ref), v23 (copy)
                v16(v23.EventStream, v25, v26, v27);
            end, 
            reportAuthModalShown = function(v28, v29) --[[ Line: 50 ]] --[[ Name: reportAuthModalShown ]]
                -- upvalues: v18 (ref), v23 (copy)
                v18(v23.EventStream, v28, v29);
            end, 
            reportAuthClientError = function(v30, v31, v32) --[[ Line: 55 ]] --[[ Name: reportAuthClientError ]]
                -- upvalues: v17 (ref), v23 (copy)
                v17(v23.EventStream, v30, v31, v32);
            end, 
            reportAuthButtonClick = function(v33, v34, v35, v36, v37) --[[ Line: 59 ]] --[[ Name: reportAuthButtonClick ]]
                -- upvalues: v19 (ref), v23 (copy)
                v19(v23.EventStream, v33, v34, v35, v36, v37);
            end, 
            reportModalShown = function(v38, v39) --[[ Line: 63 ]] --[[ Name: reportModalShown ]]
                -- upvalues: v3 (ref), v23 (copy), v11 (ref), v13 (ref)
                v3(v23.EventStream, v38, v11.ActionType.Shown, v39);
                local v40 = {
                    origin = v39
                };
                if v13() then
                    v23.EventStream:setRBXEventStream(v38, v11.AuthEventName.AuthModalShown, v40);
                end;
            end, 
            reportModalShownWithSection = function(v41, v42, v43) --[[ Line: 79 ]] --[[ Name: reportModalShownWithSection ]]
                -- upvalues: v5 (ref), v23 (copy), v11 (ref)
                v5(v23.EventStream, v41, "", v11.ActionType.Shown, v42, v43);
            end, 
            reportModalShownWithSectionAndError = function(v44, v45, v46, v47, v48) --[[ Line: 90 ]] --[[ Name: reportModalShownWithSectionAndError ]]
                -- upvalues: v5 (ref), v23 (copy), v11 (ref)
                v5(v23.EventStream, v44, v45, v11.ActionType.Shown, v46, v47, v48);
            end, 
            reportModalDismissed = function(v49, v50) --[[ Line: 102 ]] --[[ Name: reportModalDismissed ]]
                -- upvalues: v3 (ref), v23 (copy), v11 (ref)
                v3(v23.EventStream, v49, v11.ActionType.Dismiss, v50);
            end, 
            reportModalDismissedWithSection = function(v51, v52, v53) --[[ Line: 106 ]] --[[ Name: reportModalDismissedWithSection ]]
                -- upvalues: v5 (ref), v23 (copy), v11 (ref)
                v5(v23.EventStream, v51, "", v11.ActionType.Dismiss, v52, v53);
            end, 
            reportModalActionWithSection = function(v54, v55, v56, v57, v58, v59) --[[ Line: 117 ]] --[[ Name: reportModalActionWithSection ]]
                -- upvalues: v5 (ref), v23 (copy)
                v5(v23.EventStream, v54, v55, v56, v57, v58, v59);
            end, 
            reportBirthdaySelection = function(v60) --[[ Line: 123 ]] --[[ Name: reportBirthdaySelection ]]
                -- upvalues: v11 (ref), v2 (ref), v23 (copy)
                local l_Submit_0 = v11.ActionType.Submit;
                v2(v23.EventStream, v60, v11.Field.BirthdayYear, l_Submit_0);
                v2(v23.EventStream, v60, v11.Field.BirthdayMonth, l_Submit_0);
                v2(v23.EventStream, v60, v11.Field.BirthdayDay, l_Submit_0);
            end, 
            reportAgeFocus = function(v62) --[[ Line: 130 ]] --[[ Name: reportAgeFocus ]]
                -- upvalues: v2 (ref), v23 (copy), v11 (ref)
                v2(v23.EventStream, v62, v11.Field.BirthdayAge, v11.ActionType.Focus);
            end, 
            reportYearFocus = function(v63) --[[ Line: 139 ]] --[[ Name: reportYearFocus ]]
                -- upvalues: v2 (ref), v23 (copy), v11 (ref)
                v2(v23.EventStream, v63, v11.Field.BirthdayYear, v11.ActionType.Focus);
            end, 
            reportUsernameFocus = function(v64) --[[ Line: 148 ]] --[[ Name: reportUsernameFocus ]]
                -- upvalues: v2 (ref), v23 (copy), v11 (ref)
                v2(v23.EventStream, v64, v11.Field.Username, v11.ActionType.Focus);
            end, 
            reportDisplayNameFocus = function(v65) --[[ Line: 157 ]] --[[ Name: reportDisplayNameFocus ]]
                -- upvalues: v15 (ref), v21 (ref), v23 (copy), v11 (ref), v2 (ref)
                if v15 then
                    v21(v23.EventStream, v11.Context.SinglePageSignUpScreen, v11.Field.DisplayName, v11.ActionType.Focus);
                    return;
                else
                    v2(v23.EventStream, v65, v11.Field.DisplayName, v11.ActionType.Focus);
                    return;
                end;
            end, 
            reportPasswordFocus = function(v66) --[[ Line: 175 ]] --[[ Name: reportPasswordFocus ]]
                -- upvalues: v2 (ref), v23 (copy), v11 (ref)
                v2(v23.EventStream, v66, v11.Field.Password, v11.ActionType.Focus);
            end, 
            report2SVCodeFocus = function(v67) --[[ Line: 184 ]] --[[ Name: report2SVCodeFocus ]]
                -- upvalues: v2 (ref), v23 (copy), v11 (ref)
                v2(v23.EventStream, v67, v11.Field.TwoStepAuthCode, v11.ActionType.Focus);
            end, 
            reportFocus = function(v68, v69, v70) --[[ Line: 193 ]] --[[ Name: reportFocus ]]
                -- upvalues: v2 (ref), v23 (copy), v11 (ref)
                v2(v23.EventStream, v68, v69, v11.ActionType.Focus, v70);
            end, 
            report2SVInvalidCode = function(v71, v72) --[[ Line: 203 ]] --[[ Name: report2SVInvalidCode ]]
                -- upvalues: v9 (ref), v23 (copy), v11 (ref)
                v9(v23.EventStream, v71, v11.Field.TwoStepAuthCode, v72);
            end, 
            reportErrorMessageShown = function(v73, v74, v75) --[[ Line: 212 ]] --[[ Name: reportErrorMessageShown ]]
                -- upvalues: v2 (ref), v23 (copy), v11 (ref)
                v2(v23.EventStream, v73, v74, v11.ActionType.Shown, v75);
            end, 
            reportInteractWithAction = function(v76, v77, v78, v79, v80) --[[ Line: 222 ]] --[[ Name: reportInteractWithAction ]]
                -- upvalues: v2 (ref), v23 (copy)
                v2(v23.EventStream, v76, v77, v78, v79, v80);
            end, 
            reportInteractWithActionAndSection = function(v81, v82, v83, v84, v85, v86) --[[ Line: 226 ]] --[[ Name: reportInteractWithActionAndSection ]]
                -- upvalues: v7 (ref), v23 (copy)
                v7(v23.EventStream, v81, v82, v83, v84, v85, v86);
            end, 
            reportSignUpButtonClicked = function(v87) --[[ Line: 239 ]] --[[ Name: reportSignUpButtonClicked ]]
                -- upvalues: v1 (ref), v23 (copy), v11 (ref)
                v1(v23.EventStream, v87, v11.Button.SignUp);
            end, 
            reportLogInButtonClicked = function(v88) --[[ Line: 243 ]] --[[ Name: reportLogInButtonClicked ]]
                -- upvalues: v1 (ref), v23 (copy), v11 (ref)
                v1(v23.EventStream, v88, v11.Button.LogIn);
            end
        };
        v89.reportSwitchAccountButtonClicked = function(v90) --[[ Line: 247 ]] --[[ Name: reportSwitchAccountButtonClicked ]]
            -- upvalues: v89 (copy), v11 (ref)
            v89.reportAuthButtonClick(v90, v11.Button.SwitchAccounts, nil);
        end;
        v89.reportContinueButtonClicked = function(v91) --[[ Line: 256 ]] --[[ Name: reportContinueButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v91, v11.Button.Continue);
        end;
        v89.reportDismissCornerXButtonClicked = function(v92) --[[ Line: 260 ]] --[[ Name: reportDismissCornerXButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v92, v11.Button.DismissCornerX);
        end;
        v89.reportForgotPasswordButtonClicked = function(v93) --[[ Line: 264 ]] --[[ Name: reportForgotPasswordButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v93, v11.Button.ForgotPassword);
        end;
        v89.report2SVHelpButtonClicked = function(v94) --[[ Line: 268 ]] --[[ Name: report2SVHelpButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v94, v11.Button.NeedHelpLink);
        end;
        v89.reportResendCodeButtonClicked = function(v95) --[[ Line: 272 ]] --[[ Name: reportResendCodeButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v95, v11.Button.ResendCode);
        end;
        v89.reportRememberDeviceButtonClicked = function(v96) --[[ Line: 276 ]] --[[ Name: reportRememberDeviceButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v96, v11.Button.RememberDevice);
        end;
        v89.reportShowPasswordButtonClicked = function(v97) --[[ Line: 280 ]] --[[ Name: reportShowPasswordButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v97, v11.Button.ShowPassword);
        end;
        v89.reportHidePasswordButtonClicked = function(v98) --[[ Line: 284 ]] --[[ Name: reportHidePasswordButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v98, v11.Button.HidePassword);
        end;
        v89.reportAvatarSelectedButtonClicked = function(v99, v100) --[[ Line: 288 ]] --[[ Name: reportAvatarSelectedButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v99, v11.Button.AvatarSelected, v100);
        end;
        v89.reportWeChatButtonClicked = function(v101) --[[ Line: 292 ]] --[[ Name: reportWeChatButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v101, v11.Button.WeChat);
        end;
        v89.reportQQButtonClicked = function(v102) --[[ Line: 296 ]] --[[ Name: reportQQButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy), v11 (ref)
            v1(v23.EventStream, v102, v11.Button.QQ);
        end;
        v89.reportButtonClicked = function(v103, v104) --[[ Line: 300 ]] --[[ Name: reportButtonClicked ]]
            -- upvalues: v1 (ref), v23 (copy)
            v1(v23.EventStream, v103, v104);
        end;
        v89.reportButtonClickedWithCType = function(v105, v106, v107) --[[ Line: 304 ]] --[[ Name: reportButtonClickedWithCType ]]
            -- upvalues: v4 (ref), v23 (copy)
            v4(v23.EventStream, v105, v106, nil, v107);
        end;
        v89.reportButtonClickedWithSectionAndOrigin = function(v108, v109, v110, v111) --[[ Line: 308 ]] --[[ Name: reportButtonClickedWithSectionAndOrigin ]]
            -- upvalues: v6 (ref), v23 (copy)
            v6(v23.EventStream, v108, v109, nil, v110, v111);
        end;
        v89.reportUsernameSuggestionClicked = function(v112, v113, v114, v115) --[[ Line: 312 ]] --[[ Name: reportUsernameSuggestionClicked ]]
            -- upvalues: v12 (ref), v23 (copy)
            v12(v23.EventStream, v112, v113, v114, v115);
        end;
        v89.reportUsernameSuggestionShown = function(v116, v117, v118, v119) --[[ Line: 316 ]] --[[ Name: reportUsernameSuggestionShown ]]
            -- upvalues: v20 (ref), v23 (copy)
            v20(v23.EventStream, v116, v117, v118, v119);
        end;
        v89.reportDisplayNameFieldLoaded = function(v120, v121, v122) --[[ Line: 325 ]] --[[ Name: reportDisplayNameFieldLoaded ]]
            -- upvalues: v14 (ref), v21 (ref), v23 (copy)
            v14("DisplayNameFieldLoaded", 1);
            v21(v23.EventStream, v120, v121, v122);
        end;
        v89.reportDisplayNameFieldBypassed = function(v123, v124) --[[ Line: 331 ]] --[[ Name: reportDisplayNameFieldBypassed ]]
            -- upvalues: v14 (ref), v17 (ref), v23 (copy)
            v14(v124, 1);
            v17(v23.EventStream, v123, v124);
        end;
        v89.reportUsernameGenerationFailed = function(v125, v126) --[[ Line: 337 ]] --[[ Name: reportUsernameGenerationFailed ]]
            -- upvalues: v14 (ref), v17 (ref), v23 (copy)
            v14(v126, 1);
            v17(v23.EventStream, v125, v126);
        end;
        v89.reportAuthFormInteraction = function(v127, v128, v129, v130, v131) --[[ Line: 343 ]] --[[ Name: reportAuthFormInteraction ]]
            -- upvalues: v21 (ref), v23 (copy)
            v21(v23.EventStream, v127, v128, v129, v130, v131);
        end;
        return v89;
    end
};