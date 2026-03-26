local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Generic.TransferFAEBlockSheet);
local v4 = require(l_script_FirstAncestor_0.Components.Generic.VPCBlockContainer);
local v5 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local _ = require(l_script_FirstAncestor_0.Enums.TransferDirection);
local v7 = require(l_script_FirstAncestor_0.Constants.AmpWizardTransferConstants);
return function(_) --[[ Line: 22 ]] --[[ Name: ReceiveBlockSheet ]]
    -- upvalues: v5 (copy), v7 (copy), v2 (copy), v3 (copy), v4 (copy)
    local v9 = v5();
    local v10 = v9.getDirection(false);
    local v11 = v9.getAmpRecourseActions(false);
    local v12 = v9.getAmpFeatureCheck(false);
    local v13 = false;
    local v14 = false;
    if v11 then
        for _, v16 in ipairs(v11) do
            if v16 == v7.RECOURSE_ID_VERIFICATION or v16 == v7.RECOURSE_AGE_ESTIMATION then
                v13 = true;
            elseif v16 == v7.RECOURSE_PARENT_LINK or v16 == v7.RECOURSE_PARENT_CONSENT then
                v14 = true;
            end;
        end;
    end;
    if v13 and v10 then
        return v2.createElement(v3, {
            direction = v10, 
            ampRecourseActions = v11, 
            ampFeatureCheck = v12
        });
    elseif v14 and v10 then
        return v2.createElement(v4, {
            direction = v10, 
            ampRecourseActions = v11, 
            ampFeatureCheck = v12
        });
    else
        return v2.createElement(v2.Fragment);
    end;
end;