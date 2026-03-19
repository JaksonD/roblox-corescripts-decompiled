local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Analytics.Enums.SupportedTelemetryBackends);
local _ = require(l_script_FirstAncestor_0.Analytics.Enums.Contexts);
local _ = require(script.Parent.Parent.Types);
local function _(v7) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v8, v9, v10, v11) --[[ Line: 14 ]]
        -- upvalues: v7 (copy), v2 (ref), v3 (ref)
        if v7 then
            local v12 = nil;
            v12 = if not (type(v9) ~= "string") or type(v9) == "number" then {
                value = v9
            } else v9;
            local v13 = v2.Dictionary.join(v8, v12 or {}, v10 or {});
            if v11 then
                v13.ctx = v11;
            end;
            v7:info(v3.pretty(v13));
        end;
    end;
end;
return function(v15) --[[ Line: 33 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    return function(v16, v17, v18, v19) --[[ Line: 50 ]]
        -- upvalues: v15 (copy), v2 (ref), v3 (ref), v4 (ref)
        local l_defaults_0 = v15.eventList.defaults;
        local v21 = v15.eventList[v16];
        local l_loggerImpl_0 = v15.loggerImpl;
        local function v29(v23, v24, v25, v26) --[[ Line: 14 ]]
            -- upvalues: l_loggerImpl_0 (copy), v2 (ref), v3 (ref)
            if l_loggerImpl_0 then
                local v27 = nil;
                v27 = if not (type(v24) ~= "string") or type(v24) == "number" then {
                    value = v24
                } else v24;
                local v28 = v2.Dictionary.join(v23, v27 or {}, v25 or {});
                if v26 then
                    v28.ctx = v26;
                end;
                l_loggerImpl_0:info(v3.pretty(v28));
            end;
        end;
        for _, v31 in v21.backendsList do
            local v32 = v31.incrementValue or 1;
            local v33 = if v31.overrideName then v31.overrideName(v17) else v16;
            local v34 = v31.throttlingThousandths or v21.throttlingThousandths or l_defaults_0.throttlingThousandths;
            local v35 = {
                eventName = v33, 
                backends = {
                    v31.type
                }, 
                throttlingPercentage = math.clamp(v34, 0, 10000), 
                lastUpdated = v21.lastUpdated, 
                description = v21.description, 
                links = v21.links or l_defaults_0.links
            };
            local v36 = {};
            if v15.getInfoForAllEvents then
                local v37 = v15.getInfoForAllEvents();
                v36 = v2.Dictionary.join(v36, v37);
            end;
            if v31.format then
                assert(v31.dynamicCustomFields == nil, "Cannot use dynamicCustomFields with format");
                assert(v31.staticCustomFields == nil, "Cannot use staticCustomFields with format");
                v36 = v31.format(v17, v18 or {});
            else
                if v31.dynamicCustomFields and v17 then
                    for v38, v39 in v31.dynamicCustomFields do
                        if v17[v38] then
                            v36[v38] = v39(v17[v38]);
                        end;
                    end;
                end;
                if v31.staticCustomFields then
                    v36 = v2.Dictionary.join(v36, v31.staticCustomFields);
                end;
            end;
            if v31.type == v4.Points then
                v15.telemetryImpl:logRobloxTelemetryEvent(v35, v31.standardizedFields, v36);
                v29(v35, v31.standardizedFields, v36);
            elseif v31.type == v4.RobloxTelemetryStat then
                if not v17 or not v17.statValue then
                    v35.backends = {
                        v4.RobloxTelemetryCounter
                    };
                    v35.eventName = v16 .. "MissingStatValue";
                    v15.telemetryImpl:logRobloxTelemetryCounter(v35, v32, v36);
                    v29(v35, v32, v36);
                    return;
                else
                    v15.telemetryImpl:logRobloxTelemetryStat(v35, v17.statValue, v36);
                    v29(v35, v17.statValue, v36);
                end;
            elseif v31.type == v4.RobloxTelemetryCounter then
                v15.telemetryImpl:logRobloxTelemetryCounter(v35, v32, v36);
                v29(v35, v32, v36);
            elseif v31.type == v4.EventIngest then
                v15.telemetryImpl:logRobloxTelemetryEvent(v35, v31.standardizedFields, v36, v19 or v36.eventContext);
                v29(v35, v17, v36, v19 or v36.eventContext);
            end;
        end;
    end;
end;