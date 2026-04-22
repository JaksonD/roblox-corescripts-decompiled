local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Localization.TransferLocalizationKeys);
local v4 = require(l_script_FirstAncestor_0.Localization.transferLocaleFormat);
local v5 = require(l_Parent_0.SignalsReact);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v7 = require(l_Parent_0.Foundation);
local l_Snackbar_0 = v7.Snackbar;
local l_Enums_0 = v7.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v11 = require(l_script_FirstAncestor_0.Actions.Receive.handleReceiveComplete);
local v12 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v13 = require(l_script_FirstAncestor_0.Utils.formatNumber);
return function(_) --[[ Line: 34 ]] --[[ Name: ReceiveRobuxSuccessToast ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), v12 (copy), v5 (copy), v13 (copy), l_LocalizationService_0 (copy), v2 (copy), v4 (copy), v11 (copy), l_Snackbar_0 (copy), l_Enums_0 (copy)
    local v15 = l_useLocalization_0(v3.Presets.ReceiveRobuxSuccessToast);
    local v16 = v12();
    local v17 = v5.useSignalState(v16.getRobuxTransfer);
    local v18 = v5.useSignalState(v16.getIsAlreadyAccepted);
    local v19 = if v17 then v17.receivingAmount or v17.transferAmount else 0;
    local v20 = v13(l_LocalizationService_0.RobloxLocaleId, v19);
    local v21 = v2.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v18 (copy), v15 (copy), v4 (ref), v20 (copy)
        if v18 then
            return v15.AlreadyAcceptedNotification;
        else
            return v4.substituteAmount(v15.SuccessNotification, (tostring(v20)));
        end;
    end, {
        v18, 
        v20, 
        v15.SuccessNotification, 
        v15.AlreadyAcceptedNotification
    });
    local v22 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v22 (copy), v11 (ref), v16 (copy)
        if v22.current then
            task.cancel(v22.current);
        end;
        v22.current = task.delay(5, function() --[[ Line: 62 ]]
            -- upvalues: v11 (ref), v16 (ref)
            v11(v16);
        end);
        return function() --[[ Line: 68 ]]
            -- upvalues: v22 (ref)
            if v22.current then
                task.cancel(v22.current);
                v22.current = nil;
            end;
        end;
    end, {});
    return v2.createElement(l_Snackbar_0, {
        title = v21, 
        icon = if not v18 then {
            name = l_Enums_0.IconName.CircleCheck, 
            variant = l_Enums_0.IconVariant.Filled
        } else nil, 
        Position = UDim2.new(0.5, 0, 0, 50), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ZIndex = 100, 
        onClose = function() --[[ Line: 89 ]] --[[ Name: onClose ]]
            -- upvalues: v11 (ref), v16 (copy)
            v11(v16);
        end
    });
end;