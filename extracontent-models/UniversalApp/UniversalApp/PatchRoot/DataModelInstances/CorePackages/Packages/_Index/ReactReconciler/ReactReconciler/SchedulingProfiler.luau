local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_WeakMap_0 = require(l_Parent_0.LuauPolyfill).WeakMap;
local _ = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(l_Parent_0.Shared);
local l_enableSchedulingProfiler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler;
local l_ReactVersion_0 = require(l_Parent_0.Shared).ReactVersion;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v9 = _G.performance ~= nil;
local v11 = _G.performance or {
    mark = function(v10) --[[ Line: 41 ]] --[[ Name: mark ]]
        debug.profilebegin(v10);
        debug.profileend();
    end
};
formatLanes = function(v12) --[[ Line: 47 ]] --[[ Name: formatLanes ]]
    return (tostring(v12));
end;
local v13 = nil;
local v14 = {
    CommitStart = 0, 
    CommitStop = 1, 
    LayoutEffectsStart = 2, 
    LayoutEffectsStop = 3, 
    PassiveEffectsStart = 4, 
    PassiveEffectsStop = 5, 
    RenderStart = 6, 
    RenderYield = 7, 
    RenderStop = 8
};
if l_enableSchedulingProfiler_0 and v9 then
    v11.mark("--react-init-" .. tostring(l_ReactVersion_0));
end;
v0.markCommitStarted = function(v15) --[[ Line: 75 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy), v13 (ref), v14 (copy)
    if l_enableSchedulingProfiler_0 then
        if v9 then
            v11.mark("--commit-start-" .. formatLanes(v15));
        end;
        if v13 then
            v13(v14.CommitStart);
        end;
    end;
end;
v0.markCommitStopped = function(v16) --[[ Line: 87 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy), v13 (ref), v14 (copy)
    if l_enableSchedulingProfiler_0 then
        if v9 then
            v11.mark("--commit-stop");
        end;
        if v13 then
            v13(v14.CommitStop, v16);
        end;
    end;
end;
local v17 = l_WeakMap_0.new();
local v18 = 0;
getWakeableID = function(v19) --[[ Line: 105 ]] --[[ Name: getWakeableID ]]
    -- upvalues: v17 (copy), v18 (ref)
    if not v17:has(v19) then
        v17:set(v19, v18);
        v18 = v18 + 1;
    end;
    return v17:get(v19);
end;
v0.markComponentSuspended = function(v20, v21) --[[ Line: 113 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), l_getComponentName_0 (copy), v11 (copy)
    if l_enableSchedulingProfiler_0 and v9 then
        local v22 = getWakeableID(v21);
        local v23 = l_getComponentName_0(v20.type) or "Unknown";
        v11.mark("--suspense-suspend-" .. tostring(v22) .. "-" .. v23);
        v21:andThen(function() --[[ Line: 122 ]]
            -- upvalues: v11 (ref), v22 (copy), v23 (copy)
            v11.mark("--suspense-resolved-" .. tostring(v22) .. "-" .. v23);
        end, function() --[[ Line: 126 ]]
            -- upvalues: v11 (ref), v22 (copy), v23 (copy)
            v11.mark("--suspense-rejected-" .. tostring(v22) .. "-" .. v23);
        end);
    end;
end;
v0.markLayoutEffectsStarted = function(v24) --[[ Line: 135 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy), v13 (ref), v14 (copy)
    if l_enableSchedulingProfiler_0 then
        if v9 then
            v11.mark("--layout-effects-start-" .. formatLanes(v24));
        end;
        if v13 then
            v13(v14.LayoutEffectsStart);
        end;
    end;
end;
v0.markLayoutEffectsStopped = function() --[[ Line: 147 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy), v13 (ref), v14 (copy)
    if l_enableSchedulingProfiler_0 then
        if v9 then
            v11.mark("--layout-effects-stop");
        end;
        if v13 then
            v13(v14.LayoutEffectsStop);
        end;
    end;
end;
v0.markPassiveEffectsStarted = function(v25) --[[ Line: 159 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy), v13 (ref), v14 (copy)
    if l_enableSchedulingProfiler_0 then
        if v9 then
            v11.mark("--passive-effects-start-" .. formatLanes(v25));
        end;
        if v13 then
            v13(v14.PassiveEffectsStart);
        end;
    end;
end;
v0.markPassiveEffectsStopped = function(v26) --[[ Line: 171 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy), v13 (ref), v14 (copy)
    if l_enableSchedulingProfiler_0 then
        if v9 then
            v11.mark("--passive-effects-stop");
        end;
        if v13 then
            v13(v14.PassiveEffectsStop, v26);
        end;
    end;
end;
v0.markRenderStarted = function(v27) --[[ Line: 183 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy), v13 (ref), v14 (copy)
    if l_enableSchedulingProfiler_0 then
        if v9 then
            v11.mark("--render-start-" .. formatLanes(v27));
        end;
        if v13 then
            v13(v14.RenderStart);
        end;
    end;
end;
v0.markRenderYielded = function() --[[ Line: 195 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy), v13 (ref), v14 (copy)
    if l_enableSchedulingProfiler_0 then
        if v9 then
            v11.mark("--render-yield");
        end;
        if v13 then
            v13(v14.RenderYield);
        end;
    end;
end;
v0.markRenderStopped = function() --[[ Line: 207 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy), v13 (ref), v14 (copy)
    if l_enableSchedulingProfiler_0 then
        if v9 then
            v11.mark("--render-stop");
        end;
        if v13 then
            v13(v14.RenderStop);
        end;
    end;
end;
v0.markRenderScheduled = function(v28) --[[ Line: 219 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), v11 (copy)
    if l_enableSchedulingProfiler_0 and v9 then
        v11.mark("--schedule-render-" .. formatLanes(v28));
    end;
end;
v0.markForceUpdateScheduled = function(v29, v30) --[[ Line: 227 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), l_getComponentName_0 (copy), v11 (copy)
    if l_enableSchedulingProfiler_0 and v9 then
        local v31 = l_getComponentName_0(v29.type) or "Unknown";
        v11.mark("--schedule-forced-update-" .. formatLanes(v30) .. "-" .. v31);
    end;
end;
v0.markStateUpdateScheduled = function(v32, v33) --[[ Line: 239 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v9 (copy), l_getComponentName_0 (copy), v11 (copy)
    if l_enableSchedulingProfiler_0 and v9 then
        local v34 = l_getComponentName_0(v32.type) or "Unknown";
        v11.mark("--schedule-state-update-" .. formatLanes(v33) .. "-" .. v34);
    end;
end;
v0.profilerEventTypes = v14;
v0.registerProfilerEventCallback = function(v35) --[[ Line: 254 ]]
    -- upvalues: v13 (ref)
    if v13 then
        warn("SchedulingProfiler: Another event callback was already registered.");
    end;
    v13 = v35;
end;
return v0;