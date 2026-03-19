local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local l_Set_0 = require(l_Parent_0.LuauPolyfill).Set;
local l___DEV___0 = v1.__DEV__;
local l___YOLO___0 = v1.__YOLO__;
local v6 = {};
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v9 = require(script.Parent.ReactFiberLane);
local v10 = require(l_Parent_0.Scheduler);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v12 = require(script.Parent["ReactFiberStack.new"]);
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_skipUnmountedBoundaries_0 = l_ReactFeatureFlags_0.skipUnmountedBoundaries;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local l_deletedTreeCleanUpLevel_0 = l_ReactFeatureFlags_0.deletedTreeCleanUpLevel;
local l_enableNewTreeCleanupPath_0 = l_ReactFeatureFlags_0.enableNewTreeCleanupPath;
local v20 = require(l_Parent_0.Shared);
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ReactSharedInternals_0 = v20.ReactSharedInternals;
local l_invariant_0 = v20.invariant;
local v24 = require(script.Parent["SchedulerWithReactIntegration.new"]);
local l_scheduleCallback_0 = v24.scheduleCallback;
local l_cancelCallback_0 = v24.cancelCallback;
local l_getCurrentPriorityLevel_0 = v24.getCurrentPriorityLevel;
local l_runWithPriority_0 = v24.runWithPriority;
local l_shouldYield_0 = v24.shouldYield;
local l_requestPaint_0 = v24.requestPaint;
local l_now_0 = v24.now;
local l_NoPriority_0 = v24.NoPriority;
local l_ImmediatePriority_0 = v24.ImmediatePriority;
local l_UserBlockingPriority_0 = v24.UserBlockingPriority;
local l_NormalPriority_0 = v24.NormalPriority;
local l_flushSyncCallbackQueue_0 = v24.flushSyncCallbackQueue;
local l_scheduleSyncCallback_0 = v24.scheduleSyncCallback;
local v38 = require(script.Parent.DebugTracing);
local v39 = require(script.Parent.SchedulingProfiler);
local l_tracing_0 = require(l_Parent_0.Scheduler).tracing;
local l___interactionsRef_0 = l_tracing_0.__interactionsRef;
local l___subscriberRef_0 = l_tracing_0.__subscriberRef;
local v43 = require(script.Parent.ReactFiberHostConfig);
local v44 = require(script.Parent["ReactFiber.new"]);
local v45 = require(script.Parent.ReactTypeOfMode);
local v46 = require(script.Parent.ReactWorkTags);
local l_LegacyRoot_0 = require(script.Parent.ReactRootTags).LegacyRoot;
local v48 = require(script.Parent.ReactFiberFlags);
local l_SyncLane_0 = v9.SyncLane;
local l_SyncBatchedLane_0 = v9.SyncBatchedLane;
local l_NoTimestamp_0 = v9.NoTimestamp;
local l_findUpdateLane_0 = v9.findUpdateLane;
local l_findTransitionLane_0 = v9.findTransitionLane;
local l_findRetryLane_0 = v9.findRetryLane;
local l_includesSomeLane_0 = v9.includesSomeLane;
local l_isSubsetOfLanes_0 = v9.isSubsetOfLanes;
local l_mergeLanes_0 = v9.mergeLanes;
local l_removeLanes_0 = v9.removeLanes;
local l_pickArbitraryLane_0 = v9.pickArbitraryLane;
local l_hasDiscreteLanes_0 = v9.hasDiscreteLanes;
local l_includesNonIdleWork_0 = v9.includesNonIdleWork;
local l_includesOnlyRetries_0 = v9.includesOnlyRetries;
local l_includesOnlyTransitions_0 = v9.includesOnlyTransitions;
local l_getNextLanes_0 = v9.getNextLanes;
local l_returnNextLanesPriority_0 = v9.returnNextLanesPriority;
local l_setCurrentUpdateLanePriority_0 = v9.setCurrentUpdateLanePriority;
local l_getCurrentUpdateLanePriority_0 = v9.getCurrentUpdateLanePriority;
local l_markStarvedLanesAsExpired_0 = v9.markStarvedLanesAsExpired;
local l_getLanesToRetrySynchronouslyOnError_0 = v9.getLanesToRetrySynchronouslyOnError;
local l_markRootUpdated_0 = v9.markRootUpdated;
local l_markRootPinged_0 = v9.markRootPinged;
local l_markRootExpired_0 = v9.markRootExpired;
local l_markDiscreteUpdatesExpired_0 = v9.markDiscreteUpdatesExpired;
local l_markRootFinished_0 = v9.markRootFinished;
local l_schedulerPriorityToLanePriority_0 = v9.schedulerPriorityToLanePriority;
local l_lanePriorityToSchedulerPriority_0 = v9.lanePriorityToSchedulerPriority;
local v77 = require(script.Parent.ReactFiberTransition);
local v78 = require(script.Parent["ReactFiberUnwindWork.new"]);
local l_unwindWork_0 = v78.unwindWork;
local l_unwindInterruptedWork_0 = v78.unwindInterruptedWork;
local v81 = require(script.Parent["ReactFiberThrow.new"]);
local l_throwException_0 = v81.throwException;
local l_createRootErrorUpdate_0 = v81.createRootErrorUpdate;
local l_createClassErrorUpdate_0 = v81.createClassErrorUpdate;
local v85 = require(script.Parent["ReactFiberCommitWork.new"]);
local l_commitBeforeMutationLifeCycles_0 = v85.commitBeforeMutationLifeCycles;
local l_commitPlacement_0 = v85.commitPlacement;
local l_commitWork_0 = v85.commitWork;
local l_commitDeletion_0 = v85.commitDeletion;
local l_commitPassiveUnmount_0 = v85.commitPassiveUnmount;
local l_commitPassiveUnmountInsideDeletedTree_0 = v85.commitPassiveUnmountInsideDeletedTree;
local l_commitPassiveMount_0 = v85.commitPassiveMount;
local l_commitDetachRef_0 = v85.commitDetachRef;
local l_invokeLayoutEffectMountInDEV_0 = v85.invokeLayoutEffectMountInDEV;
local l_invokePassiveEffectMountInDEV_0 = v85.invokePassiveEffectMountInDEV;
local l_invokeLayoutEffectUnmountInDEV_0 = v85.invokeLayoutEffectUnmountInDEV;
local l_invokePassiveEffectUnmountInDEV_0 = v85.invokePassiveEffectUnmountInDEV;
local l_recursivelyCommitLayoutEffects_0 = v85.recursivelyCommitLayoutEffects;
local v99 = require(l_Parent_0.Promise);
local l_enqueueUpdate_0 = require(script.Parent["ReactUpdateQueue.new"]).enqueueUpdate;
local l_resetContextDependencies_0 = require(script.Parent["ReactFiberNewContext.new"]).resetContextDependencies;
local v102 = require(script.Parent.RobloxReactProfiling);
local v103 = nil;
local v104 = {
    resetHooksAfterThrowRef = nil, 
    ContextOnlyDispatcherRef = nil, 
    getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = nil, 
    originalBeginWorkRef = nil, 
    completeWorkRef = nil
};
local function v108(v105, v106, v107) --[[ Line: 246 ]]
    -- upvalues: v104 (copy)
    if not v104.originalBeginWorkRef then
        v104.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork;
    end;
    return v104.originalBeginWorkRef(v105, v106, v107);
end;
local function _(v109, v110, v111) --[[ Line: 258 ]]
    -- upvalues: v104 (copy)
    if not v104.completeWorkRef then
        v104.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
    end;
    return v104.completeWorkRef(v109, v110, v111);
end;
local v113 = nil;
local function _() --[[ Line: 272 ]] --[[ Name: initReactFiberHooks ]]
    -- upvalues: v113 (ref), v104 (copy)
    v113 = require(script.Parent["ReactFiberHooks.new"]);
    v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
    v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
    v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
end;
local function _() --[[ Line: 281 ]]
    -- upvalues: v104 (copy), v113 (ref)
    if not v104.resetHooksAfterThrowRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v104.resetHooksAfterThrowRef();
end;
local function _() --[[ Line: 289 ]]
    -- upvalues: v104 (copy), v113 (ref)
    if not v104.ContextOnlyDispatcherRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v104.ContextOnlyDispatcherRef;
end;
local function _() --[[ Line: 297 ]]
    -- upvalues: v104 (copy), v113 (ref)
    if not v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef();
end;
local l_createCapturedValue_0 = require(script.Parent.ReactCapturedValue).createCapturedValue;
local l_push_0 = v12.push;
local l_pop_0 = v12.pop;
local l_createCursor_0 = v12.createCursor;
local v122 = require(script.Parent["ReactProfilerTimer.new"]);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v124 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v125 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v125.current;
local l_resetCurrentFiber_0 = v125.resetCurrentFiber;
local l_setCurrentFiber_0 = v125.setCurrentFiber;
local l_ReactErrorUtils_0 = require(l_Parent_0.Shared).ReactErrorUtils;
local l_invokeGuardedCallback_0 = l_ReactErrorUtils_0.invokeGuardedCallback;
local l_hasCaughtError_0 = l_ReactErrorUtils_0.hasCaughtError;
local l_clearCaughtError_0 = l_ReactErrorUtils_0.clearCaughtError;
local l_onCommitRoot_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitRoot;
local l_onCommitRoot_1 = require(script.Parent.ReactTestSelectors).onCommitRoot;
local l_enqueueTask_0 = require(l_Parent_0.Shared).enqueueTask;
local l_doesFiberContain_0 = require(script.Parent.ReactFiberTreeReflection).doesFiberContain;
local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
local l_ReactCurrentOwner_0 = l_ReactSharedInternals_0.ReactCurrentOwner;
local l_IsSomeRendererActing_0 = l_ReactSharedInternals_0.IsSomeRendererActing;
local v140 = nil;
local v141 = nil;
local v142 = {};
v6.NoContext = 0;
v6.RetryAfterError = 64;
local v143 = {
    Incomplete = 0, 
    FatalErrored = 1, 
    Errored = 2, 
    Suspended = 3, 
    SuspendedWithDelay = 4, 
    Completed = 5
};
local v144 = 0;
local v145 = nil;
local v146 = nil;
local l_NoLanes_0 = v9.NoLanes;
v6.subtreeRenderLanes = v9.NoLanes;
local v148 = l_createCursor_0(v9.NoLanes);
local l_Incomplete_0 = v143.Incomplete;
local v150 = nil;
local l_NoLanes_1 = v9.NoLanes;
local v152 = require(script.Parent.ReactFiberWorkInProgress);
local l_workInProgressRootSkippedLanes_0 = v152.workInProgressRootSkippedLanes;
local l_NoLanes_2 = v9.NoLanes;
local l_NoLanes_3 = v9.NoLanes;
local v156 = nil;
local v157 = 0;
local v158 = 1e999;
local v159 = nil;
local function _() --[[ Line: 433 ]] --[[ Name: resetRenderTimer ]]
    -- upvalues: v158 (ref), l_now_0 (copy)
    v158 = l_now_0() + 500;
end;
v6.getRenderTargetTime = function() --[[ Line: 437 ]]
    -- upvalues: v158 (ref)
    return v158;
end;
local v161 = false;
local v162 = nil;
local v163 = nil;
local v164 = false;
local v165 = nil;
local l_l_NoPriority_0_0 = l_NoPriority_0;
local l_NoLanes_4 = v9.NoLanes;
local v168 = nil;
local v169 = 0;
local v170 = nil;
local v171 = 0;
local v172 = nil;
local l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
local l_NoLanes_5 = v9.NoLanes;
local l_NoLanes_6 = v9.NoLanes;
local v176 = nil;
local v177 = false;
v6.getWorkInProgressRoot = function() --[[ Line: 477 ]]
    -- upvalues: v145 (ref)
    return v145;
end;
v6.requestEventTime = function() --[[ Line: 481 ]]
    -- upvalues: v144 (ref), l_now_0 (copy), l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy)
    if bit32.band(v144, 48) ~= 0 then
        return l_now_0();
    elseif l_l_NoTimestamp_0_0 ~= l_NoTimestamp_0 then
        return l_l_NoTimestamp_0_0;
    else
        l_l_NoTimestamp_0_0 = l_now_0();
        return l_l_NoTimestamp_0_0;
    end;
end;
v6.requestUpdateLane = function(v178) --[[ Line: 503 ]]
    -- upvalues: v45 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_ReactFeatureFlags_0 (copy), v144 (ref), l_NoLanes_0 (ref), v9 (copy), l_pickArbitraryLane_0 (copy), l_NoLanes_5 (ref), l_NoLanes_1 (ref), v77 (copy), l_NoLanes_6 (ref), v156 (ref), l_findTransitionLane_0 (copy), l_UserBlockingPriority_0 (copy), l_findUpdateLane_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l___DEV___0 (copy), l_console_0 (copy)
    local l_mode_0 = v178.mode;
    if bit32.band(l_mode_0, v45.BlockingMode) == v45.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_0, v45.ConcurrentMode) == v45.NoMode then
        if l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 then
            return l_SyncLane_0;
        else
            return l_SyncBatchedLane_0;
        end;
    elseif not l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch and bit32.band(v144, 16) ~= 0 and l_NoLanes_0 ~= v9.NoLanes then
        return l_pickArbitraryLane_0(l_NoLanes_0);
    else
        if l_NoLanes_5 == v9.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        if v77.requestCurrentTransition() ~= v77.NoTransition then
            if l_NoLanes_6 ~= v9.NoLanes then
                if v156 ~= nil then
                    l_NoLanes_6 = v156.pendingLanes;
                else
                    l_NoLanes_6 = v9.NoLanes;
                end;
            end;
            return l_findTransitionLane_0(l_NoLanes_5, l_NoLanes_6);
        else
            local v180 = l_getCurrentPriorityLevel_0();
            local _ = nil;
            if bit32.band(v144, 4) ~= 0 and v180 == l_UserBlockingPriority_0 then
                return (l_findUpdateLane_0(v9.InputDiscreteLanePriority, l_NoLanes_5));
            else
                local v182 = l_schedulerPriorityToLanePriority_0(v180);
                if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                    local v183 = l_getCurrentUpdateLanePriority_0();
                    if v182 ~= v183 and v183 ~= v9.NoLanePriority and l___DEV___0 then
                        l_console_0.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(v182), (tostring(v183)));
                    end;
                end;
                return (l_findUpdateLane_0(v182, l_NoLanes_5));
            end;
        end;
    end;
end;
requestRetryLane = function(v184) --[[ Line: 607 ]] --[[ Name: requestRetryLane ]]
    -- upvalues: v45 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_NoLanes_5 (ref), v9 (copy), l_NoLanes_1 (ref), l_findRetryLane_0 (copy)
    local l_mode_1 = v184.mode;
    if bit32.band(l_mode_1, v45.BlockingMode) == v45.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_1, v45.ConcurrentMode) == v45.NoMode then
        if l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 then
            return l_SyncLane_0;
        else
            return l_SyncBatchedLane_0;
        end;
    else
        if l_NoLanes_5 == v9.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        return l_findRetryLane_0(l_NoLanes_5);
    end;
end;
v6.scheduleUpdateOnFiber = function(v186, v187, v188) --[[ Line: 629 ]]
    -- upvalues: v142 (copy), l_markRootUpdated_0 (copy), v145 (ref), l_ReactFeatureFlags_0 (copy), v144 (ref), l_NoLanes_2 (ref), l_mergeLanes_0 (copy), l_Incomplete_0 (ref), v143 (copy), l_NoLanes_0 (ref), l_getCurrentPriorityLevel_0 (copy), l_SyncLane_0 (copy), v103 (ref), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy), l_UserBlockingPriority_0 (copy), l_ImmediatePriority_0 (copy), v168 (ref), l_Set_0 (copy), v156 (ref)
    v142.checkForNestedUpdates();
    local v189 = v142.markUpdateLaneFromFiberToRoot(v186, v187);
    if v189 == nil then
        return nil;
    else
        l_markRootUpdated_0(v189, v187, v188);
        if v189 == v145 then
            v142.warnAboutRenderPhaseUpdatesInDEV(v186);
            if l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch or bit32.band(v144, 16) == 0 then
                l_NoLanes_2 = l_mergeLanes_0(l_NoLanes_2, v187);
            end;
            if l_Incomplete_0 == v143.SuspendedWithDelay then
                v142.markRootSuspended(v189, l_NoLanes_0);
            end;
        end;
        local v190 = l_getCurrentPriorityLevel_0();
        if v187 == l_SyncLane_0 then
            if bit32.band(v144, 8) ~= 0 and bit32.band(v144, 48) == 0 then
                v142.schedulePendingInteractions(v189, v187);
                v142.performSyncWorkOnRoot(v189);
            else
                v103(v189, v188);
                v142.schedulePendingInteractions(v189, v187);
                if v144 == 0 then
                    v158 = l_now_0() + 500;
                    l_flushSyncCallbackQueue_0();
                end;
            end;
        else
            if bit32.band(v144, 4) ~= 0 and (v190 == l_UserBlockingPriority_0 or v190 == l_ImmediatePriority_0) then
                if v168 == nil then
                    v168 = l_Set_0.new({
                        v189
                    });
                else
                    v168:add(v189);
                end;
            end;
            v103(v189, v188);
            v142.schedulePendingInteractions(v189, v187);
        end;
        v156 = v189;
        return v189;
    end;
end;
v142.markUpdateLaneFromFiberToRoot = function(v191, v192) --[[ Line: 739 ]]
    -- upvalues: l_mergeLanes_0 (copy), l___DEV___0 (copy), v48 (copy), v142 (copy), v46 (copy)
    v191.lanes = l_mergeLanes_0(v191.lanes, v192);
    local l_alternate_0 = v191.alternate;
    if l_alternate_0 ~= nil then
        l_alternate_0.lanes = l_mergeLanes_0(l_alternate_0.lanes, v192);
    end;
    if l___DEV___0 and l_alternate_0 == nil and bit32.band(v191.flags, (bit32.bor(v48.Placement, v48.Hydrating))) ~= v48.NoFlags then
        v142.warnAboutUpdateOnNotYetMountedFiberInDEV(v191);
    end;
    local l_v191_0 = v191;
    local l_return__0 = v191.return_;
    while l_return__0 ~= nil do
        l_return__0.childLanes = l_mergeLanes_0(l_return__0.childLanes, v192);
        l_alternate_0 = l_return__0.alternate;
        if l_alternate_0 ~= nil then
            l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v192);
        elseif l___DEV___0 and bit32.band(l_return__0.flags, (bit32.bor(v48.Placement, v48.Hydrating))) ~= v48.NoFlags then
            v142.warnAboutUpdateOnNotYetMountedFiberInDEV(v191);
        end;
        l_v191_0 = l_return__0;
        l_return__0 = l_return__0.return_;
    end;
    if l_v191_0.tag == v46.HostRoot then
        return l_v191_0.stateNode;
    else
        return nil;
    end;
end;
v103 = function(v196, v197) --[[ Line: 794 ]]
    -- upvalues: l_markStarvedLanesAsExpired_0 (copy), v145 (ref), l_NoLanes_0 (ref), v9 (copy), l_getNextLanes_0 (copy), l_returnNextLanesPriority_0 (copy), l_cancelCallback_0 (copy), l_scheduleSyncCallback_0 (copy), v102 (copy), v142 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy), l_lanePriorityToSchedulerPriority_0 (copy)
    local l_callbackNode_0 = v196.callbackNode;
    l_markStarvedLanesAsExpired_0(v196, v197);
    local v199 = nil;
    v199 = if v196 == v145 then l_NoLanes_0 else v9.NoLanes;
    local v200 = l_getNextLanes_0(v196, v199);
    local v201 = l_returnNextLanesPriority_0();
    if v200 == v9.NoLanes then
        if l_callbackNode_0 ~= nil then
            l_cancelCallback_0(l_callbackNode_0);
            v196.callbackNode = nil;
            v196.callbackPriority = v9.NoLanePriority;
        end;
        return;
    else
        if l_callbackNode_0 ~= nil then
            if v196.callbackPriority == v201 then
                return;
            else
                l_cancelCallback_0(l_callbackNode_0);
            end;
        end;
        local v202 = nil;
        if v201 == v9.SyncLanePriority then
            v202 = l_scheduleSyncCallback_0(function() --[[ Line: 839 ]]
                -- upvalues: v102 (ref), v196 (copy), v142 (ref)
                local v203 = v102.profileRootBeforeUnitOfWork(v196);
                local v204 = v142.performSyncWorkOnRoot(v196);
                v102.profileRootAfterYielding(v203);
                return v204;
            end);
        elseif v201 == v9.SyncBatchedLanePriority then
            v202 = l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 847 ]]
                -- upvalues: v102 (ref), v196 (copy), v142 (ref)
                local v205 = v102.profileRootBeforeUnitOfWork(v196);
                local v206 = v142.performSyncWorkOnRoot(v196);
                v102.profileRootAfterYielding(v205);
                return v206;
            end);
        else
            local v207 = l_lanePriorityToSchedulerPriority_0(v201);
            v202 = l_scheduleCallback_0(v207, function() --[[ Line: 857 ]]
                -- upvalues: v102 (ref), v196 (copy), v142 (ref)
                local v208 = v102.profileRootBeforeUnitOfWork(v196);
                local v209 = v142.performConcurrentWorkOnRoot(v196);
                v102.profileRootAfterYielding(v208);
                return v209;
            end);
        end;
        v196.callbackPriority = v201;
        v196.callbackNode = v202;
        return;
    end;
end;
v142.performConcurrentWorkOnRoot = function(v210) --[[ Line: 873 ]]
    -- upvalues: l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy), l_NoLanes_5 (ref), v9 (copy), l_NoLanes_6 (ref), l_invariant_0 (copy), v144 (ref), v6 (copy), l_getNextLanes_0 (copy), v145 (ref), l_NoLanes_0 (ref), v142 (copy), l_includesSomeLane_0 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), v143 (copy), v43 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v150 (ref), v103 (ref), l_now_0 (copy), v102 (copy)
    l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
    l_NoLanes_5 = v9.NoLanes;
    l_NoLanes_6 = v9.NoLanes;
    l_invariant_0(bit32.band(v144, 48) == 0, "Should not already be working.");
    local l_callbackNode_1 = v210.callbackNode;
    if v6.flushPassiveEffects() and v210.callbackNode ~= l_callbackNode_1 then
        return nil;
    else
        local v212 = l_getNextLanes_0(v210, if v210 == v145 then l_NoLanes_0 else v9.NoLanes);
        if v212 == v9.NoLanes then
            return nil;
        else
            local v213 = v142.renderRootConcurrent(v210, v212);
            if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
                v142.prepareFreshStack(v210, v9.NoLanes);
            elseif v213 ~= v143.Incomplete then
                if v213 == v143.Errored then
                    v144 = bit32.bor(v144, 64);
                    if v210.hydrate then
                        v210.hydrate = false;
                        v43.clearContainer(v210.containerInfo);
                    end;
                    v212 = l_getLanesToRetrySynchronouslyOnError_0(v210);
                    if v212 ~= v9.NoLanes then
                        v213 = v142.renderRootSync(v210, v212);
                    end;
                end;
                if v213 == v143.FatalErrored then
                    local l_v150_0 = v150;
                    v142.prepareFreshStack(v210, v9.NoLanes);
                    v142.markRootSuspended(v210, v212);
                    v103(v210, l_now_0());
                    error(l_v150_0);
                end;
                v210.finishedWork = v210.current.alternate;
                v210.finishedLanes = v212;
                v142.finishConcurrentRender(v210, v213, v212);
            end;
            v103(v210, l_now_0());
            if v210.callbackNode == l_callbackNode_1 then
                return function() --[[ Line: 968 ]]
                    -- upvalues: v102 (ref), v210 (copy), v142 (ref)
                    local v215 = v102.profileRootBeforeUnitOfWork(v210);
                    local v216 = v142.performConcurrentWorkOnRoot(v210);
                    v102.profileRootAfterYielding(v215);
                    return v216;
                end;
            else
                return nil;
            end;
        end;
    end;
end;
local v217 = 0;
local v218 = false;
shouldForceFlushFallbacksInDEV = function() --[[ Line: 985 ]] --[[ Name: shouldForceFlushFallbacksInDEV ]]
    -- upvalues: l___DEV___0 (copy), v217 (ref)
    return l___DEV___0 and v217 > 0;
end;
v142.finishConcurrentRender = function(v219, v220, v221) --[[ Line: 990 ]]
    -- upvalues: v143 (copy), l_invariant_0 (copy), v142 (copy), l_includesOnlyRetries_0 (copy), v157 (ref), l_now_0 (copy), l_getNextLanes_0 (copy), v9 (copy), l_isSubsetOfLanes_0 (copy), v6 (copy), l_markRootPinged_0 (copy), v43 (copy), l_includesOnlyTransitions_0 (copy)
    if v220 == v143.Incomplete or v220 == v143.FatalErrored then
        l_invariant_0(false, "Root did not complete. This is a bug in React.");
        return;
    elseif v220 == v143.Errored then
        v142.commitRoot(v219);
        return;
    elseif v220 == v143.Suspended then
        v142.markRootSuspended(v219, v221);
        if l_includesOnlyRetries_0(v221) and not shouldForceFlushFallbacksInDEV() then
            local v222 = v157 + 500 - l_now_0();
            if v222 > 10 then
                if l_getNextLanes_0(v219, v9.NoLanes) ~= v9.NoLanes then
                    return;
                else
                    local l_suspendedLanes_0 = v219.suspendedLanes;
                    if not l_isSubsetOfLanes_0(l_suspendedLanes_0, v221) then
                        local v224 = v6.requestEventTime();
                        l_markRootPinged_0(v219, l_suspendedLanes_0, v224);
                        return;
                    else
                        v219.timeoutHandle = v43.scheduleTimeout(function() --[[ Line: 1039 ]]
                            -- upvalues: v142 (ref), v219 (copy)
                            return v142.commitRoot(v219);
                        end, v222);
                        return;
                    end;
                end;
            end;
        end;
        v142.commitRoot(v219);
        return;
    elseif v220 == v143.SuspendedWithDelay then
        v142.markRootSuspended(v219, v221);
        if l_includesOnlyTransitions_0(v221) then
            return;
        else
            if not shouldForceFlushFallbacksInDEV() then
                local v225 = v9.getMostRecentEventTime(v219, v221);
                local v226 = l_now_0() - v225;
                local v227 = jnd(v226) - v226;
                if v227 > 10 then
                    v219.timeoutHandle = v43.scheduleTimeout(function() --[[ Line: 1074 ]]
                        -- upvalues: v142 (ref), v219 (copy)
                        return v142.commitRoot(v219);
                    end, v227);
                    return;
                end;
            end;
            v142.commitRoot(v219);
            return;
        end;
    elseif v220 == v143.Completed then
        v142.commitRoot(v219);
        return;
    else
        l_invariant_0(false, "Unknown root exit status.");
        return;
    end;
end;
v142.markRootSuspended = function(v228, v229) --[[ Line: 1090 ]]
    -- upvalues: l_removeLanes_0 (copy), l_NoLanes_3 (ref), l_NoLanes_2 (ref), v9 (copy)
    v229 = l_removeLanes_0(v229, l_NoLanes_3);
    v229 = l_removeLanes_0(v229, l_NoLanes_2);
    v9.markRootSuspended(v228, v229);
end;
v142.performSyncWorkOnRoot = function(v230) --[[ Line: 1102 ]]
    -- upvalues: l_invariant_0 (copy), v144 (ref), v6 (copy), v145 (ref), l_includesSomeLane_0 (copy), l_NoLanes_0 (ref), v142 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), l_getNextLanes_0 (copy), v9 (copy), l_LegacyRoot_0 (copy), v143 (copy), v43 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v150 (ref), v103 (ref), l_now_0 (copy)
    l_invariant_0(bit32.band(v144, 48) == 0, "Should not already be working.");
    v6.flushPassiveEffects();
    local v231 = nil;
    local v232 = nil;
    if v230 == v145 and l_includesSomeLane_0(v230.expiredLanes, l_NoLanes_0) then
        v231 = l_NoLanes_0;
        v232 = v142.renderRootSync(v230, v231);
        if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
            v231 = l_getNextLanes_0(v230, v231);
            v232 = v142.renderRootSync(v230, v231);
        end;
    else
        v231 = l_getNextLanes_0(v230, v9.NoLanes);
        v232 = v142.renderRootSync(v230, v231);
    end;
    if v230.tag ~= l_LegacyRoot_0 and v232 == v143.Errored then
        v144 = bit32.bor(v144, 64);
        if v230.hydrate then
            v230.hydrate = false;
            v43.clearContainer(v230.containerInfo);
        end;
        v231 = l_getLanesToRetrySynchronouslyOnError_0(v230);
        if v231 ~= v9.NoLanes then
            v232 = v142.renderRootSync(v230, v231);
        end;
    end;
    if v232 == v143.FatalErrored then
        local l_v150_1 = v150;
        v142.prepareFreshStack(v230, v9.NoLanes);
        v142.markRootSuspended(v230, v231);
        v103(v230, l_now_0());
        error(l_v150_1);
    end;
    v230.finishedWork = v230.current.alternate;
    v230.finishedLanes = v231;
    v142.commitRoot(v230);
    v103(v230, l_now_0());
    return nil;
end;
v6.flushRoot = function(v234, v235) --[[ Line: 1184 ]]
    -- upvalues: l_markRootExpired_0 (copy), v103 (ref), l_now_0 (copy), v144 (ref), v158 (ref), l_flushSyncCallbackQueue_0 (copy)
    l_markRootExpired_0(v234, v235);
    v103(v234, l_now_0());
    if bit32.band(v144, 48) == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
end;
v6.getExecutionContext = function() --[[ Line: 1196 ]]
    -- upvalues: v144 (ref)
    return v144;
end;
v6.flushDiscreteUpdates = function() --[[ Line: 1200 ]]
    -- upvalues: v144 (ref), l___DEV___0 (copy), l_console_0 (copy), v142 (copy), v6 (copy)
    if bit32.band(v144, 49) ~= 0 then
        if l___DEV___0 and bit32.band(v144, 16) ~= 0 then
            l_console_0.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is already rendering.");
        end;
        return;
    else
        v142.flushPendingDiscreteUpdates();
        v6.flushPassiveEffects();
        return;
    end;
end;
v6.deferredUpdates = function(v236) --[[ Line: 1230 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l___YOLO___0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v9 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_NormalPriority_0 (copy)
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v237 = l_getCurrentUpdateLanePriority_0();
        local v238 = nil;
        local v239 = nil;
        if not l___YOLO___0 then
            l_setCurrentUpdateLanePriority_0(v9.DefaultLanePriority);
            local v240, v241 = xpcall(l_runWithPriority_0, l_describeError_0, l_NormalPriority_0, v236);
            v238 = v240;
            v239 = v241;
        else
            v238 = true;
            l_setCurrentUpdateLanePriority_0(v9.DefaultLanePriority);
            v239 = l_runWithPriority_0(l_NormalPriority_0, v236);
        end;
        l_setCurrentUpdateLanePriority_0(v237);
        if v238 then
            return v239;
        else
            error(v239);
            return;
        end;
    else
        return l_runWithPriority_0(l_NormalPriority_0, v236);
    end;
end;
v142.flushPendingDiscreteUpdates = function() --[[ Line: 1259 ]]
    -- upvalues: v168 (ref), l_markDiscreteUpdatesExpired_0 (copy), v103 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    if v168 ~= nil then
        local l_v168_0 = v168;
        v168 = nil;
        l_v168_0:forEach(function(v243) --[[ Line: 1265 ]]
            -- upvalues: l_markDiscreteUpdatesExpired_0 (ref), v103 (ref), l_now_0 (ref)
            l_markDiscreteUpdatesExpired_0(v243);
            v103(v243, l_now_0());
        end);
    end;
    l_flushSyncCallbackQueue_0();
end;
v6.batchedUpdates = function(v244, v245) --[[ Line: 1274 ]]
    -- upvalues: v144 (ref), l___YOLO___0 (copy), l_describeError_0 (copy), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_0 = v144;
    v144 = bit32.bor(v144, 1);
    local v247 = nil;
    local v248 = nil;
    if not l___YOLO___0 then
        local v249, v250 = xpcall(v244, l_describeError_0, v245);
        v247 = v249;
        v248 = v250;
    else
        v247 = true;
        v248 = v244(v245);
    end;
    v144 = l_v144_0;
    if v144 == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v247 then
        return v248;
    else
        error(v248);
        return;
    end;
end;
v6.batchedEventUpdates = function(v251, v252) --[[ Line: 1302 ]]
    -- upvalues: v144 (ref), l___YOLO___0 (copy), l_describeError_0 (copy), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_1 = v144;
    v144 = bit32.bor(v144, 2);
    local v254 = nil;
    local v255 = nil;
    if not l___YOLO___0 then
        local v256, v257 = xpcall(v251, l_describeError_0, v252);
        v254 = v256;
        v255 = v257;
    else
        v254 = true;
        v255 = v251(v252);
    end;
    v144 = l_v144_1;
    if v144 == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v254 then
        return v255;
    else
        error(v255);
        return;
    end;
end;
v6.discreteUpdates = function(v258, v259, v260, v261, v262) --[[ Line: 1330 ]]
    -- upvalues: v144 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v9 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_UserBlockingPriority_0 (copy), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_2 = v144;
    v144 = bit32.bor(v144, 4);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v264 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v9.InputDiscreteLanePriority);
        local v265, v266 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function() --[[ Line: 1342 ]]
            -- upvalues: v258 (copy), v259 (copy), v260 (copy), v261 (copy), v262 (copy)
            return v258(v259, v260, v261, v262);
        end);
        l_setCurrentUpdateLanePriority_0(v264);
        v144 = l_v144_2;
        if v144 == 0 then
            v158 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if v265 then
            return v266;
        else
            error(v266);
            return;
        end;
    else
        local v267, v268 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function() --[[ Line: 1366 ]]
            -- upvalues: v258 (copy), v259 (copy), v260 (copy), v261 (copy), v262 (copy)
            return v258(v259, v260, v261, v262);
        end);
        v144 = l_v144_2;
        if v144 == 0 then
            v158 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if v267 then
            return v268;
        else
            error(v268);
            return;
        end;
    end;
end;
v6.unbatchedUpdates = function(v269, v270) --[[ Line: 1387 ]]
    -- upvalues: v144 (ref), l___YOLO___0 (copy), l_describeError_0 (copy), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_3 = v144;
    v144 = bit32.band(v144, 4294967294);
    v144 = bit32.bor(v144, 8);
    local v272 = nil;
    local v273 = nil;
    if not l___YOLO___0 then
        local v274, v275 = xpcall(v269, l_describeError_0, v270);
        v272 = v274;
        v273 = v275;
    else
        v272 = true;
        v273 = v269(v270);
    end;
    v144 = l_v144_3;
    if v144 == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v272 then
        return v273;
    else
        error(v273);
        return;
    end;
end;
v6.flushSync = function(v276, v277) --[[ Line: 1415 ]]
    -- upvalues: v144 (ref), l___DEV___0 (copy), l_console_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v9 (copy), l___YOLO___0 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_4 = v144;
    if bit32.band(l_v144_4, 48) ~= 0 then
        if l___DEV___0 then
            l_console_0.error("flushSync was called from inside a lifecycle method. React cannot flush when React is already rendering. Consider moving this call to a scheduler task or micro task.");
        end;
        return v276(v277);
    else
        v144 = bit32.bor(v144, 1);
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v279 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(v9.SyncLanePriority);
            local v280 = nil;
            local v281 = nil;
            if not l___YOLO___0 then
                if v276 then
                    local v282, v283 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 1445 ]]
                        -- upvalues: v276 (copy), v277 (copy)
                        return v276(v277);
                    end);
                    v280 = v282;
                    v281 = v283;
                else
                    v280 = true;
                    v281 = nil;
                end;
            else
                v280 = true;
                l_setCurrentUpdateLanePriority_0(v9.SyncLanePriority);
                v281 = if v276 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1458 ]]
                    -- upvalues: v276 (copy), v277 (copy)
                    return v276(v277);
                end) else nil;
            end;
            l_setCurrentUpdateLanePriority_0(v279);
            v144 = l_v144_4;
            l_flushSyncCallbackQueue_0();
            if not v280 then
                error(v281);
            end;
            return v281;
        else
            local v284 = nil;
            local v285 = nil;
            if not l___YOLO___0 then
                if v276 then
                    local v286, v287 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 1488 ]]
                        -- upvalues: v276 (copy), v277 (copy)
                        return v276(v277);
                    end);
                    v284 = v286;
                    v285 = v287;
                else
                    v284 = true;
                    v285 = nil;
                end;
            else
                v284 = true;
                v285 = if v276 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1500 ]]
                    -- upvalues: v276 (copy), v277 (copy)
                    return v276(v277);
                end) else nil;
            end;
            v144 = l_v144_4;
            l_flushSyncCallbackQueue_0();
            if not v284 then
                error(v285);
            end;
            return v285;
        end;
    end;
end;
v6.flushControlled = function(v288) --[[ Line: 1521 ]]
    -- upvalues: v144 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v9 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_5 = v144;
    v144 = bit32.bor(v144, 1);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v290 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v9.SyncLanePriority);
        local v291, v292 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v288);
        l_setCurrentUpdateLanePriority_0(v290);
        v144 = l_v144_5;
        if v144 == 0 then
            v158 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v291 then
            error(v292);
            return;
        end;
    else
        local v293, v294 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v288);
        v144 = l_v144_5;
        if v144 == 0 then
            v158 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v293 then
            error(v294);
        end;
    end;
end;
v6.pushRenderLanes = function(v295, v296) --[[ Line: 1561 ]]
    -- upvalues: l_push_0 (copy), v148 (copy), v6 (copy), l_mergeLanes_0 (copy), l_NoLanes_1 (ref)
    l_push_0(v148, v6.subtreeRenderLanes, v295);
    v6.subtreeRenderLanes = l_mergeLanes_0(v6.subtreeRenderLanes, v296);
    l_NoLanes_1 = l_mergeLanes_0(l_NoLanes_1, v296);
end;
v6.popRenderLanes = function(v297) --[[ Line: 1567 ]]
    -- upvalues: v6 (copy), v148 (copy), l_pop_0 (copy)
    v6.subtreeRenderLanes = v148.current;
    l_pop_0(v148, v297);
end;
v142.prepareFreshStack = function(v298, v299) --[[ Line: 1572 ]]
    -- upvalues: v9 (copy), v43 (copy), v146 (ref), l_unwindInterruptedWork_0 (copy), v145 (ref), v44 (copy), l_NoLanes_0 (ref), v6 (copy), l_NoLanes_1 (ref), l_Incomplete_0 (ref), v143 (copy), v150 (ref), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), l_NoLanes_3 (ref), l_ReactFeatureFlags_0 (copy), v172 (ref), l___DEV___0 (copy), v124 (copy)
    v298.finishedWork = nil;
    v298.finishedLanes = v9.NoLanes;
    local l_timeoutHandle_0 = v298.timeoutHandle;
    if l_timeoutHandle_0 ~= v43.noTimeout then
        v298.timeoutHandle = v43.noTimeout;
        v43.cancelTimeout(l_timeoutHandle_0);
    end;
    if v146 ~= nil then
        local l_return__1 = v146.return_;
        while l_return__1 ~= nil do
            l_unwindInterruptedWork_0(l_return__1);
            l_return__1 = l_return__1.return_;
        end;
    end;
    v145 = v298;
    v146 = v44.createWorkInProgress(v298.current, nil);
    l_NoLanes_0 = v299;
    v6.subtreeRenderLanes = v299;
    l_NoLanes_1 = v299;
    l_Incomplete_0 = v143.Incomplete;
    v150 = nil;
    l_workInProgressRootSkippedLanes_0(v9.NoLanes);
    l_NoLanes_2 = v9.NoLanes;
    l_NoLanes_3 = v9.NoLanes;
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v172 = nil;
    end;
    if l___DEV___0 then
        v124.discardPendingWarnings();
    end;
end;
v142.handleError = function(v302, v303) --[[ Line: 1612 ]]
    -- upvalues: v146 (ref), l_resetContextDependencies_0 (copy), v104 (copy), v113 (ref), l_resetCurrentFiber_0 (copy), l_ReactCurrentOwner_0 (copy), l_Incomplete_0 (ref), v143 (copy), v150 (ref), l_ReactFeatureFlags_0 (copy), v45 (copy), v122 (copy), l_throwException_0 (copy), l_NoLanes_0 (ref), v6 (copy), v142 (copy)
    while true do
        local l_v146_0 = v146;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 1616 ]]
            -- upvalues: l_resetContextDependencies_0 (ref), v104 (ref), v113 (ref), l_resetCurrentFiber_0 (ref), l_ReactCurrentOwner_0 (ref), l_v146_0 (ref), l_Incomplete_0 (ref), v143 (ref), v150 (ref), v303 (ref), v146 (ref), l_ReactFeatureFlags_0 (ref), v45 (ref), v122 (ref), l_throwException_0 (ref), v302 (copy), l_NoLanes_0 (ref), v6 (ref), v142 (ref)
            l_resetContextDependencies_0();
            if not v104.resetHooksAfterThrowRef then
                v113 = require(script.Parent["ReactFiberHooks.new"]);
                v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
                v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
                v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local _ = v104.resetHooksAfterThrowRef();
            l_resetCurrentFiber_0();
            l_ReactCurrentOwner_0.current = nil;
            if l_v146_0 == nil or l_v146_0.return_ == nil then
                l_Incomplete_0 = v143.FatalErrored;
                v150 = v303;
                v146 = nil;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v146_0.mode, v45.ProfileMode) ~= 0 then
                    v122.stopProfilerTimerIfRunningAndRecordDelta(l_v146_0, true);
                end;
                l_throwException_0(v302, l_v146_0.return_, l_v146_0, v303, l_NoLanes_0, v6.onUncaughtError, v6.renderDidError);
                v142.completeUnitOfWork(l_v146_0);
                return;
            end;
        end);
        if not l_status_0 then
            v303 = l_result_0;
            if v146 == l_v146_0 and l_v146_0 ~= nil then
                l_v146_0 = l_v146_0.return_;
                v146 = l_v146_0;
            else
                l_v146_0 = v146;
            end;
            --[[ close >= 2 ]]
        else
            break;
        end;
    end;
end;
v142.pushDispatcher = function() --[[ Line: 1691 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v104 (copy), v113 (ref)
    local l_current_1 = l_ReactCurrentDispatcher_0.current;
    local l_l_ReactCurrentDispatcher_0_0 = l_ReactCurrentDispatcher_0;
    if not v104.ContextOnlyDispatcherRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    l_l_ReactCurrentDispatcher_0_0.current = v104.ContextOnlyDispatcherRef;
    if l_current_1 == nil then
        if not v104.ContextOnlyDispatcherRef then
            v113 = require(script.Parent["ReactFiberHooks.new"]);
            v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
            v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
            v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        return v104.ContextOnlyDispatcherRef;
    else
        return l_current_1;
    end;
end;
v142.popDispatcher = function(v310) --[[ Line: 1708 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy)
    l_ReactCurrentDispatcher_0.current = v310;
end;
v142.pushInteractions = function(v311) --[[ Line: 1712 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        local l_current_2 = l___interactionsRef_0.current;
        l___interactionsRef_0.current = v311.memoizedInteractions;
        return l_current_2;
    else
        return nil;
    end;
end;
v142.popInteractions = function(v313) --[[ Line: 1721 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        l___interactionsRef_0.current = v313;
    end;
end;
v6.markCommitTimeOfFallback = function() --[[ Line: 1727 ]]
    -- upvalues: v157 (ref), l_now_0 (copy)
    v157 = l_now_0();
end;
v6.markSkippedUpdateLanes = function(v314) --[[ Line: 1731 ]]
    -- upvalues: v152 (copy)
    v152.markSkippedUpdateLanes(v314);
end;
v6.renderDidSuspend = function() --[[ Line: 1735 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy)
    if l_Incomplete_0 == v143.Incomplete then
        l_Incomplete_0 = v143.Suspended;
    end;
end;
v6.renderDidSuspendDelayIfPossible = function() --[[ Line: 1741 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy), v145 (ref), l_includesNonIdleWork_0 (copy), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), v142 (copy), l_NoLanes_0 (ref)
    if l_Incomplete_0 == v143.Incomplete or l_Incomplete_0 == v143.Suspended then
        l_Incomplete_0 = v143.SuspendedWithDelay;
    end;
    if v145 ~= nil and (l_includesNonIdleWork_0(l_workInProgressRootSkippedLanes_0()) or l_includesNonIdleWork_0(l_NoLanes_2)) then
        v142.markRootSuspended(v145, l_NoLanes_0);
    end;
end;
v6.renderDidError = function() --[[ Line: 1769 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy)
    if l_Incomplete_0 ~= v143.Completed then
        l_Incomplete_0 = v143.Errored;
    end;
end;
v6.renderHasNotSuspendedYet = function() --[[ Line: 1777 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy)
    return l_Incomplete_0 == v143.Incomplete;
end;
v142.renderRootSync = function(v315, v316) --[[ Line: 1783 ]]
    -- upvalues: v144 (ref), v142 (copy), v145 (ref), l_NoLanes_0 (ref), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v38 (copy), l_enableSchedulingProfiler_0 (copy), v39 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), l_ReactFeatureFlags_0 (copy), v146 (ref), l_invariant_0 (copy), v9 (copy), l_Incomplete_0 (ref)
    local l_v144_6 = v144;
    v144 = bit32.bor(v144, 16);
    local v318 = v142.pushDispatcher();
    if v145 ~= v315 or l_NoLanes_0 ~= v316 then
        v142.prepareFreshStack(v315, v316);
        v142.startWorkOnPendingInteractions(v315, v316);
    end;
    local v319 = v142.pushInteractions(v315);
    if l___DEV___0 and l_enableDebugTracing_0 then
        v38.logRenderStarted(v316);
    end;
    if l_enableSchedulingProfiler_0 then
        v39.markRenderStarted(v316);
    end;
    while true do
        local v320 = nil;
        local v321 = nil;
        if not l___YOLO___0 then
            local v322, v323 = xpcall(v142.workLoopSync, l_describeError_0);
            v320 = v322;
            v321 = v323;
        else
            v320 = true;
            v142.workLoopSync();
        end;
        if not v320 then
            v142.handleError(v315, v321);
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v142.popInteractions(v319);
    end;
    v144 = l_v144_6;
    v142.popDispatcher(v318);
    if v146 ~= nil then
        l_invariant_0(false, "Cannot commit an incomplete root. This error is likely caused by a bug in React. Please file an issue.");
    end;
    if l___DEV___0 and l_enableDebugTracing_0 then
        v38.logRenderStopped();
    end;
    if l_enableSchedulingProfiler_0 then
        v39.markRenderStopped();
    end;
    v145 = nil;
    l_NoLanes_0 = v9.NoLanes;
    return l_Incomplete_0;
end;
v142.workLoopSync = function() --[[ Line: 1859 ]]
    -- upvalues: v146 (ref), v142 (copy)
    while v146 ~= nil do
        v142.performUnitOfWork(v146);
    end;
end;
v142.renderRootConcurrent = function(v324, v325) --[[ Line: 1866 ]]
    -- upvalues: v144 (ref), v142 (copy), v145 (ref), l_NoLanes_0 (ref), v158 (ref), l_now_0 (copy), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v38 (copy), l_enableSchedulingProfiler_0 (copy), v39 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), l_ReactFeatureFlags_0 (copy), v146 (ref), v143 (copy), v9 (copy), l_Incomplete_0 (ref)
    local l_v144_7 = v144;
    v144 = bit32.bor(v144, 16);
    local v327 = v142.pushDispatcher();
    if v145 ~= v324 or l_NoLanes_0 ~= v325 then
        v158 = l_now_0() + 500;
        v142.prepareFreshStack(v324, v325);
        v142.startWorkOnPendingInteractions(v324, v325);
    end;
    local v328 = v142.pushInteractions(v324);
    if l___DEV___0 and l_enableDebugTracing_0 then
        v38.logRenderStarted(v325);
    end;
    if l_enableSchedulingProfiler_0 then
        v39.markRenderStarted(v325);
    end;
    while true do
        local v329 = nil;
        local v330 = nil;
        if not l___YOLO___0 then
            local v331, v332 = xpcall(v142.workLoopConcurrent, l_describeError_0);
            v329 = v331;
            v330 = v332;
            if v329 then
                v330 = "break";
            end;
        else
            v329 = true;
            v330 = "break";
            v142.workLoopConcurrent();
        end;
        if v330 ~= "break" then
            if not v329 then
                v142.handleError(v324, v330);
            end;
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v142.popInteractions(v328);
    end;
    v142.popDispatcher(v327);
    v144 = l_v144_7;
    if l___DEV___0 and l_enableDebugTracing_0 then
        v38.logRenderStopped();
    end;
    if v146 ~= nil then
        if l_enableSchedulingProfiler_0 then
            v39.markRenderYielded();
        end;
        return v143.Incomplete;
    else
        if l_enableSchedulingProfiler_0 then
            v39.markRenderStopped();
        end;
        v145 = nil;
        l_NoLanes_0 = v9.NoLanes;
        return l_Incomplete_0;
    end;
end;
v142.workLoopConcurrent = function() --[[ Line: 1950 ]]
    -- upvalues: v146 (ref), l_shouldYield_0 (copy), v142 (copy)
    while v146 ~= nil and not l_shouldYield_0() do
        v142.performUnitOfWork(v146);
    end;
end;
v142.performUnitOfWork = function(v333) --[[ Line: 1957 ]]
    -- upvalues: v102 (copy), l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v45 (copy), v122 (copy), v142 (copy), v6 (copy), l_resetCurrentFiber_0 (copy), v146 (ref), l_ReactCurrentOwner_0 (copy)
    local v334 = v102.profileUnitOfWorkBefore(v333);
    local l_alternate_1 = v333.alternate;
    l_setCurrentFiber_0(v333);
    local v336 = nil;
    if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v333.mode, v45.ProfileMode) ~= v45.NoMode then
        v122.startProfilerTimer(v333);
        v336 = v142.beginWork(l_alternate_1, v333, v6.subtreeRenderLanes);
        v122.stopProfilerTimerIfRunningAndRecordDelta(v333, true);
    else
        v336 = v142.beginWork(l_alternate_1, v333, v6.subtreeRenderLanes);
    end;
    l_resetCurrentFiber_0();
    v333.memoizedProps = v333.pendingProps;
    if v336 == nil then
        v142.completeUnitOfWork(v333);
    else
        v146 = v336;
    end;
    l_ReactCurrentOwner_0.current = nil;
    v102.profileUnitOfWorkAfter(v334);
end;
v142.completeUnitOfWork = function(v337) --[[ Line: 1995 ]]
    -- upvalues: v48 (copy), l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v45 (copy), v6 (copy), v104 (copy), v122 (copy), l_resetCurrentFiber_0 (copy), v146 (ref), l_unwindWork_0 (copy), l_Incomplete_0 (ref), v143 (copy)
    local l_v337_0 = v337;
    while true do
        local l_alternate_2 = l_v337_0.alternate;
        local l_return__2 = l_v337_0.return_;
        if bit32.band(l_v337_0.flags, v48.Incomplete) == v48.NoFlags then
            l_setCurrentFiber_0(l_v337_0);
            local v341 = nil;
            if not l_ReactFeatureFlags_0.enableProfilerTimer or bit32.band(l_v337_0.mode, v45.ProfileMode) == v45.NoMode then
                local l_l_v337_0_0 = l_v337_0;
                local l_subtreeRenderLanes_0 = v6.subtreeRenderLanes;
                if not v104.completeWorkRef then
                    v104.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v341 = v104.completeWorkRef(l_alternate_2, l_l_v337_0_0, l_subtreeRenderLanes_0);
            else
                v122.startProfilerTimer(l_v337_0);
                local l_l_v337_0_1 = l_v337_0;
                local l_subtreeRenderLanes_1 = v6.subtreeRenderLanes;
                if not v104.completeWorkRef then
                    v104.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v341 = v104.completeWorkRef(l_alternate_2, l_l_v337_0_1, l_subtreeRenderLanes_1);
                v122.stopProfilerTimerIfRunningAndRecordDelta(l_v337_0, false);
            end;
            l_resetCurrentFiber_0();
            if v341 ~= nil then
                v146 = v341;
                return;
            end;
        else
            local v346 = l_unwindWork_0(l_v337_0, v6.subtreeRenderLanes);
            if v346 ~= nil then
                v346.flags = bit32.band(v346.flags, v48.HostEffectMask);
                v146 = v346;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v337_0.mode, v45.ProfileMode) ~= v45.NoMode then
                    v122.stopProfilerTimerIfRunningAndRecordDelta(l_v337_0, false);
                    local v347 = l_v337_0.actualDuration or 0;
                    local l_child_0 = l_v337_0.child;
                    while l_child_0 ~= nil do
                        v347 = v347 + (l_child_0.actualDuration or 0);
                        l_child_0 = l_child_0.sibling;
                    end;
                    l_v337_0.actualDuration = v347;
                end;
                if l_return__2 ~= nil then
                    l_return__2.flags = bit32.bor(l_return__2.flags, v48.Incomplete);
                    l_return__2.subtreeFlags = v48.NoFlags;
                    l_return__2.deletions = nil;
                end;
            end;
        end;
        local l_sibling_0 = l_v337_0.sibling;
        if l_sibling_0 ~= nil then
            v146 = l_sibling_0;
            return;
        else
            l_v337_0 = l_return__2;
            v146 = l_v337_0;
            if l_v337_0 == nil then
                if l_Incomplete_0 == v143.Incomplete then
                    l_Incomplete_0 = v143.Completed;
                end;
                return;
            end;
        end;
    end;
end;
v142.commitRoot = function(v350) --[[ Line: 2103 ]]
    -- upvalues: l_getCurrentPriorityLevel_0 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), v102 (copy), v142 (copy)
    local v351 = l_getCurrentPriorityLevel_0();
    l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 2105 ]]
        -- upvalues: v102 (ref), v142 (ref), v350 (copy), v351 (copy)
        v102.profileCommitBefore();
        local v352 = v142.commitRootImpl(v350, v351);
        v102.profileCommitAfter();
        return v352;
    end);
    return nil;
end;
v142.commitRootImpl = function(v353, v354) --[[ Line: 2116 ]]
    -- upvalues: v6 (copy), v165 (ref), l_invariant_0 (copy), v144 (ref), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v38 (copy), l_enableSchedulingProfiler_0 (copy), v39 (copy), v9 (copy), l_mergeLanes_0 (copy), l_markRootFinished_0 (copy), v168 (ref), l_hasDiscreteLanes_0 (copy), v145 (ref), v146 (ref), l_NoLanes_0 (ref), v48 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v142 (copy), l_ReactCurrentOwner_0 (copy), v176 (ref), v43 (copy), v177 (ref), v122 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_recursivelyCommitLayoutEffects_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v140 (ref), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), v164 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), l_requestPaint_0 (copy), l_NoLanes_4 (ref), l_l_NoPriority_0_0 (ref), v172 (ref), v163 (ref), l_enableDoubleInvokingEffects_0 (copy), l_SyncLane_0 (copy), v170 (ref), v169 (ref), l_onCommitRoot_0 (copy), l_onCommitRoot_1 (copy), v103 (ref), l_now_0 (copy), v161 (ref), v162 (ref), l_flushSyncCallbackQueue_0 (copy)
    repeat
        v6.flushPassiveEffects();
    until v165 == nil;
    flushRenderPhaseStrictModeWarningsInDEV();
    l_invariant_0(bit32.band(v144, 48) == 0, "Should not already be working.");
    local l_finishedWork_0 = v353.finishedWork;
    local l_finishedLanes_0 = v353.finishedLanes;
    if l___DEV___0 and l_enableDebugTracing_0 then
        v38.logCommitStarted(l_finishedLanes_0);
    end;
    if l_enableSchedulingProfiler_0 then
        v39.markCommitStarted(l_finishedLanes_0);
    end;
    if l_finishedWork_0 == nil then
        if l___DEV___0 and l_enableDebugTracing_0 then
            v38.logCommitStopped();
        end;
        if l_enableSchedulingProfiler_0 then
            v39.markCommitStopped(v353);
        end;
        return nil;
    else
        v353.finishedWork = nil;
        v353.finishedLanes = v9.NoLanes;
        l_invariant_0(l_finishedWork_0 ~= v353.current, "Cannot commit the same tree as before. This error is likely caused by a bug in React. Please file an issue.");
        v353.callbackNode = nil;
        local v357 = l_mergeLanes_0(l_finishedWork_0.lanes, l_finishedWork_0.childLanes);
        l_markRootFinished_0(v353, v357);
        if v168 ~= nil and not l_hasDiscreteLanes_0(v357) and v168:has(v353) then
            v168:delete(v353);
        end;
        if v353 == v145 then
            v145 = nil;
            v146 = nil;
            l_NoLanes_0 = v9.NoLanes;
        end;
        local v358 = bit32.band(l_finishedWork_0.subtreeFlags, (bit32.bor(v48.BeforeMutationMask, v48.MutationMask, v48.LayoutMask, v48.PassiveMask))) ~= v48.NoFlags;
        local v359 = bit32.band(l_finishedWork_0.flags, (bit32.bor(v48.BeforeMutationMask, v48.MutationMask, v48.LayoutMask, v48.PassiveMask))) ~= v48.NoFlags;
        if v358 or v359 then
            local v360 = nil;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                v360 = l_getCurrentUpdateLanePriority_0();
                l_setCurrentUpdateLanePriority_0(v9.SyncLanePriority);
            end;
            local l_v144_8 = v144;
            v144 = bit32.bor(v144, 32);
            local v362 = v142.pushInteractions(v353);
            l_ReactCurrentOwner_0.current = nil;
            v176 = v43.prepareForCommit(v353.containerInfo);
            v177 = false;
            v142.commitBeforeMutationEffects(l_finishedWork_0);
            v176 = nil;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v122.recordCommitTime();
            end;
            v142.commitMutationEffects(l_finishedWork_0, v353, v354);
            if v177 then
                v43.afterActiveInstanceBlur();
            end;
            v43.resetAfterCommit(v353.containerInfo);
            v353.current = l_finishedWork_0;
            if l___DEV___0 and l_enableDebugTracing_0 then
                v38.logLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l_enableSchedulingProfiler_0 then
                v39.markLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l___DEV___0 then
                l_setCurrentFiber_0(l_finishedWork_0);
                l_invokeGuardedCallback_0(nil, l_recursivelyCommitLayoutEffects_0, nil, l_finishedWork_0, v353, v6.captureCommitPhaseError, v6.schedulePassiveEffectCallback);
                if l_hasCaughtError_0() then
                    local v363 = l_clearCaughtError_0();
                    v140(l_finishedWork_0, l_finishedWork_0, v363);
                end;
                l_resetCurrentFiber_0();
            else
                local v364 = nil;
                local v365 = nil;
                if not l___YOLO___0 then
                    local v366, v367 = xpcall(l_recursivelyCommitLayoutEffects_0, l_describeError_0, l_finishedWork_0, v353, v6.captureCommitPhaseError, v6.schedulePassiveEffectCallback);
                    v364 = v366;
                    v365 = v367;
                else
                    v364 = true;
                    l_recursivelyCommitLayoutEffects_0(l_finishedWork_0, v353, v6.captureCommitPhaseError, v6.schedulePassiveEffectCallback);
                end;
                if not v364 then
                    v140(l_finishedWork_0, l_finishedWork_0, v365);
                end;
            end;
            if l___DEV___0 and l_enableDebugTracing_0 then
                v38.logLayoutEffectsStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v39.markLayoutEffectsStopped();
            end;
            if (bit32.band(l_finishedWork_0.subtreeFlags, v48.PassiveMask) ~= v48.NoFlags or bit32.band(l_finishedWork_0.flags, v48.PassiveMask) ~= v48.NoFlags) and not v164 then
                v164 = true;
                l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2350 ]]
                    -- upvalues: v6 (ref)
                    v6.flushPassiveEffects();
                    return nil;
                end);
            end;
            l_requestPaint_0();
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                v142.popInteractions(v362);
            end;
            v144 = l_v144_8;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler and v360 ~= nil then
                l_setCurrentUpdateLanePriority_0(v360);
            end;
        else
            v353.current = l_finishedWork_0;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v122.recordCommitTime();
            end;
        end;
        local l_v164_0 = v164;
        if v164 then
            v164 = false;
            v165 = v353;
            l_NoLanes_4 = l_finishedLanes_0;
            l_l_NoPriority_0_0 = v354;
        end;
        v357 = v353.pendingLanes;
        if v357 ~= v9.NoLanes then
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                if v172 ~= nil then
                    local l_v172_0 = v172;
                    v172 = nil;
                    for v370 = 1, #l_v172_0 do
                        scheduleInteractions(v353, l_v172_0[v370], v353.memoizedInteractions);
                    end;
                end;
                v142.schedulePendingInteractions(v353, v357);
            end;
        else
            v163 = nil;
        end;
        if l___DEV___0 and l_enableDoubleInvokingEffects_0 and not l_v164_0 then
            commitDoubleInvokeEffectsInDEV(v353.current, false);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing and not l_v164_0 then
            v142.finishPendingInteractions(v353, l_finishedLanes_0);
        end;
        if v357 == l_SyncLane_0 then
            if v353 == v170 then
                v169 = v169 + 1;
            else
                v169 = 0;
                v170 = v353;
            end;
        else
            v169 = 0;
        end;
        l_onCommitRoot_0(l_finishedWork_0.stateNode, v354);
        if l___DEV___0 then
            l_onCommitRoot_1();
        end;
        v103(v353, l_now_0());
        if v161 then
            v161 = false;
            local l_v162_0 = v162;
            v162 = nil;
            error(l_v162_0);
        end;
        if bit32.band(v144, 8) ~= 0 then
            if l___DEV___0 and l_enableDebugTracing_0 then
                v38.logCommitStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v39.markCommitStopped(v353);
            end;
            return nil;
        else
            l_flushSyncCallbackQueue_0();
            if l___DEV___0 and l_enableDebugTracing_0 then
                v38.logCommitStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v39.markCommitStopped(v353);
            end;
            return nil;
        end;
    end;
end;
v142.commitBeforeMutationEffects = function(v372) --[[ Line: 2503 ]]
    -- upvalues: v142 (copy), v48 (copy), l___DEV___0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v6 (copy), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy)
    local l_v372_0 = v372;
    while l_v372_0 ~= nil do
        if l_v372_0.deletions ~= nil then
            v142.commitBeforeMutationEffectsDeletions(l_v372_0.deletions);
        end;
        if l_v372_0.child ~= nil and bit32.band(l_v372_0.subtreeFlags, v48.BeforeMutationMask) ~= v48.NoFlags then
            v142.commitBeforeMutationEffects(l_v372_0.child);
        end;
        if l___DEV___0 then
            l_setCurrentFiber_0(l_v372_0);
            l_invokeGuardedCallback_0(nil, v142.commitBeforeMutationEffectsImpl, nil, l_v372_0);
            if l_hasCaughtError_0() then
                local v374 = l_clearCaughtError_0();
                v6.captureCommitPhaseError(l_v372_0, l_v372_0.return_, v374);
            end;
            l_resetCurrentFiber_0();
        else
            local v375 = nil;
            local v376 = nil;
            if not l___YOLO___0 then
                local v377, v378 = xpcall(v142.commitBeforeMutationEffectsImpl, l_describeError_0, l_v372_0);
                v375 = v377;
                v376 = v378;
            else
                v375 = true;
                v142.commitBeforeMutationEffectsImpl(l_v372_0);
            end;
            if not v375 then
                v6.captureCommitPhaseError(l_v372_0, l_v372_0.return_, v376);
            end;
        end;
        l_v372_0 = l_v372_0.sibling;
    end;
end;
v142.commitBeforeMutationEffectsImpl = function(v379) --[[ Line: 2546 ]]
    -- upvalues: v177 (ref), v176 (ref), v46 (copy), v85 (copy), l_doesFiberContain_0 (copy), v43 (copy), v48 (copy), l_setCurrentFiber_0 (copy), l_commitBeforeMutationLifeCycles_0 (copy), l_resetCurrentFiber_0 (copy), v164 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v6 (copy)
    local l_alternate_3 = v379.alternate;
    local l_flags_0 = v379.flags;
    if not v177 and v176 ~= nil and v379.tag == v46.SuspenseComponent and v85.isSuspenseBoundaryBeingHidden(l_alternate_3, v379) and l_doesFiberContain_0(v379, v176) then
        v177 = true;
        v43.beforeActiveInstanceBlur();
    end;
    if bit32.band(l_flags_0, v48.Snapshot) ~= v48.NoFlags then
        l_setCurrentFiber_0(v379);
        l_commitBeforeMutationLifeCycles_0(l_alternate_3, v379);
        l_resetCurrentFiber_0();
    end;
    if bit32.band(l_flags_0, v48.Passive) ~= v48.NoFlags and not v164 then
        v164 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2574 ]]
            -- upvalues: v6 (ref)
            v6.flushPassiveEffects();
            return nil;
        end);
    end;
end;
v142.commitBeforeMutationEffectsDeletions = function(v382) --[[ Line: 2582 ]]
    -- upvalues: l_doesFiberContain_0 (copy), v176 (ref), v177 (ref), v43 (copy)
    for v383 = 1, #v382 do
        local v384 = v382[v383];
        if l_doesFiberContain_0(v384, v176) then
            v177 = true;
            v43.beforeActiveInstanceBlur();
        end;
    end;
end;
v142.commitMutationEffects = function(v385, v386, v387) --[[ Line: 2597 ]]
    -- upvalues: l_commitDeletion_0 (copy), l_describeError_0 (copy), v6 (copy), v48 (copy), v142 (copy), l___DEV___0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy)
    local l_v385_0 = v385;
    while l_v385_0 ~= nil do
        local l_deletions_0 = l_v385_0.deletions;
        if l_deletions_0 ~= nil then
            for _, v391 in l_deletions_0 do
                local v392, v393 = xpcall(l_commitDeletion_0, l_describeError_0, v386, v391, l_v385_0, v387);
                if not v392 then
                    v6.captureCommitPhaseError(v391, l_v385_0, v393);
                end;
            end;
        end;
        if l_v385_0.child ~= nil and bit32.band(l_v385_0.subtreeFlags, v48.MutationMask) ~= v48.NoFlags then
            v142.commitMutationEffects(l_v385_0.child, v386, v387);
        end;
        if l___DEV___0 then
            l_setCurrentFiber_0(l_v385_0);
            l_invokeGuardedCallback_0(nil, v142.commitMutationEffectsImpl, nil, l_v385_0, v386, v387);
            if l_hasCaughtError_0() then
                local v394 = l_clearCaughtError_0();
                v6.captureCommitPhaseError(l_v385_0, l_v385_0.return_, v394);
            end;
            l_resetCurrentFiber_0();
        else
            local v395 = nil;
            local v396 = nil;
            if not l___YOLO___0 then
                local v397, v398 = xpcall(v142.commitMutationEffectsImpl, l_describeError_0, l_v385_0, v386, v387);
                v395 = v397;
                v396 = v398;
            else
                v395 = true;
                v142.commitMutationEffectsImpl(l_v385_0, v386, v387);
            end;
            if not v395 then
                v6.captureCommitPhaseError(l_v385_0, l_v385_0.return_, v396);
            end;
        end;
        l_v385_0 = l_v385_0.sibling;
    end;
end;
v142.commitMutationEffectsImpl = function(v399, _, _) --[[ Line: 2670 ]]
    -- upvalues: v48 (copy), l_commitDetachRef_0 (copy), l_commitPlacement_0 (copy), l_commitWork_0 (copy)
    local l_flags_1 = v399.flags;
    if bit32.band(l_flags_1, v48.Ref) ~= 0 then
        local l_alternate_4 = v399.alternate;
        if l_alternate_4 ~= nil then
            l_commitDetachRef_0(l_alternate_4);
        end;
    end;
    local v404 = bit32.band(l_flags_1, (bit32.bor(v48.Placement, v48.Update, v48.Hydrating)));
    if v404 == v48.Placement then
        l_commitPlacement_0(v399);
        v399.flags = bit32.band(v399.flags, (bit32.bnot(v48.Placement)));
        return;
    elseif v404 == v48.PlacementAndUpdate then
        l_commitPlacement_0(v399);
        v399.flags = bit32.band(v399.flags, (bit32.bnot(v48.Placement)));
        local l_alternate_5 = v399.alternate;
        l_commitWork_0(l_alternate_5, v399);
        return;
    else
        if v404 == v48.Update then
            local l_alternate_6 = v399.alternate;
            l_commitWork_0(l_alternate_6, v399);
        end;
        return;
    end;
end;
v142.commitMutationEffectsDeletions = function(v407, v408, v409, v410) --[[ Line: 2739 ]]
    -- upvalues: l_commitDeletion_0 (copy), l_describeError_0 (copy), v6 (copy)
    for _, v412 in v407 do
        local v413, v414 = xpcall(l_commitDeletion_0, l_describeError_0, v409, v412, v408, v410);
        if not v413 then
            v6.captureCommitPhaseError(v412, v408, v414);
        end;
    end;
end;
v6.schedulePassiveEffectCallback = function() --[[ Line: 2762 ]]
    -- upvalues: v164 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v6 (copy)
    if not v164 then
        v164 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2765 ]]
            -- upvalues: v6 (ref)
            v6.flushPassiveEffects();
            return nil;
        end);
    end;
end;
local v415 = nil;
v6.flushPassiveEffects = function() --[[ Line: 2774 ]]
    -- upvalues: l_l_NoPriority_0_0 (ref), l_NoPriority_0 (copy), l_NormalPriority_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l___YOLO___0 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), v415 (ref)
    if l_l_NoPriority_0_0 ~= l_NoPriority_0 then
        local v416 = if l_NormalPriority_0 < l_l_NoPriority_0_0 then l_NormalPriority_0 else l_l_NoPriority_0_0;
        l_l_NoPriority_0_0 = l_NoPriority_0;
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v417 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v416));
            local v418 = nil;
            local v419 = nil;
            if not l___YOLO___0 then
                local v420, v421 = xpcall(l_runWithPriority_0, l_describeError_0, v416, v415);
                v418 = v420;
                v419 = v421;
            else
                v418 = true;
                l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v416));
                v419 = l_runWithPriority_0(v416, v415);
            end;
            l_setCurrentUpdateLanePriority_0(v417);
            if not v418 then
                error(v419);
            end;
            return v419;
        else
            return l_runWithPriority_0(v416, v415);
        end;
    else
        return false;
    end;
end;
v141 = function(v422, v423) --[[ Line: 2818 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v46 (copy), v159 (ref), v48 (copy), v141 (ref), l___DEV___0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_commitPassiveMount_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v6 (copy), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy)
    local l_v423_0 = v423;
    while l_v423_0 ~= nil do
        local v425 = nil;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v423_0.tag == v46.Profiler then
            v425 = v159;
            v159 = l_v423_0;
        end;
        local v426 = bit32.band(l_v423_0.subtreeFlags, v48.PassiveMask);
        if l_v423_0.child ~= nil and v426 ~= v48.NoFlags then
            v141(v422, l_v423_0.child);
        end;
        if bit32.band(l_v423_0.flags, v48.Passive) ~= v48.NoFlags then
            if l___DEV___0 then
                l_setCurrentFiber_0(l_v423_0);
                l_invokeGuardedCallback_0(nil, l_commitPassiveMount_0, nil, v422, l_v423_0);
                if l_hasCaughtError_0() then
                    local v427 = l_clearCaughtError_0();
                    v6.captureCommitPhaseError(l_v423_0, l_v423_0.return_, v427);
                end;
                l_resetCurrentFiber_0();
            else
                local v428 = nil;
                local v429 = nil;
                if not l___YOLO___0 then
                    local v430, v431 = xpcall(l_commitPassiveMount_0, l_describeError_0, v422, l_v423_0);
                    v428 = v430;
                    v429 = v431;
                else
                    v428 = true;
                    l_commitPassiveMount_0(v422, l_v423_0);
                end;
                if not v428 then
                    v6.captureCommitPhaseError(l_v423_0, l_v423_0.return_, v429);
                end;
            end;
        end;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v423_0.tag == v46.Profiler then
            if v425 ~= nil then
                local l_stateNode_0 = v425.stateNode;
                l_stateNode_0.passiveEffectDuration = l_stateNode_0.passiveEffectDuration + l_v423_0.stateNode.passiveEffectDuration;
            end;
            v159 = v425;
        end;
        l_v423_0 = l_v423_0.sibling;
    end;
end;
local function v433(v434) --[[ Line: 2887 ]] --[[ Name: flushPassiveUnmountEffects ]]
    -- upvalues: v142 (copy), l_enableNewTreeCleanupPath_0 (copy), l_deletedTreeCleanUpLevel_0 (copy), v48 (copy), v433 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmount_0 (copy), l_resetCurrentFiber_0 (copy)
    local l_v434_0 = v434;
    while l_v434_0 ~= nil do
        local l_deletions_1 = l_v434_0.deletions;
        if l_deletions_1 ~= nil then
            for v437 = 1, #l_deletions_1 do
                local v438 = l_deletions_1[v437];
                v142.flushPassiveUnmountEffectsInsideOfDeletedTree(v438, l_v434_0);
                if not l_enableNewTreeCleanupPath_0 or l_deletedTreeCleanUpLevel_0 < 2 then
                    v142.detachFiberAfterEffects(v438);
                end;
            end;
            if l_enableNewTreeCleanupPath_0 and l_deletedTreeCleanUpLevel_0 >= 1 then
                local l_alternate_7 = l_v434_0.alternate;
                if l_alternate_7 ~= nil then
                    local l_child_1 = l_alternate_7.child;
                    if l_child_1 ~= nil then
                        l_alternate_7.child = nil;
                        repeat
                            local l_sibling_1 = l_child_1.sibling;
                            l_child_1.sibling = nil;
                            l_child_1 = l_sibling_1;
                        until l_child_1 == nil;
                    end;
                end;
            end;
        end;
        local l_child_2 = l_v434_0.child;
        if l_child_2 ~= nil and bit32.band(l_v434_0.subtreeFlags, v48.PassiveMask) ~= v48.NoFlags then
            v433(l_child_2);
        end;
        if bit32.band(l_v434_0.flags, v48.Passive) ~= v48.NoFlags then
            l_setCurrentFiber_0(l_v434_0);
            l_commitPassiveUnmount_0(l_v434_0);
            l_resetCurrentFiber_0();
        end;
        l_v434_0 = l_v434_0.sibling;
    end;
end;
v142.flushPassiveUnmountEffectsInsideOfDeletedTree = function(v443, v444) --[[ Line: 2956 ]]
    -- upvalues: v48 (copy), l_enableNewTreeCleanupPath_0 (copy), l_deletedTreeCleanUpLevel_0 (copy), v142 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmountInsideDeletedTree_0 (copy), l_resetCurrentFiber_0 (copy)
    if bit32.band(v443.subtreeFlags, v48.PassiveStatic) ~= v48.NoFlags or l_enableNewTreeCleanupPath_0 and l_deletedTreeCleanUpLevel_0 >= 2 then
        local l_child_3 = v443.child;
        while l_child_3 ~= nil do
            local l_sibling_2 = l_child_3.sibling;
            v142.flushPassiveUnmountEffectsInsideOfDeletedTree(l_child_3, v444);
            l_child_3 = l_sibling_2;
        end;
    end;
    if bit32.band(v443.flags, v48.PassiveStatic) ~= v48.NoFlags then
        l_setCurrentFiber_0(v443);
        l_commitPassiveUnmountInsideDeletedTree_0(v443, v444);
        l_resetCurrentFiber_0();
    end;
    if l_enableNewTreeCleanupPath_0 and l_deletedTreeCleanUpLevel_0 >= 2 then
        v142.detachFiberAfterEffects(v443);
    end;
end;
v415 = function() --[[ Line: 2997 ]]
    -- upvalues: v165 (ref), l_NoLanes_4 (ref), v9 (copy), l_invariant_0 (copy), v144 (ref), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v38 (copy), l_enableSchedulingProfiler_0 (copy), v39 (copy), v142 (copy), v433 (copy), v141 (ref), l_enableDoubleInvokingEffects_0 (copy), l_ReactFeatureFlags_0 (copy), l_flushSyncCallbackQueue_0 (copy), v171 (ref)
    if v165 == nil then
        return false;
    else
        local l_v165_0 = v165;
        local l_l_NoLanes_4_0 = l_NoLanes_4;
        v165 = nil;
        l_NoLanes_4 = v9.NoLanes;
        l_invariant_0(bit32.band(v144, 48) == 0, "Cannot flush passive effects while already rendering.");
        if l___DEV___0 and l_enableDebugTracing_0 then
            v38.logPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        if l_enableSchedulingProfiler_0 then
            v39.markPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        local l_v144_9 = v144;
        v144 = bit32.bor(v144, 32);
        local v450 = v142.pushInteractions(l_v165_0);
        v433(l_v165_0.current);
        v141(l_v165_0, l_v165_0.current);
        if l___DEV___0 and l_enableDebugTracing_0 then
            v38.logPassiveEffectsStopped();
        end;
        if l_enableSchedulingProfiler_0 then
            v39.markPassiveEffectsStopped(l_v165_0);
        end;
        if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
            commitDoubleInvokeEffectsInDEV(l_v165_0.current, true);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing then
            v142.popInteractions(v450);
            v142.finishPendingInteractions(l_v165_0, l_l_NoLanes_4_0);
        end;
        v144 = l_v144_9;
        l_flushSyncCallbackQueue_0();
        if v165 == nil then
            v171 = 0;
        else
            v171 = v171 + 1;
        end;
        return true;
    end;
end;
v6.isAlreadyFailedLegacyErrorBoundary = function(v451) --[[ Line: 3071 ]]
    -- upvalues: v163 (ref)
    local v452 = false;
    if v163 ~= nil then
        v452 = v163:has(v451);
    end;
    return v452;
end;
v6.markLegacyErrorBoundaryAsFailed = function(v453) --[[ Line: 3076 ]]
    -- upvalues: v163 (ref), l_Set_0 (copy)
    if v163 == nil then
        v163 = l_Set_0.new({
            v453
        });
        return;
    else
        v163:add(v453);
        return;
    end;
end;
v6.onUncaughtError = function(v454) --[[ Line: 3085 ]] --[[ Name: prepareToThrowUncaughtError ]]
    -- upvalues: v161 (ref), v162 (ref)
    if not v161 then
        v161 = true;
        v162 = v454;
    end;
end;
v140 = function(v455, v456, v457) --[[ Line: 3093 ]]
    -- upvalues: l_createCapturedValue_0 (copy), l_createRootErrorUpdate_0 (copy), l_SyncLane_0 (copy), v6 (copy), l_enqueueUpdate_0 (copy), v142 (copy), l_markRootUpdated_0 (copy), v103 (ref)
    local v458 = l_createCapturedValue_0(v457, v456);
    local v459 = l_createRootErrorUpdate_0(v455, v458, l_SyncLane_0, v6.onUncaughtError);
    l_enqueueUpdate_0(v455, v459);
    local v460 = v6.requestEventTime();
    local v461 = v142.markUpdateLaneFromFiberToRoot(v455, l_SyncLane_0);
    if v461 ~= nil then
        l_markRootUpdated_0(v461, l_SyncLane_0, v460);
        v103(v461, v460);
        v142.schedulePendingInteractions(v461, l_SyncLane_0);
    end;
end;
v6.captureCommitPhaseError = function(v462, v463, v464) --[[ Line: 3113 ]]
    -- upvalues: v46 (copy), v140 (ref), l_skipUnmountedBoundaries_0 (copy), v6 (copy), l_createCapturedValue_0 (copy), l_createClassErrorUpdate_0 (copy), l_SyncLane_0 (copy), l_enqueueUpdate_0 (copy), v142 (copy), l_markRootUpdated_0 (copy), v103 (ref)
    if v462.tag == v46.HostRoot then
        v140(v462, v462, v464);
        return;
    else
        local v465 = nil;
        v465 = if l_skipUnmountedBoundaries_0 then v463 else v462.return_;
        while true do
            if v465 ~= nil then
                if v465.tag == v46.HostRoot then
                    v140(v465, v462, v464);
                    return;
                else
                    if v465.tag == v46.ClassComponent then
                        local l_type_0 = v465.type;
                        local l_stateNode_1 = v465.stateNode;
                        if typeof(l_type_0.getDerivedStateFromError) == "function" or typeof(l_stateNode_1.componentDidCatch) == "function" and not v6.isAlreadyFailedLegacyErrorBoundary(l_stateNode_1) then
                            local v468 = l_createCapturedValue_0(v464, v462);
                            local v469 = l_createClassErrorUpdate_0(v465, v468, l_SyncLane_0);
                            l_enqueueUpdate_0(v465, v469);
                            local v470 = v6.requestEventTime();
                            local v471 = v142.markUpdateLaneFromFiberToRoot(v465, l_SyncLane_0);
                            if v471 ~= nil then
                                l_markRootUpdated_0(v471, l_SyncLane_0, v470);
                                v103(v471, v470);
                                v142.schedulePendingInteractions(v471, l_SyncLane_0);
                            end;
                            return;
                        end;
                    end;
                    v465 = v465.return_;
                end;
            else
                return;
            end;
        end;
    end;
end;
v6.pingSuspendedRoot = function(v472, v473, v474) --[[ Line: 3165 ]]
    -- upvalues: v6 (copy), l_markRootPinged_0 (copy), v145 (ref), l_isSubsetOfLanes_0 (copy), l_NoLanes_0 (ref), l_Incomplete_0 (ref), v143 (copy), l_includesOnlyRetries_0 (copy), l_now_0 (copy), v157 (ref), v142 (copy), v9 (copy), l_NoLanes_3 (ref), l_mergeLanes_0 (copy), v103 (ref)
    local l_pingCache_0 = v472.pingCache;
    if l_pingCache_0 ~= nil then
        l_pingCache_0[v473] = nil;
    end;
    local v476 = v6.requestEventTime();
    l_markRootPinged_0(v472, v474, v476);
    if v145 == v472 and l_isSubsetOfLanes_0(l_NoLanes_0, v474) then
        if l_Incomplete_0 == v143.SuspendedWithDelay or l_Incomplete_0 == v143.Suspended and l_includesOnlyRetries_0(l_NoLanes_0) and l_now_0() - v157 < 500 then
            v142.prepareFreshStack(v472, v9.NoLanes);
        else
            l_NoLanes_3 = l_mergeLanes_0(l_NoLanes_3, v474);
        end;
    end;
    v103(v472, v476);
    v142.schedulePendingInteractions(v472, v474);
end;
retryTimedOutBoundary = function(v477, v478) --[[ Line: 3213 ]] --[[ Name: retryTimedOutBoundary ]]
    -- upvalues: v9 (copy), v6 (copy), v142 (copy), l_markRootUpdated_0 (copy), v103 (ref)
    if v478 == v9.NoLane then
        v478 = requestRetryLane(v477);
    end;
    local v479 = v6.requestEventTime();
    local v480 = v142.markUpdateLaneFromFiberToRoot(v477, v478);
    if v480 ~= nil then
        l_markRootUpdated_0(v480, v478, v479);
        v103(v480, v479);
        v142.schedulePendingInteractions(v480, v478);
    end;
end;
v6.resolveRetryWakeable = function(v481, v482) --[[ Line: 3240 ]]
    -- upvalues: v9 (copy)
    local l_NoLane_0 = v9.NoLane;
    local v484 = nil;
    v484 = v481.stateNode;
    if v484 ~= nil then
        v484:delete(v482);
    end;
    retryTimedOutBoundary(v481, l_NoLane_0);
end;
jnd = function(v485) --[[ Line: 3284 ]] --[[ Name: jnd ]]
    if v485 < 120 then
        return 120;
    elseif v485 < 480 then
        return 480;
    elseif v485 < 1080 then
        return 1080;
    elseif v485 < 1920 then
        return 1920;
    elseif v485 < 3000 then
        return 3000;
    elseif v485 < 4320 then
        return 4320;
    else
        return math.ceil(v485 / 1960) * 1960;
    end;
end;
v142.checkForNestedUpdates = function() --[[ Line: 3302 ]]
    -- upvalues: v169 (ref), v170 (ref), l_invariant_0 (copy), l___DEV___0 (copy), v171 (ref), l_console_0 (copy)
    if v169 > 50 then
        v169 = 0;
        v170 = nil;
        l_invariant_0(false, "Maximum update depth exceeded. This can happen when a component repeatedly calls setState inside componentWillUpdate or componentDidUpdate. React limits the number of nested updates to prevent infinite loops.");
    end;
    if l___DEV___0 and v171 > 50 then
        v171 = 0;
        l_console_0.error("Maximum update depth exceeded. This can happen when a component calls setState inside useEffect, but useEffect either doesn't have a dependency array, or one of the dependencies changes on every render.");
    end;
end;
flushRenderPhaseStrictModeWarningsInDEV = function() --[[ Line: 3328 ]] --[[ Name: flushRenderPhaseStrictModeWarningsInDEV ]]
    -- upvalues: l___DEV___0 (copy), v124 (copy), l_ReactFeatureFlags_0 (copy)
    if l___DEV___0 then
        v124.flushLegacyContextWarning();
        if l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles then
            v124.flushPendingUnsafeLifecycleWarnings();
        end;
    end;
end;
commitDoubleInvokeEffectsInDEV = function(v486, v487) --[[ Line: 3338 ]] --[[ Name: commitDoubleInvokeEffectsInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_setCurrentFiber_0 (copy), v48 (copy), l_invokeLayoutEffectUnmountInDEV_0 (copy), l_invokePassiveEffectUnmountInDEV_0 (copy), l_invokeLayoutEffectMountInDEV_0 (copy), l_invokePassiveEffectMountInDEV_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        l_setCurrentFiber_0(v486);
        invokeEffectsInDev(v486, v48.MountLayoutDev, l_invokeLayoutEffectUnmountInDEV_0);
        if v487 then
            invokeEffectsInDev(v486, v48.MountPassiveDev, l_invokePassiveEffectUnmountInDEV_0);
        end;
        invokeEffectsInDev(v486, v48.MountLayoutDev, l_invokeLayoutEffectMountInDEV_0);
        if v487 then
            invokeEffectsInDev(v486, v48.MountPassiveDev, l_invokePassiveEffectMountInDEV_0);
        end;
        l_resetCurrentFiber_0();
    end;
end;
invokeEffectsInDev = function(v488, v489, v490) --[[ Line: 3370 ]] --[[ Name: invokeEffectsInDev ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), v48 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        local l_v488_0 = v488;
        while l_v488_0 ~= nil do
            if l_v488_0.child ~= nil and bit32.band(l_v488_0.subtreeFlags, v489) ~= v48.NoFlags then
                invokeEffectsInDev(l_v488_0.child, v489, v490);
            end;
            if bit32.band(l_v488_0.flags, v489) ~= v48.NoFlags then
                v490(l_v488_0);
            end;
            l_v488_0 = l_v488_0.sibling;
        end;
    end;
end;
local v492 = nil;
v142.warnAboutUpdateOnNotYetMountedFiberInDEV = function(v493) --[[ Line: 3396 ]]
    -- upvalues: l___DEV___0 (copy), v144 (ref), v45 (copy), v46 (copy), l_getComponentName_0 (copy), v492 (ref), v125 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 then
        if bit32.band(v144, 16) ~= 0 then
            return;
        elseif bit32.band(v493.mode, (bit32.bor(v45.BlockingMode, v45.ConcurrentMode))) == 0 then
            return;
        else
            local l_tag_0 = v493.tag;
            if l_tag_0 ~= v46.IndeterminateComponent and l_tag_0 ~= v46.HostRoot and l_tag_0 ~= v46.ClassComponent and l_tag_0 ~= v46.FunctionComponent and l_tag_0 ~= v46.ForwardRef and l_tag_0 ~= v46.MemoComponent and l_tag_0 ~= v46.SimpleMemoComponent and l_tag_0 ~= v46.Block then
                return;
            else
                local v495 = l_getComponentName_0(v493.type) or "ReactComponent";
                if v492 ~= nil then
                    if v492[v495] then
                        return;
                    else
                        v492[v495] = true;
                    end;
                else
                    v492 = {
                        [v495] = true
                    };
                end;
                local l_current_3 = v125.current;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 3441 ]]
                    -- upvalues: l_setCurrentFiber_0 (ref), v493 (copy), l_console_0 (ref)
                    l_setCurrentFiber_0(v493);
                    l_console_0.error("Can't perform a React state update on a component that hasn't mounted yet. This indicates that you have a side-effect in your render function that asynchronously later calls tries to update the component. Move this work to useEffect instead.");
                end);
                if l_current_3 then
                    l_setCurrentFiber_0(v493);
                else
                    l_resetCurrentFiber_0();
                end;
                if not l_status_1 then
                    error(l_result_1);
                end;
            end;
        end;
    end;
end;
if l___DEV___0 and l_ReactFeatureFlags_0.replayFailedUnitOfWorkWithInvokeGuardedCallback then
    v142.beginWork = function(v499, v500, v501) --[[ Line: 3467 ]]
        -- upvalues: v44 (copy), v108 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), v104 (copy), v113 (ref), l_unwindInterruptedWork_0 (copy), l_ReactFeatureFlags_0 (copy), v45 (copy), v122 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy)
        local v502 = v44.assignFiberPropertiesInDEV(nil, v500);
        local v503, v504 = xpcall(v108, l_describeError_0, v499, v500, v501);
        if not v503 then
            if v504 ~= nil and typeof(v504) == "table" and typeof(v504.andThen) == "function" then
                error(v504);
            end;
            l_resetContextDependencies_0();
            if not v104.resetHooksAfterThrowRef then
                v113 = require(script.Parent["ReactFiberHooks.new"]);
                v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
                v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
                v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local v505 = v104.resetHooksAfterThrowRef();
            l_unwindInterruptedWork_0(v500);
            v44.assignFiberPropertiesInDEV(v500, v502);
            if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v500.mode, v45.ProfileMode) ~= 0 then
                v122.startProfilerTimer(v500);
            end;
            l_invokeGuardedCallback_0(nil, v108, nil, v499, v500, v501);
            if l_hasCaughtError_0() then
                v505 = l_clearCaughtError_0();
                error(v505);
                return v504;
            else
                error(v504);
            end;
        end;
        return v504;
    end;
else
    v142.beginWork = v108;
end;
local v506 = false;
local v507 = nil;
if l___DEV___0 then
    v507 = {};
end;
v142.warnAboutRenderPhaseUpdatesInDEV = function(v508) --[[ Line: 3537 ]]
    -- upvalues: l___DEV___0 (copy), v125 (copy), v144 (ref), v104 (copy), v113 (ref), v46 (copy), v146 (ref), l_getComponentName_0 (copy), v507 (ref), l_console_0 (copy), v506 (ref)
    if l___DEV___0 and v125.isRendering and bit32.band(v144, 16) ~= 0 then
        if not v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
            v113 = require(script.Parent["ReactFiberHooks.new"]);
            v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
            v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
            v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        if not v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
            if v508.tag == v46.FunctionComponent or v508.tag == v46.ForwardRef or v508.tag == v46.SimpleMemoComponent then
                local v509 = v146 and l_getComponentName_0(v146.type) or "Unknown";
                if v507[v509] == nil then
                    v507[v509] = true;
                    local v510 = l_getComponentName_0(v508.type) or "Unknown";
                    l_console_0.error("Cannot update a component (`%s`) while rendering a different component (`%s`). To locate the bad setState() call inside `%s`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render", v510, v509, v509);
                    return;
                end;
            elseif v508.tag == v46.ClassComponent and not v506 then
                l_console_0.error("Cannot update during an existing state transition (such as within `render`). Render methods should be a pure function of props and state.");
                v506 = true;
            end;
        end;
    end;
end;
v6.IsThisRendererActing = {
    current = false
};
v6.warnIfNotScopedWithMatchingAct = function(v511) --[[ Line: 3588 ]]
    -- upvalues: l___DEV___0 (copy), v43 (copy), l_IsSomeRendererActing_0 (copy), v6 (copy), v125 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 and v43.warnsIfNotActing == true and l_IsSomeRendererActing_0.current == true and v6.IsThisRendererActing.current ~= true then
        local l_current_4 = v125.current;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 3596 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v511 (copy), l_console_0 (ref)
            l_setCurrentFiber_0(v511);
            l_console_0.error("It looks like you're using the wrong act() around your test interactions.\nBe sure to use the matching version of act() corresponding to your renderer:\n\n-- for react-roblox:\nlocal React = require(Packages.React)\n-- ...\nReact.TestUtils.act(function() ... end)\n\n-- for react-test-renderer:\nlocal TestRenderer = require(Packages.ReactTestRenderer)\n-- ...\nTestRenderer.act(function() ... end)");
        end);
        if l_current_4 then
            l_setCurrentFiber_0(v511);
        else
            l_resetCurrentFiber_0();
        end;
        if not l_status_2 then
            error(l_result_2);
        end;
    end;
end;
v6.warnIfNotCurrentlyActingEffectsInDEV = function(v515) --[[ Line: 3631 ]]
    -- upvalues: l___DEV___0 (copy), v43 (copy), v45 (copy), l_IsSomeRendererActing_0 (copy), v6 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    if l___DEV___0 and v43.warnsIfNotActing == true and bit32.band(v515.mode, v45.StrictMode) ~= v45.NoMode and l_IsSomeRendererActing_0.current == false and v6.IsThisRendererActing.current == false then
        l_console_0.error("An update to %s ran an effect, but was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the real client. Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v515.type));
    end;
end;
v6.warnIfNotCurrentlyActingUpdatesInDEV = function(v516) --[[ Line: 3657 ]]
    -- upvalues: l___DEV___0 (copy), v43 (copy), v144 (ref), l_IsSomeRendererActing_0 (copy), v6 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 and v43.warnsIfNotActing == true and v144 == 0 and l_IsSomeRendererActing_0.current == false and v6.IsThisRendererActing.current == false then
        local l_l_current_0_0 = l_current_0;
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 3666 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v516 (copy), l_console_0 (ref), l_getComponentName_0 (ref)
            l_setCurrentFiber_0(v516);
            l_console_0.error("An update to %s inside a test was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  --[[ fire events that update state ]]\nend)\n--[[ assert on the output ]]\n\nThis ensures that you're testing the behavior the user would see in the client application. Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v516.type));
        end);
        if l_l_current_0_0 then
            l_setCurrentFiber_0(v516);
        else
            l_resetCurrentFiber_0();
        end;
        if l_status_3 then
            return l_result_3;
        end;
    end;
end;
local v520 = false;
v6.warnIfUnmockedScheduler = function(v521) --[[ Line: 3707 ]]
    -- upvalues: l___DEV___0 (copy), v520 (ref), v10 (copy), v45 (copy), l_console_0 (copy), l_ReactFeatureFlags_0 (copy)
    if l___DEV___0 and v520 == false and v10.unstable_flushAllWithoutAsserting == nil then
        if bit32.band(v521.mode, v45.BlockingMode) ~= 0 or bit32.band(v521.mode, v45.ConcurrentMode) ~= 0 then
            v520 = true;
            l_console_0.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked to guarantee consistent behaviour across tests and client application. For example, with Jest: \njest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler");
            return;
        elseif l_ReactFeatureFlags_0.warnAboutUnmockedScheduler == true then
            v520 = true;
            l_console_0.error("Starting from React v18, the 'scheduler' module will need to be mocked to guarantee consistent behaviour across tests and client applications. For example, with Jest: \njest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler");
        end;
    end;
end;
computeThreadID = function(v522, v523) --[[ Line: 3751 ]] --[[ Name: computeThreadID ]]
    return v523 * 1000 + v522.interactionThreadID;
end;
v6.markSpawnedWork = function(v524) --[[ Line: 3759 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v172 (ref)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    elseif v172 == nil then
        v172 = {
            v524
        };
        return;
    else
        table.insert(v172, v524);
        return;
    end;
end;
scheduleInteractions = function(v525, v526, v527) --[[ Line: 3771 ]] --[[ Name: scheduleInteractions ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l___subscriberRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        if v527.size > 0 then
            local l_pendingInteractionMap_0 = v525.pendingInteractionMap;
            local v529 = l_pendingInteractionMap_0:get(v526);
            if v529 ~= nil then
                v527:forEach(function(v530) --[[ Line: 3784 ]]
                    -- upvalues: v529 (copy)
                    if not v529:has(v530) then
                        v530.__count = v530.__count + 1;
                    end;
                    v529:add(v530);
                end);
            else
                l_pendingInteractionMap_0:set(v526, l_Set_0.new(v527));
                for _, v532 in v527 do
                    v532.__count = v532.__count + 1;
                end;
            end;
            local l_current_5 = l___subscriberRef_0.current;
            if l_current_5 ~= nil then
                local v534 = computeThreadID(v525, v526);
                l_current_5.onWorkScheduled(v527, v534);
            end;
        end;
        return;
    end;
end;
v142.schedulePendingInteractions = function(v535, v536) --[[ Line: 3809 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        scheduleInteractions(v535, v536, l___interactionsRef_0.current);
        return;
    end;
end;
v142.startWorkOnPendingInteractions = function(v537, v538) --[[ Line: 3820 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l_includesSomeLane_0 (copy), l___subscriberRef_0 (copy), l_describeError_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local v539 = l_Set_0.new();
        v537.pendingInteractionMap:forEach(function(v540, v541) --[[ Line: 3830 ]]
            -- upvalues: l_includesSomeLane_0 (ref), v538 (copy), v539 (copy)
            if l_includesSomeLane_0(v538, v541) then
                v540:forEach(function(v542) --[[ Line: 3832 ]]
                    -- upvalues: v539 (ref)
                    v539:add(v542);
                end);
            end;
        end);
        v537.memoizedInteractions = v539;
        if v539.size > 0 then
            local l_current_6 = l___subscriberRef_0.current;
            if l_current_6 ~= nil then
                local v544 = computeThreadID(v537, v538);
                local v545, v546 = xpcall(l_current_6.onWorkStarted, l_describeError_0, v539, v544);
                if not v545 then
                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3854 ]]
                        -- upvalues: v546 (copy)
                        error(v546);
                    end);
                end;
            end;
        end;
        return;
    end;
end;
v142.finishPendingInteractions = function(v547, v548) --[[ Line: 3862 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___subscriberRef_0 (copy), l_describeError_0 (copy), l_includesSomeLane_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local l_pendingLanes_0 = v547.pendingLanes;
        local v550 = nil;
        local v551 = true;
        local v552 = nil;
        if v550 ~= nil and v547.memoizedInteractions.size > 0 then
            local v553 = computeThreadID(v547, v548);
            v550 = l___subscriberRef_0.current;
            local v554, v555 = xpcall(v550.onWorkStopped, l_describeError_0, v547.memoizedInteractions, v553);
            v551 = v554;
            v552 = v555;
        end;
        local l_pendingInteractionMap_1 = v547.pendingInteractionMap;
        l_pendingInteractionMap_1:forEach(function(v557, v558) --[[ Line: 3893 ]]
            -- upvalues: l_includesSomeLane_0 (ref), l_pendingLanes_0 (copy), l_pendingInteractionMap_1 (copy), v550 (ref), l_describeError_0 (ref), l_scheduleCallback_0 (ref), l_ImmediatePriority_0 (ref)
            if not l_includesSomeLane_0(l_pendingLanes_0, v558) then
                l_pendingInteractionMap_1:delete(v558);
                v557:forEach(function(v559) --[[ Line: 3899 ]]
                    -- upvalues: v550 (ref), l_describeError_0 (ref), l_scheduleCallback_0 (ref), l_ImmediatePriority_0 (ref)
                    v559.__count = v559.__count - 1;
                    if v550 ~= nil and v559.__count == 0 then
                        local v560, v561 = xpcall(v550.onInteractionScheduledWorkCompleted, l_describeError_0, v559);
                        if not v560 then
                            l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3910 ]]
                                -- upvalues: v561 (copy)
                                error(v561);
                            end);
                        end;
                    end;
                end);
            end;
        end);
        if not v551 then
            l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3922 ]]
                -- upvalues: v552 (ref)
                error(v552);
            end);
        end;
        return;
    end;
end;
local v562 = false;
local v563 = false;
local l_unstable_flushAllWithoutAsserting_0 = v10.unstable_flushAllWithoutAsserting;
local v565 = typeof(l_unstable_flushAllWithoutAsserting_0) == "function";
local function v573() --[[ Line: 3941 ]] --[[ Name: flushActWork ]]
    -- upvalues: l_unstable_flushAllWithoutAsserting_0 (copy), v562 (ref), l_describeError_0 (copy), v6 (copy)
    if l_unstable_flushAllWithoutAsserting_0 ~= nil then
        local l_v562_0 = v562;
        v562 = true;
        local v567, v568 = xpcall(l_unstable_flushAllWithoutAsserting_0, l_describeError_0);
        v562 = l_v562_0;
        if not v567 then
            error(v568);
            return;
        else
            return v568;
        end;
    else
        local l_v562_1 = v562;
        v562 = true;
        local v571, v572 = xpcall(function() --[[ Line: 3961 ]]
            -- upvalues: v6 (ref)
            local v570 = false;
            while v6.flushPassiveEffects() do
                v570 = true;
            end;
            return v570;
        end, l_describeError_0);
        v562 = l_v562_1;
        if not v571 then
            error(v572);
            return;
        else
            return v572;
        end;
    end;
end;
local function v574(v575) --[[ Line: 3980 ]] --[[ Name: flushWorkAndMicroTasks ]]
    -- upvalues: v573 (copy), l_describeError_0 (copy), l_enqueueTask_0 (copy), v574 (copy)
    local v576, v577 = xpcall(v573, l_describeError_0);
    if v576 then
        local v578, v579 = xpcall(l_enqueueTask_0, l_describeError_0, function() --[[ Line: 3984 ]]
            -- upvalues: v573 (ref), v574 (ref), v575 (copy)
            if v573() then
                v574(v575);
                return;
            else
                v575();
                return;
            end;
        end);
        v576 = v578;
        v577 = v579;
    end;
    if not v576 then
        v575(v577);
    end;
end;
v6.act = function(v580) --[[ Line: 3998 ]]
    -- upvalues: l___DEV___0 (copy), v1 (copy), v218 (ref), l_console_0 (copy), v217 (ref), l_IsSomeRendererActing_0 (copy), v6 (copy), v563 (ref), l_describeError_0 (copy), v99 (copy), v565 (copy), v574 (copy), v573 (copy)
    if not l___DEV___0 and not v1.__ROACT_17_MOCK_SCHEDULER__ and v218 == false then
        v218 = true;
        l_console_0.error("act(...) is not supported in production builds of React, and might not behave as expected.");
    end;
    local l_v217_0 = v217;
    v217 = v217 + 1;
    local l_current_7 = l_IsSomeRendererActing_0.current;
    local l_current_8 = v6.IsThisRendererActing.current;
    local l_v563_0 = v563;
    l_IsSomeRendererActing_0.current = true;
    v6.IsThisRendererActing.current = true;
    v563 = true;
    local function _() --[[ Line: 4023 ]] --[[ Name: onDone ]]
        -- upvalues: v217 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (copy), v6 (ref), l_current_8 (copy), v563 (ref), l_v563_0 (copy), l___DEV___0 (ref), l_v217_0 (copy), l_console_0 (ref)
        v217 = v217 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v6.IsThisRendererActing.current = l_current_8;
        v563 = l_v563_0;
        if l___DEV___0 and l_v217_0 < v217 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ");
        end;
    end;
    local v586, v587 = xpcall(v6.batchedUpdates, l_describeError_0, v580);
    if not v586 then
        v217 = v217 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v6.IsThisRendererActing.current = l_current_8;
        v563 = l_v563_0;
        if l___DEV___0 and l_v217_0 < v217 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ");
        end;
        error(v587);
    end;
    if v587 ~= nil and typeof(v587) == "table" and typeof(v587.andThen) == "function" then
        local v588 = false;
        if l___DEV___0 and typeof(v99) ~= nil then
            v99.resolve():andThen(function() --[[ Line: 4056 ]]

            end):andThen(function() --[[ Line: 4056 ]]
                -- upvalues: v588 (ref), l_console_0 (ref)
                if v588 == false then
                    l_console_0.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). This could lead to unexpected testing behaviour, interleaving multiple act calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);");
                end;
            end);
        end;
        return {
            andThen = function(_, v590, v591) --[[ Line: 4075 ]] --[[ Name: andThen ]]
                -- upvalues: v588 (ref), v587 (copy), v217 (ref), v565 (ref), l_current_7 (copy), l_IsSomeRendererActing_0 (ref), v6 (ref), l_current_8 (copy), v563 (ref), l_v563_0 (copy), l___DEV___0 (ref), l_v217_0 (copy), l_console_0 (ref), v574 (ref)
                v588 = true;
                return v587:andThen(function() --[[ Line: 4077 ]]
                    -- upvalues: v217 (ref), v565 (ref), l_current_7 (ref), l_IsSomeRendererActing_0 (ref), v6 (ref), l_current_8 (ref), v563 (ref), l_v563_0 (ref), l___DEV___0 (ref), l_v217_0 (ref), l_console_0 (ref), v590 (copy), v574 (ref), v591 (copy)
                    if v217 > 1 or v565 == true and l_current_7 == true then
                        v217 = v217 - 1;
                        l_IsSomeRendererActing_0.current = l_current_7;
                        v6.IsThisRendererActing.current = l_current_8;
                        v563 = l_v563_0;
                        if l___DEV___0 and l_v217_0 < v217 then
                            l_console_0.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ");
                        end;
                        v590();
                        return;
                    else
                        v574(function(v592) --[[ Line: 4091 ]]
                            -- upvalues: v217 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v6 (ref), l_current_8 (ref), v563 (ref), l_v563_0 (ref), l___DEV___0 (ref), l_v217_0 (ref), l_console_0 (ref), v591 (ref), v590 (ref)
                            v217 = v217 - 1;
                            l_IsSomeRendererActing_0.current = l_current_7;
                            v6.IsThisRendererActing.current = l_current_8;
                            v563 = l_v563_0;
                            if l___DEV___0 and l_v217_0 < v217 then
                                l_console_0.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ");
                            end;
                            if v592 then
                                v591(v592);
                                return;
                            else
                                v590();
                                return;
                            end;
                        end);
                        return;
                    end;
                end, function(v593) --[[ Line: 4099 ]]
                    -- upvalues: v217 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v6 (ref), l_current_8 (ref), v563 (ref), l_v563_0 (ref), l___DEV___0 (ref), l_v217_0 (ref), l_console_0 (ref), v591 (copy)
                    v217 = v217 - 1;
                    l_IsSomeRendererActing_0.current = l_current_7;
                    v6.IsThisRendererActing.current = l_current_8;
                    v563 = l_v563_0;
                    if l___DEV___0 and l_v217_0 < v217 then
                        l_console_0.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ");
                    end;
                    v591(v593);
                end);
            end
        };
    else
        if l___DEV___0 and v587 ~= nil then
            l_console_0.error("The callback passed to act(...) function must return nil, or a Promise. You returned %s", (tostring(v587)));
        end;
        local v594, v595 = xpcall(function() --[[ Line: 4118 ]]
            -- upvalues: v217 (ref), v565 (ref), l_current_7 (copy), v573 (ref), l_IsSomeRendererActing_0 (ref), v6 (ref), l_current_8 (copy), v563 (ref), l_v563_0 (copy), l___DEV___0 (ref), l_v217_0 (copy), l_console_0 (ref)
            if v217 == 1 and (v565 == false or l_current_7 == false) then
                v573();
            end;
            v217 = v217 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v6.IsThisRendererActing.current = l_current_8;
            v563 = l_v563_0;
            if l___DEV___0 and l_v217_0 < v217 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ");
            end;
        end, l_describeError_0);
        if not v594 then
            v217 = v217 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v6.IsThisRendererActing.current = l_current_8;
            v563 = l_v563_0;
            if l___DEV___0 and l_v217_0 < v217 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ");
            end;
            error(v595);
        end;
        return {
            andThen = function(_, v597, _) --[[ Line: 4138 ]] --[[ Name: andThen ]]
                -- upvalues: l___DEV___0 (ref), l_console_0 (ref)
                if l___DEV___0 then
                    l_console_0.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.");
                end;
                v597();
            end
        };
    end;
end;
v142.detachFiberAfterEffects = function(v599) --[[ Line: 4150 ]]
    -- upvalues: l_enableNewTreeCleanupPath_0 (copy), v142 (copy), l_deletedTreeCleanUpLevel_0 (copy), l___DEV___0 (copy)
    if l_enableNewTreeCleanupPath_0 then
        local l_alternate_8 = v599.alternate;
        if l_alternate_8 ~= nil then
            v599.alternate = nil;
            v142.detachFiberAfterEffects(l_alternate_8);
        end;
    end;
    if not l_enableNewTreeCleanupPath_0 or l_deletedTreeCleanUpLevel_0 < 2 then
        v599.child = nil;
        v599.deletions = nil;
        v599.dependencies = nil;
        v599.memoizedProps = nil;
        v599.memoizedState = nil;
        v599.pendingProps = nil;
        v599.sibling = nil;
        v599.stateNode = nil;
        v599.updateQueue = nil;
        if l___DEV___0 then
            v599._debugOwner = nil;
            return;
        end;
    else
        v599.child = nil;
        v599.deletions = nil;
        v599.sibling = nil;
        if l___DEV___0 then
            v599._debugOwner = nil;
        end;
        if l_deletedTreeCleanUpLevel_0 >= 3 then
            v599.return_ = nil;
            v599.dependencies = nil;
            v599.memoizedProps = nil;
            v599.memoizedState = nil;
            v599.pendingProps = nil;
            v599.stateNode = nil;
            v599.updateQueue = nil;
        end;
    end;
end;
return v6;