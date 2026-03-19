local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local _ = require(l_script_FirstAncestor_0.Utils.Types);
local v2 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_UIStateActions_0 = v2.UIStateActions;
local v4 = game:DefineFastInt("ChatInterventionUIRateLimitWindowSec", 5);
local v5 = game:DefineFastFlag("RateLimitNudgeToast", false);
local v6 = game:DefineFastFlag("RateLimitTimeoutToast", false);
local v7 = game:DefineFastFlag("RateLimitNudgeDialog", false);
local v8 = game:DefineFastFlag("RateLimitTimeoutDialog", false);
return function(v9, v10) --[[ Line: 12 ]] --[[ Name: InExperienceInterventionUIStateReducer ]]
    -- upvalues: v4 (copy), v6 (copy), v2 (copy), v5 (copy), v7 (copy), v8 (copy), l_UIStateActions_0 (copy)
    local v11 = table.clone(v9);
    local l_type_0 = v10.type;
    local v13 = false;
    local v14 = DateTime.now().UnixTimestamp - v9.dispatchTimestamp < v4;
    local v15 = v10.treatmentType == v9.treatmentType;
    local v16 = false;
    if v6 then
        local v17 = v10.treatmentType == v2.TreatmentType.ChatTimeoutChatAttempt and v9.treatmentType == v2.TreatmentType.ChatTimeoutGameJoin or v10.treatmentType == v2.TreatmentType.ChatTimeoutGameJoin and v9.treatmentType == v2.TreatmentType.ChatTimeoutChatAttempt;
        local v18 = true;
        if v10.treatmentType ~= v2.TreatmentType.ChatTimeoutChatAttempt then
            v18 = v10.treatmentType == v2.TreatmentType.ChatTimeoutGameJoin;
        end;
        v16 = v15 and v18 or v17;
    end;
    local v19 = false;
    if v5 then
        v19 = v10.treatmentType == v2.TreatmentType.ChatNudgeToast and v15;
    end;
    local v20 = false;
    if v7 then
        v20 = v10.treatmentType == v2.TreatmentType.ChatNudgeDialog and v15;
    end;
    local v21 = false;
    if v8 then
        v21 = v10.treatmentType == v2.TreatmentType.ChatTimeoutDialog and v15;
    end;
    v13 = (not not v16 or v19 or v20 or v21) and v14;
    if l_type_0 == l_UIStateActions_0.ToggleNotificationDialog and not v13 then
        v11.isShown = v10.isShown;
        v11.treatmentType = v10.treatmentType;
        v11.detail = v10.detail or {};
        v11.endTime = v10.endTime or 0;
        v11.dispatchTimestamp = v10.dispatchTimestamp;
        return v11;
    else
        if v13 then
            print("Chat intervention UI treatment rate limited: ", v10.treatmentType);
        end;
        return v9;
    end;
end;