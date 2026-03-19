local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Generic.TransferFAEBlockSheet);
local v4 = require(l_script_FirstAncestor_0.Hooks.useTransferStore);
local _ = require(l_script_FirstAncestor_0.Enums.TransferDirection);
return function(_) --[[ Line: 22 ]] --[[ Name: ReceiveBlockSheet ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v7 = v4();
    local v8 = v7.getDirection(false);
    local v9 = v7.getAmpRecourseActions(false);
    local v10 = v7.getAmpFeatureCheck(false);
    local v11 = false;
    if v9 then
        for _, v13 in ipairs(v9) do
            if v13 == "IdVerificationRecourse" or v13 == "AgeEstimationRecourse" then
                v11 = true;
                break;
            end;
        end;
    end;
    if v11 and v8 then
        return v2.createElement(v3, {
            direction = v8, 
            ampRecourseActions = v9, 
            ampFeatureCheck = v10
        });
    else
        return v2.createElement(v2.Fragment);
    end;
end;