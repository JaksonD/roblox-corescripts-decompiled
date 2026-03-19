local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local _ = require(l_Parent_0.Shared);
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l___DEV___0 = v1.__DEV__;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v9 = require(script.Parent.ReactRootTags);
local v10 = require(script.Parent.ReactFiberFlags);
local _ = require(script.Parent.ReactFiberHostConfig);
local v12 = require(script.Parent.ReactWorkTags);
local l_FundamentalComponent_0 = v12.FundamentalComponent;
local _ = require(l_Parent_0.Shared);
local v15 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v17 = require(script.Parent.ReactFiberTreeReflection);
local l_findCurrentHostFiber_0 = v17.findCurrentHostFiber;
local l_findCurrentHostFiberWithNoPortals_0 = v17.findCurrentHostFiberWithNoPortals;
local l_get_0 = require(l_Parent_0.Shared).ReactInstanceMap.get;
local l_HostComponent_0 = v12.HostComponent;
local l_ClassComponent_0 = v12.ClassComponent;
local l_HostRoot_0 = v12.HostRoot;
local l_SuspenseComponent_0 = v12.SuspenseComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_enableSchedulingProfiler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getPublicInstance_0 = require(script.Parent.ReactFiberHostConfig).getPublicInstance;
local v31 = require(script.Parent["ReactFiberContext.new"]);
local l_findCurrentUnmaskedContext_0 = v31.findCurrentUnmaskedContext;
local l_processChildContext_0 = v31.processChildContext;
local l_emptyContextObject_0 = v31.emptyContextObject;
local l_isContextProvider_0 = v31.isContextProvider;
local l_createFiberRoot_0 = require(script.Parent["ReactFiberRoot.new"]).createFiberRoot;
local v37 = require(script.Parent["ReactFiberDevToolsHook.new"]);
local l_injectInternals_0 = v37.injectInternals;
local l_onScheduleRoot_0 = v37.onScheduleRoot;
local v40 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_requestEventTime_0 = v40.requestEventTime;
local l_requestUpdateLane_0 = v40.requestUpdateLane;
local l_scheduleUpdateOnFiber_0 = v40.scheduleUpdateOnFiber;
local l_flushRoot_0 = v40.flushRoot;
local l_batchedEventUpdates_0 = v40.batchedEventUpdates;
local l_batchedUpdates_0 = v40.batchedUpdates;
local l_unbatchedUpdates_0 = v40.unbatchedUpdates;
local l_flushSync_0 = v40.flushSync;
local l_flushControlled_0 = v40.flushControlled;
local l_deferredUpdates_0 = v40.deferredUpdates;
local l_discreteUpdates_0 = v40.discreteUpdates;
local l_flushDiscreteUpdates_0 = v40.flushDiscreteUpdates;
local l_flushPassiveEffects_0 = v40.flushPassiveEffects;
local l_warnIfNotScopedWithMatchingAct_0 = v40.warnIfNotScopedWithMatchingAct;
local l_warnIfUnmockedScheduler_0 = v40.warnIfUnmockedScheduler;
local l_IsThisRendererActing_0 = v40.IsThisRendererActing;
local l_act_0 = v40.act;
local v58 = require(script.Parent["ReactUpdateQueue.new"]);
local l_createUpdate_0 = v58.createUpdate;
local l_enqueueUpdate_0 = v58.enqueueUpdate;
local v61 = require(script.Parent.ReactCurrentFiber);
local l_isRendering_0 = v61.isRendering;
local l_resetCurrentFiber_0 = v61.resetCurrentFiber;
local l_setCurrentFiber_0 = v61.setCurrentFiber;
local v65 = require(script.Parent.ReactTypeOfMode);
local l_StrictMode_0 = v65.StrictMode;
local l_SyncLane_0 = v15.SyncLane;
local l_InputDiscreteHydrationLane_0 = v15.InputDiscreteHydrationLane;
local l_SelectiveHydrationLane_0 = v15.SelectiveHydrationLane;
local l_NoTimestamp_0 = v15.NoTimestamp;
local l_getHighestPriorityPendingLanes_0 = v15.getHighestPriorityPendingLanes;
local l_higherPriorityLane_0 = v15.higherPriorityLane;
local l_getCurrentUpdateLanePriority_0 = v15.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v15.setCurrentUpdateLanePriority;
local v75 = require(script.Parent["ReactFiberHotReloading.new"]);
local l_scheduleRefresh_0 = v75.scheduleRefresh;
local l_scheduleRoot_0 = v75.scheduleRoot;
local l_setRefreshHandler_0 = v75.setRefreshHandler;
local l_findHostInstancesForRefresh_0 = v75.findHostInstancesForRefresh;
local v80 = require(script.Parent.SchedulingProfiler);
local l_markRenderScheduled_0 = v80.markRenderScheduled;
local v82 = {
    ReactRootTags = v9, 
    ReactWorkTags = v12, 
    ReactTypeOfMode = v65, 
    ReactFiberFlags = v10, 
    getNearestMountedFiber = v17.getNearestMountedFiber, 
    findCurrentFiberUsingSlowPath = v17.findCurrentFiberUsingSlowPath, 
    createPortal = require(script.Parent.ReactPortal).createPortal
};
local v83 = nil;
local v84 = nil;
if l___DEV___0 then
    v83 = false;
    v84 = {};
end;
local function _(v85) --[[ Line: 181 ]] --[[ Name: getContextForSubtree ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy)
    if not v85 then
        return l_emptyContextObject_0;
    else
        local v86 = l_get_0(v85);
        local v87 = l_findCurrentUnmaskedContext_0(v86);
        if v86.tag == l_ClassComponent_0 then
            local l_type_0 = v86.type;
            if l_isContextProvider_0(l_type_0) then
                return l_processChildContext_0(v86, l_type_0, v87);
            end;
        end;
        return v87;
    end;
end;
local function v93(v90) --[[ Line: 199 ]] --[[ Name: findHostInstance ]]
    -- upvalues: l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy)
    local v91 = l_get_0(v90);
    if v91 == nil then
        if typeof(v90.render) == "function" then
            l_invariant_0(false, "Unable to find node on an unmounted component.");
        else
            l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v90)));
        end;
    end;
    local v92 = l_findCurrentHostFiber_0(v91);
    if v92 == nil then
        return nil;
    else
        return v92.stateNode;
    end;
end;
local function v102(v94, v95) --[[ Line: 220 ]] --[[ Name: findHostInstanceWithWarning ]]
    -- upvalues: l___DEV___0 (copy), l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy), l_StrictMode_0 (copy), l_getComponentName_0 (copy), v84 (ref), v61 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_describeError_0 (copy), l_resetCurrentFiber_0 (copy), v93 (copy)
    if l___DEV___0 then
        local v96 = l_get_0(v94);
        if v96 == nil then
            if typeof(v94.render) == "function" then
                l_invariant_0(false, "Unable to find node on an unmounted component.");
            else
                l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v94)));
            end;
        end;
        local v97 = l_findCurrentHostFiber_0(v96);
        if v97 == nil then
            return nil;
        else
            if bit32.band(v97.mode, l_StrictMode_0) ~= 0 then
                local v98 = l_getComponentName_0(v96.type) or "Component";
                if not v84[v98] then
                    v84[v98] = true;
                    local l_current_0 = v61.current;
                    local v100, v101 = xpcall(function() --[[ Line: 248 ]]
                        -- upvalues: l_setCurrentFiber_0 (ref), v97 (copy), v96 (copy), l_StrictMode_0 (ref), l_console_0 (ref), v95 (copy), v98 (copy)
                        l_setCurrentFiber_0(v97);
                        if bit32.band(v96.mode, l_StrictMode_0) ~= 0 then
                            l_console_0.error("%s is deprecated in StrictMode. %s was passed an instance of %s which is inside StrictMode. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", v95, v95, v98);
                            return;
                        else
                            l_console_0.error("%s is deprecated in StrictMode. %s was passed an instance of %s which renders StrictMode children. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node", v95, v95, v98);
                            return;
                        end;
                    end, l_describeError_0);
                    if l_current_0 then
                        l_setCurrentFiber_0(l_current_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                    if not v100 then
                        error(v101);
                    end;
                end;
            end;
            return v97.stateNode;
        end;
    else
        return (v93(v94));
    end;
end;
v82.createContainer = function(v103, v104, v105, v106) --[[ Line: 293 ]]
    -- upvalues: l_createFiberRoot_0 (copy)
    return l_createFiberRoot_0(v103, v104, v105, v106);
end;
v82.updateContainer = function(v107, v108, v109, v110) --[[ Line: 302 ]]
    -- upvalues: l___DEV___0 (copy), l_onScheduleRoot_0 (copy), l_requestEventTime_0 (copy), v1 (copy), l_warnIfUnmockedScheduler_0 (copy), l_warnIfNotScopedWithMatchingAct_0 (copy), l_requestUpdateLane_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markRenderScheduled_0 (copy), l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy), l_isRendering_0 (copy), v61 (copy), v83 (ref), l_console_0 (copy), l_getComponentName_0 (copy), l_createUpdate_0 (copy), l_Object_0 (copy), l_enqueueUpdate_0 (copy), l_scheduleUpdateOnFiber_0 (copy)
    local v111 = false;
    if l___DEV___0 then
        l_onScheduleRoot_0(v108, v107);
    end;
    local l_current_1 = v108.current;
    local v113 = l_requestEventTime_0();
    if l___DEV___0 and v1.__TESTEZ_RUNNING_TEST__ then
        l_warnIfUnmockedScheduler_0(l_current_1);
        l_warnIfNotScopedWithMatchingAct_0(l_current_1);
    end;
    local v114 = l_requestUpdateLane_0(l_current_1);
    if l_enableSchedulingProfiler_0 then
        l_markRenderScheduled_0(v114);
    end;
    local v115;
    if not v109 then
        v115 = l_emptyContextObject_0;
    else
        local v116 = l_get_0(v109);
        local v117 = l_findCurrentUnmaskedContext_0(v116);
        if v116.tag == l_ClassComponent_0 then
            local l_type_1 = v116.type;
            if l_isContextProvider_0(l_type_1) then
                v115 = l_processChildContext_0(v116, l_type_1, v117);
                v111 = true;
            end;
        end;
        if not v111 then
            v115 = v117;
        end;
    end;
    v111 = false;
    if v108.context == nil then
        v108.context = v115;
    else
        v108.pendingContext = v115;
    end;
    if l___DEV___0 and l_isRendering_0 and v61.current ~= nil and not v83 then
        v83 = true;
        l_console_0.error("Render methods should be a pure function of props and state; triggering nested component updates from render is not allowed. If necessary, trigger nested updates in componentDidUpdate.\n\nCheck the render method of %s.", l_getComponentName_0(v61.current.type) or "Unknown");
    end;
    local v119 = l_createUpdate_0(v113, v114);
    if v107 == nil then
        v107 = l_Object_0.None;
    end;
    v119.payload = {
        element = v107
    };
    if v110 ~= nil then
        if l___DEV___0 and typeof(v110) ~= "function" then
            l_console_0.error("render(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", (tostring(v110)));
        end;
        v119.callback = v110;
    end;
    l_enqueueUpdate_0(l_current_1, v119);
    l_scheduleUpdateOnFiber_0(l_current_1, v114, v113);
    return v114;
end;
v82.batchedEventUpdates = l_batchedEventUpdates_0;
v82.batchedUpdates = l_batchedUpdates_0;
v82.unbatchedUpdates = l_unbatchedUpdates_0;
v82.deferredUpdates = l_deferredUpdates_0;
v82.discreteUpdates = l_discreteUpdates_0;
v82.flushDiscreteUpdates = l_flushDiscreteUpdates_0;
v82.flushControlled = l_flushControlled_0;
v82.flushSync = l_flushSync_0;
v82.flushPassiveEffects = l_flushPassiveEffects_0;
v82.IsThisRendererActing = l_IsThisRendererActing_0;
v82.act = l_act_0;
v82.getPublicRootInstance = function(v120) --[[ Line: 397 ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy)
    local l_current_2 = v120.current;
    if not l_current_2.child then
        return nil;
    elseif l_current_2.child.tag == l_HostComponent_0 then
        return l_getPublicInstance_0(l_current_2.child.stateNode);
    else
        return l_current_2.child.stateNode;
    end;
end;
local v122 = nil;
v82.attemptSynchronousHydration = function(v123) --[[ Line: 414 ]]
    -- upvalues: l_HostRoot_0 (copy), l_getHighestPriorityPendingLanes_0 (copy), l_flushRoot_0 (copy), l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_flushSync_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_InputDiscreteHydrationLane_0 (copy), v122 (ref)
    if v123.tag == l_HostRoot_0 then
        local l_stateNode_0 = v123.stateNode;
        if l_stateNode_0.hydrate then
            local v125 = l_getHighestPriorityPendingLanes_0(l_stateNode_0);
            l_flushRoot_0(l_stateNode_0, v125);
            return;
        end;
    elseif v123.tag == l_SuspenseComponent_0 then
        local v126 = l_requestEventTime_0();
        l_flushSync_0(function() --[[ Line: 424 ]]
            -- upvalues: l_scheduleUpdateOnFiber_0 (ref), v123 (copy), l_SyncLane_0 (ref), v126 (copy)
            return l_scheduleUpdateOnFiber_0(v123, l_SyncLane_0, v126);
        end);
        v122(v123, l_InputDiscreteHydrationLane_0);
    end;
end;
local function _(v127, v128) --[[ Line: 435 ]] --[[ Name: markRetryLaneImpl ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_0 = v127.memoizedState;
    if l_memoizedState_0 and l_memoizedState_0 ~= nil and l_memoizedState_0.dehydrated ~= nil then
        l_memoizedState_0.retryLane = l_higherPriorityLane_0(l_memoizedState_0.retryLane, v128);
    end;
end;
v122 = function(v131, v132) --[[ Line: 446 ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_1 = v131.memoizedState;
    if l_memoizedState_1 and l_memoizedState_1 ~= nil and l_memoizedState_1.dehydrated ~= nil then
        l_memoizedState_1.retryLane = l_higherPriorityLane_0(l_memoizedState_1.retryLane, v132);
    end;
    l_memoizedState_1 = v131.alternate;
    if l_memoizedState_1 then
        local l_memoizedState_2 = l_memoizedState_1.memoizedState;
        if l_memoizedState_2 and l_memoizedState_2 ~= nil and l_memoizedState_2.dehydrated ~= nil then
            l_memoizedState_2.retryLane = l_higherPriorityLane_0(l_memoizedState_2.retryLane, v132);
        end;
    end;
end;
v82.attemptUserBlockingHydration = function(v135) --[[ Line: 455 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_InputDiscreteHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v122 (ref)
    if v135.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v136 = l_requestEventTime_0();
        local l_l_InputDiscreteHydrationLane_0_0 = l_InputDiscreteHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v135, l_l_InputDiscreteHydrationLane_0_0, v136);
        v122(v135, l_l_InputDiscreteHydrationLane_0_0);
        return;
    end;
end;
v82.attemptContinuousHydration = function(v138) --[[ Line: 469 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_SelectiveHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v122 (ref)
    if v138.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v139 = l_requestEventTime_0();
        local l_l_SelectiveHydrationLane_0_0 = l_SelectiveHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v138, l_l_SelectiveHydrationLane_0_0, v139);
        v122(v138, l_l_SelectiveHydrationLane_0_0);
        return;
    end;
end;
v82.attemptHydrationAtCurrentPriority = function(v141) --[[ Line: 483 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v122 (ref)
    if v141.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v142 = l_requestEventTime_0();
        local v143 = l_requestUpdateLane_0(v141);
        l_scheduleUpdateOnFiber_0(v141, v143, v142);
        v122(v141, v143);
        return;
    end;
end;
v82.runWithPriority = function(v144, v145) --[[ Line: 495 ]]
    -- upvalues: l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_describeError_0 (copy)
    local v146 = l_getCurrentUpdateLanePriority_0();
    l_setCurrentUpdateLanePriority_0(v144);
    local v147, v148 = xpcall(v145, l_describeError_0);
    l_setCurrentUpdateLanePriority_0(v146);
    if not v147 then
        error(v148);
    end;
    return v148;
end;
v82.getCurrentUpdateLanePriority = l_getCurrentUpdateLanePriority_0;
v82.findHostInstance = v93;
v82.findHostInstanceWithWarning = v102;
v82.findHostInstanceWithNoPortals = function(v149) --[[ Line: 513 ]]
    -- upvalues: l_findCurrentHostFiberWithNoPortals_0 (copy), l_FundamentalComponent_0 (copy)
    local v150 = l_findCurrentHostFiberWithNoPortals_0(v149);
    if v150 == nil then
        return nil;
    elseif v150.tag == l_FundamentalComponent_0 then
        return v150.stateNode.instance;
    else
        return v150.stateNode;
    end;
end;
local function v152(_) --[[ Line: 524 ]] --[[ Name: shouldSuspendImpl ]]
    return false;
end;
v82.shouldSuspend = function(v153) --[[ Line: 528 ]]
    -- upvalues: v152 (ref)
    return v152(v153);
end;
local v154 = nil;
local v155 = nil;
local v156 = nil;
local v157 = nil;
local v158 = nil;
local v159 = nil;
local v160 = nil;
local v161 = nil;
if l___DEV___0 then
    local function v162(v163, v164, v165) --[[ Line: 543 ]] --[[ Name: copyWithDeleteImpl ]]
        -- upvalues: l_Array_0 (copy), v162 (copy)
        local v166 = v164[v165];
        local v167 = nil;
        v167 = if l_Array_0.isArray(v163) then l_Array_0.slice(v163) else table.clone(v163);
        if v165 + 1 == #v164 then
            if l_Array_0.isArray(v167) then
                l_Array_0.splice(v167, v166, 1);
                return v167;
            else
                v167[v166] = nil;
                return v167;
            end;
        else
            v167[v166] = v162(v163[v166], v164, v165 + 1);
            return v167;
        end;
    end;
    local function _(v168, v169) --[[ Line: 571 ]] --[[ Name: copyWithDelete ]]
        -- upvalues: v162 (copy)
        return (v162(v168, v169, 0));
    end;
    local function v171(v172, v173, v174, v175) --[[ Line: 579 ]] --[[ Name: copyWithRenameImpl ]]
        -- upvalues: l_Array_0 (copy), v171 (copy)
        local v176 = v173[v175];
        local v177 = nil;
        v177 = if l_Array_0.isArray(v172) then l_Array_0.slice(v172) else table.clone(v172);
        if v175 + 1 == #v173 then
            v177[v174[v175]] = v177[v176];
            if l_Array_0.isArray(v177) then
                l_Array_0.splice(v177, v176, 1);
                return v177;
            else
                v177[v176] = nil;
                return v177;
            end;
        else
            v177[v176] = v171(v172[v176], v173, v174, v175 + 1);
            return v177;
        end;
    end;
    local function v182(v178, v179, v180) --[[ Line: 615 ]] --[[ Name: copyWithRename ]]
        -- upvalues: l_console_0 (copy), v171 (copy)
        if #v179 ~= #v180 then
            l_console_0.warn("copyWithRename() expects paths of the same length");
            return nil;
        else
            for v181 = 1, #v180 do
                if v179[v181] ~= v180[v181] then
                    l_console_0.warn("copyWithRename() expects paths to be the same except for the deepest key");
                    return nil;
                end;
            end;
            return (v171(v178, v179, v180, 0));
        end;
    end;
    local function v183(v184, v185, v186, v187) --[[ Line: 637 ]] --[[ Name: copyWithSetImpl ]]
        -- upvalues: l_Array_0 (copy), v183 (copy)
        if #v185 + 1 <= v186 then
            return v187;
        else
            local v188 = v185[v186];
            local v189 = nil;
            v189 = if l_Array_0.isArray(v184) then l_Array_0.slice(v184) else table.clone(v184);
            v189[v188] = v183(v184[v188], v185, v186 + 2, v187);
            return v189;
        end;
    end;
    local function _(v190, v191, v192) --[[ Line: 659 ]] --[[ Name: copyWithSet ]]
        -- upvalues: v183 (copy)
        return (v183(v190, v191, 1, v192));
    end;
    local function _(v194, v195) --[[ Line: 667 ]] --[[ Name: findHook ]]
        local l_memoizedState_3 = v194.memoizedState;
        while l_memoizedState_3 ~= nil and v195 > 1 do
            l_memoizedState_3 = l_memoizedState_3.next;
            v195 = v195 - 1;
        end;
        return l_memoizedState_3;
    end;
    v154 = function(v198, v199, v200, v201) --[[ Line: 679 ]]
        -- upvalues: v183 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v199_0 = v199;
        local l_memoizedState_4 = v198.memoizedState;
        while l_memoizedState_4 ~= nil and l_v199_0 > 1 do
            l_memoizedState_4 = l_memoizedState_4.next;
            l_v199_0 = l_v199_0 - 1;
        end;
        local l_l_memoizedState_4_0 = l_memoizedState_4;
        if l_l_memoizedState_4_0 ~= nil then
            l_memoizedState_4 = l_l_memoizedState_4_0.memoizedState;
            l_v199_0 = v183(l_memoizedState_4, v200, 1, v201);
            l_l_memoizedState_4_0.memoizedState = l_v199_0;
            l_l_memoizedState_4_0.baseState = l_v199_0;
            v198.memoizedProps = table.clone(v198.memoizedProps);
            l_scheduleUpdateOnFiber_0(v198, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v155 = function(v205, v206, v207) --[[ Line: 701 ]]
        -- upvalues: v162 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v206_0 = v206;
        local l_memoizedState_5 = v205.memoizedState;
        while l_memoizedState_5 ~= nil and l_v206_0 > 1 do
            l_memoizedState_5 = l_memoizedState_5.next;
            l_v206_0 = l_v206_0 - 1;
        end;
        local l_l_memoizedState_5_0 = l_memoizedState_5;
        if l_l_memoizedState_5_0 ~= nil then
            l_memoizedState_5 = l_l_memoizedState_5_0.memoizedState;
            l_v206_0 = v162(l_memoizedState_5, v207, 0);
            l_l_memoizedState_5_0.memoizedState = l_v206_0;
            l_l_memoizedState_5_0.baseState = l_v206_0;
            v205.memoizedProps = table.clone(v205.memoizedProps);
            l_scheduleUpdateOnFiber_0(v205, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v156 = function(v211, v212, v213, v214) --[[ Line: 722 ]]
        -- upvalues: v182 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v212_0 = v212;
        local l_memoizedState_6 = v211.memoizedState;
        while l_memoizedState_6 ~= nil and l_v212_0 > 1 do
            l_memoizedState_6 = l_memoizedState_6.next;
            l_v212_0 = l_v212_0 - 1;
        end;
        local l_l_memoizedState_6_0 = l_memoizedState_6;
        if l_l_memoizedState_6_0 ~= nil then
            l_v212_0 = v182(l_l_memoizedState_6_0.memoizedState, v213, v214);
            l_l_memoizedState_6_0.memoizedState = l_v212_0;
            l_l_memoizedState_6_0.baseState = l_v212_0;
            v211.memoizedProps = table.clone(v211.memoizedProps);
            l_scheduleUpdateOnFiber_0(v211, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v157 = function(v218, v219, v220) --[[ Line: 746 ]]
        -- upvalues: v183 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_0 = v218.memoizedProps;
        v218.pendingProps = v183(l_memoizedProps_0, v219, 1, v220);
        local l_alternate_0 = v218.alternate;
        if l_alternate_0 then
            l_alternate_0.pendingProps = v218.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v218, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v158 = function(v223, v224) --[[ Line: 755 ]]
        -- upvalues: v162 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_1 = v223.memoizedProps;
        v223.pendingProps = v162(l_memoizedProps_1, v224, 0);
        local l_alternate_1 = v223.alternate;
        if l_alternate_1 then
            l_alternate_1.pendingProps = v223.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v223, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v159 = function(v227, v228, v229) --[[ Line: 764 ]]
        -- upvalues: v182 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        v227.pendingProps = v182(v227.memoizedProps, v228, v229);
        local l_alternate_2 = v227.alternate;
        if l_alternate_2 then
            l_alternate_2.pendingProps = v227.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v227, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v160 = function(v231) --[[ Line: 778 ]]
        -- upvalues: l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        l_scheduleUpdateOnFiber_0(v231, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v161 = function(v232) --[[ Line: 782 ]]
        -- upvalues: v152 (ref)
        v152 = v232;
    end;
end;
findHostInstanceByFiber = function(v233) --[[ Line: 787 ]] --[[ Name: findHostInstanceByFiber ]]
    -- upvalues: l_findCurrentHostFiber_0 (copy)
    local v234 = l_findCurrentHostFiber_0(v233);
    if v234 == nil then
        return nil;
    else
        return v234.stateNode;
    end;
end;
emptyFindFiberByHostInstance = function(_) --[[ Line: 795 ]] --[[ Name: emptyFindFiberByHostInstance ]]
    return nil;
end;
getCurrentFiberForDevTools = function() --[[ Line: 799 ]] --[[ Name: getCurrentFiberForDevTools ]]
    -- upvalues: v61 (copy)
    return v61.current;
end;
v82.injectIntoDevTools = function(v236) --[[ Line: 803 ]]
    -- upvalues: l_ReactSharedInternals_0 (copy), l___DEV___0 (copy), l_injectInternals_0 (copy), v154 (ref), v155 (ref), v156 (ref), v157 (ref), v158 (ref), v159 (ref), v161 (ref), v160 (ref), l_findHostInstancesForRefresh_0 (copy), l_scheduleRefresh_0 (copy), l_scheduleRoot_0 (copy), l_setRefreshHandler_0 (copy)
    local l_findFiberByHostInstance_0 = v236.findFiberByHostInstance;
    local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    local v239 = nil;
    if l___DEV___0 then
        v239 = getCurrentFiberForDevTools;
    end;
    return l_injectInternals_0({
        bundleType = v236.bundleType, 
        version = v236.version, 
        rendererPackageName = v236.rendererPackageName, 
        rendererConfig = v236.rendererConfig, 
        overrideHookState = v154, 
        overrideHookStateDeletePath = v155, 
        overrideHookStateRenamePath = v156, 
        overrideProps = v157, 
        overridePropsDeletePath = v158, 
        overridePropsRenamePath = v159, 
        setSuspenseHandler = v161, 
        scheduleUpdate = v160, 
        currentDispatcherRef = l_ReactCurrentDispatcher_0, 
        findHostInstanceByFiber = findHostInstanceByFiber, 
        findFiberByHostInstance = l_findFiberByHostInstance_0 or emptyFindFiberByHostInstance, 
        findHostInstancesForRefresh = if l___DEV___0 then l_findHostInstancesForRefresh_0 else nil, 
        scheduleRefresh = if l___DEV___0 then l_scheduleRefresh_0 else nil, 
        scheduleRoot = if l___DEV___0 then l_scheduleRoot_0 else nil, 
        setRefreshHandler = if l___DEV___0 then l_setRefreshHandler_0 else nil, 
        getCurrentFiber = v239
    });
end;
v82.robloxReactProfiling = require(script.Parent.RobloxReactProfiling);
v82.schedulingProfiler = {
    profilerEventTypes = v80.profilerEventTypes, 
    registerProfilerEventCallback = v80.registerProfilerEventCallback
};
return v82;