local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_HttpService_0 = game:GetService("HttpService");
local l_logEvent_0 = require(l_script_FirstAncestor_0.Analytics.CrossExperienceAnalytics).logEvent;
local v4 = require(l_script_FirstAncestor_0.Constants);
local v5 = require(l_script_FirstAncestor_0.Utils.getMemStorageKey);
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v7 = require(l_script_FirstAncestor_0.Logger);
local _ = require(l_script_FirstAncestor_0.Types);
local l_FFlagLogCrossExperienceEvents_0 = require(l_script_FirstAncestor_0.Flags).FFlagLogCrossExperienceEvents;
local v10 = require(l_script_FirstAncestor_0.dependencies);
local l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 = v10.SharedFlags.FFlagRecordCevJoinAttemptIdInObserverSetup;
local l_FFlagFixCrossExperienceVoiceExecutePrint_0 = v10.SharedFlags.FFlagFixCrossExperienceVoiceExecutePrint;
local function v13() --[[ Line: 23 ]]

end;
local function v22(v14, v15, v16, v17) --[[ Line: 25 ]]
    -- upvalues: l_ExperienceService_0 (copy), l_FFlagFixCrossExperienceVoiceExecutePrint_0 (copy), v7 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
        -- upvalues: l_ExperienceService_0 (ref), v14 (copy), v15 (copy), v16 (copy), l_FFlagFixCrossExperienceVoiceExecutePrint_0 (ref), v7 (ref), v17 (copy)
        l_ExperienceService_0:ExecuteCrossExperienceCall(v14, v15, function(v18) --[[ Line: 27 ]]
            -- upvalues: v16 (ref)
            if v16 then
                v16(v18);
            end;
        end, function(v19) --[[ Line: 31 ]]
            -- upvalues: l_FFlagFixCrossExperienceVoiceExecutePrint_0 (ref), v7 (ref), v17 (ref)
            if l_FFlagFixCrossExperienceVoiceExecutePrint_0 then
                v7:warning("Error executing call: {}", v19);
            else
                print("[CrossExperience] Error executing call", v19);
            end;
            if v17 then
                v17(v19);
            end;
        end);
    end);
    if not l_status_0 then
        if l_FFlagFixCrossExperienceVoiceExecutePrint_0 then
            v7:warning("Error executing call pcall: {} {}", v14, l_result_0);
        else
            print("[CrossExperience] Error executing call pcall", v14, l_result_0);
        end;
        if v17 then
            v17("[CrossExperience] Error executing call pcall");
        end;
    end;
end;
local function v28(v23, v24, v25, v26) --[[ Line: 56 ]]
    -- upvalues: l_FFlagLogCrossExperienceEvents_0 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), v5 (copy), v4 (copy), l_logEvent_0 (copy), v6 (copy), v22 (copy)
    if l_FFlagLogCrossExperienceEvents_0 then
        local v27 = {
            eventName = v23.NOTIFY, 
            clientTimeStamp = os.time(), 
            cevJoinAttemptId = if l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v5(v4.CEV_JOIN_ATTEMPT_ID_KEY) else nil
        };
        if not l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 and v24 and v24.cevJoinAttemptId then
            v27.cevJoinAttemptId = v24.cevJoinAttemptId;
        end;
        l_logEvent_0(v6.NotifyObserver, v27);
    end;
    v22(v23.NOTIFY, v24, v25, v26);
end;
local function v31(v29, v30) --[[ Line: 81 ]]
    -- upvalues: v28 (copy), v13 (copy)
    v28(v29, v30, v13, v13);
end;
local function v38(v32, v33, v34, _, v36) --[[ Line: 85 ]]
    -- upvalues: l_HttpService_0 (copy), l_FFlagLogCrossExperienceEvents_0 (copy), l_logEvent_0 (copy), v6 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), v5 (copy), v4 (copy), v22 (copy)
    local v37 = l_HttpService_0:GenerateGUID(false);
    if l_FFlagLogCrossExperienceEvents_0 then
        l_logEvent_0(v6.AddObserver, {
            eventName = v33.ADD_OBSERVER, 
            clientTimeStamp = os.time(), 
            cevJoinAttemptId = if l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v5(v4.CEV_JOIN_ATTEMPT_ID_KEY) else nil
        });
    end;
    v22(v33.ADD_OBSERVER, {
        observerId = v37, 
        experienceType = v32
    }, v34, v36);
    return v37;
end;
local function v42(v39, v40, v41) --[[ Line: 110 ]]
    -- upvalues: v38 (copy), v13 (copy)
    return (v38(v39, v40, v41, v13, v13));
end;
local function v48(v43, v44, v45, v46, v47) --[[ Line: 114 ]]
    -- upvalues: l_FFlagLogCrossExperienceEvents_0 (copy), l_logEvent_0 (copy), v6 (copy), l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 (copy), v5 (copy), v4 (copy), v22 (copy)
    if l_FFlagLogCrossExperienceEvents_0 then
        l_logEvent_0(v6.RemoveObserver, {
            eventName = v44.REMOVE_OBSERVER, 
            clientTimeStamp = os.time(), 
            cevJoinAttemptId = if l_FFlagRecordCevJoinAttemptIdInObserverSetup_0 then v5(v4.CEV_JOIN_ATTEMPT_ID_KEY) else nil
        });
    end;
    v22(v44.REMOVE_OBSERVER, {
        observerId = v45, 
        experienceType = v43
    }, v46, v47);
end;
return {
    execute = v22, 
    notify = v31, 
    notifyWithCallbacks = v28, 
    addObserver = v42, 
    addObserverWithCallbacks = v38, 
    removeObserver = function(v49, v50, v51) --[[ Line: 137 ]]
        -- upvalues: v48 (copy), v13 (copy)
        return v48(v49, v50, v51, v13, v13);
    end, 
    removeObserverWithCallbacks = v48
};