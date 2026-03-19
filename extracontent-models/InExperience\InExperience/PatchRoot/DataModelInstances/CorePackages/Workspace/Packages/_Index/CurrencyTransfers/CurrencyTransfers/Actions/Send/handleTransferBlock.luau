local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
local v2 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Enums.TransferRetryOrigin);
return function(v4, v5, v6, v7) --[[ Line: 9 ]] --[[ Name: handleTransferBlock ]]
    -- upvalues: v2 (copy)
    local l_setPromptState_0 = v4.setPromptState;
    local l_setAmpRecourseActions_0 = v4.setAmpRecourseActions;
    local l_setAmpFeatureCheck_0 = v4.setAmpFeatureCheck;
    local l_setTransferRetryOrigin_0 = v4.setTransferRetryOrigin;
    if v5 then
        l_setAmpRecourseActions_0(v5);
    end;
    if v6 then
        l_setAmpFeatureCheck_0(v6);
    end;
    if v7 then
        l_setTransferRetryOrigin_0(v7);
    end;
    l_setPromptState_0(v2.TransferBlocked);
end;