local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.ReactProfilerContext);
local v3 = require(script.Parent.isReactProfilingEnabled);
local v4 = v1.createContext(nil);
local function v27(v5) --[[ Line: 20 ]] --[[ Name: ReactProfiler ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy)
    local v6 = v1.useRef(0);
    local v7 = v1.useRef(0);
    local v8 = v1.useContext(v4);
    local v9 = v1.useContext(v2);
    local v18 = v1.useCallback(function(v10, _, v12, _, v14, v15) --[[ Line: 30 ]]
        -- upvalues: v8 (copy), v6 (copy), v9 (copy)
        if v8 ~= nil then
            local l_exclusiveRenderDurationRef_0 = v8.exclusiveRenderDurationRef;
            l_exclusiveRenderDurationRef_0.current = l_exclusiveRenderDurationRef_0.current - v12;
        end;
        local l_v6_0 = v6;
        l_v6_0.current = l_v6_0.current + v12;
        if v9 ~= nil then
            v9.onRender:fire({
                profilerId = v10, 
                startTime = v14, 
                commitTime = v15, 
                duration = v12, 
                exclusiveDuration = v6.current
            });
        end;
        v6.current = 0;
    end, {});
    local v25 = v1.useCallback(function(v19, _, v21, v22) --[[ Line: 61 ]]
        -- upvalues: v8 (copy), v7 (copy), v9 (copy)
        if v8 ~= nil then
            local l_exclusiveEffectDurationRef_0 = v8.exclusiveEffectDurationRef;
            l_exclusiveEffectDurationRef_0.current = l_exclusiveEffectDurationRef_0.current - v21;
        end;
        local l_v7_0 = v7;
        l_v7_0.current = l_v7_0.current + v21;
        if v9 ~= nil then
            v9.onCommit:fire({
                profilerId = v19, 
                commitTime = v22, 
                duration = v21, 
                exclusiveDuration = v7.current
            });
        end;
        v7.current = 0;
    end, {});
    local v26 = v1.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v6 (copy), v7 (copy)
        return {
            exclusiveRenderDurationRef = v6, 
            exclusiveEffectDurationRef = v7
        };
    end, {});
    return v1.createElement(v1.Profiler, {
        id = v5.id, 
        onRender = v18, 
        onCommit = v25
    }, v1.createElement(v4.Provider, {
        key = "ExclusiveDurationsContext", 
        value = v26
    }, v5.children));
end;
return function(v28) --[[ Line: 104 ]]
    -- upvalues: v3 (copy), v1 (copy), v27 (copy)
    if v3 then
        return v1.createElement(v27, {
            id = v28.id
        }, v28.children);
    else
        return v1.createElement(v1.Fragment, nil, v28.children);
    end;
end;