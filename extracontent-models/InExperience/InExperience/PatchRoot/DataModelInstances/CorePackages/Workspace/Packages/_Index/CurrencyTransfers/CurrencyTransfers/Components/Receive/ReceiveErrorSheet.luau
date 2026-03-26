local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.NetworkRequests.getTransferRequestByIdRequest);
local v5 = require(l_script_FirstAncestor_0.Hooks.useUserNameFromUserId);
local v6 = require(l_Parent_0.Foundation);
local l_Sheet_0 = v6.Sheet;
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_Button_0 = v6.Button;
local l_Icon_0 = v6.Icon;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_FillBehavior_0 = v6.Enums.FillBehavior;
local l_useScaledValue_0 = v6.Hooks.useScaledValue;
local l_useTokens_0 = v6.Hooks.useTokens;
local l_Enums_0 = v6.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v18 = require(l_script_FirstAncestor_0.Enums.FailureReason);
local v19 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local function _(v20, v21, v22) --[[ Line: 36 ]] --[[ Name: getErrorMessageAndButton ]]
    -- upvalues: v18 (copy)
    if not v20 then
        return v21.GenericError, v21.TryAgain;
    else
        local l_OK_0 = v21.OK;
        local v24 = nil;
        if v20 == v18.TransferDisabledForUser then
            v24 = v21.AccountDisabled;
        elseif v20 == v18.TransferExpired then
            v24 = string.gsub(v21.TransferExpired, "{username}", (tostring(v22)));
        else
            v24 = v21.GenericError;
            l_OK_0 = v21.TryAgain;
        end;
        return v24, l_OK_0;
    end;
end;
return function(_) --[[ Line: 62 ]] --[[ Name: ReceiveErrorSheet ]]
    -- upvalues: v19 (copy), l_useTokens_0 (copy), v3 (copy), v18 (copy), v2 (copy), v4 (copy), v5 (copy), l_useLocalization_0 (copy), l_Sheet_0 (copy), l_useScaledValue_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy)
    local v27 = v19();
    local v28 = l_useTokens_0();
    local v29 = v3.useSignalState(v27.getErrorTransferModel);
    local v30 = v3.useSignalState(v27.getSender);
    local v31 = v3.useSignalState(v27.getRobuxTransfer);
    local v32 = v3.useSignalState(v27.getTransferRequestId);
    local l_triggerOnClose_0 = v27.triggerOnClose;
    local v34 = if v29 then v29.failureReason else nil;
    local v35 = v34 == v18.TransferExpired;
    v2.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v35 (copy), v30 (copy), v31 (copy), v32 (copy), v4 (ref), v27 (copy)
        if not v35 or v30 or v31 and v31.sender or not v32 then
            return;
        else
            v4({
                transferRequestId = v32
            }):andThen(function(v36) --[[ Line: 84 ]]
                -- upvalues: v27 (ref)
                if v36 and v36.transfer and v36.transfer.sender then
                    v27.setSender(v36.transfer.sender);
                end;
            end):catch(function() --[[ Line: 89 ]]

            end);
            return;
        end;
    end, {
        v35, 
        v32, 
        v30, 
        v31
    });
    local v37 = v30 or v31 and v31.sender or nil;
    local v38 = if v37 then v37.targetId else nil;
    local v39 = v5(if v35 and v38 and v38 ~= 0 then v38 else nil);
    local v40 = if v37 and (v37.targetName or v37.targetDisplayName) then v37.targetName or v37.targetDisplayName else if v35 and v39 and v39 ~= "" then v39 else nil;
    local v41 = l_useLocalization_0({
        GenericError = "Features.Transfers.Body.GenericReceiveError", 
        AccountDisabled = "Features.Transfers.Body.UnableReceiveRobuxError", 
        TransferExpired = "Features.Transfers.Body.ExpiredTransferError", 
        TryAgain = "Features.Transfers.RobuxTransfer.Action.TryAgain", 
        OK = "Features.Transfers.Action.Ok"
    });
    local v42, v43;
    if not v34 then
        v42 = v41.GenericError;
        v43 = v41.TryAgain;
    else
        local l_OK_1 = v41.OK;
        local v45 = nil;
        if v34 == v18.TransferDisabledForUser then
            v45 = v41.AccountDisabled;
        elseif v34 == v18.TransferExpired then
            v45 = string.gsub(v41.TransferExpired, "{username}", (tostring(v40)));
        else
            v45 = v41.GenericError;
            l_OK_1 = v41.TryAgain;
        end;
        v42 = v45;
        v43 = l_OK_1;
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
                        size = v28.Size.Size_1200, 
                        tag = "content-inverse-emphasis"
                    })
                }), 
                ErrorMessage = v2.createElement(l_Text_0, {
                    Text = v42, 
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
                        text = v43, 
                        onActivated = l_triggerOnClose_0, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        fillBehavior = l_FillBehavior_0.Fill
                    })
                })
            })
        })
    });
end;