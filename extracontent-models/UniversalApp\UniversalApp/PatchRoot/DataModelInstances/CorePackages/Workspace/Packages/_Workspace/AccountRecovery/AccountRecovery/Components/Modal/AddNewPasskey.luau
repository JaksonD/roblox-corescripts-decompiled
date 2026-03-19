local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v6 = require(l_Parent_0.AuthCommon);
local l_RegisterPreauthPasskey_0 = v6.Thunks.RegisterPreauthPasskey;
local l_FinishARPreauthPasskeyRegistration_0 = v6.Thunks.FinishARPreauthPasskeyRegistration;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v10 = require(l_Parent_0.CredentialsProtocol);
local l_default_0 = v10.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v10.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v13 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v14 = require(l_script_FirstAncestor_0.Enums.ModalState);
local v15 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryActionType);
local v16 = require(l_script_FirstAncestor_0.Components.Constants);
local v17 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v17.Enums.ButtonVariant;
local l_Dialog_0 = v17.Dialog;
local l_DialogSize_0 = v17.Enums.DialogSize;
local l_Text_0 = v17.Text;
local l_useTokens_0 = v17.Hooks.useTokens;
return function(v23) --[[ Line: 43 ]]
    -- upvalues: v2 (copy), v13 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useTokens_0 (copy), l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_Logger_0 (copy), v15 (copy), v14 (copy), l_RegisterPreauthPasskey_0 (copy), l_FinishARPreauthPasskeyRegistration_0 (copy), v16 (copy), l_useLocalization_0 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_Text_0 (copy), l_ButtonVariant_0 (copy)
    local v24 = v2.useContext(v13);
    local v25 = l_useRoactService_0(l_RoactNetworking_0);
    local v26 = l_useTokens_0();
    local v27, v28 = v2.useState(false);
    local v29, v30 = v2.useState(true);
    local v31, v32 = v2.useState(false);
    local v33, v34 = v2.useState("");
    v2.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: l_default_0 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), v28 (copy), v30 (copy), l_Logger_0 (ref)
        l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v35) --[[ Line: 56 ]]
            -- upvalues: v28 (ref), v30 (ref)
            v28(v35.isAvailable or false);
            v30(false);
        end):catch(function(v36) --[[ Line: 60 ]]
            -- upvalues: l_Logger_0 (ref), v28 (ref), v30 (ref)
            l_Logger_0:warning("Error checking for available credential types. Error: {}", v36);
            v28(false);
            v30(false);
        end);
    end, {});
    local function v37() --[[ Line: 67 ]]
        -- upvalues: v24 (copy), v15 (ref), v14 (ref), v23 (copy)
        v24.dispatch({
            type = v15.SET_MODAL_STATE_AND_PROPS, 
            data = {
                modalStateAndProps = {
                    modalState = v14.UPDATE_EMAIL, 
                    props = {
                        email = v23.email, 
                        onPasswordResetSuccess = v23.onPasswordResetSuccess
                    }
                }
            }
        });
    end;
    local function v40() --[[ Line: 82 ]]
        -- upvalues: v31 (copy), v32 (copy), v34 (copy), l_RegisterPreauthPasskey_0 (ref), v25 (copy), v23 (copy), l_FinishARPreauthPasskeyRegistration_0 (ref), v24 (copy), v37 (copy), v16 (ref)
        if v31 then
            return;
        else
            v32(true);
            v34("");
            l_RegisterPreauthPasskey_0(v25, v23.username):andThen(function(v38) --[[ Line: 89 ]]
                -- upvalues: l_FinishARPreauthPasskeyRegistration_0 (ref), v25 (ref), v24 (ref), v23 (ref)
                return l_FinishARPreauthPasskeyRegistration_0(v25, v24.state.recoverySessionId, v38.sessionId, v23.userId, v38.result, true);
            end):andThen(function() --[[ Line: 99 ]]
                -- upvalues: v32 (ref), v23 (ref), v37 (ref)
                v32(false);
                if v23.shouldUpdateEmail then
                    v37();
                    return;
                else
                    v23.onPasswordResetSuccess();
                    return;
                end;
            end):catch(function(_) --[[ Line: 107 ]]
                -- upvalues: v32 (ref), v34 (ref), v16 (ref)
                v32(false);
                v34(v16.UnknownErrorKey);
            end);
            return;
        end;
    end;
    local function _() --[[ Line: 113 ]]
        -- upvalues: v23 (copy), v37 (copy)
        if v23.shouldUpdateEmail then
            v37();
            return;
        else
            v23.onPasswordResetSuccess();
            return;
        end;
    end;
    local v42 = l_useLocalization_0({
        addPasskeyHeadingText = "Authentication.AccountRecovery.Heading.EnhancedProtectionPostRecoveryPasskey", 
        passkeyNotSupportedHeadingText = "Authentication.AccountRecovery.Heading.EnhancedProtectionProgramPostRecoveryNoPasskey", 
        addPasskeyBodyText = {
            "Authentication.AccountRecovery.Description.EnhancedProtectionAddPasskey"; 
            lineBreak = "\n"
        }, 
        passkeyNotSupportedBodyText = "Authentication.AccountRecovery.Description.DeviceDoesNotSupportPasskey", 
        addPasskeyButtonText = "Authentication.AccountRecovery.Action.AddAPasskey", 
        skipButtonText = "Authentication.AccountRecovery.Action.SkipAddingPasskey", 
        okButtonText = "Authentication.AccountRecovery.Action.Ok", 
        requestErrorText = if v33 ~= "" then v33 else nil
    });
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        disablePortal = false, 
        hasBackdrop = true
    }, {
        DialogTitle = not v29 and v2.createElement(l_Dialog_0.Title, {
            LayoutOrder = 2, 
            text = v27 and v42.addPasskeyHeadingText or v42.passkeyNotSupportedHeadingText
        }), 
        DialogContent = not v29 and v2.createElement(l_Dialog_0.Content, {
            LayoutOrder = 3
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            DialogText = v2.createElement(l_Dialog_0.Text, {
                LayoutOrder = 1, 
                Text = v27 and v42.addPasskeyBodyText or v42.passkeyNotSupportedBodyText
            }), 
            ErrorText = if v33 ~= "" then v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v42.requestErrorText or "", 
                TextWrapped = true, 
                fontStyle = v26.Typography.CaptionSmall, 
                textStyle = v26.Color.System.Alert, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }) else nil
        }), 
        DialogActionsPasskeySupported = not v29 and v27 and v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 4, 
            actions = {
                {
                    text = v42.addPasskeyButtonText, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = function() --[[ Line: 175 ]] --[[ Name: onActivated ]]
                        -- upvalues: v40 (copy)
                        v40();
                    end
                }, 
                {
                    text = v42.skipButtonText, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = function() --[[ Line: 182 ]] --[[ Name: onActivated ]]
                        -- upvalues: v23 (copy), v37 (copy)
                        if v23.shouldUpdateEmail then
                            v37();
                            return;
                        else
                            v23.onPasswordResetSuccess();
                            return;
                        end;
                    end
                }
            }
        }), 
        DialogActionsPasskeyNotSupported = not v29 and not v27 and v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 5, 
            actions = {
                {
                    text = v42.okButtonText, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = function() --[[ Line: 196 ]] --[[ Name: onActivated ]]
                        -- upvalues: v23 (copy), v37 (copy)
                        if v23.shouldUpdateEmail then
                            v37();
                            return;
                        else
                            v23.onPasswordResetSuccess();
                            return;
                        end;
                    end
                }
            }
        })
    });
end;