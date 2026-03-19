local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.AuthAnalytics);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_TextInput_0 = require(l_Parent_0.Foundation).TextInput;
local v14 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local v15 = require(l_script_FirstAncestor_0.Context.LoginContext);
local v16 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v17 = require(l_script_FirstAncestor_0.Enums.AuthenticationMethodType);
local v18 = require(l_script_FirstAncestor_0.Components.Constants);
local l_authFormInteraction_0 = v4.Events.authFormInteraction;
local l_EventStreamConstants_0 = v4.EventStreamConstants;
local l_UIConstants_0 = require(l_Parent_0.AuthCommon).Common.UIConstants;
AuthenticationMethod = function(v22) --[[ Line: 45 ]] --[[ Name: AuthenticationMethod ]]
    -- upvalues: v2 (copy), v15 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v14 (copy), v16 (copy), l_useLocalization_0 (copy), v17 (copy), l_StyledTextLabel_0 (copy), l_TextInput_0 (copy), l_authFormInteraction_0 (copy), l_EventStreamConstants_0 (copy), l_UIConstants_0 (copy), l_Button_0 (copy), v18 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy), l_Images_0 (copy)
    local v23 = v2.useContext(v15);
    local v24 = l_useStyle_0();
    local v25 = l_useDesignTokens_0();
    local l_state_0 = v23.state;
    local function v28(v27) --[[ Line: 52 ]]
        -- upvalues: v23 (copy), v14 (ref), v16 (ref)
        v23.dispatch({
            type = v14.SetComponentState, 
            data = {
                component = v16.AuthenticationScreen, 
                payload = v27
            }
        });
    end;
    local v29 = l_state_0 and l_state_0.componentState[v16.AuthenticationScreen].password or "";
    local function _(v30) --[[ Line: 65 ]]
        -- upvalues: v28 (copy)
        v28({
            password = v30
        });
    end;
    local v32, v33 = v2.useState(false);
    local v34 = l_state_0 and l_state_0.componentState[v16.AuthenticationScreen].errorKey or "";
    local function _(v35) --[[ Line: 73 ]]
        -- upvalues: v28 (copy)
        v28({
            errorKey = v35
        });
    end;
    local v37 = l_state_0 and l_state_0.componentState[v16.AuthenticationScreen].errorType or "";
    local v38 = l_useLocalization_0({
        passwordLabelText = "Authentication.Login.Label.Password", 
        nextActionText = "Authentication.Login.Action.Next", 
        usePasskeyActionText = "Authentication.Login.Action.UsePasskey", 
        emailOneTimeCodeActionText = "Authentication.Login.Action.EmailACode", 
        passwordErrorText = v34 ~= "" and v37 == v17.Password and v34 or nil
    });
    local l_Space_100_0 = v25.Global.Space_100;
    if v22.authMethod == v17.Password then
        return v2.createElement("Frame", {
            LayoutOrder = v22.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_Space_100_0)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v25.Global.Space_20)
            }), 
            PasswordLabel = v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                text = v38.passwordLabelText, 
                fontStyle = v24.Font.Body, 
                colorStyle = v24.Theme.TextEmphasis, 
                richText = true
            }), 
            PasswordField = v2.createElement(l_TextInput_0, {
                LayoutOrder = 2, 
                text = "", 
                label = "", 
                textInputType = if v32 then Enum.TextInputType.PasswordShown else Enum.TextInputType.Password, 
                width = UDim.new(1, 0), 
                onChanged = function(v40) --[[ Line: 120 ]] --[[ Name: onChanged ]]
                    -- upvalues: v34 (copy), v37 (copy), v17 (ref), v28 (copy)
                    if v34 ~= "" and v37 == v17.Password then
                        v28({
                            errorKey = ""
                        });
                    end;
                    v28({
                        password = v40
                    });
                end, 
                onFocusGained = function() --[[ Line: 126 ]] --[[ Name: onFocusGained ]]
                    -- upvalues: l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref)
                    l_authFormInteraction_0(l_EventStreamConstants_0.Context.LoginFormV2Auth, l_EventStreamConstants_0.Field.Password, nil, nil, nil);
                end, 
                iconTrailing = {
                    name = if v32 then l_UIConstants_0.SHOW_PASSWORD_ICON else l_UIConstants_0.HIDE_PASSWORD_ICON, 
                    onActivated = function() --[[ Line: 139 ]] --[[ Name: onActivated ]]
                        -- upvalues: v33 (copy), v32 (copy)
                        v33(not v32);
                    end
                }, 
                isDisabled = v22.isLoginInProgress, 
                textBoxRef = v22.textBoxRef
            }), 
            ErrorTextSpacing = v38.passwordErrorText and v2.createElement("Frame", {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, v25.Global.Space_50), 
                BackgroundTransparency = 1
            }), 
            ErrorTextLabel = v38.passwordErrorText and v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 4, 
                text = v38.passwordErrorText, 
                fontStyle = v24.Font.BodySmall, 
                colorStyle = v24.Theme.Alert, 
                automaticSize = Enum.AutomaticSize.XY, 
                textWrapped = true
            }), 
            SubmitButtonSpacing = v2.createElement("Frame", {
                LayoutOrder = 5, 
                Size = UDim2.new(1, 0, 0, v25.Global.Space_200), 
                BackgroundTransparency = 1
            }), 
            SubmitButton = v2.createElement(l_Button_0, {
                layoutOrder = 6, 
                text = v38.nextActionText, 
                buttonTextOverride = v18.getButtonTextOverrideConfig(), 
                onActivated = function() --[[ Line: 168 ]] --[[ Name: onActivated ]]
                    -- upvalues: v22 (copy), v29 (copy)
                    v22.onSubmit(v29);
                end, 
                standardSize = l_StandardButtonSize_0.Regular, 
                buttonType = l_ButtonType_0.PrimaryContextual, 
                isLoading = v22.isLoginInProgress, 
                isDisabled = v29 == ""
            })
        });
    elseif v22.authMethod == v17.Passkey then
        return v2.createElement("Frame", {
            LayoutOrder = v22.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_Space_100_0)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v25.Global.Space_20)
            }), 
            PasskeyButton = v2.createElement(l_Button_0, {
                layoutOrder = 1, 
                text = v38.usePasskeyActionText, 
                buttonTextOverride = v18.getButtonTextOverrideConfig(), 
                onActivated = function() --[[ Line: 196 ]] --[[ Name: onActivated ]]
                    -- upvalues: v22 (copy)
                    v22.onSubmit(nil);
                end, 
                standardSize = l_StandardButtonSize_0.Regular, 
                buttonType = if v22.isFirstItemInList then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.Secondary, 
                isLoading = v22.isLoginInProgress, 
                icon = l_Images_0["icons/menu/passkey"]
            })
        });
    elseif v22.authMethod == v17.EmailOtp then
        return v2.createElement("Frame", {
            LayoutOrder = v22.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, l_Space_100_0)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v25.Global.Space_20)
            }), 
            EmailOtpButton = v2.createElement(l_Button_0, {
                layoutOrder = 1, 
                text = v38.emailOneTimeCodeActionText, 
                buttonTextOverride = v18.getButtonTextOverrideConfig(), 
                onActivated = function() --[[ Line: 224 ]] --[[ Name: onActivated ]]
                    -- upvalues: v22 (copy)
                    v22.onSubmit(nil);
                end, 
                standardSize = l_StandardButtonSize_0.Regular, 
                buttonType = if v22.isFirstItemInList then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.Secondary, 
                isLoading = v22.isLoginInProgress, 
                icon = l_Images_0["icons/menu/email"]
            })
        });
    else
        error("Invalid auth method");
        return v2.createElement("Frame", {
            LayoutOrder = v22.layoutOrder, 
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        });
    end;
end;
return AuthenticationMethod;