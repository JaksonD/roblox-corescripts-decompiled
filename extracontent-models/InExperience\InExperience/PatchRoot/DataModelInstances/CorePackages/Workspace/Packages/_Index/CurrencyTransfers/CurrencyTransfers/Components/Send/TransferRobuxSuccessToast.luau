local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_Parent_0.Foundation);
local l_Snackbar_0 = v5.Snackbar;
local l_Enums_0 = v5.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Actions.Send.handleTransferComplete);
local v10 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v11 = require(l_script_FirstAncestor_0.Utils.formatNumber);
return function(_) --[[ Line: 29 ]] --[[ Name: TransferRobuxSuccessToast ]]
    -- upvalues: l_useLocalization_0 (copy), v10 (copy), v3 (copy), v11 (copy), l_LocalizationService_0 (copy), v2 (copy), v9 (copy), l_Snackbar_0 (copy), l_Enums_0 (copy)
    local v13 = l_useLocalization_0({
        SendRobux = "Features.Transfers.RobuxTransfers.Label.SuccessNotification"
    });
    local v14 = v10();
    local v15 = v3.useSignalState(v14.getSelectedAmount);
    local v16 = if v15 then v11(l_LocalizationService_0.RobloxLocaleId, v15) else "0";
    local v17 = v2.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v13 (copy), v16 (copy)
        return string.gsub(v13.SendRobux, "{amount}", (tostring(v16)));
    end, {
        v16
    });
    local v18 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v18 (copy), v9 (ref), v14 (copy)
        if v18.current then
            task.cancel(v18.current);
        end;
        v18.current = task.delay(5, function() --[[ Line: 54 ]]
            -- upvalues: v9 (ref), v14 (ref)
            v9(v14);
        end);
        return function() --[[ Line: 60 ]]
            -- upvalues: v18 (ref)
            if v18.current then
                task.cancel(v18.current);
                v18.current = nil;
            end;
        end;
    end, {});
    return v2.createElement(l_Snackbar_0, {
        title = v17, 
        icon = {
            name = l_Enums_0.IconName.CircleCheck, 
            variant = l_Enums_0.IconVariant.Filled
        }, 
        Position = UDim2.new(0.5, 0, 0, 50), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ZIndex = 100, 
        onClose = function() --[[ Line: 82 ]] --[[ Name: onClose ]]
            -- upvalues: v9 (ref), v14 (copy)
            v9(v14);
        end
    });
end;