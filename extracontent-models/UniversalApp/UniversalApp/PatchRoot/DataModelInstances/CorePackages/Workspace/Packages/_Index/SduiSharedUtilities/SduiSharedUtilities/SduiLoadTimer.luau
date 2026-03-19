local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local v1 = require(l_script_FirstAncestor_0.SduiPageAnalytics);
local _ = require(l_script_FirstAncestor_0.SduiIntegrationTypes);
local v3 = {
    UiRequestSent = "UiRequestSent", 
    UiRequestQueued = "UiRequestQueued", 
    UiResponseReceived = "UiResponseReceived", 
    ResponseDecodeBegin = "ResponseDecodeBegin", 
    ResponseDecodeEnd = "ResponseDecodeEnd", 
    ResponseDataUpdateBegin = "ResponseDataUpdateBegin", 
    ResponseDataUpdateEnd = "ResponseDataUpdateEnd", 
    SduiTreeBuildBegin = "SduiTreeBuildBegin", 
    SduiTreeBuildEnd = "SduiTreeBuildEnd", 
    SduiComponentMounted = "SduiComponentMounted", 
    SduiComponentReady = "SduiComponentReady"
};
return {
    createLoadTimer = function(v4, v5) --[[ Line: 71 ]] --[[ Name: createLoadTimer ]]
        -- upvalues: v3 (copy), v1 (copy)
        local v6 = nil;
        local v7 = nil;
        local v8 = {};
        local v9 = nil;
        local v10 = "NotStarted";
        local v11 = nil;
        local v12 = nil;
        local function _(v13, v14) --[[ Line: 85 ]] --[[ Name: calculateDuration ]]
            -- upvalues: v8 (copy)
            local v15 = v8[v13];
            local v16 = v8[v14];
            if v15 and v16 then
                return (v16 - v15) * 1000;
            else
                return nil;
            end;
        end;
        local function v19(v18) --[[ Line: 95 ]] --[[ Name: start ]]
            -- upvalues: v6 (ref), v10 (ref), v12 (ref)
            v6 = os.clock();
            v10 = "Running";
            v12 = v18;
        end;
        local function v29() --[[ Line: 102 ]] --[[ Name: finish ]]
            -- upvalues: v10 (ref), v6 (ref), v7 (ref), v3 (ref), v8 (copy), v9 (ref), v11 (ref), v4 (copy), v12 (ref), v5 (copy), v1 (ref)
            if v10 ~= "Running" or v6 == nil then
                return;
            else
                v10 = "Finished";
                v7 = os.clock();
                local v20 = (v7 - v6) * 1000;
                local l_UiRequestQueued_0 = v3.UiRequestQueued;
                local l_UiResponseReceived_0 = v3.UiResponseReceived;
                local v23 = v8[l_UiRequestQueued_0];
                local v24 = v8[l_UiResponseReceived_0];
                local v25 = if v23 and v24 then (v24 - v23) * 1000 else nil;
                l_UiResponseReceived_0 = v3.ResponseDecodeBegin;
                v23 = v3.ResponseDecodeEnd;
                v24 = v8[l_UiResponseReceived_0];
                local v26 = v8[v23];
                l_UiRequestQueued_0 = if v24 and v26 then (v26 - v24) * 1000 else nil;
                v23 = v3.ResponseDataUpdateBegin;
                v24 = v3.ResponseDataUpdateEnd;
                v26 = v8[v23];
                local v27 = v8[v24];
                l_UiResponseReceived_0 = if v26 and v27 then (v27 - v26) * 1000 else nil;
                v24 = v3.SduiTreeBuildBegin;
                v26 = v3.SduiTreeBuildEnd;
                v27 = v8[v24];
                local v28 = v8[v26];
                v23 = if v27 and v28 then (v28 - v27) * 1000 else nil;
                v24 = v9 and v9.RoundTripTime and v9.RoundTripTime * 1000;
                v26 = v9 and v9.DurationReceiveResponse and v9.DurationReceiveResponse * 1000;
                v27 = {
                    totalDurationMs = v20, 
                    uiRequestDurationMs = v25, 
                    responseDecodeDurationMs = l_UiRequestQueued_0, 
                    sduiTreeBuildDurationMs = v23, 
                    dataUpdateDurationMs = l_UiResponseReceived_0, 
                    netRoundTripTimeMs = v24, 
                    netDurationReceiveResponseMs = v26, 
                    requestStatus = v11, 
                    pageKey = v4, 
                    startSource = v12 or "unknown"
                };
                if v5 then
                    v5(v27);
                    return;
                else
                    v1.sendLoadTimerEvent(v27);
                    return;
                end;
            end;
        end;
        local function _(v30) --[[ Line: 144 ]] --[[ Name: logTimestamp ]]
            -- upvalues: v8 (copy)
            v8[v30] = os.clock();
        end;
        local function v33(v32) --[[ Line: 149 ]] --[[ Name: logNetRequestStats ]]
            -- upvalues: v9 (ref)
            v9 = v32;
        end;
        local function v35() --[[ Line: 154 ]] --[[ Name: logUiRequestQueued ]]
            -- upvalues: v10 (ref), v3 (ref), v6 (ref), v12 (ref), v8 (copy)
            if v10 == "NotStarted" then
                local l_UiRequestQueued_1 = v3.UiRequestQueued;
                v6 = os.clock();
                v10 = "Running";
                v12 = l_UiRequestQueued_1;
            end;
            v8[v3.UiRequestQueued] = os.clock();
        end;
        local function v37() --[[ Line: 162 ]] --[[ Name: logUiRequestSent ]]
            -- upvalues: v10 (ref), v3 (ref), v6 (ref), v12 (ref), v8 (copy)
            if v10 == "NotStarted" then
                local l_UiRequestSent_0 = v3.UiRequestSent;
                v6 = os.clock();
                v10 = "Running";
                v12 = l_UiRequestSent_0;
            end;
            v8[v3.UiRequestSent] = os.clock();
        end;
        local function v38() --[[ Line: 170 ]] --[[ Name: logUiResponseReceived ]]
            -- upvalues: v3 (ref), v8 (copy)
            v8[v3.UiResponseReceived] = os.clock();
        end;
        local function v39() --[[ Line: 175 ]] --[[ Name: logResponseDecodeBegin ]]
            -- upvalues: v3 (ref), v8 (copy)
            v8[v3.ResponseDecodeBegin] = os.clock();
        end;
        local function v40() --[[ Line: 180 ]] --[[ Name: logResponseDecodeEnd ]]
            -- upvalues: v3 (ref), v8 (copy)
            v8[v3.ResponseDecodeEnd] = os.clock();
        end;
        local function v41() --[[ Line: 185 ]] --[[ Name: logResponseDataUpdateBegin ]]
            -- upvalues: v3 (ref), v8 (copy)
            v8[v3.ResponseDataUpdateBegin] = os.clock();
        end;
        local function v42() --[[ Line: 190 ]] --[[ Name: logResponseDataUpdateEnd ]]
            -- upvalues: v3 (ref), v8 (copy)
            v8[v3.ResponseDataUpdateEnd] = os.clock();
        end;
        local function v43() --[[ Line: 195 ]] --[[ Name: logSduiTreeBuildBegin ]]
            -- upvalues: v3 (ref), v8 (copy)
            v8[v3.SduiTreeBuildBegin] = os.clock();
        end;
        local function v44() --[[ Line: 200 ]] --[[ Name: logSduiTreeBuildEnd ]]
            -- upvalues: v3 (ref), v8 (copy)
            v8[v3.SduiTreeBuildEnd] = os.clock();
        end;
        local function v45() --[[ Line: 205 ]] --[[ Name: logComponentMounted ]]
            -- upvalues: v3 (ref), v8 (copy)
            v8[v3.SduiComponentMounted] = os.clock();
        end;
        local function v46() --[[ Line: 211 ]] --[[ Name: logComponentReady ]]
            -- upvalues: v3 (ref), v8 (copy), v10 (ref), v29 (copy)
            v8[v3.SduiComponentReady] = os.clock();
            if v10 == "Running" then
                v29();
            end;
        end;
        local function v48(v47) --[[ Line: 219 ]] --[[ Name: updateRequestStatus ]]
            -- upvalues: v11 (ref)
            v11 = v47;
        end;
        return {
            start = v19, 
            logUiRequestQueued = v35, 
            logUiRequestSent = v37, 
            logUiResponseReceived = v38, 
            logResponseDecodeBegin = v39, 
            logResponseDecodeEnd = v40, 
            logResponseDataUpdateBegin = v41, 
            logResponseDataUpdateEnd = v42, 
            logSduiTreeBuildBegin = v43, 
            logSduiTreeBuildEnd = v44, 
            logComponentMounted = v45, 
            logComponentReady = v46, 
            logNetRequestStats = v33, 
            updateRequestStatus = v48, 
            finish = v29
        };
    end
};