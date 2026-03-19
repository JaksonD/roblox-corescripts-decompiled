local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialStopwatch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Timers_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Timing.Timers;
local _ = require(l_script_FirstAncestor_0.Events);
local v5 = require(l_script_FirstAncestor_0.EventModes);
local v6 = require(l_script_FirstAncestor_0.EventRegister);
local v7 = require(l_Parent_0.LoggingProtocol);
local v8 = require(l_script_FirstAncestor_0.StopwatchTelemetryConfig);
local _ = require(script.Parent.Types);
return function() --[[ Line: 21 ]]
    -- upvalues: l_Timers_0 (copy), v7 (copy), v6 (copy), v8 (copy), v5 (copy), l_HttpService_0 (copy)
    local v10 = {};
    local v11 = l_Timers_0();
    local l_default_0 = v7.default;
    local function _(v13) --[[ Line: 26 ]]
        -- upvalues: v6 (ref)
        local v14 = v6[v13];
        if not v14 then
            error("Event not registered: " .. v13);
        end;
        return v14;
    end;
    local function _(v16) --[[ Line: 34 ]]
        -- upvalues: v6 (ref), v10 (ref), l_default_0 (copy), v8 (ref), v5 (ref), v11 (copy)
        return function(v17) --[[ Line: 35 ]]
            -- upvalues: v6 (ref), v10 (ref), l_default_0 (ref), v8 (ref), v16 (copy), v5 (ref), v11 (ref)
            local v18 = v6[v17];
            if not v18 then
                error("Event not registered: " .. v17);
            end;
            local l_v18_0 = v18;
            v18 = v10[v17];
            if not v18 then
                l_default_0:logRobloxTelemetryEvent(v8, {
                    l_default_0.StandardizedFields.addOsInfo
                }, {
                    eventName = ("FailedOn%*%*"):format(v16, v17), 
                    count = 1
                });
                if l_v18_0.mode == v5.Strict then
                    error((("Cannot %* an event that has not been started: %*"):format(v16, v17)));
                end;
            end;
            if v18 and v11.getStartTimestamp(v18) then
                return {
                    startTime = v11.getStartTimestamp(v18), 
                    id = v18, 
                    timeElapsed = v11.getTime(v18)
                };
            else
                return nil;
            end;
        end;
    end;
    local v21 = "Get";
    local l_v21_0 = v21 --[[ copy: 6 -> 8 ]];
    local function v26(v23) --[[ Line: 35 ]]
        -- upvalues: v6 (ref), v10 (ref), l_default_0 (copy), v8 (ref), l_v21_0 (copy), v5 (ref), v11 (copy)
        local v24 = v6[v23];
        if not v24 then
            error("Event not registered: " .. v23);
        end;
        local l_v24_0 = v24;
        v24 = v10[v23];
        if not v24 then
            l_default_0:logRobloxTelemetryEvent(v8, {
                l_default_0.StandardizedFields.addOsInfo
            }, {
                eventName = ("FailedOn%*%*"):format(l_v21_0, v23), 
                count = 1
            });
            if l_v24_0.mode == v5.Strict then
                error((("Cannot %* an event that has not been started: %*"):format(l_v21_0, v23)));
            end;
        end;
        if v24 and v11.getStartTimestamp(v24) then
            return {
                startTime = v11.getStartTimestamp(v24), 
                id = v24, 
                timeElapsed = v11.getTime(v24)
            };
        else
            return nil;
        end;
    end;
    local v27 = "Stop";
    v21 = function(v28) --[[ Line: 35 ]]
        -- upvalues: v6 (ref), v10 (ref), l_default_0 (copy), v8 (ref), v27 (copy), v5 (ref), v11 (copy)
        local v29 = v6[v28];
        if not v29 then
            error("Event not registered: " .. v28);
        end;
        local l_v29_0 = v29;
        v29 = v10[v28];
        if not v29 then
            l_default_0:logRobloxTelemetryEvent(v8, {
                l_default_0.StandardizedFields.addOsInfo
            }, {
                eventName = ("FailedOn%*%*"):format(v27, v28), 
                count = 1
            });
            if l_v29_0.mode == v5.Strict then
                error((("Cannot %* an event that has not been started: %*"):format(v27, v28)));
            end;
        end;
        if v29 and v11.getStartTimestamp(v29) then
            return {
                startTime = v11.getStartTimestamp(v29), 
                id = v29, 
                timeElapsed = v11.getTime(v29)
            };
        else
            return nil;
        end;
    end;
    return {
        start = function(v31, v32) --[[ Line: 65 ]] --[[ Name: start ]]
            -- upvalues: v6 (ref), v11 (copy), l_HttpService_0 (ref), v10 (ref), l_default_0 (copy), v8 (ref), v5 (ref)
            local v33 = v6[v31];
            if not v33 then
                error("Event not registered: " .. v31);
            end;
            local l_v33_0 = v33;
            v33 = v11.start(l_HttpService_0:GenerateGUID(false), v32);
            if v10[v31] then
                l_default_0:logRobloxTelemetryEvent(v8, {
                    l_default_0.StandardizedFields.addOsInfo
                }, {
                    eventName = ("FailedOnStart%*"):format(v31), 
                    count = 1
                });
                if l_v33_0.mode == v5.Strict then
                    error("Cannot start event twice: " .. v31);
                end;
            end;
            v10[v31] = v33;
            return {
                startTime = v11.getStartTimestamp(v33), 
                id = v33
            };
        end, 
        get = v26, 
        stop = function(v35) --[[ Line: 90 ]] --[[ Name: stop ]]
            -- upvalues: v21 (copy), v10 (ref)
            local v36 = v21(v35);
            v10[v35] = nil;
            return v36;
        end, 
        _unsafeClearEventLog = function() --[[ Line: 95 ]] --[[ Name: _unsafeClearEventLog ]]
            -- upvalues: v10 (ref)
            v10 = {};
        end
    };
end;