local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Generic.TransferFAEBlockSheet);
local v4 = require(l_script_FirstAncestor_0.Components.Generic.SubscriptionUpsellContainer);
local v5 = require(l_script_FirstAncestor_0.Components.Generic.VPCBlockContainer);
local v6 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local _ = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v8 = require(l_script_FirstAncestor_0.Constants.AmpWizardTransferConstants);
return function(_) --[[ Line: 23 ]] --[[ Name: TransferBlockSheet ]]
    -- upvalues: v6 (copy), v8 (copy), v2 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v10 = v6();
    local v11 = v10.getDirection(false);
    local v12 = v10.getAmpRecourseActions(false);
    local v13 = v10.getAmpFeatureCheck(false);
    local v14 = false;
    local v15 = false;
    local v16 = false;
    if v12 then
        for _, v18 in ipairs(v12) do
            if v18 == v8.RECOURSE_PLUS_SUBSCRIPTION then
                v14 = true;
            elseif v18 == v8.RECOURSE_ID_VERIFICATION or v18 == v8.RECOURSE_AGE_ESTIMATION then
                v15 = true;
            elseif v18 == v8.RECOURSE_PARENT_LINK or v18 == v8.RECOURSE_PARENT_CONSENT then
                v16 = true;
            end;
        end;
    end;
    local v19 = {
        direction = v11, 
        ampRecourseActions = v12, 
        ampFeatureCheck = v13
    };
    if v14 and v11 then
        return v2.createElement(v4, {
            direction = v19.direction, 
            ampRecourseActions = v19.ampRecourseActions, 
            ampFeatureCheck = v19.ampFeatureCheck
        });
    elseif v15 and v11 then
        return v2.createElement(v3, {
            direction = v19.direction, 
            ampRecourseActions = v19.ampRecourseActions, 
            ampFeatureCheck = v19.ampFeatureCheck
        });
    elseif v16 and v11 then
        return v2.createElement(v5, {
            direction = v19.direction, 
            ampRecourseActions = v19.ampRecourseActions, 
            ampFeatureCheck = v19.ampFeatureCheck
        });
    else
        return v2.createElement(v2.Fragment);
    end;
end;