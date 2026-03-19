local function v1(v0) --[[ Line: 11 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local v2 = 0;
local function _(v3) --[[ Line: 25 ]] --[[ Name: isCallable ]]
    if typeof(v3) == "function" then
        return true;
    else
        if typeof(v3) == "table" then
            local v4 = getmetatable(v3);
            if v4 and rawget(v4, "__call") then
                return true;
            elseif v3._isMockFunction then
                return true;
            end;
        end;
        return false;
    end;
end;
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local v9 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v9.Error;
local l_Set_0 = v9.Set;
local l___DEV___0 = v7.__DEV__;
local l___YOLO___0 = v7.__YOLO__;
local v14 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v17 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local v20 = require(script.Parent.ReactHookEffectTags);
local l_unstable_wrap_0 = require(l_Parent_0.Scheduler).tracing.unstable_wrap;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local l_enableProfilerCommitHooks_0 = l_ReactFeatureFlags_0.enableProfilerCommitHooks;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local l_enableNewTreeCleanupPath_0 = l_ReactFeatureFlags_0.enableNewTreeCleanupPath;
local v29 = require(script.Parent.ReactWorkTags);
local l_FunctionComponent_0 = v29.FunctionComponent;
local l_ForwardRef_0 = v29.ForwardRef;
local l_ClassComponent_0 = v29.ClassComponent;
local l_HostRoot_0 = v29.HostRoot;
local l_HostComponent_0 = v29.HostComponent;
local l_HostText_0 = v29.HostText;
local l_HostPortal_0 = v29.HostPortal;
local l_Profiler_0 = v29.Profiler;
local l_SuspenseComponent_0 = v29.SuspenseComponent;
local l_DehydratedFragment_0 = v29.DehydratedFragment;
local l_IncompleteClassComponent_0 = v29.IncompleteClassComponent;
local l_MemoComponent_0 = v29.MemoComponent;
local l_SimpleMemoComponent_0 = v29.SimpleMemoComponent;
local l_SuspenseListComponent_0 = v29.SuspenseListComponent;
local l_FundamentalComponent_0 = v29.FundamentalComponent;
local l_ScopeComponent_0 = v29.ScopeComponent;
local l_Block_0 = v29.Block;
local l_OffscreenComponent_0 = v29.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v29.LegacyHiddenComponent;
local l_ReactErrorUtils_0 = require(l_Parent_0.Shared).ReactErrorUtils;
local l_invokeGuardedCallback_0 = l_ReactErrorUtils_0.invokeGuardedCallback;
local l_hasCaughtError_0 = l_ReactErrorUtils_0.hasCaughtError;
local l_clearCaughtError_0 = l_ReactErrorUtils_0.clearCaughtError;
local v53 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v53.NoFlags;
local l_ContentReset_0 = v53.ContentReset;
local l_Placement_0 = v53.Placement;
local l_Snapshot_0 = v53.Snapshot;
local l_Update_0 = v53.Update;
local l_Callback_0 = v53.Callback;
local l_LayoutMask_0 = v53.LayoutMask;
local l_PassiveMask_0 = v53.PassiveMask;
local l_Ref_0 = v53.Ref;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local v66 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v66.current;
local l_resetCurrentFiber_0 = v66.resetCurrentFiber;
local l_setCurrentFiber_0 = v66.setCurrentFiber;
local l_onCommitUnmount_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitUnmount;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v72 = require(script.Parent["ReactProfilerTimer.new"]);
local l_startLayoutEffectTimer_0 = v72.startLayoutEffectTimer;
local l_recordPassiveEffectDuration_0 = v72.recordPassiveEffectDuration;
local l_recordLayoutEffectDuration_0 = v72.recordLayoutEffectDuration;
local l_startPassiveEffectTimer_0 = v72.startPassiveEffectTimer;
local l_getCommitTime_0 = v72.getCommitTime;
local l_ProfileMode_0 = require(script.Parent.ReactTypeOfMode).ProfileMode;
local l_commitUpdateQueue_0 = v17.commitUpdateQueue;
local l_getPublicInstance_0 = v14.getPublicInstance;
local l_supportsMutation_0 = v14.supportsMutation;
local l_supportsPersistence_0 = v14.supportsPersistence;
local l_supportsHydration_0 = v14.supportsHydration;
local l_commitMount_0 = v14.commitMount;
local l_commitUpdate_0 = v14.commitUpdate;
local l_resetTextContent_0 = v14.resetTextContent;
local l_commitTextUpdate_0 = v14.commitTextUpdate;
local l_appendChild_0 = v14.appendChild;
local l_appendChildToContainer_0 = v14.appendChildToContainer;
local l_insertBefore_0 = v14.insertBefore;
local l_insertInContainerBefore_0 = v14.insertInContainerBefore;
local l_removeChild_0 = v14.removeChild;
local l_removeChildFromContainer_0 = v14.removeChildFromContainer;
local l_hideInstance_0 = v14.hideInstance;
local l_hideTextInstance_0 = v14.hideTextInstance;
local l_unhideInstance_0 = v14.unhideInstance;
local l_unhideTextInstance_0 = v14.unhideTextInstance;
local l_commitHydratedSuspenseInstance_0 = v14.commitHydratedSuspenseInstance;
local l_clearContainer_0 = v14.clearContainer;
local v100 = nil;
local function v103(v101, v102) --[[ Line: 196 ]] --[[ Name: resolveRetryWakeable ]]
    -- upvalues: v100 (ref)
    if not v100 then
        v100 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v100.resolveRetryWakeable(v101, v102);
end;
local function _() --[[ Line: 203 ]] --[[ Name: markCommitTimeOfFallback ]]
    -- upvalues: v100 (ref)
    if not v100 then
        v100 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v100.markCommitTimeOfFallback();
end;
local function v105() --[[ Line: 211 ]] --[[ Name: schedulePassiveEffectCallback ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback());
end;
local function v109(_, _, v108) --[[ Line: 219 ]] --[[ Name: captureCommitPhaseError ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle");
    error(v108);
end;
local l_NoFlags_1 = v20.NoFlags;
local l_HasEffect_0 = v20.HasEffect;
local l_Layout_0 = v20.Layout;
local l_Passive_0 = v20.Passive;
local v114 = nil;
local function v115() --[[ Line: 237 ]]
    -- upvalues: v114 (ref)
    if not v114 then
        v114 = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps;
    end;
    return v114;
end;
local v116 = nil;
local v117 = nil;
local v118 = nil;
local v119 = nil;
local v120 = nil;
local v121 = nil;
local v122 = nil;
local v123 = nil;
local v124 = nil;
local v125 = nil;
local v126 = nil;
local function v131(v127, v128) --[[ Line: 262 ]] --[[ Name: callComponentWillUnmountWithTimer ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_describeError_0 (copy), l_recordLayoutEffectDuration_0 (copy)
    v128.props = v127.memoizedProps;
    v128.state = v127.memoizedState;
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v127.mode, l_ProfileMode_0) ~= 0 then
        local v129, v130 = xpcall(function() --[[ Line: 271 ]]
            -- upvalues: l_startLayoutEffectTimer_0 (ref), v128 (copy)
            l_startLayoutEffectTimer_0();
            v128:componentWillUnmount();
        end, l_describeError_0);
        l_recordLayoutEffectDuration_0(v127);
        if not v129 then
            error(v130);
            return;
        end;
    else
        v128:componentWillUnmount();
    end;
end;
safelyCallComponentWillUnmount = function(v132, v133, v134) --[[ Line: 289 ]] --[[ Name: safelyCallComponentWillUnmount ]]
    -- upvalues: v131 (copy), l_describeError_0 (copy), v109 (ref)
    local v135, v136 = xpcall(v131, l_describeError_0, v132, v133);
    if not v135 then
        v109(v132, v134, v136);
    end;
end;
local function _(v137, v138) --[[ Line: 303 ]] --[[ Name: safelyDetachRef ]]
    -- upvalues: l_describeError_0 (copy), v109 (ref)
    local l_ref_0 = v137.ref;
    if l_ref_0 ~= nil then
        if typeof(l_ref_0) == "function" then
            local v140, v141 = xpcall(l_ref_0, l_describeError_0);
            if not v140 then
                v109(v137, v138, v141);
                return;
            end;
        else
            l_ref_0.current = nil;
        end;
    end;
end;
local function v148(v143, v144, v145) --[[ Line: 319 ]] --[[ Name: safelyCallDestroy ]]
    -- upvalues: l_describeError_0 (copy), v109 (ref)
    local v146, v147 = xpcall(v145, l_describeError_0);
    if not v146 then
        v109(v143, v144, v147);
    end;
end;
local function v156(v149, v150) --[[ Line: 331 ]] --[[ Name: commitBeforeMutationLifeCycles ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ClassComponent_0 (copy), l_Snapshot_0 (copy), l___DEV___0 (copy), v115 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resolveDefaultProps_0 (copy), l_HostRoot_0 (copy), l_supportsMutation_0 (copy), l_clearContainer_0 (copy), l_HostComponent_0 (copy), l_HostText_0 (copy), l_HostPortal_0 (copy), l_IncompleteClassComponent_0 (copy), l_invariant_0 (copy)
    if v150.tag == l_FunctionComponent_0 or v150.tag == l_ForwardRef_0 or v150.tag == l_SimpleMemoComponent_0 or v150.tag == l_Block_0 then
        return;
    elseif v150.tag == l_ClassComponent_0 then
        if bit32.band(v150.flags, l_Snapshot_0) ~= 0 and v149 ~= nil then
            local l_memoizedProps_0 = v149.memoizedProps;
            local l_memoizedState_0 = v149.memoizedState;
            local l_stateNode_0 = v150.stateNode;
            if l___DEV___0 and v150.type == v150.elementType and not v115 then
                if l_stateNode_0.props ~= v150.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", l_getComponentName_0(v150.type) or "instance");
                end;
                if l_stateNode_0.state ~= v150.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", l_getComponentName_0(v150.type) or "instance");
                end;
            end;
            local v154 = l_stateNode_0:getSnapshotBeforeUpdate(v150.elementType == v150.type and l_memoizedProps_0 or l_resolveDefaultProps_0(v150.type, l_memoizedProps_0), l_memoizedState_0);
            if l___DEV___0 then

            end;
            l_stateNode_0.__reactInternalSnapshotBeforeUpdate = v154;
        end;
        return;
    elseif v150.tag == l_HostRoot_0 then
        if l_supportsMutation_0 and bit32.band(v150.flags, l_Snapshot_0) ~= 0 then
            local l_stateNode_1 = v150.stateNode;
            l_clearContainer_0(l_stateNode_1.containerInfo);
        end;
        return;
    elseif v150.tag == l_HostComponent_0 or v150.tag == l_HostText_0 or v150.tag == l_HostPortal_0 or v150.tag == l_IncompleteClassComponent_0 then
        return;
    else
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
local function v167(v157, v158, v159) --[[ Line: 424 ]] --[[ Name: commitHookEffectListUnmount ]]
    -- upvalues: l_describeError_0 (copy), v109 (ref)
    local l_updateQueue_0 = v158.updateQueue;
    local v161 = nil;
    if l_updateQueue_0 ~= nil then
        v161 = l_updateQueue_0.lastEffect;
    end;
    if v161 ~= nil then
        local l_next_0 = v161.next;
        local l_l_next_0_0 = l_next_0;
        repeat
            if bit32.band(l_l_next_0_0.tag, v157) == v157 then
                local l_destroy_0 = l_l_next_0_0.destroy;
                l_l_next_0_0.destroy = nil;
                if l_destroy_0 ~= nil then
                    local v165, v166 = xpcall(l_destroy_0, l_describeError_0);
                    if not v165 then
                        v109(v158, v159, v166);
                    end;
                end;
            end;
            l_l_next_0_0 = l_l_next_0_0.next;
        until l_l_next_0_0 == l_next_0;
    end;
end;
local function v176(v168, v169) --[[ Line: 452 ]] --[[ Name: commitHookEffectListMount ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy)
    local l_updateQueue_1 = v169.updateQueue;
    local v171 = if l_updateQueue_1 ~= nil then l_updateQueue_1.lastEffect else nil;
    if v171 ~= nil then
        local l_next_1 = v171.next;
        local l_l_next_1_0 = l_next_1;
        repeat
            if bit32.band(l_l_next_1_0.tag, v168) == v168 then
                l_l_next_1_0.destroy = l_l_next_1_0.create();
                if l___DEV___0 then
                    local l_destroy_1 = l_l_next_1_0.destroy;
                    if l_destroy_1 ~= nil and typeof(l_destroy_1) ~= "function" then
                        local v175 = nil;
                        v175 = l_destroy_1 == nil and " You returned nil. If your effect does not require clean up, return nil (or nothing)." or typeof(l_destroy_1.andThen) == "function" and "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. Instead, write the async function inside your effect and call it immediately:\n\nuseEffect(function()\n  function fetchData()\n    -- You can await here\n    local response = MyAPI.getData(someId):await()\n    -- ...\n  end\n  fetchData()\nend, {someId}) -- Or {} if effect doesn't need props or state\n\nLearn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" or " You returned: " .. l_destroy_1;
                        l_console_0.error("An effect function must not return anything besides a function, which is used for clean-up.%s", v175);
                    end;
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == l_next_1;
    end;
end;
commitProfilerPassiveEffect = function(v177, v178) --[[ Line: 492 ]] --[[ Name: commitProfilerPassiveEffect ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_Profiler_0 (copy), l_getCommitTime_0 (copy), l_enableSchedulerTracing_0 (copy)
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and v178.tag == l_Profiler_0 then
        local l_passiveEffectDuration_0 = v178.stateNode.passiveEffectDuration;
        local l_id_0 = v178.memoizedProps.id;
        local l_onPostCommit_0 = v178.memoizedProps.onPostCommit;
        local v182 = l_getCommitTime_0();
        if typeof(l_onPostCommit_0) == "function" then
            if l_enableSchedulerTracing_0 then
                l_onPostCommit_0(l_id_0, v178.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v182, v177.memoizedInteractions);
                return;
            else
                l_onPostCommit_0(l_id_0, v178.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v182);
            end;
        end;
    end;
end;
local function v183(v184, v185, v186, v187) --[[ Line: 525 ]] --[[ Name: recursivelyCommitLayoutEffects ]]
    -- upvalues: v109 (ref), v105 (ref), l_Profiler_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), v126 (ref), l_LayoutMask_0 (copy), l_NoFlags_0 (copy), l___DEV___0 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), v183 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy), l_describeError_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), v66 (copy), v2 (ref), l___YOLO___0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v176 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_PassiveMask_0 (copy), l_ClassComponent_0 (copy), v122 (ref), l_HostRoot_0 (copy), v120 (ref), l_HostComponent_0 (copy), v121 (ref), l_SuspenseComponent_0 (copy), l_FundamentalComponent_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), l_IncompleteClassComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), l_OffscreenComponent_0 (copy), l_ScopeComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_invariant_0 (copy), l_Ref_0 (copy)
    if v186 ~= nil then
        v109 = v186;
    end;
    if v187 ~= nil then
        v105 = v187;
    end;
    local l_flags_0 = v184.flags;
    local l_tag_0 = v184.tag;
    if l_tag_0 == l_Profiler_0 then
        local v190 = nil;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            v190 = v126;
            v126 = v184;
        end;
        local l_child_0 = v184.child;
        while l_child_0 ~= nil do
            if bit32.band(v184.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if l___DEV___0 then
                    local l_l_current_0_0 = l_current_0;
                    l_setCurrentFiber_0(l_child_0);
                    l_invokeGuardedCallback_0(nil, v183, nil, l_child_0, v185, v109, v105);
                    if l_hasCaughtError_0() then
                        local v193 = l_clearCaughtError_0();
                        v109(l_child_0, v184, v193);
                    end;
                    if l_l_current_0_0 ~= nil then
                        l_setCurrentFiber_0(l_l_current_0_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local v194, v195 = xpcall(v183, l_describeError_0, l_child_0, v185, v109, v105);
                    if not v194 then
                        v109(l_child_0, v184, v195);
                    end;
                end;
            end;
            l_child_0 = l_child_0.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 and l_enableProfilerTimer_0 then
            if l___DEV___0 then
                local l_l_current_0_1 = l_current_0;
                l_setCurrentFiber_0(v184);
                l_invokeGuardedCallback_0(nil, commitLayoutEffectsForProfiler, nil, v184, v185);
                if l_hasCaughtError_0() then
                    local v197 = l_clearCaughtError_0();
                    v109(v184, v184.return_, v197);
                end;
                if l_l_current_0_1 ~= nil then
                    l_setCurrentFiber_0(l_l_current_0_1);
                else
                    l_resetCurrentFiber_0();
                end;
            else
                local v198, v199 = xpcall(commitLayoutEffectsForProfiler, l_describeError_0, v184, v185);
                if not v198 then
                    v109(v184, v184.return_, v199);
                end;
            end;
        end;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            if v190 ~= nil then
                local l_stateNode_2 = v190.stateNode;
                l_stateNode_2.effectDuration = l_stateNode_2.effectDuration + v184.stateNode.effectDuration;
            end;
            v126 = v190;
            return;
        end;
    else
        local l_child_1 = v184.child;
        while l_child_1 ~= nil do
            if bit32.band(v184.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if l___DEV___0 then
                    local l_current_1 = v66.current;
                    l_setCurrentFiber_0(l_child_1);
                    if v2 < 20 then
                        v2 = v2 + 1;
                        l_invokeGuardedCallback_0(nil, v183, nil, l_child_1, v185, v109, v105);
                        v2 = v2 - 1;
                        if l_hasCaughtError_0() then
                            local v203 = l_clearCaughtError_0();
                            v109(l_child_1, v184, v203);
                        end;
                    else
                        v183(l_child_1, v185, v109, v105);
                    end;
                    if l_current_1 ~= nil then
                        l_setCurrentFiber_0(l_current_1);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local v204 = nil;
                    local v205 = nil;
                    if not l___YOLO___0 and v2 < 20 then
                        v2 = v2 + 1;
                        local v206, v207 = xpcall(v183, l_describeError_0, l_child_1, v185, v109, v105);
                        v204 = v206;
                        v205 = v207;
                        v2 = v2 - 1;
                    else
                        v204 = true;
                        v183(l_child_1, v185, v109, v105);
                    end;
                    if not v204 then
                        v109(l_child_1, v184, v205);
                    end;
                end;
            end;
            l_child_1 = l_child_1.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 then
            if l_tag_0 == l_FunctionComponent_0 or l_tag_0 == l_ForwardRef_0 or l_tag_0 == l_SimpleMemoComponent_0 or l_tag_0 == l_Block_0 then
                if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v184.mode, l_ProfileMode_0) ~= 0 then
                    local v208, v209 = xpcall(function() --[[ Line: 747 ]]
                        -- upvalues: l_startLayoutEffectTimer_0 (ref), v176 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v184 (copy)
                        l_startLayoutEffectTimer_0();
                        v176(bit32.bor(l_Layout_0, l_HasEffect_0), v184);
                    end, l_describeError_0);
                    l_recordLayoutEffectDuration_0(v184);
                    if not v208 then
                        error(v209);
                    end;
                else
                    v176(bit32.bor(l_Layout_0, l_HasEffect_0), v184);
                end;
                if bit32.band(v184.subtreeFlags, l_PassiveMask_0) ~= l_NoFlags_0 then
                    v105();
                end;
            elseif l_tag_0 == l_ClassComponent_0 then
                v122(v184);
            elseif l_tag_0 == l_HostRoot_0 then
                v120(v184);
            elseif l_tag_0 == l_HostComponent_0 then
                v121(v184);
            elseif l_tag_0 == l_SuspenseComponent_0 then
                commitSuspenseHydrationCallbacks(v185, v184);
            elseif l_tag_0 ~= l_FundamentalComponent_0 and l_tag_0 ~= l_HostPortal_0 and l_tag_0 ~= l_HostText_0 and l_tag_0 ~= l_IncompleteClassComponent_0 and l_tag_0 ~= l_LegacyHiddenComponent_0 and l_tag_0 ~= l_OffscreenComponent_0 and l_tag_0 ~= l_ScopeComponent_0 and l_tag_0 ~= l_SuspenseListComponent_0 then
                l_invariant_0(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.");
            end;
        end;
        if bit32.band(l_flags_0, l_Ref_0) ~= 0 then
            commitAttachRef(v184);
        end;
    end;
end;
commitLayoutEffectsForProfiler = function(v210, v211) --[[ Line: 812 ]] --[[ Name: commitLayoutEffectsForProfiler ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_getCommitTime_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), l_NoFlags_0 (copy), l_enableSchedulerTracing_0 (copy), l_enableProfilerCommitHooks_0 (copy)
    local v212 = false;
    local v213 = false;
    if l_enableProfilerTimer_0 then
        local l_flags_1 = v210.flags;
        local l_alternate_0 = v210.alternate;
        local l_onCommit_0 = v210.memoizedProps.onCommit;
        local l_onRender_0 = v210.memoizedProps.onRender;
        local l_effectDuration_0 = v210.stateNode.effectDuration;
        local v219 = l_getCommitTime_0();
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Callback_0_0 = l_Callback_0;
        if bit32.band(l_flags_1, l_l_Update_0_0) ~= l_NoFlags_0 then
            local v222;
            if typeof(l_onRender_0) == "function" then
                v222 = true;
            else
                if typeof(l_onRender_0) == "table" then
                    local v223 = getmetatable(l_onRender_0);
                    if v223 and rawget(v223, "__call") then
                        v222 = true;
                        v212 = true;
                    elseif l_onRender_0._isMockFunction then
                        v222 = true;
                        v212 = true;
                    end;
                end;
                if not v212 then
                    if not v212 then
                        v222 = false;
                    end;
                end;
            end;
            v212 = false;
            if v222 then
                if l_enableSchedulerTracing_0 then
                    l_onRender_0(v210.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v210.actualDuration, v210.treeBaseDuration, v210.actualStartTime, v219, v211.memoizedInteractions);
                else
                    l_onRender_0(v210.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v210.actualDuration, v210.treeBaseDuration, v210.actualStartTime, v219);
                end;
            end;
        end;
        if l_enableProfilerCommitHooks_0 and bit32.band(l_flags_1, l_l_Callback_0_0) ~= l_NoFlags_0 then
            local v224;
            if typeof(l_onCommit_0) == "function" then
                v224 = true;
            else
                if typeof(l_onCommit_0) == "table" then
                    local v225 = getmetatable(l_onCommit_0);
                    if v225 and rawget(v225, "__call") then
                        v224 = true;
                        v213 = true;
                    elseif l_onCommit_0._isMockFunction then
                        v224 = true;
                        v213 = true;
                    end;
                end;
                if not v213 then
                    if not v213 then
                        v224 = false;
                    end;
                end;
            end;
            v213 = false;
            if v224 then
                if l_enableSchedulerTracing_0 then
                    l_onCommit_0(v210.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v219, v211.memoizedInteractions);
                    return;
                else
                    l_onCommit_0(v210.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v219);
                end;
            end;
        end;
    end;
end;
v122 = function(v226) --[[ Line: 880 ]] --[[ Name: commitLayoutEffectsForClassComponent ]]
    -- upvalues: l_Update_0 (copy), l___DEV___0 (copy), v115 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_describeError_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_resolveDefaultProps_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_stateNode_3 = v226.stateNode;
    local l_alternate_1 = v226.alternate;
    if bit32.band(v226.flags, l_Update_0) ~= 0 then
        if l_alternate_1 == nil then
            if l___DEV___0 and v226.type == v226.elementType and not v115 then
                if l_stateNode_3.props ~= v226.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", l_getComponentName_0(v226.type) or "instance");
                end;
                if l_stateNode_3.state ~= v226.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", l_getComponentName_0(v226.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v226.mode, l_ProfileMode_0) ~= 0 then
                local v229, v230 = xpcall(function() --[[ Line: 920 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidMount();
                end, l_describeError_0);
                l_recordLayoutEffectDuration_0(v226);
                if not v229 then
                    error(v230);
                end;
            else
                l_stateNode_3:componentDidMount();
            end;
        else
            local v231 = v226.elementType == v226.type and l_alternate_1.memoizedProps or l_resolveDefaultProps_0(v226.type, l_alternate_1.memoizedProps);
            local l_memoizedState_1 = l_alternate_1.memoizedState;
            if l___DEV___0 and v226.type == v226.elementType and not v115 then
                if l_stateNode_3.props ~= v226.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", l_getComponentName_0(v226.type) or "instance");
                end;
                if l_stateNode_3.state ~= v226.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", l_getComponentName_0(v226.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v226.mode, l_ProfileMode_0) ~= 0 then
                local l_v231_0 = v231 --[[ copy: 3 -> 7 ]];
                local v234, v235 = xpcall(function() --[[ Line: 974 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy), l_v231_0 (copy), l_memoizedState_1 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidUpdate(l_v231_0, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
                end, l_describeError_0);
                l_recordLayoutEffectDuration_0(v226);
                if not v234 then
                    error(v235);
                end;
            else
                l_stateNode_3:componentDidUpdate(v231, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
            end;
        end;
    end;
    local l_updateQueue_2 = v226.updateQueue;
    if l_updateQueue_2 ~= nil then
        if l___DEV___0 and v226.type == v226.elementType and not v115 then
            if l_stateNode_3.props ~= v226.memoizedProps then
                l_console_0.error("Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.", l_getComponentName_0(v226.type) or "instance");
            end;
            if l_stateNode_3.state ~= v226.memoizedState then
                l_console_0.error("Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.", l_getComponentName_0(v226.type) or "instance");
            end;
        end;
        l_commitUpdateQueue_0(v226, l_updateQueue_2, l_stateNode_3);
    end;
end;
v120 = function(v237) --[[ Line: 1037 ]] --[[ Name: commitLayoutEffectsForHostRoot ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l_ClassComponent_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_updateQueue_3 = v237.updateQueue;
    if l_updateQueue_3 ~= nil then
        local v239 = nil;
        if v237.child ~= nil then
            local l_child_2 = v237.child;
            if l_child_2.tag == l_HostComponent_0 then
                v239 = l_getPublicInstance_0(l_child_2.stateNode);
            elseif l_child_2.tag == l_ClassComponent_0 then
                v239 = l_child_2.stateNode;
            end;
        end;
        l_commitUpdateQueue_0(v237, l_updateQueue_3, v239);
    end;
end;
v121 = function(v241) --[[ Line: 1056 ]] --[[ Name: commitLayoutEffectsForHostComponent ]]
    -- upvalues: l_Update_0 (copy), l_commitMount_0 (copy)
    local l_stateNode_4 = v241.stateNode;
    if v241.alternate == nil and bit32.band(v241.flags, l_Update_0) ~= 0 then
        local l_type_0 = v241.type;
        local l_memoizedProps_1 = v241.memoizedProps;
        l_commitMount_0(l_stateNode_4, l_type_0, l_memoizedProps_1, v241);
    end;
end;
local function v250(v245, v246) --[[ Line: 1071 ]] --[[ Name: hideOrUnhideAllChildren ]]
    -- upvalues: l_supportsMutation_0 (copy), l_HostComponent_0 (copy), l_hideInstance_0 (copy), l_unhideInstance_0 (copy), l_HostText_0 (copy), l_hideTextInstance_0 (copy), l_unhideTextInstance_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy)
    if l_supportsMutation_0 then
        local l_v245_0 = v245;
        while true do
            if l_v245_0.tag == l_HostComponent_0 then
                local l_stateNode_5 = l_v245_0.stateNode;
                if v246 then
                    l_hideInstance_0(l_stateNode_5);
                else
                    l_unhideInstance_0(l_v245_0.stateNode, l_v245_0.memoizedProps);
                end;
            elseif l_v245_0.tag == l_HostText_0 then
                local l_stateNode_6 = l_v245_0.stateNode;
                if v246 then
                    l_hideTextInstance_0(l_stateNode_6);
                else
                    l_unhideTextInstance_0(l_stateNode_6, l_v245_0.memoizedProps);
                end;
            elseif (l_v245_0.tag ~= l_OffscreenComponent_0 and l_v245_0.tag ~= l_LegacyHiddenComponent_0 or l_v245_0.memoizedState == nil or l_v245_0 == v245) and l_v245_0.child ~= nil then
                l_v245_0.child.return_ = l_v245_0;
                l_v245_0 = l_v245_0.child;
                continue;
            end;
            if l_v245_0 == v245 then
                return;
            else
                while true do
                    if l_v245_0.sibling == nil then
                        if l_v245_0.return_ == nil or l_v245_0.return_ == v245 then
                            return;
                        else
                            l_v245_0 = l_v245_0.return_;
                        end;
                    else
                        l_v245_0.sibling.return_ = l_v245_0.return_;
                        l_v245_0 = l_v245_0.sibling;
                        break;
                    end;
                end;
            end;
        end;
    else
        return;
    end;
end;
commitAttachRef = function(v251) --[[ Line: 1121 ]] --[[ Name: commitAttachRef ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l___DEV___0 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    local l_ref_1 = v251.ref;
    if l_ref_1 ~= nil then
        local l_stateNode_7 = v251.stateNode;
        local v254 = nil;
        v254 = if v251.tag == l_HostComponent_0 then l_getPublicInstance_0(l_stateNode_7) else l_stateNode_7;
        if typeof(l_ref_1) == "function" then
            l_ref_1(v254);
            return;
        elseif l___DEV___0 and typeof(l_ref_1) ~= "table" then
            l_console_0.error("Unexpected ref object provided for %s. Use either a ref-setter function or React.createRef().", l_getComponentName_0(v251.type) or "instance");
            return;
        else
            l_ref_1.current = v254;
        end;
    end;
end;
commitDetachRef = function(v255) --[[ Line: 1160 ]] --[[ Name: commitDetachRef ]]
    local l_ref_2 = v255.ref;
    if l_ref_2 ~= nil then
        if typeof(l_ref_2) == "function" then
            l_ref_2(nil);
            return;
        else
            l_ref_2.current = nil;
        end;
    end;
end;
v125 = function(v257, v258, v259, v260) --[[ Line: 1174 ]] --[[ Name: commitUnmount ]]
    -- upvalues: l_onCommitUnmount_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_Layout_0 (copy), l_NoFlags_1 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_describeError_0 (copy), v109 (ref), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_HostPortal_0 (copy), l_supportsMutation_0 (copy), v123 (ref), l_supportsPersistence_0 (copy), v1 (copy)
    l_onCommitUnmount_0(v258);
    if v258.tag == l_FunctionComponent_0 or v258.tag == l_ForwardRef_0 or v258.tag == l_MemoComponent_0 or v258.tag == l_SimpleMemoComponent_0 or v258.tag == l_Block_0 then
        local l_updateQueue_4 = v258.updateQueue;
        if l_updateQueue_4 ~= nil then
            local l_lastEffect_0 = l_updateQueue_4.lastEffect;
            if l_lastEffect_0 ~= nil then
                local l_next_2 = l_lastEffect_0.next;
                local l_l_next_2_0 = l_next_2;
                repeat
                    if l_l_next_2_0.destroy ~= nil and bit32.band(l_l_next_2_0.tag, l_Layout_0) ~= l_NoFlags_1 then
                        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v258.mode, l_ProfileMode_0) ~= 0 then
                            l_startLayoutEffectTimer_0();
                            local l_destroy_2 = l_l_next_2_0.destroy;
                            local v266, v267 = xpcall(l_destroy_2, l_describeError_0);
                            if not v266 then
                                v109(v258, v259, v267);
                            end;
                            l_recordLayoutEffectDuration_0(v258);
                        else
                            local l_destroy_3 = l_l_next_2_0.destroy;
                            local v269, v270 = xpcall(l_destroy_3, l_describeError_0);
                            if not v269 then
                                v109(v258, v259, v270);
                            end;
                        end;
                    end;
                    l_l_next_2_0 = l_l_next_2_0.next;
                until l_l_next_2_0 == l_next_2;
            end;
        end;
        return;
    elseif v258.tag == l_ClassComponent_0 then
        local l_ref_3 = v258.ref;
        if l_ref_3 ~= nil then
            if typeof(l_ref_3) == "function" then
                local v272, v273 = xpcall(l_ref_3, l_describeError_0);
                if not v272 then
                    v109(v258, v259, v273);
                end;
            else
                l_ref_3.current = nil;
            end;
        end;
        l_ref_3 = v258.stateNode;
        if typeof(l_ref_3.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v258, l_ref_3, v259);
        end;
        return;
    elseif v258.tag == l_HostComponent_0 then
        local l_ref_4 = v258.ref;
        if l_ref_4 ~= nil then
            if typeof(l_ref_4) == "function" then
                local v275, v276 = xpcall(l_ref_4, l_describeError_0);
                if not v275 then
                    v109(v258, v259, v276);
                    return;
                end;
            else
                l_ref_4.current = nil;
            end;
        end;
        return;
    elseif v258.tag == l_HostPortal_0 then
        if l_supportsMutation_0 then
            v123(v257, v258, v259, v260);
            return;
        else
            if l_supportsPersistence_0 then
                v1("emptyPortalContainer");
            end;
            return;
        end;
    else
        return;
    end;
end;
v124 = function(v277, v278, v279, v280) --[[ Line: 1281 ]] --[[ Name: commitNestedUnmounts ]]
    -- upvalues: v125 (ref), l_supportsMutation_0 (copy), l_HostPortal_0 (copy)
    local l_v278_0 = v278;
    while true do
        v125(v277, l_v278_0, v279, v280);
        if l_v278_0.child ~= nil and (not l_supportsMutation_0 or l_v278_0.tag ~= l_HostPortal_0) then
            l_v278_0.child.return_ = l_v278_0;
            l_v278_0 = l_v278_0.child;
            continue;
        end;
        if l_v278_0 == v278 then
            return;
        else
            while true do
                if l_v278_0.sibling == nil then
                    if l_v278_0.return_ == nil or l_v278_0.return_ == v278 then
                        return;
                    else
                        l_v278_0 = l_v278_0.return_;
                    end;
                else
                    l_v278_0.sibling.return_ = l_v278_0.return_;
                    l_v278_0 = l_v278_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function _(v282) --[[ Line: 1321 ]] --[[ Name: detachFiberMutation ]]
    -- upvalues: l_enableNewTreeCleanupPath_0 (copy)
    local l_alternate_2 = v282.alternate;
    if l_alternate_2 ~= nil then
        l_alternate_2.return_ = nil;
        if not l_enableNewTreeCleanupPath_0 then
            v282.alternate = nil;
        end;
    end;
    v282.return_ = nil;
end;
local function v287(v285) --[[ Line: 1390 ]] --[[ Name: getHostParentFiber ]]
    -- upvalues: v116 (ref), l_Error_0 (copy)
    local l_return__0 = v285.return_;
    while true do
        if l_return__0 ~= nil then
            if v116(l_return__0) then
                return l_return__0;
            else
                l_return__0 = l_return__0.return_;
            end;
        else
            error(l_Error_0.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."));
            return;
        end;
    end;
end;
v116 = function(v288) --[[ Line: 1408 ]] --[[ Name: isHostParent ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy)
    local v289 = true;
    if v288.tag ~= l_HostComponent_0 then
        v289 = true;
        if v288.tag ~= l_HostRoot_0 then
            v289 = v288.tag == l_HostPortal_0;
        end;
    end;
    return v289;
end;
v117 = function(v290) --[[ Line: 1412 ]] --[[ Name: getHostSibling ]]
    -- upvalues: v116 (ref), l_HostComponent_0 (copy), l_HostText_0 (copy), l_DehydratedFragment_0 (copy), l_Placement_0 (copy), l_HostPortal_0 (copy)
    local l_v290_0 = v290;
    while true do
        local v292 = false;
        while true do
            if l_v290_0.sibling == nil then
                if l_v290_0.return_ == nil or v116(l_v290_0.return_) then
                    return nil;
                else
                    l_v290_0 = l_v290_0.return_;
                end;
            else
                l_v290_0.sibling.return_ = l_v290_0.return_;
                l_v290_0 = l_v290_0.sibling;
                while l_v290_0.tag ~= l_HostComponent_0 and l_v290_0.tag ~= l_HostText_0 and l_v290_0.tag ~= l_DehydratedFragment_0 do
                    if bit32.band(l_v290_0.flags, l_Placement_0) ~= 0 then
                        v292 = true;
                        break;
                    elseif l_v290_0.child == nil or l_v290_0.tag == l_HostPortal_0 then
                        v292 = true;
                        break;
                    else
                        l_v290_0.child.return_ = l_v290_0;
                        l_v290_0 = l_v290_0.child;
                    end;
                end;
                if not v292 and bit32.band(l_v290_0.flags, l_Placement_0) == 0 then
                    return l_v290_0.stateNode;
                else
                    break;
                end;
            end;
        end;
    end;
end;
local function v299(v293) --[[ Line: 1466 ]] --[[ Name: commitPlacement ]]
    -- upvalues: l_supportsMutation_0 (copy), v287 (copy), l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_invariant_0 (copy), l_ContentReset_0 (copy), l_resetTextContent_0 (copy), v117 (ref), v119 (ref), v118 (ref)
    if not l_supportsMutation_0 then
        return;
    else
        local v294 = v287(v293);
        local v295 = nil;
        local v296 = nil;
        local l_stateNode_8 = v294.stateNode;
        if v294.tag == l_HostComponent_0 then
            v295 = l_stateNode_8;
            v296 = false;
        elseif v294.tag == l_HostRoot_0 then
            v295 = l_stateNode_8.containerInfo;
            v296 = true;
        elseif v294.tag == l_HostPortal_0 then
            v295 = l_stateNode_8.containerInfo;
            v296 = true;
        else
            l_invariant_0(false, "Invalid host parent fiber. This error is likely caused by a bug in React. Please file an issue.");
        end;
        if bit32.band(v294.flags, l_ContentReset_0) ~= 0 then
            l_resetTextContent_0(v295);
            v294.flags = bit32.band(v294.flags, (bit32.bnot(l_ContentReset_0)));
        end;
        local v298 = v117(v293);
        if v296 then
            v119(v293, v298, v295);
            return;
        else
            v118(v293, v298, v295);
            return;
        end;
    end;
end;
v119 = function(v300, v301, v302) --[[ Line: 1517 ]] --[[ Name: insertOrAppendPlacementNodeIntoContainer ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertInContainerBefore_0 (copy), l_appendChildToContainer_0 (copy), l_HostPortal_0 (copy), v119 (ref)
    local l_tag_1 = v300.tag;
    local v304 = true;
    if l_tag_1 ~= l_HostComponent_0 then
        v304 = l_tag_1 == l_HostText_0;
    end;
    if v304 then
        local l_stateNode_9 = v300.stateNode;
        if v301 then
            l_insertInContainerBefore_0(v302, l_stateNode_9, v301);
            return;
        else
            l_appendChildToContainer_0(v302, l_stateNode_9);
            return;
        end;
    elseif l_tag_1 == l_HostPortal_0 then
        return;
    else
        local l_child_3 = v300.child;
        if l_child_3 ~= nil then
            v119(l_child_3, v301, v302);
            local l_sibling_0 = l_child_3.sibling;
            while l_sibling_0 ~= nil do
                v119(l_sibling_0, v301, v302);
                l_sibling_0 = l_sibling_0.sibling;
            end;
        end;
        return;
    end;
end;
v118 = function(v308, v309, v310) --[[ Line: 1549 ]] --[[ Name: insertOrAppendPlacementNode ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertBefore_0 (copy), l_appendChild_0 (copy), l_HostPortal_0 (copy), v118 (ref)
    local l_tag_2 = v308.tag;
    local v312 = true;
    if l_tag_2 ~= l_HostComponent_0 then
        v312 = l_tag_2 == l_HostText_0;
    end;
    if v312 then
        local l_stateNode_10 = v308.stateNode;
        if v309 then
            l_insertBefore_0(v310, l_stateNode_10, v309);
            return;
        else
            l_appendChild_0(v310, l_stateNode_10);
            return;
        end;
    elseif l_tag_2 == l_HostPortal_0 then
        return;
    else
        local l_child_4 = v308.child;
        if l_child_4 ~= nil then
            v118(l_child_4, v309, v310);
            local l_sibling_1 = l_child_4.sibling;
            while l_sibling_1 ~= nil do
                v118(l_sibling_1, v309, v310);
                l_sibling_1 = l_sibling_1.sibling;
            end;
        end;
        return;
    end;
end;
v123 = function(v316, v317, v318, v319) --[[ Line: 1577 ]] --[[ Name: unmountHostComponents ]]
    -- upvalues: l_Error_0 (copy), l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), v124 (ref), l_removeChildFromContainer_0 (copy), l_removeChild_0 (copy), v125 (ref)
    local l_v317_0 = v317;
    local v321 = false;
    local v322 = nil;
    local v323 = nil;
    while true do
        if not v321 then
            local l_return__1 = l_v317_0.return_;
            while true do
                if l_return__1 == nil then
                    error(l_Error_0.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."));
                end;
                local l_stateNode_11 = l_return__1.stateNode;
                if l_return__1.tag == l_HostComponent_0 then
                    v322 = l_stateNode_11;
                    v323 = false;
                    break;
                elseif l_return__1.tag == l_HostRoot_0 then
                    v322 = l_stateNode_11.containerInfo;
                    v323 = true;
                    break;
                elseif l_return__1.tag == l_HostPortal_0 then
                    v322 = l_stateNode_11.containerInfo;
                    v323 = true;
                    break;
                else
                    l_return__1 = l_return__1.return_;
                end;
            end;
            v321 = true;
        end;
        if l_v317_0.tag == l_HostComponent_0 or l_v317_0.tag == l_HostText_0 then
            v124(v316, l_v317_0, v318, v319);
            if v323 then
                l_removeChildFromContainer_0(v322, l_v317_0.stateNode);
            else
                l_removeChild_0(v322, l_v317_0.stateNode);
            end;
        elseif l_v317_0.tag == l_HostPortal_0 then
            if l_v317_0.child ~= nil then
                v322 = l_v317_0.stateNode.containerInfo;
                v323 = true;
                l_v317_0.child.return_ = l_v317_0;
                l_v317_0 = l_v317_0.child;
                continue;
            end;
        else
            v125(v316, l_v317_0, v318, v319);
            if l_v317_0.child ~= nil then
                l_v317_0.child.return_ = l_v317_0;
                l_v317_0 = l_v317_0.child;
                continue;
            end;
        end;
        if l_v317_0 == v317 then
            return;
        else
            while true do
                if l_v317_0.sibling == nil then
                    if l_v317_0.return_ == nil or l_v317_0.return_ == v317 then
                        return;
                    else
                        l_v317_0 = l_v317_0.return_;
                        if l_v317_0.tag == l_HostPortal_0 then
                            v321 = false;
                        end;
                    end;
                else
                    l_v317_0.sibling.return_ = l_v317_0.return_;
                    l_v317_0 = l_v317_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function v333(v326, v327, v328, v329) --[[ Line: 1755 ]] --[[ Name: commitDeletion ]]
    -- upvalues: v123 (ref), l_enableNewTreeCleanupPath_0 (copy)
    v123(v326, v327, v328, v329);
    local v330 = nil;
    if not l_enableNewTreeCleanupPath_0 then
        v330 = v327.alternate;
    end;
    local l_alternate_3 = v327.alternate;
    if l_alternate_3 ~= nil then
        l_alternate_3.return_ = nil;
        if not l_enableNewTreeCleanupPath_0 then
            v327.alternate = nil;
        end;
    end;
    v327.return_ = nil;
    if not l_enableNewTreeCleanupPath_0 and v330 ~= nil then
        l_alternate_3 = v330;
        local l_alternate_4 = l_alternate_3.alternate;
        if l_alternate_4 ~= nil then
            l_alternate_4.return_ = nil;
            if not l_enableNewTreeCleanupPath_0 then
                l_alternate_3.alternate = nil;
            end;
        end;
        l_alternate_3.return_ = nil;
    end;
end;
local function v348(v334, v335) --[[ Line: 1790 ]] --[[ Name: commitWork ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v167 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_describeError_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_commitUpdate_0 (copy), l_HostText_0 (copy), l_invariant_0 (copy), l_commitTextUpdate_0 (copy), l_HostRoot_0 (copy), l_supportsHydration_0 (copy), v1 (copy), l_Profiler_0 (copy), l_SuspenseComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_IncompleteClassComponent_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), v250 (copy)
    if v335.tag == l_FunctionComponent_0 or v335.tag == l_ForwardRef_0 or v335.tag == l_MemoComponent_0 or v335.tag == l_SimpleMemoComponent_0 or v335.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v335.mode, l_ProfileMode_0) ~= 0 then
            local v336, v337 = xpcall(function() --[[ Line: 1879 ]]
                -- upvalues: l_startLayoutEffectTimer_0 (ref), v167 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v335 (copy)
                l_startLayoutEffectTimer_0();
                v167(bit32.bor(l_Layout_0, l_HasEffect_0), v335, v335.return_);
            end, l_describeError_0);
            l_recordLayoutEffectDuration_0(v335);
            if not v336 then
                error(v337);
                return;
            end;
        else
            v167(bit32.bor(l_Layout_0, l_HasEffect_0), v335, v335.return_);
        end;
        return;
    elseif v335.tag == l_ClassComponent_0 then
        return;
    elseif v335.tag == l_HostComponent_0 then
        local l_stateNode_12 = v335.stateNode;
        if l_stateNode_12 ~= nil then
            local l_memoizedProps_2 = v335.memoizedProps;
            local v340 = nil;
            v340 = if v334 then v334.memoizedProps else l_memoizedProps_2;
            local l_type_1 = v335.type;
            local l_updateQueue_5 = v335.updateQueue;
            v335.updateQueue = nil;
            if l_updateQueue_5 ~= nil then
                l_commitUpdate_0(l_stateNode_12, l_updateQueue_5, l_type_1, v340, l_memoizedProps_2, v335);
            end;
        end;
        return;
    elseif v335.tag == l_HostText_0 then
        l_invariant_0(v335.stateNode ~= nil, "This should have a text node initialized. This error is likely caused by a bug in React. Please file an issue.");
        local l_stateNode_13 = v335.stateNode;
        local l_memoizedProps_3 = v335.memoizedProps;
        local v345 = nil;
        if v334 ~= nil then
            v345 = v334.memoizedProps;
            v345 = l_memoizedProps_3;
        end;
        l_commitTextUpdate_0(l_stateNode_13, v345, l_memoizedProps_3);
        return;
    elseif v335.tag == l_HostRoot_0 then
        if l_supportsHydration_0 then
            local l_stateNode_14 = v335.stateNode;
            if l_stateNode_14.hydrate then
                l_stateNode_14.hydrate = false;
                v1("commitWork: HostRoot: commitHydratedContainer");
            end;
        end;
        return;
    elseif v335.tag == l_Profiler_0 then
        return;
    elseif v335.tag == l_SuspenseComponent_0 then
        commitSuspenseComponent(v335);
        attachSuspenseRetryListeners(v335);
        return;
    else
        if v335.tag == l_SuspenseListComponent_0 then
            v1("commitWork: SuspenseListComponent");
        elseif v335.tag == l_IncompleteClassComponent_0 then
            return;
        elseif v335.tag == l_OffscreenComponent_0 or v335.tag == l_LegacyHiddenComponent_0 then
            local v347 = v335.memoizedState ~= nil;
            v250(v335, v347);
            return;
        end;
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
commitSuspenseComponent = function(v349) --[[ Line: 2005 ]] --[[ Name: commitSuspenseComponent ]]
    -- upvalues: v100 (ref), l_supportsMutation_0 (copy), v250 (copy), l_enableSuspenseCallback_0 (copy), l___DEV___0 (copy), l_console_0 (copy)
    local l_memoizedState_2 = v349.memoizedState;
    if l_memoizedState_2 ~= nil then
        if not v100 then
            v100 = require(script.Parent["ReactFiberWorkLoop.new"]);
        end;
        v100.markCommitTimeOfFallback();
        if l_supportsMutation_0 then
            local l_child_5 = v349.child;
            v250(l_child_5, true);
        end;
    end;
    if l_enableSuspenseCallback_0 and l_memoizedState_2 ~= nil then
        local l_suspenseCallback_0 = v349.memoizedProps.suspenseCallback;
        if typeof(l_suspenseCallback_0) == "function" then
            local l_updateQueue_6 = v349.updateQueue;
            if l_updateQueue_6 ~= nil then
                l_suspenseCallback_0(table.clone(l_updateQueue_6));
                return;
            end;
        elseif l___DEV___0 and l_suspenseCallback_0 ~= nil then
            l_console_0.error("Unexpected type for suspenseCallback: %s", (tostring(l_suspenseCallback_0)));
        end;
    end;
end;
commitSuspenseHydrationCallbacks = function(v354, v355) --[[ Line: 2044 ]] --[[ Name: commitSuspenseHydrationCallbacks ]]
    -- upvalues: l_supportsHydration_0 (copy), l_commitHydratedSuspenseInstance_0 (copy), l_enableSuspenseCallback_0 (copy)
    if not l_supportsHydration_0 then
        return;
    else
        if v355.memoizedState == nil then
            local l_alternate_5 = v355.alternate;
            if l_alternate_5 ~= nil then
                local l_memoizedState_3 = l_alternate_5.memoizedState;
                if l_memoizedState_3 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_3.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        l_commitHydratedSuspenseInstance_0(l_dehydrated_0);
                        if l_enableSuspenseCallback_0 then
                            local l_hydrationCallbacks_0 = v354.hydrationCallbacks;
                            if l_hydrationCallbacks_0 ~= nil then
                                local l_onHydrated_0 = l_hydrationCallbacks_0.onHydrated;
                                if l_onHydrated_0 then
                                    l_onHydrated_0(l_dehydrated_0);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
attachSuspenseRetryListeners = function(v361) --[[ Line: 2072 ]] --[[ Name: attachSuspenseRetryListeners ]]
    -- upvalues: l_Set_0 (copy), v103 (copy), l_enableSchedulerTracing_0 (copy), l_unstable_wrap_0 (copy)
    local l_updateQueue_7 = v361.updateQueue;
    if l_updateQueue_7 ~= nil then
        v361.updateQueue = nil;
        local l_stateNode_15 = v361.stateNode;
        if l_stateNode_15 == nil then
            v361.stateNode = l_Set_0.new();
            l_stateNode_15 = v361.stateNode;
        end;
        for v364, _ in l_updateQueue_7 do
            local function v366() --[[ Line: 2086 ]]
                -- upvalues: v103 (ref), v361 (copy), v364 (copy)
                return v103(v361, v364);
            end;
            do
                local l_v366_0 = v366;
                if not l_stateNode_15:has(v364) then
                    if l_enableSchedulerTracing_0 and v364.__reactDoNotTraceInteractions ~= true then
                        l_v366_0 = l_unstable_wrap_0(l_v366_0);
                    end;
                    l_stateNode_15:add(v364);
                    v364:andThen(function() --[[ Line: 2097 ]]
                        -- upvalues: l_v366_0 (ref)
                        return l_v366_0();
                    end, function() --[[ Line: 2099 ]]
                        -- upvalues: l_v366_0 (ref)
                        return l_v366_0();
                    end);
                end;
            end;
        end;
    end;
end;
isSuspenseBoundaryBeingHidden = function(v368, v369) --[[ Line: 2110 ]] --[[ Name: isSuspenseBoundaryBeingHidden ]]
    if v368 ~= nil then
        local l_memoizedState_4 = v368.memoizedState;
        if l_memoizedState_4 == nil or l_memoizedState_4.dehydrated ~= nil then
            local l_memoizedState_5 = v369.memoizedState;
            local v372 = false;
            if l_memoizedState_5 ~= nil then
                v372 = l_memoizedState_5.dehydrated == nil;
            end;
            return v372;
        end;
    end;
    return false;
end;
commitResetTextContent = function(v373) --[[ Line: 2122 ]] --[[ Name: commitResetTextContent ]]
    -- upvalues: l_supportsMutation_0 (copy), l_resetTextContent_0 (copy)
    if not l_supportsMutation_0 then
        return;
    else
        l_resetTextContent_0(v373.stateNode);
        return;
    end;
end;
local function v375(v374) --[[ Line: 2129 ]] --[[ Name: commitPassiveUnmount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v167 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v374.tag == l_FunctionComponent_0 or v374.tag == l_ForwardRef_0 or v374.tag == l_SimpleMemoComponent_0 or v374.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v374.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v167(bit32.bor(l_Passive_0, l_HasEffect_0), v374, v374.return_);
            l_recordPassiveEffectDuration_0(v374);
            return;
        else
            v167(bit32.bor(l_Passive_0, l_HasEffect_0), v374, v374.return_);
        end;
    end;
end;
local function v378(v376, v377) --[[ Line: 2158 ]] --[[ Name: commitPassiveUnmountInsideDeletedTree ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v167 (copy), l_Passive_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v376.tag == l_FunctionComponent_0 or v376.tag == l_ForwardRef_0 or v376.tag == l_SimpleMemoComponent_0 or v376.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v376.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v167(l_Passive_0, v376, v377);
            l_recordPassiveEffectDuration_0(v376);
            return;
        else
            v167(l_Passive_0, v376, v377);
        end;
    end;
end;
local function v383(v379, v380) --[[ Line: 2182 ]] --[[ Name: commitPassiveMount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v176 (copy), l_describeError_0 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy), l_Profiler_0 (copy)
    if v380.tag == l_FunctionComponent_0 or v380.tag == l_ForwardRef_0 or v380.tag == l_SimpleMemoComponent_0 or v380.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v380.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            local v381, v382 = xpcall(v176, l_describeError_0, bit32.bor(l_Passive_0, l_HasEffect_0), v380);
            l_recordPassiveEffectDuration_0(v380);
            if not v381 then
                error(v382);
                return;
            end;
        else
            v176(bit32.bor(l_Passive_0, l_HasEffect_0), v380);
            return;
        end;
    elseif v380.tag == l_Profiler_0 then
        commitProfilerPassiveEffect(v379, v380);
    end;
end;
invokeLayoutEffectMountInDEV = function(v384) --[[ Line: 2215 ]] --[[ Name: invokeLayoutEffectMountInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v176 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v109 (ref), l_ClassComponent_0 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        if v384.tag == l_FunctionComponent_0 or v384.tag == l_ForwardRef_0 or v384.tag == l_SimpleMemoComponent_0 or v384.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v176, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v384);
            if l_hasCaughtError_0() then
                local v385 = l_clearCaughtError_0();
                v109(v384, v384.return_, v385);
            end;
            return;
        end;
    elseif v384.tag == l_ClassComponent_0 then
        local l_stateNode_16 = v384.stateNode;
        l_invokeGuardedCallback_0(nil, l_stateNode_16.componentDidMount, l_stateNode_16);
        if l_hasCaughtError_0() then
            local v387 = l_clearCaughtError_0();
            v109(v384, v384.return_, v387);
        end;
        return;
    end;
end;
invokePassiveEffectMountInDEV = function(v388) --[[ Line: 2247 ]] --[[ Name: invokePassiveEffectMountInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v176 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v109 (ref)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 and (v388.tag == l_FunctionComponent_0 or v388.tag == l_ForwardRef_0 or v388.tag == l_SimpleMemoComponent_0 or v388.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v176, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v388);
        if l_hasCaughtError_0() then
            local v389 = l_clearCaughtError_0();
            v109(v388, v388.return_, v389);
        end;
        return;
    else
        return;
    end;
end;
invokeLayoutEffectUnmountInDEV = function(v390) --[[ Line: 2271 ]] --[[ Name: invokeLayoutEffectUnmountInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v167 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v109 (ref), l_ClassComponent_0 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        if v390.tag == l_FunctionComponent_0 or v390.tag == l_ForwardRef_0 or v390.tag == l_SimpleMemoComponent_0 or v390.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v167, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v390, v390.return_);
            if l_hasCaughtError_0() then
                local v391 = l_clearCaughtError_0();
                v109(v390, v390.return_, v391);
            end;
            return;
        end;
    elseif v390.tag == l_ClassComponent_0 then
        local l_stateNode_17 = v390.stateNode;
        if typeof(l_stateNode_17.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v390, l_stateNode_17, v390.return_);
        end;
        return;
    end;
end;
invokePassiveEffectUnmountInDEV = function(v393) --[[ Line: 2302 ]] --[[ Name: invokePassiveEffectUnmountInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v167 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v109 (ref)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 and (v393.tag == l_FunctionComponent_0 or v393.tag == l_ForwardRef_0 or v393.tag == l_SimpleMemoComponent_0 or v393.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v167, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v393, v393.return_);
        if l_hasCaughtError_0() then
            local v394 = l_clearCaughtError_0();
            v109(v393, v393.return_, v394);
        end;
        return;
    else
        return;
    end;
end;
return {
    safelyCallDestroy = v148, 
    commitBeforeMutationLifeCycles = v156, 
    commitResetTextContent = commitResetTextContent, 
    commitPlacement = v299, 
    commitDeletion = v333, 
    commitWork = v348, 
    commitAttachRef = commitAttachRef, 
    commitDetachRef = commitDetachRef, 
    commitPassiveUnmount = v375, 
    commitPassiveUnmountInsideDeletedTree = v378, 
    commitPassiveMount = v383, 
    invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV, 
    invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV, 
    invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV, 
    invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV, 
    isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden, 
    recursivelyCommitLayoutEffects = v183
};