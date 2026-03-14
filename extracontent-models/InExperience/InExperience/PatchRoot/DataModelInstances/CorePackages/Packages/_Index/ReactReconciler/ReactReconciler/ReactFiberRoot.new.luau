local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Set_0 = v2.Set;
local l_Map_0 = v2.Map;
local _ = require(script.Parent.ReactInternalTypes);
local v6 = require(script.Parent.ReactRootTags);
local v7 = require(script.Parent.ReactFiberHostConfig);
local l_noTimeout_0 = v7.noTimeout;
local l_supportsHydration_0 = v7.supportsHydration;
local l_createHostRootFiber_0 = require(script.Parent["ReactFiber.new"]).createHostRootFiber;
local v11 = require(script.Parent.ReactFiberLane);
local l_NoLanes_0 = v11.NoLanes;
local l_NoLanePriority_0 = v11.NoLanePriority;
local l_NoTimestamp_0 = v11.NoTimestamp;
local l_createLaneMap_0 = v11.createLaneMap;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_unstable_getThreadID_0 = require(l_Parent_0.Scheduler).tracing.unstable_getThreadID;
local l_initializeUpdateQueue_0 = require(script.Parent["ReactUpdateQueue.new"]).initializeUpdateQueue;
local l_LegacyRoot_0 = v6.LegacyRoot;
local l_BlockingRoot_0 = v6.BlockingRoot;
local l_ConcurrentRoot_0 = v6.ConcurrentRoot;
local v24 = {};
local function v29(v25, v26, v27) --[[ Line: 49 ]] --[[ Name: FiberRootNode ]]
    -- upvalues: l_noTimeout_0 (copy), l_NoLanePriority_0 (copy), l_createLaneMap_0 (copy), l_NoLanes_0 (copy), l_NoTimestamp_0 (copy), l_supportsHydration_0 (copy), l_enableSchedulerTracing_0 (copy), l_unstable_getThreadID_0 (copy), l_Set_0 (copy), l_Map_0 (copy), l_enableSuspenseCallback_0 (copy), v1 (copy), l_BlockingRoot_0 (copy), l_ConcurrentRoot_0 (copy), l_LegacyRoot_0 (copy)
    local v28 = {
        tag = v26, 
        containerInfo = v25, 
        pendingChildren = nil, 
        current = nil, 
        pingCache = nil, 
        finishedWork = nil, 
        timeoutHandle = l_noTimeout_0, 
        context = nil, 
        pendingContext = nil, 
        hydrate = v27, 
        callbackNode = nil, 
        callbackPriority = l_NoLanePriority_0, 
        eventTimes = l_createLaneMap_0(l_NoLanes_0), 
        expirationTimes = l_createLaneMap_0(l_NoTimestamp_0), 
        pendingLanes = l_NoLanes_0, 
        suspendedLanes = l_NoLanes_0, 
        pingedLanes = l_NoLanes_0, 
        expiredLanes = l_NoLanes_0, 
        mutableReadLanes = l_NoLanes_0, 
        finishedLanes = l_NoLanes_0, 
        entangledLanes = l_NoLanes_0, 
        entanglements = l_createLaneMap_0(l_NoLanes_0)
    };
    if l_supportsHydration_0 then
        v28.mutableSourceEagerHydrationData = nil;
    end;
    if l_enableSchedulerTracing_0 then
        v28.interactionThreadID = l_unstable_getThreadID_0();
        v28.memoizedInteractions = l_Set_0.new();
        v28.pendingInteractionMap = l_Map_0.new();
    end;
    if l_enableSuspenseCallback_0 then
        v28.hydrationCallbacks = nil;
    end;
    if v1.__DEV__ then
        if v26 == l_BlockingRoot_0 then
            v28._debugRootType = "createBlockingRoot()";
            return v28;
        elseif v26 == l_ConcurrentRoot_0 then
            v28._debugRootType = "createRoot()";
            return v28;
        elseif v26 == l_LegacyRoot_0 then
            v28._debugRootType = "createLegacyRoot()";
        end;
    end;
    return v28;
end;
v24.createFiberRoot = function(v30, v31, v32, v33) --[[ Line: 105 ]]
    -- upvalues: v29 (copy), l_enableSuspenseCallback_0 (copy), l_createHostRootFiber_0 (copy), l_initializeUpdateQueue_0 (copy)
    local v34 = v29(v30, v31, v32);
    if l_enableSuspenseCallback_0 then
        v34.hydrationCallbacks = v33;
    end;
    local v35 = l_createHostRootFiber_0(v31);
    v34.current = v35;
    v35.stateNode = v34;
    l_initializeUpdateQueue_0(v35);
    return v34;
end;
return v24;