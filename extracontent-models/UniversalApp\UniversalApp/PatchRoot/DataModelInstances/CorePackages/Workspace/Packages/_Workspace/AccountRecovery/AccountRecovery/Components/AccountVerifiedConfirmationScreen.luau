local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.AppBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_FullscreenPageWithSafeArea_0 = v4.FullscreenPageWithSafeArea;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v11 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v11.Hooks.useTokens;
local l_Text_0 = v11.Text;
local l_Button_0 = v11.Button;
local l_ButtonVariant_0 = v11.Enums.ButtonVariant;
local l_InputSize_0 = v11.Enums.InputSize;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_GetUserById_0 = require(l_Parent_0.AuthCommon).Thunks.GetUserById;
local v19 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnable2SVRecovery);
local v20 = require(l_script_FirstAncestor_0.Components.getModal);
local v21 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableSkipPasswordReset);
local v22 = require(l_script_FirstAncestor_0.Components.RecoveryHeader);
local v23 = require(l_script_FirstAncestor_0.Components.UserHeader);
local v24 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryPageState);
local l_useClearFocusOnUnmount_0 = require(l_script_FirstAncestor_0.Hooks).useClearFocusOnUnmount;
local v26 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v27 = require(l_script_FirstAncestor_0.Components.Constants);
return function(v28) --[[ Line: 47 ]]
    -- upvalues: v2 (copy), v26 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useClearFocusOnUnmount_0 (copy), l_GetUserById_0 (copy), l_Logger_0 (copy), l_useLocalization_0 (copy), v19 (copy), l_FullscreenPageWithSafeArea_0 (copy), v22 (copy), v23 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), v21 (copy), v27 (copy), v24 (copy), v20 (copy)
    local v29 = v2.useContext(v26);
    local v30 = l_useStyle_0();
    local v31 = l_useTokens_0();
    local v32 = l_useDesignTokens_0();
    local v33 = l_useRoactService_0(l_RoactNetworking_0);
    local v34, v35 = v2.useState("");
    local v36, v37 = v2.useState("");
    local v38, v39 = v2.useState(false);
    local v40, v41 = v2.useState("");
    local v42 = v28.navigation.getParam("userID");
    local v43 = v28.navigation.getParam("closeRecoveryOnBack") or false;
    l_useClearFocusOnUnmount_0();
    v2.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: v42 (copy), l_GetUserById_0 (ref), v33 (copy), v37 (copy), v35 (copy), l_Logger_0 (ref)
        if v42 and v42 ~= 0 then
            l_GetUserById_0(v33, v42):andThen(function(v44) --[[ Line: 67 ]]
                -- upvalues: v37 (ref), v35 (ref)
                v37(v44.name);
                v35(v44.displayName);
            end):catch(function(v45) --[[ Line: 70 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error getting user info: {}", v45);
            end);
        end;
    end, {});
    local v46 = l_useLocalization_0({
        recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery", 
        trustedLocationResetPasswordText = {
            "Authentication.AccountRecovery.Description.TrustedLocationResetPassword"; 
            username = ("@%*"):format(v36)
        }, 
        trustedLocationResetPasswordSkip2svText = {
            "Authentication.AccountRecovery.Description.TrustedLocationResetPasswordSkip2SV"; 
            username = ("@%*"):format(v36)
        }, 
        trustedLocationSkip2svText = {
            "Authentication.AccountRecovery.Description.TrustedLocationSkip2SV"; 
            username = ("@%*"):format(v36)
        }, 
        continueButtonText = "Authentication.AccountRecovery.Action.Continue", 
        resetPasswordButtonText = "Authentication.AccountRecovery.Action.ResetPassword", 
        requestErrorText = if v40 ~= "" then v40 else nil
    });
    local v47 = if v19() and v29.state.recover2sv and v29.state.recoverPassword then v46.trustedLocationResetPasswordSkip2svText else if v19() and v29.state.recover2sv then v46.trustedLocationSkip2svText else v46.trustedLocationResetPasswordText;
    local v48 = if v19() and v29.state.recover2sv then v46.continueButtonText else v46.resetPasswordButtonText;
    local l_createElement_0 = v2.createElement;
    local l_l_FullscreenPageWithSafeArea_0_0 = l_FullscreenPageWithSafeArea_0;
    local v51 = {
        includeStatusBar = true, 
        BackgroundColor3 = v30.Theme.BackgroundDefault.Color
    };
    local v52 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v32.Global.Space_100), 
            PaddingLeft = UDim.new(0, v32.Global.Space_150), 
            PaddingRight = UDim.new(0, v32.Global.Space_150), 
            PaddingBottom = UDim.new(0, v32.Global.Space_100)
        })
    };
    local l_createElement_1 = v2.createElement;
    local v54 = "Frame";
    local v55 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v56 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        Header = v2.createElement(v22, {
            LayoutOrder = 1, 
            onBackActivated = function() --[[ Line: 129 ]] --[[ Name: onBackActivated ]]
                -- upvalues: v43 (copy), v29 (copy), v28 (copy)
                if v43 then
                    v29.parentNavigation.goBack();
                    return;
                else
                    v28.navigation.goBack();
                    return;
                end;
            end, 
            backButtonDisabled = false, 
            recoveryHeadingText = v46.recoveryHeadingText, 
            currentComponent = "accountVerifiedConfirmation", 
            recoverySessionId = v29.state.recoverySessionId
        })
    };
    local l_createElement_2 = v2.createElement;
    local v58 = "Frame";
    local v59 = {
        LayoutOrder = 2, 
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v62 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v32.Global.Space_100), 
            PaddingRight = UDim.new(0, v32.Global.Space_100)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v32.Global.Space_20)
        }), 
        RecoveryHeadingSpacing = v2.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, v32.Global.Space_250), 
            BackgroundTransparency = 1
        }), 
        UserHeader = v2.createElement(v23, {
            LayoutOrder = 2, 
            userId = v42 or 0, 
            displayName = v34, 
            username = v36
        }), 
        UserHeaderSpacing = v2.createElement("Frame", {
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, v31.Size.Size_400), 
            BackgroundTransparency = 1
        }), 
        BodyText = v2.createElement(l_Text_0, {
            LayoutOrder = 4, 
            Text = v47, 
            TextWrapped = true, 
            fontStyle = v31.Typography.BodyMedium, 
            textStyle = v31.Color.Content.Default, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        BodyTextSpacing = v2.createElement("Frame", {
            LayoutOrder = 5, 
            Size = UDim2.new(1, 0, 0, v32.Global.Space_150), 
            BackgroundTransparency = 1
        }), 
        ResetPasswordButton = v2.createElement(l_Button_0, {
            LayoutOrder = 6, 
            variant = l_ButtonVariant_0.Emphasis, 
            size = l_InputSize_0.Medium, 
            text = v48, 
            width = UDim.new(1, 0), 
            isLoading = v38, 
            onActivated = function() --[[ Line: 195 ]] --[[ Name: onActivated ]]
                -- upvalues: v21 (ref), v29 (copy), v39 (copy), v41 (copy), v27 (ref), v42 (copy), v36 (copy), v28 (copy), v24 (ref)
                if v21() and v29.state.recover2sv and not v29.state.recoverPassword then
                    v39(true);
                    v41("");
                    local function v61(v60) --[[ Line: 205 ]]
                        -- upvalues: v41 (ref), v27 (ref), v39 (ref)
                        v41(v60 or v27.UnknownErrorKey);
                        v39(false);
                    end;
                    v29.utils.handleUpdatePassword(v29.state.recoverySessionId, v42, v36, "", "", v61, v29.utils.launchAppOrGoBack);
                    return;
                else
                    v28.navigation.navigate(v24.ChooseAccountScreen, {
                        userID = v42
                    });
                    return;
                end;
            end
        })
    };
    local v63 = false;
    if v40 ~= "" then
        v63 = v2.createElement(l_Text_0, {
            LayoutOrder = 7, 
            Text = v46.requestErrorText or "", 
            fontStyle = v31.Typography.CaptionSmall, 
            textStyle = v31.Color.System.Alert, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            padding = {
                top = UDim.new(0, v31.Size.Size_200)
            }
        });
    end;
    v62.RequestErrorTextLabel = v63;
    v62.Modal = v21() and v20(v29.state.modalStateAndProps);
    v56.Content = l_createElement_2(v58, v59, v62);
    v52.Wrapper = l_createElement_1(v54, v55, v56);
    return l_createElement_0(l_l_FullscreenPageWithSafeArea_0_0, v51, v52);
end;