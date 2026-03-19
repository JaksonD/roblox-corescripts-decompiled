local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v5 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent.ReactCapturedValue);
local v7 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local v9 = require(script.Parent["ReactFiberSuspenseContext.new"]);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v11 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v11.ClassComponent;
local l_HostRoot_0 = v11.HostRoot;
local l_SuspenseComponent_0 = v11.SuspenseComponent;
local l_IncompleteClassComponent_0 = v11.IncompleteClassComponent;
local v16 = require(script.Parent.ReactFiberFlags);
local l_DidCapture_0 = v16.DidCapture;
local l_Incomplete_0 = v16.Incomplete;
local l_NoFlags_0 = v16.NoFlags;
local l_ShouldCapture_0 = v16.ShouldCapture;
local l_LifecycleEffectMask_0 = v16.LifecycleEffectMask;
local l_ForceUpdateForLegacySuspense_0 = v16.ForceUpdateForLegacySuspense;
local l_shouldCaptureSuspense_0 = require(script.Parent["ReactFiberSuspenseComponent.new"]).shouldCaptureSuspense;
local v24 = require(script.Parent.ReactTypeOfMode);
local l_NoMode_0 = v24.NoMode;
local l_BlockingMode_0 = v24.BlockingMode;
local l_DebugTracingMode_0 = v24.DebugTracingMode;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_createCapturedValue_0 = require(script.Parent.ReactCapturedValue).createCapturedValue;
local l_enqueueCapturedUpdate_0 = v7.enqueueCapturedUpdate;
local l_createUpdate_0 = v7.createUpdate;
local l_CaptureUpdate_0 = v7.CaptureUpdate;
local l_ForceUpdate_0 = v7.ForceUpdate;
local l_enqueueUpdate_0 = v7.enqueueUpdate;
local l_markFailedErrorBoundaryForHotReloading_0 = require(script.Parent["ReactFiberHotReloading.new"]).markFailedErrorBoundaryForHotReloading;
local l_hasSuspenseContext_0 = v9.hasSuspenseContext;
local l_InvisibleParentSuspenseContext_0 = v9.InvisibleParentSuspenseContext;
local l_suspenseStackCursor_0 = v9.suspenseStackCursor;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local function v45(...) --[[ Line: 89 ]]
    -- upvalues: v42 (ref), v41 (ref)
    if not v42 then
        v41 = require(script.Parent["ReactFiberWorkLoop.new"]);
        v42 = v41.markLegacyErrorBoundaryAsFailed;
    end;
    return v42(...);
end;
local function v46(...) --[[ Line: 104 ]]
    -- upvalues: v41 (ref), v44 (ref)
    if v41 == nil then
        v41 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v44 = v41.pingSuspendedRoot;
    return v44(...);
end;
local function v47(...) --[[ Line: 111 ]]
    -- upvalues: v41 (ref), v43 (ref)
    if v41 == nil then
        v41 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v43 = v41.isAlreadyFailedLegacyErrorBoundary;
    return v43(...);
end;
local l_logCapturedError_0 = require(script.Parent.ReactFiberErrorLogger).logCapturedError;
local l_logComponentSuspended_0 = require(script.Parent.DebugTracing).logComponentSuspended;
local l_markComponentSuspended_0 = require(script.Parent.SchedulingProfiler).markComponentSuspended;
local l_SyncLane_0 = v5.SyncLane;
local l_NoTimestamp_0 = v5.NoTimestamp;
local l_includesSomeLane_0 = v5.includesSomeLane;
local l_mergeLanes_0 = v5.mergeLanes;
local l_pickArbitraryLane_0 = v5.pickArbitraryLane;
createRootErrorUpdate = function(v56, v57, v58, v59) --[[ Line: 133 ]] --[[ Name: createRootErrorUpdate ]]
    -- upvalues: l_createUpdate_0 (copy), l_NoTimestamp_0 (copy), l_CaptureUpdate_0 (copy), l_Object_0 (copy), l_logCapturedError_0 (copy)
    local v60 = l_createUpdate_0(l_NoTimestamp_0, v58);
    v60.tag = l_CaptureUpdate_0;
    v60.payload = {
        element = l_Object_0.None
    };
    local l_value_0 = v57.value;
    v60.callback = function() --[[ Line: 147 ]]
        -- upvalues: v59 (copy), l_value_0 (copy), l_logCapturedError_0 (ref), v56 (copy), v57 (copy)
        if v59 ~= nil then
            v59(l_value_0);
        end;
        l_logCapturedError_0(v56, v57);
    end;
    return v60;
end;
createClassErrorUpdate = function(v62, v63, v64) --[[ Line: 156 ]] --[[ Name: createClassErrorUpdate ]]
    -- upvalues: l_createUpdate_0 (copy), l_NoTimestamp_0 (copy), l_CaptureUpdate_0 (copy), l_logCapturedError_0 (copy), v1 (copy), l_markFailedErrorBoundaryForHotReloading_0 (copy), v45 (copy), l_includesSomeLane_0 (copy), l_SyncLane_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    local v65 = l_createUpdate_0(l_NoTimestamp_0, v64);
    v65.tag = l_CaptureUpdate_0;
    local l_getDerivedStateFromError_0 = v62.type.getDerivedStateFromError;
    if typeof(l_getDerivedStateFromError_0) == "function" then
        local l_value_1 = v63.value;
        local l_l_value_1_0 = l_value_1 --[[ copy: 5 -> 6 ]];
        v65.payload = function() --[[ Line: 166 ]]
            -- upvalues: l_logCapturedError_0 (ref), v62 (copy), v63 (copy), l_getDerivedStateFromError_0 (copy), l_l_value_1_0 (copy)
            l_logCapturedError_0(v62, v63);
            return l_getDerivedStateFromError_0(l_l_value_1_0);
        end;
    end;
    local l_stateNode_0 = v62.stateNode;
    if l_stateNode_0 ~= nil and typeof(l_stateNode_0.componentDidCatch) == "function" then
        v65.callback = function() --[[ Line: 174 ]]
            -- upvalues: v1 (ref), l_markFailedErrorBoundaryForHotReloading_0 (ref), v62 (copy), l_getDerivedStateFromError_0 (copy), v45 (ref), l_stateNode_0 (copy), l_logCapturedError_0 (ref), v63 (copy), l_includesSomeLane_0 (ref), l_SyncLane_0 (ref), l_console_0 (ref), l_getComponentName_0 (ref)
            if v1.__DEV__ then
                l_markFailedErrorBoundaryForHotReloading_0(v62);
            end;
            if typeof(l_getDerivedStateFromError_0) ~= "function" then
                v45(l_stateNode_0);
                l_logCapturedError_0(v62, v63);
            end;
            local l_value_2 = v63.value;
            local l_stack_0 = v63.stack;
            l_stateNode_0:componentDidCatch(l_value_2, {
                componentStack = l_stack_0 or ""
            });
            if v1.__DEV__ and typeof(l_getDerivedStateFromError_0) ~= "function" and not l_includesSomeLane_0(v62.lanes, l_SyncLane_0) then
                l_console_0.error("%s: Error boundaries should implement getDerivedStateFromError(). In that method, return a state update to display an error message or fallback UI.", l_getComponentName_0(v62.type) or "Unknown");
            end;
        end;
        return v65;
    else
        if v1.__DEV__ then
            v65.callback = function() --[[ Line: 212 ]]
                -- upvalues: l_markFailedErrorBoundaryForHotReloading_0 (ref), v62 (copy)
                l_markFailedErrorBoundaryForHotReloading_0(v62);
            end;
        end;
        return v65;
    end;
end;
local function v78(v72, v73, v74) --[[ Line: 219 ]] --[[ Name: attachPingListener ]]
    -- upvalues: v46 (copy)
    local l_pingCache_0 = v72.pingCache;
    local v76 = nil;
    if l_pingCache_0 == nil then
        v76 = {};
        v72.pingCache = {
            [v73] = v76
        };
        l_pingCache_0 = v72.pingCache;
    else
        v76 = l_pingCache_0[v73];
        if v76 == nil then
            v76 = {};
            l_pingCache_0[v73] = v76;
        end;
    end;
    if not v76[v74] then
        v76[v74] = true;
        local function v77() --[[ Line: 247 ]]
            -- upvalues: v46 (ref), v72 (copy), v73 (copy), v74 (copy)
            return v46(v72, v73, v74);
        end;
        v73:andThen(v77, v77);
    end;
end;
throwException = function(v79, v80, v81, v82, v83, v84, v85) --[[ Line: 254 ]] --[[ Name: throwException ]]
    -- upvalues: l_Incomplete_0 (copy), v1 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logComponentSuspended_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markComponentSuspended_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_hasSuspenseContext_0 (copy), l_suspenseStackCursor_0 (copy), l_InvisibleParentSuspenseContext_0 (copy), l_SuspenseComponent_0 (copy), l_shouldCaptureSuspense_0 (copy), l_DidCapture_0 (copy), l_ForceUpdateForLegacySuspense_0 (copy), l_LifecycleEffectMask_0 (copy), l_ClassComponent_0 (copy), l_IncompleteClassComponent_0 (copy), l_createUpdate_0 (copy), l_NoTimestamp_0 (copy), l_SyncLane_0 (copy), l_ForceUpdate_0 (copy), l_enqueueUpdate_0 (copy), l_mergeLanes_0 (copy), v78 (copy), l_ShouldCapture_0 (copy), l_createCapturedValue_0 (copy), l_HostRoot_0 (copy), l_pickArbitraryLane_0 (copy), l_enqueueCapturedUpdate_0 (copy), l_NoFlags_0 (copy), v47 (copy)
    v81.flags = bit32.bor(v81.flags, l_Incomplete_0);
    if v82 ~= nil and typeof(v82) == "table" and typeof(v82.andThen) == "function" then
        local l_v82_0 = v82;
        if v1.__DEV__ and l_enableDebugTracing_0 and bit32.band(v81.mode, l_DebugTracingMode_0) ~= 0 then
            local v87 = l_getComponentName_0(v81.type) or "Unknown";
            l_logComponentSuspended_0(v87, l_v82_0);
        end;
        if l_enableSchedulingProfiler_0 then
            l_markComponentSuspended_0(v81, l_v82_0);
        end;
        if bit32.band(v81.mode, l_BlockingMode_0) == l_NoMode_0 then
            local l_alternate_0 = v81.alternate;
            if l_alternate_0 then
                v81.updateQueue = l_alternate_0.updateQueue;
                v81.memoizedState = l_alternate_0.memoizedState;
                v81.lanes = l_alternate_0.lanes;
            else
                v81.updateQueue = nil;
                v81.memoizedState = nil;
            end;
        end;
        local v89 = l_hasSuspenseContext_0(l_suspenseStackCursor_0.current, l_InvisibleParentSuspenseContext_0);
        local l_v80_0 = v80;
        while true do
            if l_v80_0.tag == l_SuspenseComponent_0 and l_shouldCaptureSuspense_0(l_v80_0, v89) then
                local l_updateQueue_0 = l_v80_0.updateQueue;
                if l_updateQueue_0 == nil then
                    l_v80_0.updateQueue = {
                        [l_v82_0] = true
                    };
                else
                    l_updateQueue_0[l_v82_0] = true;
                end;
                if bit32.band(l_v80_0.mode, l_BlockingMode_0) == l_NoMode_0 then
                    l_v80_0.flags = bit32.bor(l_v80_0.flags, l_DidCapture_0);
                    v81.flags = bit32.bor(v81.flags, l_ForceUpdateForLegacySuspense_0);
                    v81.flags = bit32.band(v81.flags, (bit32.bnot((bit32.bor(l_LifecycleEffectMask_0, l_Incomplete_0)))));
                    if v81.tag == l_ClassComponent_0 then
                        if v81.alternate == nil then
                            v81.tag = l_IncompleteClassComponent_0;
                        else
                            local v92 = l_createUpdate_0(l_NoTimestamp_0, l_SyncLane_0);
                            v92.tag = l_ForceUpdate_0;
                            l_enqueueUpdate_0(v81, v92);
                        end;
                    end;
                    v81.lanes = l_mergeLanes_0(v81.lanes, l_SyncLane_0);
                    return;
                else
                    v78(v79, l_v82_0, v83);
                    l_v80_0.flags = bit32.bor(l_v80_0.flags, l_ShouldCapture_0);
                    l_v80_0.lanes = v83;
                    return;
                end;
            else
                l_v80_0 = l_v80_0.return_;
                if l_v80_0 == nil then
                    v82 = (l_getComponentName_0(v81.type) or "A React component") .. " suspended while rendering, but no fallback UI was specified.\n" .. "\n" .. "Add a <Suspense fallback=...> component higher in the tree to " .. "provide a loading indicator or placeholder to display.";
                    break;
                end;
            end;
        end;
    end;
    v85();
    v82 = l_createCapturedValue_0(v82, v81);
    local l_v80_1 = v80;
    while true do
        if l_v80_1.tag == l_HostRoot_0 then
            local l_v82_1 = v82;
            l_v80_1.flags = bit32.bor(l_v80_1.flags, l_ShouldCapture_0);
            local v95 = l_pickArbitraryLane_0(v83);
            l_v80_1.lanes = l_mergeLanes_0(l_v80_1.lanes, v95);
            local v96 = createRootErrorUpdate(l_v80_1, l_v82_1, v95, v84);
            l_enqueueCapturedUpdate_0(l_v80_1, v96);
            return;
        else
            if l_v80_1.tag == l_ClassComponent_0 then
                local l_v82_2 = v82;
                local l_type_0 = l_v80_1.type;
                local l_stateNode_1 = l_v80_1.stateNode;
                if bit32.band(l_v80_1.flags, l_DidCapture_0) == l_NoFlags_0 and (typeof(l_type_0.getDerivedStateFromError) == "function" or l_stateNode_1 ~= nil and typeof(l_stateNode_1.componentDidCatch) == "function" and not v47(l_stateNode_1)) then
                    l_v80_1.flags = bit32.bor(l_v80_1.flags, l_ShouldCapture_0);
                    local v100 = l_pickArbitraryLane_0(v83);
                    l_v80_1.lanes = l_mergeLanes_0(l_v80_1.lanes, v100);
                    local v101 = createClassErrorUpdate(l_v80_1, l_v82_2, v100);
                    l_enqueueCapturedUpdate_0(l_v80_1, v101);
                    return;
                end;
            end;
            l_v80_1 = l_v80_1.return_;
            if l_v80_1 == nil then
                return;
            end;
        end;
    end;
end;
return {
    throwException = throwException, 
    createRootErrorUpdate = createRootErrorUpdate, 
    createClassErrorUpdate = createClassErrorUpdate
};