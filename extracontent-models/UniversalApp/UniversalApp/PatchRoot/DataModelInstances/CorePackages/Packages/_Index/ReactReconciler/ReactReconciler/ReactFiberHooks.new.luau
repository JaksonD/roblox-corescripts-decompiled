local function _(v0) --[[ Line: 12 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. v0);
    error("FIXME (roblox): " .. v0 .. " is unimplemented");
end;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.ReactGlobals);
local v4 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Error_0 = v4.Error;
local l_Object_0 = v4.Object;
local l___DEV___0 = v3.__DEV__;
local l_createRef_0 = require(l_Parent_0.React).createRef;
local l_createBinding_0 = require(l_Parent_0.React).createBinding;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v14 = require(script.Parent.ReactFiberLane);
local v15 = require(script.Parent.ReactHookEffectTags);
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_enableNewReconciler_0 = l_ReactFeatureFlags_0.enableNewReconciler;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local l_DebugTracingMode_0 = require(script.Parent.ReactTypeOfMode).DebugTracingMode;
local l_NoLane_0 = v14.NoLane;
local l_NoLanes_0 = v14.NoLanes;
local l_isSubsetOfLanes_0 = v14.isSubsetOfLanes;
local l_mergeLanes_0 = v14.mergeLanes;
local l_removeLanes_0 = v14.removeLanes;
local l_markRootEntangled_0 = v14.markRootEntangled;
local l_markRootMutableRead_0 = v14.markRootMutableRead;
local l_readContext_0 = require(script.Parent["ReactFiberNewContext.new"]).readContext;
local v31 = require(script.Parent.ReactFiberFlags);
local l_Update_0 = v31.Update;
local l_Passive_0 = v31.Passive;
local l_PassiveStatic_0 = v31.PassiveStatic;
local l_MountLayoutDev_0 = v31.MountLayoutDev;
local l_MountPassiveDev_0 = v31.MountPassiveDev;
local l_HasEffect_0 = v15.HasEffect;
local l_Layout_0 = v15.Layout;
local l_Passive_1 = v15.Passive;
local v40 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_warnIfNotCurrentlyActingUpdatesInDEV_0 = v40.warnIfNotCurrentlyActingUpdatesInDEV;
local l_scheduleUpdateOnFiber_0 = v40.scheduleUpdateOnFiber;
local l_warnIfNotScopedWithMatchingAct_0 = v40.warnIfNotScopedWithMatchingAct;
local l_requestEventTime_0 = v40.requestEventTime;
local l_requestUpdateLane_0 = v40.requestUpdateLane;
local l_markSkippedUpdateLanes_0 = v40.markSkippedUpdateLanes;
local l_getWorkInProgressRoot_0 = v40.getWorkInProgressRoot;
local l_warnIfNotCurrentlyActingEffectsInDEV_0 = v40.warnIfNotCurrentlyActingEffectsInDEV;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local function _(v51, v52) --[[ Line: 117 ]] --[[ Name: is ]]
    return v51 == v52 and (v51 ~= 0 or 1 / v51 == 1 / v52) or v51 ~= v51 and v52 ~= v52;
end;
local l_markWorkInProgressReceivedUpdate_0 = require(script.Parent["ReactFiberBeginWork.new"]).markWorkInProgressReceivedUpdate;
local l_getIsHydrating_0 = require(script.Parent["ReactFiberHydrationContext.new"]).getIsHydrating;
local l_makeClientId_0 = require(script.Parent.ReactFiberHostConfig).makeClientId;
local v57 = require(script.Parent["ReactMutableSource.new"]);
local l_warnAboutMultipleRenderersDEV_0 = v57.warnAboutMultipleRenderersDEV;
local l_getWorkInProgressVersion_0 = v57.getWorkInProgressVersion;
local l_setWorkInProgressVersion_0 = v57.setWorkInProgressVersion;
local l_markSourceAsDirty_0 = v57.markSourceAsDirty;
local l_logStateUpdateScheduled_0 = require(script.Parent.DebugTracing).logStateUpdateScheduled;
local l_markStateUpdateScheduled_0 = require(script.Parent.SchedulingProfiler).markStateUpdateScheduled;
local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
local v65 = require(l_Parent_0.SafeFlags).createGetFFlag("ReactCleanQueueOnUpdateBailout")();
local v66 = nil;
local v67 = nil;
if l___DEV___0 then
    v67 = {};
    v66 = {};
end;
local v68 = {};
local l_l_NoLanes_0_0 = l_NoLanes_0;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = false;
local v74 = false;
local v75 = nil;
local v76 = nil;
local v77 = 0;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = nil;
local v83 = nil;
local v84 = nil;
local _ = function(v85) --[[ Line: 265 ]] --[[ Name: getHighestIndex ]]
    local v86 = 0;
    for v87, _ in v85 do
        if v86 < v87 then
            v86 = v87;
        end;
    end;
    return v86;
end;
local _ = function(v90) --[[ Line: 275 ]] --[[ Name: isArrayOrSparseArray ]]
    if type(v90) ~= "table" then
        return false;
    else
        for v91, _ in v90 do
            if type(v91) ~= "number" then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _() --[[ Line: 287 ]] --[[ Name: mountHookTypesDev ]]
    -- upvalues: l___DEV___0 (copy), v75 (ref), v76 (ref)
    if l___DEV___0 then
        local l_v75_0 = v75;
        if v76 == nil then
            v76 = {
                l_v75_0
            };
            return;
        else
            table.insert(v76, l_v75_0);
        end;
    end;
end;
updateHookTypesDev = function() --[[ Line: 300 ]] --[[ Name: updateHookTypesDev ]]
    -- upvalues: l___DEV___0 (copy), v75 (ref), v76 (ref), v77 (ref)
    if l___DEV___0 then
        local l_v75_1 = v75;
        if v76 ~= nil then
            v77 = v77 + 1;
            if v76[v77] ~= l_v75_1 then
                warnOnHookMismatchInDev(l_v75_1);
            end;
        end;
    end;
end;
local _ = function(v97) --[[ Line: 314 ]] --[[ Name: checkDepsAreArrayDev ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), v75 (ref)
    local v98 = false;
    if l___DEV___0 and v97 ~= nil then
        local v99;
        if type(v97) ~= "table" then
            v99 = false;
        else
            for v100, _ in v97 do
                if type(v100) ~= "number" then
                    v99 = false;
                    v98 = true;
                end;
                if v98 then
                    break;
                end;
            end;
            if not v98 then
                v99 = true;
            end;
        end;
        v98 = false;
        if not v99 then
            l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v75, (type(v97)));
        end;
    end;
end;
warnOnHookMismatchInDev = function(v103) --[[ Line: 329 ]] --[[ Name: warnOnHookMismatchInDev ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), v70 (ref), v66 (ref), v76 (ref), v77 (ref), l_console_0 (copy)
    if l___DEV___0 then
        local v104 = l_getComponentName_0(v70.type) or "Component";
        if not v66[v104] then
            v66[v104] = true;
            if v76 ~= nil then
                local v105 = "";
                for v106 = 1, v77 do
                    local v107 = v76[v106];
                    local v108 = nil;
                    v108 = if v106 == v77 then v103 else v107;
                    local v109 = tostring(v106) .. ". " .. (v107 or "undefined");
                    while string.len(v109) < 30 do
                        v109 = v109 .. " ";
                    end;
                    v105 = v105 .. v109 .. v108 .. "\n";
                end;
                l_console_0.error("React has detected a change in the order of Hooks called by %s. This will lead to bugs and errors if not fixed. For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n   Previous render            Next render\n   ------------------------------------------------------\n%s   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v104, v105);
            end;
        end;
    end;
end;
local function v110() --[[ Line: 381 ]] --[[ Name: throwInvalidHookError ]]
    -- upvalues: l_Error_0 (copy)
    error(l_Error_0.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."));
end;
local function v123(v111, v112) --[[ Line: 396 ]] --[[ Name: areHookInputsEqual ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), v75 (ref)
    if l___DEV___0 then

    end;
    if v112 == nil then
        if l___DEV___0 then
            l_console_0.error("%s received a final argument during this render, but not during the previous render. Even though the final argument is optional, its type cannot change between renders.", v75);
        end;
        return false;
    else
        local v113 = 0;
        for v114, _ in v111 do
            if v113 < v114 then
                v113 = v114;
            end;
        end;
        local l_v113_0 = v113;
        local v117 = 0;
        for v118, _ in v112 do
            if v117 < v118 then
                v117 = v118;
            end;
        end;
        v113 = v117;
        if l_v113_0 ~= v113 then
            return false;
        else
            for v120 = 1, math.min(v113, l_v113_0) do
                local v121 = v111[v120];
                local v122 = v112[v120];
                if not (v121 == v122 and (v121 ~= 0 or 1 / v121 == 1 / v122) or v121 ~= v121 and v122 ~= v122) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v68.bailoutHooks = function(v124, v125, v126) --[[ Line: 460 ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_removeLanes_0 (copy)
    v125.updateQueue = v124.updateQueue;
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        v125.flags = bit32.band(v125.flags, (bit32.bnot((bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_MountLayoutDev_0, l_Update_0)))));
    else
        v125.flags = bit32.band(v125.flags, (bit32.bnot((bit32.bor(l_Passive_0, l_Update_0)))));
    end;
    v124.lanes = l_removeLanes_0(v124.lanes, v126);
end;
local v127 = false;
v68.resetHooksAfterThrow = function() --[[ Line: 485 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v68 (copy), v73 (ref), v70 (ref), l_l_NoLanes_0_0 (ref), l_NoLanes_0 (copy), v71 (ref), v72 (ref), l___DEV___0 (copy), v76 (ref), v77 (ref), v75 (ref), v127 (ref), v74 (ref)
    l_ReactCurrentDispatcher_0.current = v68.ContextOnlyDispatcher;
    if v73 then
        local l_memoizedState_0 = v70.memoizedState;
        while l_memoizedState_0 ~= nil do
            local l_queue_0 = l_memoizedState_0.queue;
            if l_queue_0 ~= nil then
                l_queue_0.pending = nil;
            end;
            l_memoizedState_0 = l_memoizedState_0.next;
        end;
        v73 = false;
    end;
    l_l_NoLanes_0_0 = l_NoLanes_0;
    v70 = nil;
    v71 = nil;
    v72 = nil;
    if l___DEV___0 then
        v76 = nil;
        v77 = 0;
        v75 = nil;
        v127 = false;
    end;
    v74 = false;
end;
local function _() --[[ Line: 530 ]] --[[ Name: mountWorkInProgressHook ]]
    -- upvalues: v72 (ref), v70 (ref)
    local v130 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v72 == nil then
        v70.memoizedState = v130;
        v72 = v130;
    else
        v72.next = v130;
        v72 = v130;
    end;
    return v72;
end;
local function v136() --[[ Line: 553 ]] --[[ Name: updateWorkInProgressHook ]]
    -- upvalues: v71 (ref), v70 (ref), v72 (ref), l_Error_0 (copy)
    local v132 = nil;
    if v71 == nil then
        local l_alternate_0 = v70.alternate;
        v132 = if l_alternate_0 ~= nil then l_alternate_0.memoizedState else nil;
    else
        v132 = v71.next;
    end;
    local v134 = nil;
    v134 = if v72 == nil then v70.memoizedState else v72.next;
    if v134 ~= nil then
        v72 = v134;
        v134 = v72.next;
        v71 = v132;
    else
        if v132 == nil then
            error(l_Error_0.new("Rendered more hooks than during the previous render."));
        end;
        v71 = v132;
        local v135 = {
            memoizedState = v71.memoizedState, 
            baseState = v71.baseState, 
            baseQueue = v71.baseQueue, 
            queue = v71.queue, 
            next = nil
        };
        if v72 == nil then
            v72 = v135;
            v70.memoizedState = v135;
        else
            v72.next = v135;
            v72 = v135;
        end;
    end;
    return v72;
end;
basicStateReducer = function(v137, v138) --[[ Line: 628 ]] --[[ Name: basicStateReducer ]]
    if type(v138) == "function" then
        return v138(v137);
    else
        return v138;
    end;
end;
mountReducer = function(v139, v140, v141) --[[ Line: 637 ]] --[[ Name: mountReducer ]]
    -- upvalues: v72 (ref), v70 (ref)
    local v142 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v72 == nil then
        v70.memoizedState = v142;
        v72 = v142;
    else
        v72.next = v142;
        v72 = v142;
    end;
    local l_v72_0 = v72;
    v142 = nil;
    v142 = if v141 ~= nil then v141(v140) else v140;
    l_v72_0.baseState = v142;
    l_v72_0.memoizedState = l_v72_0.baseState;
    local v144 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = v139, 
        lastRenderedState = v142
    };
    l_v72_0.queue = v144;
    local l_v70_0 = v70;
    local function v147(v146, ...) --[[ Line: 664 ]]
        -- upvalues: l_v70_0 (copy), v144 (copy)
        dispatchAction(l_v70_0, v144, v146, ...);
    end;
    v144.dispatch = v147;
    return l_v72_0.memoizedState, v147;
end;
updateReducer = function(v148, _, _) --[[ Line: 674 ]] --[[ Name: updateReducer ]]
    -- upvalues: v136 (copy), v71 (ref), l_l_NoLanes_0_0 (ref), v70 (ref), l_mergeLanes_0 (copy), l_markSkippedUpdateLanes_0 (copy), l_NoLane_0 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v151 = v136();
    local l_queue_1 = v151.queue;
    assert(l_queue_1 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_1.lastRenderedReducer = v148;
    local l_v71_0 = v71;
    local l_baseQueue_0 = l_v71_0.baseQueue;
    local l_pending_0 = l_queue_1.pending;
    if l_pending_0 ~= nil then
        if l_baseQueue_0 ~= nil then
            local l_next_0 = l_baseQueue_0.next;
            l_baseQueue_0.next = l_pending_0.next;
            l_pending_0.next = l_next_0;
        end;
        l_baseQueue_0 = l_pending_0;
        l_v71_0.baseQueue = l_baseQueue_0;
        l_queue_1.pending = nil;
    end;
    if l_baseQueue_0 ~= nil then
        local l_next_1 = l_baseQueue_0.next;
        local l_baseState_0 = l_v71_0.baseState;
        local v159 = nil;
        local v160 = nil;
        local v161 = nil;
        local l_l_next_1_0 = l_next_1;
        repeat
            local l_lane_0 = l_l_next_1_0.lane;
            if bit32.band(l_l_NoLanes_0_0, l_lane_0) ~= l_lane_0 then
                local v164 = {
                    lane = l_lane_0, 
                    action = l_l_next_1_0.action, 
                    eagerReducer = l_l_next_1_0.eagerReducer, 
                    eagerState = l_l_next_1_0.eagerState, 
                    next = nil
                };
                if v161 == nil then
                    v161 = v164;
                    v160 = v161;
                    v159 = l_baseState_0;
                else
                    v161.next = v164;
                    v161 = v161.next;
                end;
                v70.lanes = l_mergeLanes_0(v70.lanes, l_lane_0);
                l_markSkippedUpdateLanes_0(l_lane_0);
            else
                if v161 ~= nil then
                    v161.next = {
                        lane = l_NoLane_0, 
                        action = l_l_next_1_0.action, 
                        eagerReducer = l_l_next_1_0.eagerReducer, 
                        eagerState = l_l_next_1_0.eagerState, 
                        next = nil
                    };
                    v161 = v161.next;
                end;
                if l_l_next_1_0.eagerReducer == v148 then
                    l_baseState_0 = l_l_next_1_0.eagerState;
                else
                    l_baseState_0 = v148(l_baseState_0, l_l_next_1_0.action);
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == nil or l_l_next_1_0 == l_next_1;
        if v161 == nil then
            v159 = l_baseState_0;
        else
            v161.next = v160;
        end;
        local l_l_baseState_0_0 = l_baseState_0;
        local l_memoizedState_1 = v151.memoizedState;
        if not (l_l_baseState_0_0 == l_memoizedState_1 and (l_l_baseState_0_0 ~= 0 or 1 / l_l_baseState_0_0 == 1 / l_memoizedState_1) or l_l_baseState_0_0 ~= l_l_baseState_0_0 and l_memoizedState_1 ~= l_memoizedState_1) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v151.memoizedState = l_baseState_0;
        v151.baseState = v159;
        v151.baseQueue = v161;
        l_queue_1.lastRenderedState = l_baseState_0;
    end;
    local l_dispatch_0 = l_queue_1.dispatch;
    return v151.memoizedState, l_dispatch_0;
end;
rerenderReducer = function(v168, _, _) --[[ Line: 815 ]] --[[ Name: rerenderReducer ]]
    -- upvalues: v136 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v171 = v136();
    local l_queue_2 = v171.queue;
    assert(l_queue_2 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_2.lastRenderedReducer = v168;
    local l_dispatch_1 = l_queue_2.dispatch;
    local l_pending_1 = l_queue_2.pending;
    local l_memoizedState_2 = v171.memoizedState;
    if l_pending_1 ~= nil then
        l_queue_2.pending = nil;
        local l_next_2 = l_pending_1.next;
        local l_l_next_2_0 = l_next_2;
        repeat
            l_memoizedState_2 = v168(l_memoizedState_2, l_l_next_2_0.action);
            l_l_next_2_0 = l_l_next_2_0.next;
        until l_l_next_2_0 == l_next_2;
        local l_l_memoizedState_2_0 = l_memoizedState_2;
        local l_memoizedState_3 = v171.memoizedState;
        if not (l_l_memoizedState_2_0 == l_memoizedState_3 and (l_l_memoizedState_2_0 ~= 0 or 1 / l_l_memoizedState_2_0 == 1 / l_memoizedState_3) or l_l_memoizedState_2_0 ~= l_l_memoizedState_2_0 and l_memoizedState_3 ~= l_memoizedState_3) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v171.memoizedState = l_memoizedState_2;
        if v171.baseQueue == nil then
            v171.baseState = l_memoizedState_2;
        end;
        l_queue_2.lastRenderedState = l_memoizedState_2;
    end;
    return l_memoizedState_2, l_dispatch_1;
end;
readFromUnsubcribedMutableSource = function(v180, v181, v182) --[[ Line: 880 ]] --[[ Name: readFromUnsubcribedMutableSource ]]
    -- upvalues: l___DEV___0 (copy), l_warnAboutMultipleRenderersDEV_0 (copy), l_getWorkInProgressVersion_0 (copy), l_isSubsetOfLanes_0 (copy), l_l_NoLanes_0_0 (ref), l_setWorkInProgressVersion_0 (copy), l_console_0 (copy), l_markSourceAsDirty_0 (copy), l_Error_0 (copy)
    if l___DEV___0 then
        l_warnAboutMultipleRenderersDEV_0(v181);
    end;
    local v183 = v181._getVersion(v181._source);
    local v184 = false;
    local v185 = l_getWorkInProgressVersion_0(v181);
    if v185 ~= nil then
        v184 = v185 == v183;
    else
        v184 = l_isSubsetOfLanes_0(l_l_NoLanes_0_0, v180.mutableReadLanes);
        if v184 then
            l_setWorkInProgressVersion_0(v181, v183);
        end;
    end;
    if v184 then
        local v186 = v182(v181._source);
        if l___DEV___0 and type(v186) == "function" then
            l_console_0.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.");
        end;
        return v186;
    else
        l_markSourceAsDirty_0(v181);
        error(l_Error_0.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."));
        return;
    end;
end;
useMutableSource = function(v187, v188, v189, v190) --[[ Line: 963 ]] --[[ Name: useMutableSource ]]
    -- upvalues: l_getWorkInProgressRoot_0 (copy), l_invariant_0 (copy), l_ReactCurrentDispatcher_0 (copy), v72 (ref), v70 (ref), l___DEV___0 (copy), l_console_0 (copy), l_requestUpdateLane_0 (copy), l_markRootMutableRead_0 (copy), l_markRootEntangled_0 (copy)
    local v191 = l_getWorkInProgressRoot_0();
    l_invariant_0(v191 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.");
    local l__getVersion_0 = v188._getVersion;
    local v193 = l__getVersion_0(v188._source);
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    assert(l_current_0 ~= nil, "dispatcher was nil, this is a bug in React");
    local v195, v196 = l_current_0.useState(function() --[[ Line: 988 ]]
        -- upvalues: v191 (copy), v188 (copy), v189 (copy)
        return readFromUnsubcribedMutableSource(v191, v188, v189);
    end);
    local l_v195_0 = v195;
    local l_v72_1 = v72;
    local l_memoizedState_4 = v187.memoizedState;
    if l_memoizedState_4.refs == nil then
        error((tostring(debug.traceback())));
    end;
    local l_refs_0 = l_memoizedState_4.refs;
    local l_getSnapshot_0 = l_refs_0.getSnapshot;
    local l_source_0 = l_memoizedState_4.source;
    local l_subscribe_0 = l_memoizedState_4.subscribe;
    local l_v70_1 = v70;
    v187.memoizedState = {
        refs = l_refs_0, 
        source = v188, 
        subscribe = v190
    };
    l_current_0.useEffect(function() --[[ Line: 1017 ]]
        -- upvalues: l_refs_0 (copy), v189 (copy), v196 (ref), l__getVersion_0 (copy), v188 (copy), v193 (copy), l___DEV___0 (ref), l_console_0 (ref), l_v195_0 (ref), l_requestUpdateLane_0 (ref), l_v70_1 (copy), l_markRootMutableRead_0 (ref), v191 (copy), l_markRootEntangled_0 (ref)
        l_refs_0.getSnapshot = v189;
        l_refs_0.setSnapshot = v196;
        local v205 = l__getVersion_0(v188._source);
        local l_v193_0 = v193;
        if not (l_v193_0 == v205 and (l_v193_0 ~= 0 or 1 / l_v193_0 == 1 / v205) or l_v193_0 ~= l_v193_0 and v205 ~= v205) then
            local v207 = v189(v188._source);
            if l___DEV___0 and type(v207) == "function" then
                l_console_0.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.");
            end;
            local l_l_v195_0_0 = l_v195_0;
            if not (l_l_v195_0_0 == v207 and (l_l_v195_0_0 ~= 0 or 1 / l_l_v195_0_0 == 1 / v207) or l_l_v195_0_0 ~= l_l_v195_0_0 and v207 ~= v207) then
                v196(v207);
                l_v193_0 = l_requestUpdateLane_0(l_v70_1);
                l_markRootMutableRead_0(v191, l_v193_0);
            end;
            l_markRootEntangled_0(v191, v191.mutableReadLanes);
        end;
    end, {
        v189, 
        v188, 
        v190
    });
    l_current_0.useEffect(function() --[[ Line: 1055 ]]
        -- upvalues: l_refs_0 (copy), v188 (copy), l_requestUpdateLane_0 (ref), l_v70_1 (copy), l_markRootMutableRead_0 (ref), v191 (copy), v190 (copy), l___DEV___0 (ref), l_console_0 (ref)
        local function v214() --[[ Line: 1056 ]]
            -- upvalues: l_refs_0 (ref), v188 (ref), l_requestUpdateLane_0 (ref), l_v70_1 (ref), l_markRootMutableRead_0 (ref), v191 (ref)
            local l_getSnapshot_1 = l_refs_0.getSnapshot;
            local l_setSnapshot_0 = l_refs_0.setSnapshot;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 1061 ]]
                -- upvalues: l_setSnapshot_0 (copy), l_getSnapshot_1 (copy), v188 (ref), l_requestUpdateLane_0 (ref), l_v70_1 (ref), l_markRootMutableRead_0 (ref), v191 (ref)
                l_setSnapshot_0(l_getSnapshot_1(v188._source));
                local v211 = l_requestUpdateLane_0(l_v70_1);
                l_markRootMutableRead_0(v191, v211);
            end);
            if not l_status_0 then
                l_setSnapshot_0(function() --[[ Line: 1075 ]]
                    -- upvalues: l_result_0 (copy)
                    error(l_result_0);
                end);
            end;
        end;
        local v215 = v190(v188._source, v214);
        if l___DEV___0 and type(v215) ~= "function" then
            l_console_0.error("Mutable source subscribe function must return an unsubscribe function.");
        end;
        return v215;
    end, {
        v188, 
        v190
    });
    if (l_getSnapshot_0 ~= v189 or l_getSnapshot_0 == 0 and 1 / l_getSnapshot_0 ~= 1 / v189) and (l_getSnapshot_0 == l_getSnapshot_0 or v189 == v189) or (l_source_0 ~= v188 or l_source_0 == 0 and 1 / l_source_0 ~= 1 / v188) and (l_source_0 == l_source_0 or v188 == v188) or not (l_subscribe_0 == v190 and (l_subscribe_0 ~= 0 or 1 / l_subscribe_0 == 1 / v190) or l_subscribe_0 ~= l_subscribe_0 and v190 ~= v190) then
        local v216 = {
            pending = nil, 
            dispatch = nil, 
            lastRenderedReducer = basicStateReducer, 
            lastRenderedState = l_v195_0
        };
        local l_v70_2 = v70;
        v196 = function(...) --[[ Line: 1124 ]]
            -- upvalues: l_v70_2 (copy), v216 (copy)
            dispatchAction(l_v70_2, v216, ...);
        end;
        v216.dispatch = v196;
        l_v72_1.queue = v216;
        l_v72_1.baseQueue = nil;
        l_v195_0 = readFromUnsubcribedMutableSource(v191, v188, v189);
        l_v72_1.baseState = l_v195_0;
        l_v72_1.memoizedState = l_v72_1.baseState;
    end;
    return l_v195_0;
end;
mountMutableSource = function(v218, v219, v220) --[[ Line: 1138 ]] --[[ Name: mountMutableSource ]]
    -- upvalues: v72 (ref), v70 (ref)
    local v221 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v72 == nil then
        v70.memoizedState = v221;
        v72 = v221;
    else
        v72.next = v221;
        v72 = v221;
    end;
    local l_v72_2 = v72;
    l_v72_2.memoizedState = {
        refs = {
            getSnapshot = v219, 
            setSnapshot = nil
        }, 
        source = v218, 
        subscribe = v220
    };
    return useMutableSource(l_v72_2, v218, v219, v220);
end;
updateMutableSource = function(v223, v224, v225) --[[ Line: 1161 ]] --[[ Name: updateMutableSource ]]
    -- upvalues: v136 (copy)
    local v226 = v136();
    return useMutableSource(v226, v223, v224, v225);
end;
mountState = function(v227) --[[ Line: 1176 ]] --[[ Name: mountState ]]
    -- upvalues: v72 (ref), v70 (ref)
    local v228 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v72 == nil then
        v70.memoizedState = v228;
        v72 = v228;
    else
        v72.next = v228;
        v72 = v228;
    end;
    local l_v72_3 = v72;
    if type(v227) == "function" then
        v227 = v227();
    end;
    l_v72_3.baseState = v227;
    l_v72_3.memoizedState = l_v72_3.baseState;
    v228 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = nil, 
        lastRenderedState = v227, 
        lastRenderedReducer = basicStateReducer
    };
    l_v72_3.queue = v228;
    local l_v70_3 = v70;
    local function v232(v231, ...) --[[ Line: 1198 ]]
        -- upvalues: l_v70_3 (copy), v228 (copy)
        dispatchAction(l_v70_3, v228, v231, ...);
    end;
    v228.dispatch = v232;
    return l_v72_3.memoizedState, v232;
end;
updateState = function(v233) --[[ Line: 1207 ]] --[[ Name: updateState ]]
    return updateReducer(basicStateReducer, v233);
end;
rerenderState = function(v234) --[[ Line: 1211 ]] --[[ Name: rerenderState ]]
    return rerenderReducer(basicStateReducer, v234);
end;
local function v243(v235, v236, v237, v238) --[[ Line: 1215 ]] --[[ Name: pushEffect ]]
    -- upvalues: v70 (ref)
    local v239 = {
        tag = v235, 
        create = v236, 
        destroy = v237, 
        deps = v238, 
        next = nil
    };
    local l_updateQueue_0 = v70.updateQueue;
    if l_updateQueue_0 == nil then
        l_updateQueue_0 = {
            lastEffect = nil
        };
        v70.updateQueue = l_updateQueue_0;
        v239.next = v239;
        l_updateQueue_0.lastEffect = v239;
        return v239;
    else
        local l_lastEffect_0 = l_updateQueue_0.lastEffect;
        if l_lastEffect_0 == nil then
            l_updateQueue_0.lastEffect = v239;
            v239.next = v239;
            return v239;
        else
            local l_next_3 = l_lastEffect_0.next;
            l_lastEffect_0.next = v239;
            v239.next = l_next_3;
            l_updateQueue_0.lastEffect = v239;
            return v239;
        end;
    end;
end;
mountBinding = function(v244) --[[ Line: 1251 ]] --[[ Name: mountBinding ]]
    -- upvalues: v72 (ref), v70 (ref), l_createBinding_0 (copy)
    local v245 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v72 == nil then
        v70.memoizedState = v245;
        v72 = v245;
    else
        v72.next = v245;
        v72 = v245;
    end;
    local l_v72_4 = v72;
    local v247;
    v245, v247 = l_createBinding_0(v244);
    l_v72_4.memoizedState = {
        v245, 
        v247
    };
    return v245, v247;
end;
updateBinding = function(_) --[[ Line: 1260 ]] --[[ Name: updateBinding ]]
    -- upvalues: v136 (copy)
    return unpack(v136().memoizedState);
end;
mountRef = function(v249) --[[ Line: 1265 ]] --[[ Name: mountRef ]]
    -- upvalues: v72 (ref), v70 (ref), l_createRef_0 (copy)
    local v250 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v72 == nil then
        v70.memoizedState = v250;
        v72 = v250;
    else
        v72.next = v250;
        v72 = v250;
    end;
    local l_v72_5 = v72;
    v250 = l_createRef_0();
    v250.current = v249;
    l_v72_5.memoizedState = v250;
    return v250;
end;
updateRef = function(_) --[[ Line: 1277 ]] --[[ Name: updateRef ]]
    -- upvalues: v136 (copy)
    return v136().memoizedState;
end;
local function v259(v253, v254, v255, v256) --[[ Line: 1282 ]] --[[ Name: mountEffectImpl ]]
    -- upvalues: v72 (ref), v70 (ref), v243 (copy), l_HasEffect_0 (copy)
    local v257 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v72 == nil then
        v70.memoizedState = v257;
        v72 = v257;
    else
        v72.next = v257;
        v72 = v257;
    end;
    local l_v72_6 = v72;
    v70.flags = bit32.bor(v70.flags, v253);
    l_v72_6.memoizedState = v243(bit32.bor(l_HasEffect_0, v254), v255, nil, v256);
end;
updateEffectImpl = function(v260, v261, v262, v263) --[[ Line: 1294 ]] --[[ Name: updateEffectImpl ]]
    -- upvalues: v136 (copy), v71 (ref), v123 (copy), v243 (copy), v70 (ref), l_HasEffect_0 (copy)
    local v264 = v136();
    local v265 = nil;
    if v71 ~= nil then
        local l_memoizedState_5 = v71.memoizedState;
        v265 = l_memoizedState_5.destroy;
        if v263 ~= nil then
            local l_deps_0 = l_memoizedState_5.deps;
            if v123(v263, l_deps_0) then
                v264.memoizedState = v243(v261, v262, v265, v263);
                return;
            end;
        end;
    end;
    v70.flags = bit32.bor(v70.flags, v260);
    v264.memoizedState = v243(bit32.bor(l_HasEffect_0, v261), v262, v265, v263);
end;
local function v278(v268, v269) --[[ Line: 1320 ]] --[[ Name: mountEffect ]]
    -- upvalues: l___DEV___0 (copy), v3 (copy), l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v70 (ref), l_enableDoubleInvokingEffects_0 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_PassiveStatic_0 (copy), l_Passive_1 (copy), v72 (ref), v243 (copy), l_HasEffect_0 (copy)
    if l___DEV___0 and (type(_G.jest) ~= "nil" or v3.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v70);
    end;
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        local v270 = bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_0 = l_Passive_1;
        local v272 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v72 == nil then
            v70.memoizedState = v272;
            v72 = v272;
        else
            v72.next = v272;
            v72 = v272;
        end;
        local l_v72_7 = v72;
        v70.flags = bit32.bor(v70.flags, v270);
        l_v72_7.memoizedState = v243(bit32.bor(l_HasEffect_0, l_l_Passive_1_0), v268, nil, v269);
        return;
    else
        local v274 = bit32.bor(l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_1 = l_Passive_1;
        local v276 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v72 == nil then
            v70.memoizedState = v276;
            v72 = v276;
        else
            v72.next = v276;
            v72 = v276;
        end;
        local l_v72_8 = v72;
        v70.flags = bit32.bor(v70.flags, v274);
        l_v72_8.memoizedState = v243(bit32.bor(l_HasEffect_0, l_l_Passive_1_1), v268, nil, v269);
        return;
    end;
end;
local function v281(v279, v280) --[[ Line: 1350 ]] --[[ Name: updateEffect ]]
    -- upvalues: l___DEV___0 (copy), v3 (copy), l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v70 (ref), l_Passive_0 (copy), l_Passive_1 (copy)
    if l___DEV___0 and (type(_G.jest) ~= "nil" or v3.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v70);
    end;
    updateEffectImpl(l_Passive_0, l_Passive_1, v279, v280);
end;
local function v292(v282, v283) --[[ Line: 1365 ]] --[[ Name: mountLayoutEffect ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy), v72 (ref), v70 (ref), v243 (copy), l_HasEffect_0 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        local v284 = bit32.bor(l_MountLayoutDev_0, l_Update_0);
        local l_l_Layout_0_0 = l_Layout_0;
        local v286 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v72 == nil then
            v70.memoizedState = v286;
            v72 = v286;
        else
            v72.next = v286;
            v72 = v286;
        end;
        local l_v72_9 = v72;
        v70.flags = bit32.bor(v70.flags, v284);
        l_v72_9.memoizedState = v243(bit32.bor(l_HasEffect_0, l_l_Layout_0_0), v282, nil, v283);
        return;
    else
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Layout_0_1 = l_Layout_0;
        local v290 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v72 == nil then
            v70.memoizedState = v290;
            v72 = v290;
        else
            v72.next = v290;
            v72 = v290;
        end;
        local l_v72_10 = v72;
        v70.flags = bit32.bor(v70.flags, l_l_Update_0_0);
        l_v72_10.memoizedState = v243(bit32.bor(l_HasEffect_0, l_l_Layout_0_1), v282, nil, v283);
        return;
    end;
end;
local function v295(v293, v294) --[[ Line: 1382 ]] --[[ Name: updateLayoutEffect ]]
    -- upvalues: l_Update_0 (copy), l_Layout_0 (copy)
    updateEffectImpl(l_Update_0, l_Layout_0, v293, v294);
end;
imperativeHandleEffect = function(v296, v297) --[[ Line: 1390 ]] --[[ Name: imperativeHandleEffect ]]
    -- upvalues: l___DEV___0 (copy), l_Object_0 (copy), l_console_0 (copy), l_Array_0 (copy)
    if v297 ~= nil and type(v297) == "function" then
        v297((v296()));
        return function() --[[ Line: 1399 ]]
            -- upvalues: v297 (copy)
            return v297(nil);
        end;
    elseif v297 ~= nil then
        if l___DEV___0 then
            local v298 = false;
            if getmetatable(v297) ~= nil then
                v298 = #l_Object_0.keys(v297) == 0;
            end;
            if not v298 then
                l_console_0.error("Expected useImperativeHandle() first argument to either be a ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. l_Array_0.join(l_Object_0.keys(v297), ", ") .. "}");
            end;
        end;
        v297.current = v296();
        return function() --[[ Line: 1424 ]]
            -- upvalues: v297 (copy)
            v297.current = nil;
        end;
    else
        return nil;
    end;
end;
mountImperativeHandle = function(v299, v300, v301) --[[ Line: 1433 ]] --[[ Name: mountImperativeHandle ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_Array_0 (copy), l_enableDoubleInvokingEffects_0 (copy), v259 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if l___DEV___0 and type(v300) ~= "function" then
        l_console_0.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", if v300 ~= nil then type(v300) else "nil");
    end;
    local v302 = if v301 ~= nil then l_Array_0.concat(v301, {
        v299
    }) else nil;
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        return v259(bit32.bor(l_MountLayoutDev_0, l_Update_0), l_Layout_0, function() --[[ Line: 1456 ]]
            -- upvalues: v300 (copy), v299 (copy)
            return imperativeHandleEffect(v300, v299);
        end, v302);
    else
        return v259(l_Update_0, l_Layout_0, function() --[[ Line: 1462 ]]
            -- upvalues: v300 (copy), v299 (copy)
            return imperativeHandleEffect(v300, v299);
        end, v302);
    end;
end;
updateImperativeHandle = function(v303, v304, v305) --[[ Line: 1468 ]] --[[ Name: updateImperativeHandle ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if l___DEV___0 and type(v304) ~= "function" then
        local v306 = "nil";
        if v304 then
            v306 = type(v304);
        end;
        l_console_0.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", v306);
    end;
    local v307 = nil;
    if v305 ~= nil then
        v307 = table.clone(v305);
        table.insert(v307, v303);
    end;
    return updateEffectImpl(l_Update_0, l_Layout_0, function() --[[ Line: 1495 ]]
        -- upvalues: v304 (copy), v303 (copy)
        return imperativeHandleEffect(v304, v303);
    end, v307);
end;
mountDebugValue = function(_, _) --[[ Line: 1500 ]] --[[ Name: mountDebugValue ]]

end;
local l_mountDebugValue_0 = mountDebugValue;
mountCallback = function(v311, v312) --[[ Line: 1508 ]] --[[ Name: mountCallback ]]
    -- upvalues: v72 (ref), v70 (ref)
    local v313 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v72 == nil then
        v70.memoizedState = v313;
        v72 = v313;
    else
        v72.next = v313;
        v72 = v313;
    end;
    v72.memoizedState = {
        v311, 
        v312
    };
    return v311;
end;
updateCallback = function(v314, v315) --[[ Line: 1516 ]] --[[ Name: updateCallback ]]
    -- upvalues: v136 (copy), v123 (copy)
    local v316 = v136();
    local l_memoizedState_6 = v316.memoizedState;
    if l_memoizedState_6 ~= nil and v315 ~= nil then
        local v318 = l_memoizedState_6[2];
        if v123(v315, v318) then
            return l_memoizedState_6[1];
        end;
    end;
    v316.memoizedState = {
        v314, 
        v315
    };
    return v314;
end;
mountMemo = function(v319, v320) --[[ Line: 1535 ]] --[[ Name: mountMemo ]]
    -- upvalues: v72 (ref), v70 (ref)
    local v321 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v72 == nil then
        v70.memoizedState = v321;
        v72 = v321;
    else
        v72.next = v321;
        v72 = v321;
    end;
    local l_v72_11 = v72;
    v321 = {
        v319()
    };
    l_v72_11.memoizedState = {
        v321, 
        v320
    };
    return unpack(v321);
end;
updateMemo = function(v323, v324) --[[ Line: 1547 ]] --[[ Name: updateMemo ]]
    -- upvalues: v136 (copy), v123 (copy)
    local v325 = v136();
    local l_memoizedState_7 = v325.memoizedState;
    if l_memoizedState_7 ~= nil and v324 ~= nil then
        local v327 = l_memoizedState_7[2];
        if v123(v324, v327) then
            return unpack(l_memoizedState_7[1]);
        end;
    end;
    local v328 = {
        v323()
    };
    v325.memoizedState = {
        v328, 
        v324
    };
    return unpack(v328);
end;
v68.getIsUpdatingOpaqueValueInRenderPhaseInDEV = function() --[[ Line: 1697 ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        return false;
    else
        return nil;
    end;
end;
mountOpaqueIdentifier = function() --[[ Line: 1719 ]] --[[ Name: mountOpaqueIdentifier ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_makeClientId_0 (copy), l_getIsHydrating_0 (copy)
    local v329 = nil;
    if l___DEV___0 then
        l_console_0.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV");
    else
        v329 = l_makeClientId_0;
    end;
    if l_getIsHydrating_0() then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: ReactFiberHooks: getIsHydrating() true");
        error("FIXME (roblox): ReactFiberHooks: getIsHydrating() true is unimplemented");
        return nil;
    else
        local v330 = v329();
        mountState(v330);
        return v330;
    end;
end;
updateOpaqueIdentifier = function() --[[ Line: 1786 ]] --[[ Name: updateOpaqueIdentifier ]]
    local v331, _ = updateState(nil);
    return v331;
end;
rerenderOpaqueIdentifier = function() --[[ Line: 1791 ]] --[[ Name: rerenderOpaqueIdentifier ]]
    local v333, _ = rerenderState(nil);
    return v333;
end;
dispatchAction = function(v335, v336, v337, ...) --[[ Line: 1796 ]] --[[ Name: dispatchAction ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), v70 (ref), v73 (ref), v74 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v83 (ref), v65 (copy), v3 (copy), l_warnIfNotScopedWithMatchingAct_0 (copy), l_warnIfNotCurrentlyActingUpdatesInDEV_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logStateUpdateScheduled_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markStateUpdateScheduled_0 (copy)
    if l___DEV___0 then
        local v338 = select("#", ...);
        local v339 = nil;
        if v338 == 1 then
            v339 = select(1, ...);
        end;
        if type(v339) == "function" then
            l_console_0.error("State updates from the useState() and useReducer() Hooks don't support the second callback argument. To execute a side effect after rendering, declare it in the component body with useEffect().");
        end;
    end;
    local v340 = l_requestEventTime_0();
    local v341 = l_requestUpdateLane_0(v335);
    local v342 = {
        lane = v341, 
        action = v337, 
        eagerReducer = nil, 
        eagerState = nil, 
        next = nil
    };
    local l_pending_2 = v336.pending;
    if l_pending_2 == nil then
        v342.next = v342;
    else
        v342.next = l_pending_2.next;
        l_pending_2.next = v342;
    end;
    v336.pending = v342;
    local l_alternate_1 = v335.alternate;
    if v335 == v70 or l_alternate_1 ~= nil and l_alternate_1 == v70 then
        v73 = true;
        v74 = true;
    else
        if v335.lanes == l_NoLanes_0 and (l_alternate_1 == nil or l_alternate_1.lanes == l_NoLanes_0) then
            local l_lastRenderedReducer_0 = v336.lastRenderedReducer;
            if l_lastRenderedReducer_0 ~= nil then
                local v346 = nil;
                if l___DEV___0 then
                    v346 = l_ReactCurrentDispatcher_0.current;
                    l_ReactCurrentDispatcher_0.current = v83;
                end;
                local l_lastRenderedState_0 = v336.lastRenderedState;
                local l_status_1, l_result_1 = pcall(l_lastRenderedReducer_0, l_lastRenderedState_0, v337);
                if l_status_1 then
                    v342.eagerReducer = l_lastRenderedReducer_0;
                    v342.eagerState = l_result_1;
                end;
                if l___DEV___0 then
                    l_ReactCurrentDispatcher_0.current = v346;
                end;
                if l_result_1 == l_lastRenderedState_0 and (l_result_1 ~= 0 or 1 / l_result_1 == 1 / l_lastRenderedState_0) or l_result_1 ~= l_result_1 and l_lastRenderedState_0 ~= l_lastRenderedState_0 then
                    if v65 then
                        if l_pending_2 == nil then
                            v336.pending = nil;
                            return;
                        else
                            l_pending_2.next = v342.next;
                            v336.pending = l_pending_2;
                        end;
                    end;
                    return;
                elseif not l_status_1 then

                end;
            end;
        end;
        if l___DEV___0 and (type(_G.jest) ~= "nil" or v3.__TESTEZ_RUNNING_TEST__) then
            l_warnIfNotScopedWithMatchingAct_0(v335);
            l_warnIfNotCurrentlyActingUpdatesInDEV_0(v335);
        end;
        l_scheduleUpdateOnFiber_0(v335, v341, v340);
    end;
    if l___DEV___0 and l_enableDebugTracing_0 and bit32.band(v335.mode, l_DebugTracingMode_0) ~= 0 then
        local v350 = l_getComponentName_0(v335.type) or "Unknown";
        l_logStateUpdateScheduled_0(v350, v341, v337);
    end;
    if l_enableSchedulingProfiler_0 then
        l_markStateUpdateScheduled_0(v335, v341);
    end;
end;
local v351 = {
    readContext = l_readContext_0, 
    useCallback = v110, 
    useContext = v110, 
    useEffect = v110, 
    useImperativeHandle = v110, 
    useLayoutEffect = v110, 
    useMemo = v110, 
    useReducer = v110, 
    useRef = v110, 
    useBinding = v110, 
    useState = v110, 
    useDebugValue = v110, 
    useMutableSource = v110, 
    useOpaqueIdentifier = v110, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
v68.ContextOnlyDispatcher = v351;
local v352 = {
    readContext = l_readContext_0, 
    useCallback = mountCallback, 
    useContext = l_readContext_0, 
    useEffect = v278, 
    useImperativeHandle = mountImperativeHandle, 
    useLayoutEffect = v292, 
    useMemo = mountMemo, 
    useReducer = mountReducer, 
    useRef = mountRef, 
    useBinding = mountBinding, 
    useState = mountState, 
    useDebugValue = mountDebugValue, 
    useMutableSource = mountMutableSource, 
    useOpaqueIdentifier = mountOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v353 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v281, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v295, 
    useMemo = updateMemo, 
    useReducer = updateReducer, 
    useRef = updateRef, 
    useBinding = updateBinding, 
    useState = updateState, 
    useDebugValue = l_mountDebugValue_0, 
    useMutableSource = updateMutableSource, 
    useOpaqueIdentifier = updateOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v354 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v281, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v295, 
    useMemo = updateMemo, 
    useReducer = rerenderReducer, 
    useRef = updateRef, 
    useBinding = updateBinding, 
    useState = rerenderState, 
    useDebugValue = l_mountDebugValue_0, 
    useMutableSource = updateMutableSource, 
    useOpaqueIdentifier = rerenderOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
if l___DEV___0 then
    local function _() --[[ Line: 2022 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().");
    end;
    local function _() --[[ Line: 2031 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
    end;
    v78 = {
        readContext = function(v357, v358) --[[ Line: 2041 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v357, v358);
        end, 
        useCallback = function(v359, v360) --[[ Line: 2047 ]] --[[ Name: useCallback ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref), l_console_0 (copy)
            local v361 = false;
            v75 = "useCallback";
            if l___DEV___0 then
                local l_v75_2 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_2
                    };
                else
                    table.insert(v76, l_v75_2);
                end;
            end;
            if l___DEV___0 and v360 ~= nil then
                local v363;
                if type(v360) ~= "table" then
                    v363 = false;
                else
                    for v364, _ in v360 do
                        if type(v364) ~= "number" then
                            v363 = false;
                            v361 = true;
                        end;
                        if v361 then
                            break;
                        end;
                    end;
                    if not v361 then
                        v363 = true;
                    end;
                end;
                v361 = false;
                if not v363 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v75, (type(v360)));
                end;
            end;
            return mountCallback(v359, v360);
        end, 
        useContext = function(v366, v367) --[[ Line: 2053 ]] --[[ Name: useContext ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref), l_readContext_0 (copy)
            v75 = "useContext";
            if l___DEV___0 then
                local l_v75_3 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_3
                    };
                else
                    table.insert(v76, l_v75_3);
                end;
            end;
            return l_readContext_0(v366, v367);
        end, 
        useEffect = function(v369, v370) --[[ Line: 2061 ]] --[[ Name: useEffect ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref), l_console_0 (copy), v278 (copy)
            local v371 = false;
            v75 = "useEffect";
            if l___DEV___0 then
                local l_v75_4 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_4
                    };
                else
                    table.insert(v76, l_v75_4);
                end;
            end;
            if l___DEV___0 and v370 ~= nil then
                local v373;
                if type(v370) ~= "table" then
                    v373 = false;
                else
                    for v374, _ in v370 do
                        if type(v374) ~= "number" then
                            v373 = false;
                            v371 = true;
                        end;
                        if v371 then
                            break;
                        end;
                    end;
                    if not v371 then
                        v373 = true;
                    end;
                end;
                v371 = false;
                if not v373 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v75, (type(v370)));
                end;
            end;
            return v278(v369, v370);
        end, 
        useImperativeHandle = function(v376, v377, v378) --[[ Line: 2071 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref), l_console_0 (copy)
            local v379 = false;
            v75 = "useImperativeHandle";
            if l___DEV___0 then
                local l_v75_5 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_5
                    };
                else
                    table.insert(v76, l_v75_5);
                end;
            end;
            if l___DEV___0 and v378 ~= nil then
                local v381;
                if type(v378) ~= "table" then
                    v381 = false;
                else
                    for v382, _ in v378 do
                        if type(v382) ~= "number" then
                            v381 = false;
                            v379 = true;
                        end;
                        if v379 then
                            break;
                        end;
                    end;
                    if not v379 then
                        v381 = true;
                    end;
                end;
                v379 = false;
                if not v381 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v75, (type(v378)));
                end;
            end;
            return mountImperativeHandle(v376, v377, v378);
        end, 
        useLayoutEffect = function(v384, v385) --[[ Line: 2081 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref), l_console_0 (copy), v292 (copy)
            local v386 = false;
            v75 = "useLayoutEffect";
            if l___DEV___0 then
                local l_v75_6 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_6
                    };
                else
                    table.insert(v76, l_v75_6);
                end;
            end;
            if l___DEV___0 and v385 ~= nil then
                local v388;
                if type(v385) ~= "table" then
                    v388 = false;
                else
                    for v389, _ in v385 do
                        if type(v389) ~= "number" then
                            v388 = false;
                            v386 = true;
                        end;
                        if v386 then
                            break;
                        end;
                    end;
                    if not v386 then
                        v388 = true;
                    end;
                end;
                v386 = false;
                if not v388 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v75, (type(v385)));
                end;
            end;
            return v292(v384, v385);
        end, 
        useMemo = function(v391, v392) --[[ Line: 2092 ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            local v393 = false;
            v75 = "useMemo";
            if l___DEV___0 then
                local l_v75_7 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_7
                    };
                else
                    table.insert(v76, l_v75_7);
                end;
            end;
            if l___DEV___0 and v392 ~= nil then
                local v395;
                if type(v392) ~= "table" then
                    v395 = false;
                else
                    for v396, _ in v392 do
                        if type(v396) ~= "number" then
                            v395 = false;
                            v393 = true;
                        end;
                        if v393 then
                            break;
                        end;
                    end;
                    if not v393 then
                        v395 = true;
                    end;
                end;
                v393 = false;
                if not v395 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v75, (type(v392)));
                end;
            end;
            local l_current_1 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v399 = {
                pcall(mountMemo, v391, v392)
            };
            l_ReactCurrentDispatcher_0.current = l_current_1;
            if not v399[1] then
                error(v399[2]);
            end;
            return unpack(v399, 2);
        end, 
        useReducer = function(v400, v401, v402) --[[ Line: 2110 ]] --[[ Name: useReducer ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v75 = "useReducer";
            if l___DEV___0 then
                local l_v75_8 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_8
                    };
                else
                    table.insert(v76, l_v75_8);
                end;
            end;
            local l_current_2 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v405, v406, v407 = pcall(mountReducer, v400, v401, v402);
            l_ReactCurrentDispatcher_0.current = l_current_2;
            if not v405 then
                error(v406);
            end;
            return v406, v407;
        end, 
        useRef = function(v408) --[[ Line: 2128 ]] --[[ Name: useRef ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref)
            v75 = "useRef";
            if l___DEV___0 then
                local l_v75_9 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_9
                    };
                else
                    table.insert(v76, l_v75_9);
                end;
            end;
            return mountRef(v408);
        end, 
        useBinding = function(v410) --[[ Line: 2134 ]] --[[ Name: useBinding ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref)
            v75 = "useBinding";
            if l___DEV___0 then
                local l_v75_10 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_10
                    };
                else
                    table.insert(v76, l_v75_10);
                end;
            end;
            return mountBinding(v410);
        end, 
        useState = function(v412) --[[ Line: 2139 ]] --[[ Name: useState ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v75 = "useState";
            if l___DEV___0 then
                local l_v75_11 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_11
                    };
                else
                    table.insert(v76, l_v75_11);
                end;
            end;
            local l_current_3 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v415, v416, v417 = pcall(mountState, v412);
            l_ReactCurrentDispatcher_0.current = l_current_3;
            if not v415 then
                error(v416);
            end;
            return v416, v417;
        end, 
        useDebugValue = function(v418, v419) --[[ Line: 2155 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref)
            v75 = "useDebugValue";
            if l___DEV___0 then
                local l_v75_12 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_12
                    };
                else
                    table.insert(v76, l_v75_12);
                end;
            end;
            return mountDebugValue(v418, v419);
        end, 
        useMutableSource = function(v421, v422, v423) --[[ Line: 2170 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref)
            v75 = "useMutableSource";
            if l___DEV___0 then
                local l_v75_13 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_13
                    };
                else
                    table.insert(v76, l_v75_13);
                end;
            end;
            return mountMutableSource(v421, v422, v423);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2185 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), v76 (ref)
            v75 = "useOpaqueIdentifier";
            if l___DEV___0 then
                local l_v75_14 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_14
                    };
                else
                    table.insert(v76, l_v75_14);
                end;
            end;
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v79 = {
        readContext = function(v426, v427) --[[ Line: 2195 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v426, v427);
        end, 
        useCallback = function(v428, v429) --[[ Line: 2201 ]] --[[ Name: useCallback ]]
            -- upvalues: v75 (ref), l___DEV___0 (copy), l_console_0 (copy)
            local v430 = false;
            v75 = "useCallback";
            updateHookTypesDev();
            if l___DEV___0 and v429 ~= nil then
                local v431;
                if type(v429) ~= "table" then
                    v431 = false;
                else
                    for v432, _ in v429 do
                        if type(v432) ~= "number" then
                            v431 = false;
                            v430 = true;
                        end;
                        if v430 then
                            break;
                        end;
                    end;
                    if not v430 then
                        v431 = true;
                    end;
                end;
                v430 = false;
                if not v431 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", v75, (type(v429)));
                end;
            end;
            return mountCallback(v428, v429);
        end, 
        useContext = function(v434, v435) --[[ Line: 2207 ]] --[[ Name: useContext ]]
            -- upvalues: v75 (ref), l_readContext_0 (copy)
            v75 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v434, v435);
        end, 
        useEffect = function(v436, v437) --[[ Line: 2215 ]] --[[ Name: useEffect ]]
            -- upvalues: v75 (ref), v278 (copy)
            v75 = "useEffect";
            updateHookTypesDev();
            return v278(v436, v437);
        end, 
        useImperativeHandle = function(v438, v439, v440) --[[ Line: 2224 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v75 (ref)
            v75 = "useImperativeHandle";
            updateHookTypesDev();
            return mountImperativeHandle(v438, v439, v440);
        end, 
        useLayoutEffect = function(v441, v442) --[[ Line: 2233 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v75 (ref), v292 (copy)
            v75 = "useLayoutEffect";
            updateHookTypesDev();
            return v292(v441, v442);
        end, 
        useMemo = function(v443, v444) --[[ Line: 2243 ]]
            -- upvalues: v75 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v75 = "useMemo";
            updateHookTypesDev();
            local l_current_4 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v446 = {
                pcall(mountMemo, v443, v444)
            };
            l_ReactCurrentDispatcher_0.current = l_current_4;
            if not v446[1] then
                error(v446[2]);
            end;
            return unpack(v446, 2);
        end, 
        useReducer = function(v447, v448, v449) --[[ Line: 2259 ]] --[[ Name: useReducer ]]
            -- upvalues: v75 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v75 = "useReducer";
            updateHookTypesDev();
            local l_current_5 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v451, v452, v453 = pcall(mountReducer, v447, v448, v449);
            l_ReactCurrentDispatcher_0.current = l_current_5;
            if not v451 then
                error(v452);
            end;
            return v452, v453;
        end, 
        useRef = function(v454) --[[ Line: 2277 ]] --[[ Name: useRef ]]
            -- upvalues: v75 (ref)
            v75 = "useRef";
            updateHookTypesDev();
            return mountRef(v454);
        end, 
        useBinding = function(v455) --[[ Line: 2283 ]] --[[ Name: useBinding ]]
            -- upvalues: v75 (ref)
            v75 = "useBinding";
            updateHookTypesDev();
            return mountBinding(v455);
        end, 
        useState = function(v456) --[[ Line: 2288 ]] --[[ Name: useState ]]
            -- upvalues: v75 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v75 = "useState";
            updateHookTypesDev();
            local l_current_6 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v458, v459, v460 = pcall(mountState, v456);
            l_ReactCurrentDispatcher_0.current = l_current_6;
            if not v458 then
                error(v459);
            end;
            return v459, v460;
        end, 
        useDebugValue = function(v461, v462) --[[ Line: 2304 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v75 (ref)
            v75 = "useDebugValue";
            updateHookTypesDev();
            return mountDebugValue(v461, v462);
        end, 
        useMutableSource = function(v463, v464, v465) --[[ Line: 2319 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v75 (ref)
            v75 = "useMutableSource";
            updateHookTypesDev();
            return mountMutableSource(v463, v464, v465);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2334 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v75 (ref)
            v75 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v80 = {
        readContext = function(v466, v467) --[[ Line: 2344 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v466, v467);
        end, 
        useCallback = function(v468, v469) --[[ Line: 2350 ]] --[[ Name: useCallback ]]
            -- upvalues: v75 (ref)
            v75 = "useCallback";
            updateHookTypesDev();
            return updateCallback(v468, v469);
        end, 
        useContext = function(v470, v471) --[[ Line: 2355 ]] --[[ Name: useContext ]]
            -- upvalues: v75 (ref), l_readContext_0 (copy)
            v75 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v470, v471);
        end, 
        useEffect = function(v472, v473) --[[ Line: 2363 ]] --[[ Name: useEffect ]]
            -- upvalues: v75 (ref), v281 (copy)
            v75 = "useEffect";
            updateHookTypesDev();
            return v281(v472, v473);
        end, 
        useImperativeHandle = function(v474, v475, v476) --[[ Line: 2372 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v75 (ref)
            v75 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v474, v475, v476);
        end, 
        useLayoutEffect = function(v477, v478) --[[ Line: 2381 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v75 (ref), v295 (copy)
            v75 = "useLayoutEffect";
            updateHookTypesDev();
            return v295(v477, v478);
        end, 
        useMemo = function(v479, v480) --[[ Line: 2391 ]]
            -- upvalues: v75 (ref), l_ReactCurrentDispatcher_0 (copy), v83 (ref)
            v75 = "useMemo";
            updateHookTypesDev();
            local l_current_7 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v482 = {
                pcall(updateMemo, v479, v480)
            };
            l_ReactCurrentDispatcher_0.current = l_current_7;
            if not v482[1] then
                error(v482[2]);
            end;
            return unpack(v482, 2);
        end, 
        useReducer = function(v483, v484, v485) --[[ Line: 2407 ]] --[[ Name: useReducer ]]
            -- upvalues: v75 (ref), l_ReactCurrentDispatcher_0 (copy), v83 (ref)
            v75 = "useReducer";
            updateHookTypesDev();
            local l_current_8 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v487, v488, v489 = pcall(updateReducer, v483, v484, v485);
            l_ReactCurrentDispatcher_0.current = l_current_8;
            if not v487 then
                error(v488);
            end;
            return v488, v489;
        end, 
        useRef = function(v490) --[[ Line: 2425 ]] --[[ Name: useRef ]]
            -- upvalues: v75 (ref)
            v75 = "useRef";
            updateHookTypesDev();
            return updateRef(v490);
        end, 
        useBinding = function(v491) --[[ Line: 2431 ]] --[[ Name: useBinding ]]
            -- upvalues: v75 (ref)
            v75 = "useBinding";
            updateHookTypesDev();
            return updateBinding(v491);
        end, 
        useState = function(v492) --[[ Line: 2436 ]] --[[ Name: useState ]]
            -- upvalues: v75 (ref), l_ReactCurrentDispatcher_0 (copy), v83 (ref)
            v75 = "useState";
            updateHookTypesDev();
            local l_current_9 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v494, v495, v496 = pcall(updateState, v492);
            l_ReactCurrentDispatcher_0.current = l_current_9;
            if not v494 then
                error(v495);
            end;
            return v495, v496;
        end, 
        useDebugValue = function(v497, v498) --[[ Line: 2452 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v75 (ref), l_mountDebugValue_0 (copy)
            v75 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v497, v498);
        end, 
        useMutableSource = function(v499, v500, v501) --[[ Line: 2467 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v75 (ref)
            v75 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v499, v500, v501);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2482 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v75 (ref)
            v75 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v81 = {
        readContext = function(v502, v503) --[[ Line: 2492 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v502, v503);
        end, 
        useCallback = function(v504, v505) --[[ Line: 2498 ]] --[[ Name: useCallback ]]
            -- upvalues: v75 (ref)
            v75 = "useCallback";
            updateHookTypesDev();
            return updateCallback(v504, v505);
        end, 
        useContext = function(v506, v507) --[[ Line: 2503 ]] --[[ Name: useContext ]]
            -- upvalues: v75 (ref), l_readContext_0 (copy)
            v75 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v506, v507);
        end, 
        useEffect = function(v508, v509) --[[ Line: 2511 ]] --[[ Name: useEffect ]]
            -- upvalues: v75 (ref), v281 (copy)
            v75 = "useEffect";
            updateHookTypesDev();
            return v281(v508, v509);
        end, 
        useImperativeHandle = function(v510, v511, v512) --[[ Line: 2520 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v75 (ref)
            v75 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v510, v511, v512);
        end, 
        useLayoutEffect = function(v513, v514) --[[ Line: 2529 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v75 (ref), v295 (copy)
            v75 = "useLayoutEffect";
            updateHookTypesDev();
            return v295(v513, v514);
        end, 
        useMemo = function(v515, v516) --[[ Line: 2539 ]]
            -- upvalues: v75 (ref), l_ReactCurrentDispatcher_0 (copy), v84 (ref)
            v75 = "useMemo";
            updateHookTypesDev();
            local l_current_10 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v84;
            local v518 = {
                pcall(updateMemo, v515, v516)
            };
            l_ReactCurrentDispatcher_0.current = l_current_10;
            if not v518[1] then
                error(v518[2]);
            end;
            return unpack(v518, 2);
        end, 
        useReducer = function(v519, v520, v521) --[[ Line: 2555 ]] --[[ Name: useReducer ]]
            -- upvalues: v75 (ref), l_ReactCurrentDispatcher_0 (copy), v84 (ref)
            v75 = "useReducer";
            updateHookTypesDev();
            local l_current_11 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v84;
            local v523, v524, v525 = pcall(rerenderReducer, v519, v520, v521);
            l_ReactCurrentDispatcher_0.current = l_current_11;
            if not v523 then
                error(v524);
            end;
            return v524, v525;
        end, 
        useRef = function(v526) --[[ Line: 2574 ]] --[[ Name: useRef ]]
            -- upvalues: v75 (ref)
            v75 = "useRef";
            updateHookTypesDev();
            return updateRef(v526);
        end, 
        useBinding = function(v527) --[[ Line: 2580 ]] --[[ Name: useBinding ]]
            -- upvalues: v75 (ref)
            v75 = "useBinding";
            updateHookTypesDev();
            return updateBinding(v527);
        end, 
        useState = function(v528) --[[ Line: 2585 ]] --[[ Name: useState ]]
            -- upvalues: v75 (ref), l_ReactCurrentDispatcher_0 (copy), v84 (ref)
            v75 = "useState";
            updateHookTypesDev();
            local l_current_12 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v84;
            local v530, v531, v532 = pcall(rerenderState, v528);
            l_ReactCurrentDispatcher_0.current = l_current_12;
            if not v530 then
                error(v531);
            end;
            return v531, v532;
        end, 
        useDebugValue = function(v533, v534) --[[ Line: 2601 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v75 (ref), l_mountDebugValue_0 (copy)
            v75 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v533, v534);
        end, 
        useMutableSource = function(v535, v536, v537) --[[ Line: 2616 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v75 (ref)
            v75 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v535, v536, v537);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2631 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v75 (ref)
            v75 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v82 = {
        readContext = function(v538, v539) --[[ Line: 2641 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v538, v539);
        end, 
        useCallback = function(v540, v541) --[[ Line: 2648 ]] --[[ Name: useCallback ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref)
            v75 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_15 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_15
                    };
                else
                    table.insert(v76, l_v75_15);
                end;
            end;
            return mountCallback(v540, v541);
        end, 
        useContext = function(v543, v544) --[[ Line: 2654 ]] --[[ Name: useContext ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref), l_readContext_0 (copy)
            v75 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_16 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_16
                    };
                else
                    table.insert(v76, l_v75_16);
                end;
            end;
            return l_readContext_0(v543, v544);
        end, 
        useEffect = function(v546, v547) --[[ Line: 2663 ]] --[[ Name: useEffect ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref), v278 (copy)
            v75 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_17 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_17
                    };
                else
                    table.insert(v76, l_v75_17);
                end;
            end;
            return v278(v546, v547);
        end, 
        useImperativeHandle = function(v549, v550, v551) --[[ Line: 2673 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref)
            v75 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_18 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_18
                    };
                else
                    table.insert(v76, l_v75_18);
                end;
            end;
            return mountImperativeHandle(v549, v550, v551);
        end, 
        useLayoutEffect = function(v553, v554) --[[ Line: 2683 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref), v292 (copy)
            v75 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_19 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_19
                    };
                else
                    table.insert(v76, l_v75_19);
                end;
            end;
            return v292(v553, v554);
        end, 
        useMemo = function(v556, v557) --[[ Line: 2694 ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v75 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_20 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_20
                    };
                else
                    table.insert(v76, l_v75_20);
                end;
            end;
            local l_current_13 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v560 = {
                pcall(mountMemo, v556, v557)
            };
            l_ReactCurrentDispatcher_0.current = l_current_13;
            if not v560[1] then
                error(v560[2]);
            end;
            return unpack(v560, 2);
        end, 
        useReducer = function(v561, v562, v563) --[[ Line: 2711 ]] --[[ Name: useReducer ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v75 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_21 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_21
                    };
                else
                    table.insert(v76, l_v75_21);
                end;
            end;
            local l_current_14 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v566, v567, v568 = pcall(mountReducer, v561, v562, v563);
            l_ReactCurrentDispatcher_0.current = l_current_14;
            if not v566 then
                error(v567);
            end;
            return v567, v568;
        end, 
        useRef = function(v569) --[[ Line: 2730 ]] --[[ Name: useRef ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref)
            v75 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_22 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_22
                    };
                else
                    table.insert(v76, l_v75_22);
                end;
            end;
            return mountRef(v569);
        end, 
        useBinding = function(v571) --[[ Line: 2737 ]] --[[ Name: useBinding ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref)
            v75 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_23 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_23
                    };
                else
                    table.insert(v76, l_v75_23);
                end;
            end;
            return mountBinding(v571);
        end, 
        useState = function(v573) --[[ Line: 2743 ]] --[[ Name: useState ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v75 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_24 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_24
                    };
                else
                    table.insert(v76, l_v75_24);
                end;
            end;
            local l_current_15 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v576, v577, v578 = pcall(mountState, v573);
            l_ReactCurrentDispatcher_0.current = l_current_15;
            if not v576 then
                error(v577);
            end;
            return v577, v578;
        end, 
        useDebugValue = function(v579, v580) --[[ Line: 2760 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref)
            v75 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_25 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_25
                    };
                else
                    table.insert(v76, l_v75_25);
                end;
            end;
            return mountDebugValue(v579, v580);
        end, 
        useMutableSource = function(v582, v583, v584) --[[ Line: 2778 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref)
            v75 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_26 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_26
                    };
                else
                    table.insert(v76, l_v75_26);
                end;
            end;
            return mountMutableSource(v582, v583, v584);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2794 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l___DEV___0 (copy), v76 (ref)
            v75 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v75_27 = v75;
                if v76 == nil then
                    v76 = {
                        l_v75_27
                    };
                else
                    table.insert(v76, l_v75_27);
                end;
            end;
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v83 = {
        readContext = function(v587, v588) --[[ Line: 2805 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v587, v588);
        end, 
        useCallback = function(v589, v590) --[[ Line: 2812 ]] --[[ Name: useCallback ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return mountCallback(v589, v590);
        end, 
        useContext = function(v591, v592) --[[ Line: 2818 ]] --[[ Name: useContext ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v75 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v591, v592);
        end, 
        useEffect = function(v593, v594) --[[ Line: 2827 ]] --[[ Name: useEffect ]]
            -- upvalues: v75 (ref), l_console_0 (copy), v281 (copy)
            v75 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v281(v593, v594);
        end, 
        useImperativeHandle = function(v595, v596, v597) --[[ Line: 2837 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v595, v596, v597);
        end, 
        useLayoutEffect = function(v598, v599) --[[ Line: 2847 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v75 (ref), l_console_0 (copy), v295 (copy)
            v75 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v295(v598, v599);
        end, 
        useMemo = function(v600, v601) --[[ Line: 2858 ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v83 (ref)
            v75 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_16 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v603 = {
                pcall(updateMemo, v600, v601)
            };
            l_ReactCurrentDispatcher_0.current = l_current_16;
            if not v603[1] then
                error(v603[2]);
            end;
            return unpack(v603, 2);
        end, 
        useReducer = function(v604, v605, v606) --[[ Line: 2875 ]] --[[ Name: useReducer ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v83 (ref)
            v75 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_17 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v608, v609, v610 = pcall(updateReducer, v604, v605, v606);
            l_ReactCurrentDispatcher_0.current = l_current_17;
            if not v608 then
                error(v609);
            end;
            return v609, v610;
        end, 
        useRef = function(v611) --[[ Line: 2895 ]] --[[ Name: useRef ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v611);
        end, 
        useBinding = function(v612) --[[ Line: 2902 ]] --[[ Name: useBinding ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateBinding(v612);
        end, 
        useState = function(v613) --[[ Line: 2908 ]] --[[ Name: useState ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v83 (ref)
            v75 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_18 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v615, v616, v617 = pcall(updateState, v613);
            l_ReactCurrentDispatcher_0.current = l_current_18;
            if not v615 then
                error(v616);
            end;
            return v616, v617;
        end, 
        useDebugValue = function(v618, v619) --[[ Line: 2925 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v75 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v618, v619);
        end, 
        useMutableSource = function(v620, v621, v622) --[[ Line: 2943 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v620, v621, v622);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2959 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v84 = {
        readContext = function(v623, v624) --[[ Line: 2970 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v623, v624);
        end, 
        useCallback = function(v625, v626) --[[ Line: 2977 ]] --[[ Name: useCallback ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateCallback(v625, v626);
        end, 
        useContext = function(v627, v628) --[[ Line: 2983 ]] --[[ Name: useContext ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v75 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v627, v628);
        end, 
        useEffect = function(v629, v630) --[[ Line: 2992 ]] --[[ Name: useEffect ]]
            -- upvalues: v75 (ref), l_console_0 (copy), v281 (copy)
            v75 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v281(v629, v630);
        end, 
        useImperativeHandle = function(v631, v632, v633) --[[ Line: 3002 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v631, v632, v633);
        end, 
        useLayoutEffect = function(v634, v635) --[[ Line: 3012 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v75 (ref), l_console_0 (copy), v295 (copy)
            v75 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v295(v634, v635);
        end, 
        useMemo = function(v636, v637) --[[ Line: 3023 ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v83 (ref)
            v75 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_19 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v639 = {
                pcall(updateMemo, v636, v637)
            };
            l_ReactCurrentDispatcher_0.current = l_current_19;
            if not v639[1] then
                error(v639[2]);
            end;
            return unpack(v639, 2);
        end, 
        useReducer = function(v640, v641, v642) --[[ Line: 3040 ]] --[[ Name: useReducer ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v83 (ref)
            v75 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_20 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v644, v645, v646 = pcall(rerenderReducer, v640, v641, v642);
            l_ReactCurrentDispatcher_0.current = l_current_20;
            if not v644 then
                error(v645);
            end;
            return v645, v646;
        end, 
        useRef = function(v647) --[[ Line: 3060 ]] --[[ Name: useRef ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v647);
        end, 
        useBinding = function(v648) --[[ Line: 3067 ]] --[[ Name: useBinding ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateBinding(v648);
        end, 
        useState = function(v649) --[[ Line: 3073 ]] --[[ Name: useState ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v83 (ref)
            v75 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_21 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v83;
            local v651, v652, v653 = pcall(rerenderState, v649);
            l_ReactCurrentDispatcher_0.current = l_current_21;
            if not v651 then
                error(v652);
            end;
            return v652, v653;
        end, 
        useDebugValue = function(v654, v655) --[[ Line: 3090 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v75 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v75 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v654, v655);
        end, 
        useMutableSource = function(v656, v657, v658) --[[ Line: 3108 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v656, v657, v658);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 3124 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v75 (ref), l_console_0 (copy)
            v75 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
end;
v68.renderWithHooks = function(v659, v660, v661, v662, v663, v664) --[[ Line: 3135 ]] --[[ Name: renderWithHooks ]]
    -- upvalues: l_l_NoLanes_0_0 (ref), v70 (ref), l___DEV___0 (copy), v76 (ref), v77 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref), v79 (ref), v78 (ref), v352 (copy), v353 (copy), v74 (ref), l_Error_0 (copy), v71 (ref), v72 (ref), v81 (ref), v354 (copy), v351 (copy), v75 (ref), v73 (ref), l_getComponentName_0 (copy)
    l_l_NoLanes_0_0 = v664;
    v70 = v660;
    if l___DEV___0 then
        v76 = if v659 ~= nil then v659._debugHookTypes else nil;
        v77 = 0;
    end;
    v660.memoizedState = nil;
    v660.updateQueue = nil;
    v660.lanes = l_NoLanes_0;
    if l___DEV___0 then
        if v659 ~= nil and v659.memoizedState ~= nil then
            l_ReactCurrentDispatcher_0.current = v80;
        elseif v76 ~= nil then
            l_ReactCurrentDispatcher_0.current = v79;
        else
            l_ReactCurrentDispatcher_0.current = v78;
        end;
    else
        l_ReactCurrentDispatcher_0.current = (not (v659 ~= nil) or v659.memoizedState == nil) and v352 or v353;
    end;
    local v665 = v661(v662, v663);
    if v74 then
        local v666 = 0;
        repeat
            v74 = false;
            if v666 >= 25 then
                error(l_Error_0.new("Too many re-renders. React limits the number of renders to prevent an infinite loop."));
            end;
            v666 = v666 + 1;
            v71 = nil;
            v72 = nil;
            v660.updateQueue = nil;
            if l___DEV___0 then
                v77 = 0;
            end;
            l_ReactCurrentDispatcher_0.current = l___DEV___0 and v81 or v354;
            v665 = v661(v662, v663);
        until not v74;
    end;
    l_ReactCurrentDispatcher_0.current = v351;
    if l___DEV___0 then
        v660._debugHookTypes = v76;
    end;
    local v667 = false;
    if v71 ~= nil then
        v667 = v71.next ~= nil;
    end;
    l_l_NoLanes_0_0 = l_NoLanes_0;
    v70 = nil;
    v71 = nil;
    v72 = nil;
    if l___DEV___0 then
        v75 = nil;
        v76 = nil;
        v77 = 0;
    end;
    v73 = false;
    if v667 then
        local v668 = "unknown";
        if v665 and v665.type then
            v668 = l_getComponentName_0(v665.type) or v668;
        end;
        error(l_Error_0.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement. Inside '" .. v668 .. "'"));
    end;
    return v665;
end;
return v68;