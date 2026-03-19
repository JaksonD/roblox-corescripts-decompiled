local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ValidationModuleLoader);
local v4 = require(l_Parent_0.validationSystem.dataFetchModules.FetchAllDesiredData);
local v5 = require(l_Parent_0.validationSystem.ValidationReporter);
local v6 = require(l_Parent_0.flags.getFFlagDebugUGCValidationPrintNewStructureResults);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidationUpdateHeadIsDynamic);
local v8 = require(l_Parent_0.validationSystem.ValidationConstants);
local v9 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local l_TelemetryService_0 = game:GetService("TelemetryService");
game:DefineFastInt("SingleValidationTelemetryThrottleHundrethsPercent", 10000);
local v11 = {
    eventName = "UgcSingleValidationFinished", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:GetFastInt("SingleValidationTelemetryThrottleHundrethsPercent"), 
    lastUpdated = {
        25, 
        9, 
        24
    }, 
    description = "Report single ugc validation result to EventIngest backend.", 
    links = "https://create.roblox.com/docs/art/validation-errors"
};
local function v18(v12, v13, v14, v15, v16) --[[ Line: 42 ]] --[[ Name: reportSingleResult ]]
    -- upvalues: l_TelemetryService_0 (copy), v11 (copy)
    local v17 = {
        validationJobId = v13.jobId, 
        validationSource = v13.consumerConfig.source, 
        validationEnum = v12, 
        status = v14, 
        durationMs = v16, 
        additional_info = v15
    };
    l_TelemetryService_0:LogEvent(v11, {
        customFields = v17
    });
end;
local function v24(v19, v20) --[[ Line: 61 ]] --[[ Name: getMissingData ]]
    -- upvalues: v4 (copy)
    local v21 = {};
    for _, v23 in v20 do
        if v19[v23] == nil or v19[v23] == v4.DATA_FETCH_FAILURE then
            table.insert(v21, v23);
        end;
    end;
    return v21;
end;
local function v25(v26, v27) --[[ Line: 72 ]] --[[ Name: checkAqsReturnSchema ]]
    -- upvalues: v25 (copy)
    if typeof(v26) ~= "table" then
        return false;
    else
        for v28, v29 in v27 do
            if type(v29) == "table" and not v25(v26[v28], v29) then
                return false;
            elseif type(v29) == "string" and not tonumber(v26[v29]) then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _(v30, v31, v32) --[[ Line: 88 ]] --[[ Name: complete ]]
    -- upvalues: v18 (copy)
    local v33 = v32:complete();
    v18(v30, v31, v33.status, v33.telemetryContext, v33.duration);
    return v33;
end;
return function(v35, v36, v37) --[[ Line: 94 ]] --[[ Name: ValidationTestWrapper ]]
    -- upvalues: v3 (copy), v5 (copy), v2 (copy), v18 (copy), v24 (copy), v7 (copy), v8 (copy), v9 (copy), v25 (copy), v6 (copy)
    local v38 = v3.getValidationModule(v35);
    local v39 = v5.new(v35);
    for _, v41 in v38.prereqTests do
        if v37[v41] ~= v2.Status.PASS then
            local v42 = v39:complete();
            v18(v35, v36, v42.status, v42.telemetryContext, v42.duration);
            return v42;
        end;
    end;
    local v43 = v24(v36, v38.requiredData);
    if #v43 > 0 then
        v39:err((("Missing required data: %*"):format((table.concat(v43, ", ")))));
        local v44 = v39:complete();
        v18(v35, v36, v44.status, v44.telemetryContext, v44.duration);
        return v44;
    else
        if next(v38.expectedAqsData) ~= nil then
            local v45 = false;
            for v46, _ in v38.expectedAqsData do
                local v48 = v36.aqsSummaryData[v46];
                local v49 = false;
                if v48 and v48.Error then
                    for _, v51 in v48.Error do
                        if v38.knownAqsUserErrors[v51] ~= nil then
                            v39:fail(v38.knownAqsUserErrors[v51]);
                            v45 = true;
                        elseif v7() then
                            if table.find(v8.AQSInternalErrorEnum, v51) ~= nil and v49 == false then
                                v39:fail(v9.Keys.AQSInternalError);
                                v45 = true;
                                v49 = true;
                            else
                                v39:err((("Unexpected error enum %*"):format(v51)));
                                local v52 = v39:complete();
                                v18(v35, v36, v52.status, v52.telemetryContext, v52.duration);
                                return v52;
                            end;
                        else
                            v39:err((("Unexpected error enum %*"):format(v51)));
                            local v53 = v39:complete();
                            v18(v35, v36, v53.status, v53.telemetryContext, v53.duration);
                            return v53;
                        end;
                    end;
                    local v54 = v39:complete();
                    v18(v35, v36, v54.status, v54.telemetryContext, v54.duration);
                    return v54;
                end;
            end;
            if v45 then
                local v55 = v39:complete();
                v18(v35, v36, v55.status, v55.telemetryContext, v55.duration);
                return v55;
            elseif not v25(v36.aqsSummaryData, v38.expectedAqsData) then
                v39:err("Missing expected AQS schema");
                local v56 = v39:complete();
                v18(v35, v36, v56.status, v56.telemetryContext, v56.duration);
                return v56;
            end;
        end;
        v39:begin();
        if #v24(v36, v38.conditionalData) > 0 then
            local v57 = v39:complete();
            v18(v35, v36, v57.status, v57.telemetryContext, v57.duration);
            return v57;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 168 ]]
                -- upvalues: v38 (copy), v39 (copy), v36 (copy)
                v38.run(v39, v36);
            end);
            if not l_status_0 then
                if v6() then
                    print("Validation error:", l_result_0);
                    print("As this is in debug mode, we will re-call the function for a full error trace: ");
                    v38.run(v39, v36);
                end;
                v39:err(l_result_0);
            end;
            local v60 = v39:complete();
            v18(v35, v36, v60.status, v60.telemetryContext, v60.duration);
            return v60;
        end;
    end;
end;