local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.AppBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FullscreenPageWithSafeArea_0 = v4.FullscreenPageWithSafeArea;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v9 = require(l_Parent_0.Foundation);
local l_Text_0 = v9.Text;
local l_useTokens_0 = v9.Hooks.useTokens;
local l_ScrollView_0 = v9.ScrollView;
local l_Visibility_0 = v9.Enums.Visibility;
local l_InputSize_0 = v9.Enums.InputSize;
local l_Button_0 = v9.Button;
local l_ButtonVariant_0 = v9.Enums.ButtonVariant;
local l_useClearFocusOnUnmount_0 = require(l_script_FirstAncestor_0.Hooks).useClearFocusOnUnmount;
local v18 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v19 = require(l_script_FirstAncestor_0.Enums.RecoveryState);
local v20 = require(l_script_FirstAncestor_0.Components.RecoveryHeader);
local v21 = require(l_script_FirstAncestor_0.Components.UserHeader);
local v22 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryPageState);
local v23 = require(l_script_FirstAncestor_0.Components.Constants);
local v24 = require(l_script_FirstAncestor_0.Components.getModal);
local v25 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableSkipPasswordReset);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
return function(v27) --[[ Line: 41 ]]
    -- upvalues: v2 (copy), v18 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_useClearFocusOnUnmount_0 (copy), v23 (copy), v19 (copy), v22 (copy), v25 (copy), l_useLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v20 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v21 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), v24 (copy)
    local v28 = v2.useContext(v18);
    local v29 = l_useStyle_0();
    local v30 = l_useTokens_0();
    local v31 = l_useDesignTokens_0();
    local v32 = v27.navigation.getParam("userID");
    local v33 = v27.navigation.getParam("displayName");
    local v34 = v27.navigation.getParam("username");
    local v35 = v27.navigation.getParam("didAbandon2SV");
    local v36 = v27.navigation.getParam("contactMethodNumber");
    local v37, v38 = v2.useState("");
    local v39, v40 = v2.useState(false);
    local v41, v42 = v2.useState(Vector2.new(0, 0));
    l_useClearFocusOnUnmount_0();
    local function v46(v43, v44, v45) --[[ Line: 61 ]]
        -- upvalues: v23 (ref), v19 (ref), v27 (copy), v22 (ref), v36 (copy), v28 (copy), v25 (ref), v34 (copy)
        if v44 == nil then
            v45(v23.UnknownErrorKey);
            return;
        elseif v44.recoveryState == v19.RECOVERY_STATE_CONTACT_METHOD_VERIFICATION_REQUIRED then
            v27.navigation.navigate(v22.SendCodeScreen, {
                userID = v43, 
                isSecondContactMethodVerification = true, 
                previousRecoveryMethod = v44.previousRecoveryMethod, 
                previousRecoveryMethodTypes = v44.previousRecoveryMethodTypes
            });
            return;
        elseif v44.recoveryState == v19.RECOVERY_STATE_ACCOUNT_VERIFIED then
            if v36 == 0 and v28.state.recover2sv then
                v27.navigation.replace(v22.AccountVerifiedConfirmationScreen, {
                    userID = v43
                });
                return;
            elseif v25() and v28.state.recover2sv and not v28.state.recoverPassword then
                v28.utils.handleUpdatePassword(v28.state.recoverySessionId, v43, v34, "", "", v45, v28.utils.launchAppOrGoBack);
                return;
            else
                v27.navigation.replace(v22.ChooseAccountScreen, {
                    userID = v43
                });
                return;
            end;
        elseif v44.recoveryState == v19.RECOVERY_STATE_AWAITING_REEVALUATION then
            v27.navigation.navigate(v22.CannotRecoverAccountScreen, {
                userID = v43
            });
            return;
        else
            v45(v23.UnknownErrorKey);
            return;
        end;
    end;
    local function v48(v47) --[[ Line: 117 ]]
        -- upvalues: v41 (copy), v42 (copy)
        if v41 ~= v47.AbsoluteSize then
            v42(v47.AbsoluteSize);
        end;
    end;
    local v49 = l_useLocalization_0({
        recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery", 
        verifyAgainBodyText = "Authentication.AccountRecovery.Description.VerifyAgain", 
        somethingWentWrongVerifyAgainText = "Authentication.AccountRecovery.Description.SomethingWentWrongVerifyAgain", 
        continueButtonText = "Authentication.AccountRecovery.Action.Continue", 
        requestErrorText = if v37 ~= "" then v37 else nil
    });
    return v2.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v29.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v31.Global.Space_100), 
            PaddingLeft = UDim.new(0, v31.Global.Space_150), 
            PaddingRight = UDim.new(0, v31.Global.Space_150), 
            PaddingBottom = UDim.new(0, v31.Global.Space_100)
        }), 
        Wrapper = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v31.Global.Space_250)
            }), 
            PreScrollContent = v2.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                [v2.Change.AbsoluteSize] = v48
            }, {
                Header = v2.createElement(v20, {
                    LayoutOrder = 1, 
                    onBackActivated = function() --[[ Line: 160 ]] --[[ Name: onBackActivated ]]
                        -- upvalues: v27 (copy)
                        v27.navigation.goBack();
                    end, 
                    backButtonDisabled = v39, 
                    recoveryHeadingText = v49.recoveryHeadingText, 
                    currentComponent = "continueFallback", 
                    recoverySessionId = v28.state.recoverySessionId
                })
            }), 
            ContentScrollView = v2.createElement(l_ScrollView_0, {
                LayoutOrder = 2, 
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    scrollBarVisibility = l_Visibility_0.Auto
                }, 
                Size = UDim2.new(1, 0, 1, -v41.Y)
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v31.Global.Space_100), 
                    PaddingRight = UDim.new(0, v31.Global.Space_100)
                }), 
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v31.Global.Space_20)
                }), 
                UserHeader = v2.createElement(v21, {
                    LayoutOrder = 1, 
                    userId = v32, 
                    displayName = v33, 
                    username = v34
                }), 
                BodyText = v2.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = v35 and v49.verifyAgainBodyText or v49.somethingWentWrongVerifyAgainText, 
                    TextWrapped = true, 
                    fontStyle = v30.Typography.BodyMedium, 
                    textStyle = v30.Color.Content.Default, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    padding = {
                        top = UDim.new(0, v30.Size.Size_300), 
                        bottom = UDim.new(0, v30.Size.Size_300)
                    }
                }), 
                ContinueButton = v2.createElement(l_Button_0, {
                    LayoutOrder = 3, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    size = l_InputSize_0.Medium, 
                    text = v49.continueButtonText, 
                    width = UDim.new(1, 0), 
                    onActivated = function() --[[ Line: 218 ]] --[[ Name: onActivated ]]
                        -- upvalues: v40 (copy), v38 (copy), v23 (ref), v28 (copy), v32 (copy), v46 (copy)
                        v40(true);
                        v38("");
                        local function v51(v50) --[[ Line: 222 ]]
                            -- upvalues: v38 (ref), v23 (ref), v40 (ref)
                            v38(v50 or v23.UnknownErrorKey);
                            v40(false);
                        end;
                        v28.utils.handleContinueRecovery(v28.state.recoverySessionId, v32, function(v52) --[[ Line: 229 ]]
                            -- upvalues: v46 (ref), v32 (ref), v51 (copy)
                            v46(v32, v52, v51);
                        end, v51, function() --[[ Line: 233 ]]
                            -- upvalues: v40 (ref)
                            v40(false);
                        end);
                    end, 
                    isLoading = v39
                }), 
                RequestErrorTextLabel = v2.createElement(l_Text_0, {
                    LayoutOrder = 4, 
                    Text = v49.requestErrorText or "", 
                    fontStyle = v30.Typography.CaptionSmall, 
                    textStyle = v30.Color.System.Alert, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    padding = {
                        top = UDim.new(0, v30.Size.Size_200)
                    }
                }), 
                Modal = v25() and v24(v28.state.modalStateAndProps)
            })
        })
    });
end;