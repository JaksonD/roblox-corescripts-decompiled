local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactRodux);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_NavigateFromWebView_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateFromWebView;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Common.FullPageModalWrapper);
local v11 = require(l_script_FirstAncestor_0.Common.Lock);
local v12 = require(l_script_FirstAncestor_0.Common.ModalTextComponent);
local v13 = require(l_script_FirstAncestor_0.Common.ModalButtonConfig);
local v14 = require(l_script_FirstAncestor_0.Common.ModalFooter);
local v15 = require(l_script_FirstAncestor_0.Common.ModalTextSizes);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v17 = l_Url_0.BASE_URL .. "my/account#!/info";
local v18 = {
    changePassword = "Authentication.TwoStepVerification.Action.ChangePassword", 
    header = "Authentication.TwoStepVerification.Header.AttemptDenied", 
    passwordWarning = "Authentication.TwoStepVerification.Label.SomeoneMightHavePassword", 
    passwordChangeRecommended = "Authentication.TwoStepVerification.Label.PasswordChangeRecommended", 
    helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage"
};
return v4.connect(function(_, _) --[[ Line: 104 ]]
    return {};
end, function(v21) --[[ Line: 106 ]]
    -- upvalues: l_NavigateDown_0 (copy), l_NavigateFromWebView_0 (copy)
    return {
        navigateToPage = function(v22) --[[ Line: 108 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v21 (copy), l_NavigateDown_0 (ref)
            return v21(l_NavigateDown_0(v22));
        end, 
        navigateFromWebView = function(v23) --[[ Line: 111 ]] --[[ Name: navigateFromWebView ]]
            -- upvalues: v21 (copy), l_NavigateFromWebView_0 (ref)
            return v21(l_NavigateFromWebView_0(v23));
        end
    };
end)(function(v24) --[[ Line: 32 ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), v18 (copy), l_AppPage_0 (copy), v17 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), l_ButtonType_0 (copy), v14 (copy), v15 (copy)
    local v25, v26 = v2.useState(false);
    local v27 = l_useLocalization_0(v18);
    local function v28() --[[ Line: 37 ]]
        -- upvalues: v26 (copy), v24 (copy), l_AppPage_0 (ref), v17 (ref)
        v26(true);
        v24.navigateFromWebView({
            name = l_AppPage_0.SettingsSubPage, 
            detail = v17, 
            extraProps = {
                titleKey = "Feature.AccountSettings.Heading.Tab.Security.AccountInfo"
            }
        });
    end;
    return v2.createElement(v10, {
        title = v27.header, 
        closeModal = v24.closeModal, 
        makeBodyFragment = function(v29) --[[ Line: 53 ]] --[[ Name: makeBodyFragment ]]
            -- upvalues: v2 (ref), v11 (ref), v12 (ref), v27 (copy)
            return v2.createElement(v2.Fragment, nil, {
                Lock = v2.createElement(v11, {
                    layoutOrder = 1
                }), 
                SomeoneMightHaveYourPassword = v2.createElement(v12, {
                    layoutOrder = 2, 
                    contentWidth = v29, 
                    useBold = true, 
                    useEmphasis = true, 
                    text = v27.passwordWarning
                }), 
                ChangeYourPassword = v2.createElement(v12, {
                    layoutOrder = 3, 
                    contentWidth = v29, 
                    useBold = true, 
                    useEmphasis = true, 
                    text = v27.passwordChangeRecommended
                })
            });
        end, 
        buttonConfig = v13({
            {
                isDisabled = v25, 
                isLoading = v25, 
                onActivated = v28, 
                text = v27.changePassword, 
                type = l_ButtonType_0.Secondary
            }
        }), 
        footerContent = v14(function(v30) --[[ Line: 83 ]]
            -- upvalues: v2 (ref), v12 (ref), v27 (copy), v15 (ref), v24 (copy), l_AppPage_0 (ref)
            return v2.createElement(v12, {
                BackgroundTransparency = 0, 
                layoutOrder = 1, 
                text = v27.helpMessage, 
                contentWidth = v30, 
                size = v15.Footer, 
                onActivated = function() --[[ Line: 90 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (ref), l_AppPage_0 (ref)
                    v24.navigateToPage({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account", 
                        extraProps = {
                            title = ""
                        }
                    });
                end
            });
        end)
    });
end);