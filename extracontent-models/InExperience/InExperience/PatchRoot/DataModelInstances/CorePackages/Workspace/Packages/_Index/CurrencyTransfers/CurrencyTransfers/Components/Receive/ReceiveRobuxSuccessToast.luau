local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v5 = require(l_Parent_0.Foundation);
local l_Snackbar_0 = v5.Snackbar;
local l_Enums_0 = v5.Enums;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Actions.Receive.handleReceiveComplete);
local v10 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local v11 = require(l_script_FirstAncestor_0.Utils.formatNumber);
return function(_) --[[ Line: 32 ]] --[[ Name: ReceiveRobuxSuccessToast ]]
    -- upvalues: l_useLocalization_0 (copy), v10 (copy), v3 (copy), v11 (copy), l_LocalizationService_0 (copy), v2 (copy), v9 (copy), l_Snackbar_0 (copy), l_Enums_0 (copy)
    local v13 = l_useLocalization_0({
        SuccessNotification = "Features.Transfers.RobuxTransfers.Label.SuccessNotification"
    });
    local v14 = v10();
    local v15 = v3.useSignalState(v14.getRobuxTransfer);
    local v16 = if v15 then v15.transferAmount else 0;
    local v17 = v11(l_LocalizationService_0.RobloxLocaleId, v16);
    local v18 = v2.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: v13 (copy), v17 (copy)
        return string.gsub(v13.SuccessNotification, "{amount}", (tostring(v17)));
    end, {
        v17, 
        v13.SuccessNotification
    });
    local v19 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: v19 (copy), v9 (ref), v14 (copy)
        if v19.current then
            task.cancel(v19.current);
        end;
        v19.current = task.delay(5, function() --[[ Line: 55 ]]
            -- upvalues: v9 (ref), v14 (ref)
            v9(v14);
        end);
        return function() --[[ Line: 61 ]]
            -- upvalues: v19 (ref)
            if v19.current then
                task.cancel(v19.current);
                v19.current = nil;
            end;
        end;
    end, {});
    return v2.createElement(l_Snackbar_0, {
        title = v18, 
        icon = {
            name = l_Enums_0.IconName.CircleCheck, 
            variant = l_Enums_0.IconVariant.Filled
        }, 
        Position = UDim2.new(0.5, 0, 0, 50), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ZIndex = 100, 
        onClose = function() --[[ Line: 80 ]] --[[ Name: onClose ]]
            -- upvalues: v9 (ref), v14 (copy)
            v9(v14);
        end
    });
end;