local l_Parent_0 = script.Parent.Parent.Parent;
local l_llama_0 = require(l_Parent_0.dependencies).llama;
local _ = require(script.Parent.Types);
local v3 = require(script.Parent.toStringAdditionalArgs);
local v4 = require(script.Parent.getEventInfo);
local v5 = require(script.Parent.optionallyLog);
local v6 = require(script.Parent.Parent.Parent.RoduxTools.compose);
local v7 = require(script.Parent.Parent.Parent.Utils.isEnum);
local function _(v8) --[[ Line: 12 ]]
    -- upvalues: l_llama_0 (copy), v7 (copy)
    return l_llama_0.Dictionary.map(v8 or {}, function(v9) --[[ Line: 13 ]]
        -- upvalues: v7 (ref)
        if v7(v9) then
            return v9.rawValue();
        else
            return v9;
        end;
    end);
end;
local function v16(v11, v12) --[[ Line: 22 ]]
    -- upvalues: l_llama_0 (copy)
    if not v11 or not v12 then
        return {};
    else
        return l_llama_0.Dictionary.map(v11, function(v13, v14) --[[ Line: 27 ]]
            -- upvalues: v12 (copy), l_llama_0 (ref)
            local v15 = v12[v14];
            if v15 then
                if type(v15) == "function" then
                    return (v15(v13));
                else
                    return v13;
                end;
            else
                return l_llama_0.None;
            end;
        end);
    end;
end;
local function v18(v17) --[[ Line: 37 ]]
    -- upvalues: v3 (copy)
    return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", v17.context, v17.eventType, v3(v17.additionalInfo));
end;
local function _(v19) --[[ Line: 46 ]]
    return function(v20) --[[ Line: 47 ]]
        -- upvalues: v19 (copy)
        v19:setRBXEventStream(v20.context, v20.eventType, v20.additionalInfo);
        return v20;
    end;
end;
return function(v22) --[[ Line: 54 ]]
    -- upvalues: v4 (copy), v6 (copy), v5 (copy), v18 (copy), l_llama_0 (copy), v7 (copy), v16 (copy)
    local v23 = v4(v22.eventList);
    return function(v24, v25) --[[ Line: 64 ]]
        -- upvalues: v23 (copy), v6 (ref), v5 (ref), v22 (copy), v18 (ref), l_llama_0 (ref), v7 (ref), v16 (ref)
        local v26 = v23(v24);
        local l_v6_0 = v6;
        local v28 = v5(v22.loggerImpl, v18);
        local l_eventStreamImpl_0 = v22.eventStreamImpl;
        local l_l_eventStreamImpl_0_0 = l_eventStreamImpl_0 --[[ copy: 6 -> 9 ]];
        l_v6_0 = l_v6_0(v28, function(v31) --[[ Line: 47 ]]
            -- upvalues: l_l_eventStreamImpl_0_0 (copy)
            l_l_eventStreamImpl_0_0:setRBXEventStream(v31.context, v31.eventType, v31.additionalInfo);
            return v31;
        end);
        v28 = {
            context = v26.context.rawValue(), 
            eventType = v26.eventType.rawValue()
        };
        local l_join_0 = l_llama_0.Dictionary.join;
        l_eventStreamImpl_0 = v22.infoForAllEvents or {};
        local l_additionalInfo_0 = v26.additionalInfo;
        v28.additionalInfo = l_join_0(l_eventStreamImpl_0, l_llama_0.Dictionary.map(l_additionalInfo_0 or {}, function(v34) --[[ Line: 13 ]]
            -- upvalues: v7 (ref)
            if v7(v34) then
                return v34.rawValue();
            else
                return v34;
            end;
        end), v16(v25, v26.formatRulesForAdditionalInfo));
        l_v6_0(v28);
        return v24, v25;
    end;
end;