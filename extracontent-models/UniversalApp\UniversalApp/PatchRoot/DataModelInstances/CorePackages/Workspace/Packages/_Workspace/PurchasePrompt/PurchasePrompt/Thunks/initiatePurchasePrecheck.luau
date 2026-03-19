local l_Parent_0 = script.Parent.Parent;
local _ = game:GetService("UserInputService");
local v2 = require(l_Parent_0.Actions.SetButtonState);
local v3 = require(l_Parent_0.Enums.PurchaseWarning);
local v4 = require(l_Parent_0.Enums.ButtonState);
local v5 = require(l_Parent_0.Enums.UpsellFlow);
local v6 = require(l_Parent_0.Services.Network);
local v7 = require(l_Parent_0.Network.getPurchaseWarning);
local v8 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v9 = require(l_Parent_0.Services.Analytics);
local v10 = require(l_Parent_0.Services.ExternalSettings);
local v11 = require(l_Parent_0.Thunk);
local v12 = require(l_Parent_0.Utils.SelectedRobuxPackage);
local v13 = require(script.Parent.resolvePurchasePrecheck);
local _ = require(l_Parent_0.Actions.SetPromptState);
local _ = require(l_Parent_0.Enums.PromptState);
local v16 = {
    v9, 
    v6, 
    v10
};
return function() --[[ Line: 28 ]] --[[ Name: initiatePurchasePrecheck ]]
    -- upvalues: v11 (copy), v16 (copy), v9 (copy), v6 (copy), v10 (copy), v13 (copy), v3 (copy), v8 (copy), v12 (copy), v5 (copy), v2 (copy), v4 (copy), v7 (copy)
    return v11.new(script.Name, v16, function(v17, v18) --[[ Line: 29 ]]
        -- upvalues: v9 (ref), v6 (ref), v10 (ref), v13 (ref), v3 (ref), v8 (ref), v12 (ref), v5 (ref), v2 (ref), v4 (ref), v7 (ref)
        local v19 = v17:getState();
        local v20 = v18[v9];
        local v21 = v18[v6];
        local v22 = v18[v10];
        if v22.isStudio() then
            return v13(v3.NoAction);
        else
            local v23 = v8(v22.getPlatform());
            local l_productId_0 = v19.productInfo.productId;
            local v25 = v12.getRobuxProductId(v19);
            local v26 = nil;
            local v27 = v19.accountInfo.membershipType == 4;
            if v23 == v5.Web then
                v26 = v12.getProductId(v19);
                v25 = nil;
            else
                v26 = nil;
            end;
            v17:dispatch(v2(v4.Disabled));
            return v7(v21, v25, v26, v27):andThen(function(v28) --[[ Line: 57 ]]
                -- upvalues: v17 (copy), v2 (ref), v4 (ref), v20 (copy), l_productId_0 (copy), v25 (ref), v26 (ref), v13 (ref), v3 (ref)
                v17:dispatch(v2(v4.Enabled));
                if v28 then
                    if v28.action == "U13PaymentModal" then
                        v20.signalScaryModalShown(l_productId_0, "U13PaymentModal", v25 or v26);
                        return v17:dispatch(v13(v3.U13PaymentModal));
                    elseif v28.action == "U13MonthlyThreshold1Modal" then
                        v20.signalScaryModalShown(l_productId_0, "U13MonthlyThreshold1Modal", v25 or v26);
                        return v17:dispatch(v13(v3.U13MonthlyThreshold1Modal));
                    elseif v28.action == "U13MonthlyThreshold2Modal" then
                        v20.signalScaryModalShown(l_productId_0, "U13MonthlyThreshold2Modal", v25 or v26);
                        return v17:dispatch(v13(v3.U13MonthlyThreshold2Modal));
                    elseif v28.action == "ParentalConsentWarningPaymentModal13To17" then
                        v20.signalScaryModalShown(l_productId_0, "ParentalConsentWarningPaymentModal13To17", v25 or v26);
                        return v17:dispatch(v13(v3.ParentalConsentWarningPaymentModal13To17));
                    end;
                end;
                v17:dispatch(v13(v3.NoAction));
            end):catch(function(_) --[[ Line: 95 ]]
                -- upvalues: v17 (copy), v2 (ref), v4 (ref), v13 (ref), v3 (ref)
                v17:dispatch(v2(v4.Enabled));
                v17:dispatch(v13(v3.NoAction));
            end);
        end;
    end);
end;