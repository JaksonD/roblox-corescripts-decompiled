local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_llama_0 = require(l_Parent_0.dependencies).llama;
local _ = require(script.Parent.Parent.Types);
local v4 = require(script.Parent.toStringAdditionalArgs);
local v5 = require(script.Parent.getEventInfo);
local v6 = require(script.Parent.optionallyLog);
local v7 = require(script.Parent.Parent.Parent.Utils.isEnum);
local v8 = require(l_Parent_1.Dash);
local function _(v9) --[[ Line: 15 ]]
    -- upvalues: l_llama_0 (copy), v7 (copy)
    return l_llama_0.Dictionary.map(v9 or {}, function(v10) --[[ Line: 16 ]]
        -- upvalues: v7 (ref)
        if v7(v10) then
            return v10.rawValue();
        else
            return v10;
        end;
    end);
end;
local function v17(v12, v13) --[[ Line: 27 ]]
    -- upvalues: l_llama_0 (copy)
    if not v12 or not v13 then
        return {};
    else
        return l_llama_0.Dictionary.map(v12, function(v14, v15) --[[ Line: 32 ]]
            -- upvalues: v13 (copy), l_llama_0 (ref)
            local v16 = v13[v15];
            if v16 then
                if type(v16) == "function" then
                    return (v16(v14));
                else
                    return v14;
                end;
            else
                return l_llama_0.None;
            end;
        end);
    end;
end;
local function v19(v18) --[[ Line: 42 ]]
    -- upvalues: v4 (copy)
    return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", v18.context, v18.eventType, v4(v18.additionalInfo));
end;
local function v23(v20, v21) --[[ Line: 51 ]]
    return function(v22) --[[ Line: 52 ]]
        -- upvalues: v21 (copy), v20 (copy)
        if v21 then
            v20:sendEventDeferred(v22.context, v22.eventType, v22.additionalInfo);
            return v22;
        else
            v20:setRBXEventStream(v22.context, v22.eventType, v22.additionalInfo);
            return v22;
        end;
    end;
end;
return function(v24) --[[ Line: 63 ]]
    -- upvalues: v5 (copy), v23 (copy), v8 (copy), v6 (copy), v19 (copy), l_llama_0 (copy), v7 (copy), v17 (copy)
    local v25 = v5(v24.eventList);
    return function(v26, v27) --[[ Line: 73 ]]
        -- upvalues: v25 (copy), v23 (ref), v24 (copy), v8 (ref), v6 (ref), v19 (ref), l_llama_0 (ref), v7 (ref), v17 (ref)
        local v28 = v25(v26);
        local _ = v23;
        local v30 = if v24.getInfoForAllEvents then v24.getInfoForAllEvents() else v24.infoForAllEvents;
        local l_pipe_0 = v8.pipe;
        local l_eventStreamImpl_0 = v24.eventStreamImpl;
        local l_shouldUseSendEventDeferred_0 = v24.shouldUseSendEventDeferred;
        local l_l_shouldUseSendEventDeferred_0_0 = l_shouldUseSendEventDeferred_0 --[[ copy: 8 -> 11 ]];
        local l_l_eventStreamImpl_0_0 = l_eventStreamImpl_0 --[[ copy: 7 -> 12 ]];
        l_pipe_0 = l_pipe_0(function(v36) --[[ Line: 52 ]]
            -- upvalues: l_l_shouldUseSendEventDeferred_0_0 (copy), l_l_eventStreamImpl_0_0 (copy)
            if l_l_shouldUseSendEventDeferred_0_0 then
                l_l_eventStreamImpl_0_0:sendEventDeferred(v36.context, v36.eventType, v36.additionalInfo);
                return v36;
            else
                l_l_eventStreamImpl_0_0:setRBXEventStream(v36.context, v36.eventType, v36.additionalInfo);
                return v36;
            end;
        end, v6(v24.loggerImpl, v19));
        local v37 = {
            context = v28.context, 
            eventType = v28.eventType
        };
        l_eventStreamImpl_0 = l_llama_0.Dictionary.join;
        l_shouldUseSendEventDeferred_0 = v30 or {};
        local l_additionalInfo_0 = v28.additionalInfo;
        v37.additionalInfo = l_eventStreamImpl_0(l_shouldUseSendEventDeferred_0, l_llama_0.Dictionary.map(l_additionalInfo_0 or {}, function(v39) --[[ Line: 16 ]]
            -- upvalues: v7 (ref)
            if v7(v39) then
                return v39.rawValue();
            else
                return v39;
            end;
        end), v17(v27, v28.formatRulesForAdditionalInfo));
        l_pipe_0(v37);
        return v26, v27;
    end;
end;