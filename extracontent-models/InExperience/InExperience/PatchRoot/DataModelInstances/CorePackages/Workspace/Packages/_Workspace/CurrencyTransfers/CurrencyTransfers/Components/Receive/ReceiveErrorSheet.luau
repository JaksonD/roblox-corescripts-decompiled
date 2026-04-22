local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.NetworkRequests.getTransferRequestByIdRequest);
local v5 = require(l_script_FirstAncestor_0.Hooks.useUserNameFromUserId);
local v6 = require(l_script_FirstAncestor_0.Localization.TransferLocalizationKeys);
local v7 = require(l_script_FirstAncestor_0.Localization.transferLocaleFormat);
local v8 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v8.Sheet;
local l_View_0 = v8.View;
local l_Text_0 = v8.Text;
local l_Button_0 = v8.Button;
local l_Icon_0 = v8.Icon;
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_FillBehavior_0 = v8.Enums.FillBehavior;
local l_useScaledValue_0 = v8.Hooks.useScaledValue;
local l_useTokens_0 = v8.Hooks.useTokens;
local l_Enums_0 = v8.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v20 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v21 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local function _(v22, v23, v24) --[[ Line: 38 ]] --[[ Name: getErrorMessageAndButton ]]
    -- upvalues: v20 (copy), v7 (copy)
    if not v22 then
        return v23.GenericError, v23.TryAgain;
    else
        local l_OK_0 = v23.OK;
        local v26 = nil;
        if v22 == v20.TransferDisabledForUser then
            v26 = v23.AccountDisabled;
        elseif v22 == v20.TransferExpired then
            v26 = v7.substituteUsername(v23.TransferExpired, (tostring(v24)));
        else
            v26 = v23.GenericError;
            l_OK_0 = v23.TryAgain;
        end;
        return v26, l_OK_0;
    end;
end;
return function(_) --[[ Line: 64 ]] --[[ Name: ReceiveErrorSheet ]]
    -- upvalues: v21 (copy), l_useTokens_0 (copy), v3 (copy), v20 (copy), v2 (copy), v4 (copy), v5 (copy), l_useLocalization_0 (copy), v6 (copy), v7 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v29 = v21();
    local v30 = l_useTokens_0();
    local v31 = v3.useSignalState(v29.getErrorTransferModel);
    local v32 = v3.useSignalState(v29.getSender);
    local v33 = v3.useSignalState(v29.getRobuxTransfer);
    local v34 = v3.useSignalState(v29.getTransferRequestId);
    local l_triggerOnClose_0 = v29.triggerOnClose;
    local v36 = if v31 then v31.failureReason else nil;
    local v37 = v36 == v20.TransferExpired;
    v2.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v37 (copy), v32 (copy), v33 (copy), v34 (copy), v4 (ref), v29 (copy)
        if not v37 or v32 or v33 and v33.sender or not v34 then
            return;
        else
            v4({
                transferRequestId = v34
            }):andThen(function(v38) --[[ Line: 86 ]]
                -- upvalues: v29 (ref)
                if v38 and v38.transfer and v38.transfer.sender then
                    v29.setSender(v38.transfer.sender);
                end;
            end):catch(function() --[[ Line: 91 ]]

            end);
            return;
        end;
    end, {
        v37, 
        v34, 
        v32, 
        v33
    });
    local v39 = v32 or v33 and v33.sender or nil;
    local v40 = if v39 then v39.targetId else nil;
    local v41 = v5(if v37 and v40 and v40 ~= 0 then v40 else nil);
    local v42 = if v39 and (v39.targetName or v39.targetDisplayName) then v39.targetName or v39.targetDisplayName else if v37 and v41 and v41 ~= "" then v41 else nil;
    local v43 = l_useLocalization_0(v6.Presets.ReceiveErrorSheet);
    local v44, v45;
    if not v36 then
        v44 = v43.GenericError;
        v45 = v43.TryAgain;
    else
        local l_OK_1 = v43.OK;
        local v47 = nil;
        if v36 == v20.TransferDisabledForUser then
            v47 = v43.AccountDisabled;
        elseif v36 == v20.TransferExpired then
            v47 = v7.substituteUsername(v43.TransferExpired, (tostring(v42)));
        else
            v47 = v43.GenericError;
            l_OK_1 = v43.TryAgain;
        end;
        v44 = v47;
        v45 = l_OK_1;
    end;
    return v2.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        snapPoints = {
            l_useScaledValue_0(300), 
            0.5
        }, 
        onClose = l_triggerOnClose_0
    }, {
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 1
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = "col gap-xlarge auto-y size-full-0 align-x-center align-y-center padding-top-xlarge"
            }, {
                ErrorIconContainer = v2.createElement(l_View_0, {
                    tag = "size-1200-1200 radius-circle align-x-center align-y-center bg-inverse-emphasis", 
                    LayoutOrder = 1
                }, {
                    ErrorIcon = v2.createElement(l_Icon_0, {
                        name = l_Enums_0.IconName.TriangleExclamation, 
                        size = v30.Size.Size_1200, 
                        tag = "content-inverse-emphasis"
                    })
                }), 
                ErrorMessage = v2.createElement(l_Text_0, {
                    Text = v44, 
                    tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap", 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 2
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 2
        }, {
            v2.createElement(l_View_0, {
                tag = "col auto-y align-y-center align-x-center size-full-0 gap-small"
            }, {
                v2.createElement(l_View_0, {
                    tag = "row auto-y size-full-0 gap-small"
                }, {
                    v2.createElement(l_Button_0, {
                        text = v45, 
                        onActivated = l_triggerOnClose_0, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;