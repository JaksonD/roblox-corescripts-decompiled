local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_HttpService_0 = game:GetService("HttpService");
local l_logEvent_0 = require(l_script_FirstAncestor_0.Analytics.CrossExperienceAnalytics).logEvent;
local v4 = require(l_script_FirstAncestor_0.Constants);
local v5 = require(l_script_FirstAncestor_0.Utils.getMemStorageKey);
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local _ = require(l_script_FirstAncestor_0.Types);
local l_FFlagLogCrossExperienceEvents_0 = require(l_script_FirstAncestor_0.Flags).FFlagLogCrossExperienceEvents;
local l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 = require(l_script_FirstAncestor_0.dependencies).SharedFlags.FFlagRecordCevJoinAttemptIdInObserverSetup;
local function v10() --[[ Line: 21 ]]

end;
local function v19(v11, v12, v13, v14) --[[ Line: 23 ]]
    -- upvalues: l_ExperienceService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
        -- upvalues: l_ExperienceService_0 (ref), v11 (copy), v12 (copy), v13 (copy), v14 (copy)
        l_ExperienceService_0:ExecuteCrossExperienceCall(v11, v12, function(v15) --[[ Line: 25 ]]
            -- upvalues: v13 (ref)
            if v13 then
                v13(v15);
            end;
        end, function(v16) --[[ Line: 29 ]]
            -- upvalues: v14 (ref)
            print("[CrossExperience] Error executing call", v16);
            if v14 then
                v14(v16);
            end;
        end);
    end);
    if not l_status_0 then
        print("[CrossExperience] Error executing call pcall", v11, l_result_0);
        if v14 then
            v14("[CrossExperience] Error executing call pcall");
        end;
    end;
end;
local function v25(v20, v21, v22, v23) --[[ Line: 46 ]]
    -- upvalues: l_FFlagLogCrossExperienceEvents_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), v5 (copy), v4 (copy), l_logEvent_0 (copy), v6 (copy), v19 (copy)
    if l_FFlagLogCrossExperienceEvents_0 then
        local v24 = {
            eventName = v20.NOTIFY, 
            clientTimeStamp = os.time(), 
            cevJoinAttemptId = if l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v5(v4.CEV_JOIN_ATTEMPT_ID_KEY) else nil
        };
        if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 and v21 and v21.cevJoinAttemptId then
            v24.cevJoinAttemptId = v21.cevJoinAttemptId;
        end;
        l_logEvent_0(v6.NotifyObserver, v24);
    end;
    v19(v20.NOTIFY, v21, v22, v23);
end;
local function v28(v26, v27) --[[ Line: 71 ]]
    -- upvalues: v25 (copy), v10 (copy)
    v25(v26, v27, v10, v10);
end;
local function v35(v29, v30, v31, _, v33) --[[ Line: 75 ]]
    -- upvalues: l_HttpService_0 (copy), l_FFlagLogCrossExperienceEvents_0 (copy), l_logEvent_0 (copy), v6 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), v5 (copy), v4 (copy), v19 (copy)
    local v34 = l_HttpService_0:GenerateGUID(false);
    if l_FFlagLogCrossExperienceEvents_0 then
        l_logEvent_0(v6.AddObserver, {
            eventName = v30.ADD_OBSERVER, 
            clientTimeStamp = os.time(), 
            cevJoinAttemptId = if l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v5(v4.CEV_JOIN_ATTEMPT_ID_KEY) else nil
        });
    end;
    v19(v30.ADD_OBSERVER, {
        observerId = v34, 
        experienceType = v29
    }, v31, v33);
    return v34;
end;
local function v39(v36, v37, v38) --[[ Line: 100 ]]
    -- upvalues: v35 (copy), v10 (copy)
    return (v35(v36, v37, v38, v10, v10));
end;
local function v45(v40, v41, v42, v43, v44) --[[ Line: 104 ]]
    -- upvalues: l_FFlagLogCrossExperienceEvents_0 (copy), l_logEvent_0 (copy), v6 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), v5 (copy), v4 (copy), v19 (copy)
    if l_FFlagLogCrossExperienceEvents_0 then
        l_logEvent_0(v6.RemoveObserver, {
            eventName = v41.REMOVE_OBSERVER, 
            clientTimeStamp = os.time(), 
            cevJoinAttemptId = if l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v5(v4.CEV_JOIN_ATTEMPT_ID_KEY) else nil
        });
    end;
    v19(v41.REMOVE_OBSERVER, {
        observerId = v42, 
        experienceType = v40
    }, v43, v44);
end;
return {
    execute = v19, 
    notify = v28, 
    notifyWithCallbacks = v25, 
    addObserver = v39, 
    addObserverWithCallbacks = v35, 
    removeObserver = function(v46, v47, v48) --[[ Line: 127 ]]
        -- upvalues: v45 (copy), v10 (copy)
        return v45(v46, v47, v48, v10, v10);
    end, 
    removeObserverWithCallbacks = v45
};