local function _(v0) --[[ Line: 11 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(script.Parent.ReactFiberLane);
local l_OffscreenLane_0 = v4.OffscreenLane;
local v6 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local l_resetWorkInProgressVersions_0 = require(script.Parent["ReactMutableSource.new"]).resetWorkInProgressVersions;
local v9 = require(script.Parent.ReactWorkTags);
local l_IndeterminateComponent_0 = v9.IndeterminateComponent;
local l_FunctionComponent_0 = v9.FunctionComponent;
local l_ClassComponent_0 = v9.ClassComponent;
local l_HostRoot_0 = v9.HostRoot;
local l_HostComponent_0 = v9.HostComponent;
local l_HostText_0 = v9.HostText;
local l_HostPortal_0 = v9.HostPortal;
local l_ContextProvider_0 = v9.ContextProvider;
local l_ContextConsumer_0 = v9.ContextConsumer;
local l_ForwardRef_0 = v9.ForwardRef;
local l_Fragment_0 = v9.Fragment;
local l_Mode_0 = v9.Mode;
local l_Profiler_0 = v9.Profiler;
local l_SuspenseComponent_0 = v9.SuspenseComponent;
local l_SuspenseListComponent_0 = v9.SuspenseListComponent;
local l_MemoComponent_0 = v9.MemoComponent;
local l_SimpleMemoComponent_0 = v9.SimpleMemoComponent;
local l_LazyComponent_0 = v9.LazyComponent;
local l_IncompleteClassComponent_0 = v9.IncompleteClassComponent;
local l_FundamentalComponent_0 = v9.FundamentalComponent;
local l_ScopeComponent_0 = v9.ScopeComponent;
local l_Block_0 = v9.Block;
local l_OffscreenComponent_0 = v9.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v9.LegacyHiddenComponent;
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v35 = require(script.Parent.ReactTypeOfMode);
local l_NoMode_0 = v35.NoMode;
local l_ConcurrentMode_0 = v35.ConcurrentMode;
local l_BlockingMode_0 = v35.BlockingMode;
local l_ProfileMode_0 = v35.ProfileMode;
local v40 = require(script.Parent.ReactFiberFlags);
local l_Ref_0 = v40.Ref;
local l_Update_0 = v40.Update;
local l_Callback_0 = v40.Callback;
local l_Passive_0 = v40.Passive;
local l_Deletion_0 = v40.Deletion;
local l_NoFlags_0 = v40.NoFlags;
local l_DidCapture_0 = v40.DidCapture;
local l_Snapshot_0 = v40.Snapshot;
local l_MutationMask_0 = v40.MutationMask;
local l_LayoutMask_0 = v40.LayoutMask;
local l_PassiveMask_0 = v40.PassiveMask;
local l_StaticMask_0 = v40.StaticMask;
local l_PerformedWork_0 = v40.PerformedWork;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_createInstance_0 = v6.createInstance;
local l_createTextInstance_0 = v6.createTextInstance;
local l_appendInitialChild_0 = v6.appendInitialChild;
local l_finalizeInitialChildren_0 = v6.finalizeInitialChildren;
local l_prepareUpdate_0 = v6.prepareUpdate;
local l_supportsMutation_0 = v6.supportsMutation;
local l_supportsPersistence_0 = v6.supportsPersistence;
local l_createContainerChildSet_0 = v6.createContainerChildSet;
local l_finalizeContainerChildren_0 = v6.finalizeContainerChildren;
local l_preparePortalMount_0 = v6.preparePortalMount;
local v65 = require(script.Parent["ReactFiberHostContext.new"]);
local l_getRootHostContainer_0 = v65.getRootHostContainer;
local l_popHostContext_0 = v65.popHostContext;
local l_getHostContext_0 = v65.getHostContext;
local l_popHostContainer_0 = v65.popHostContainer;
local v70 = require(script.Parent["ReactFiberSuspenseContext.new"]);
local l_popSuspenseContext_0 = v70.popSuspenseContext;
local l_suspenseStackCursor_0 = v70.suspenseStackCursor;
local l_InvisibleParentSuspenseContext_0 = v70.InvisibleParentSuspenseContext;
local l_hasSuspenseContext_0 = v70.hasSuspenseContext;
local v75 = require(script.Parent["ReactFiberContext.new"]);
local l_isContextProvider_0 = v75.isContextProvider;
local l_popContext_0 = v75.popContext;
local l_popTopLevelContextObject_0 = v75.popTopLevelContextObject;
local l_popProvider_0 = require(script.Parent["ReactFiberNewContext.new"]).popProvider;
local v80 = require(script.Parent["ReactFiberHydrationContext.new"]);
local l_prepareToHydrateHostSuspenseInstance_0 = v80.prepareToHydrateHostSuspenseInstance;
local l_popHydrationState_0 = v80.popHydrationState;
local l_resetHydrationState_0 = v80.resetHydrationState;
local l_prepareToHydrateHostInstance_0 = v80.prepareToHydrateHostInstance;
local l_prepareToHydrateHostTextInstance_0 = v80.prepareToHydrateHostTextInstance;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_enableSuspenseServerRenderer_0 = l_ReactFeatureFlags_0.enableSuspenseServerRenderer;
local l_enableFundamentalAPI_0 = l_ReactFeatureFlags_0.enableFundamentalAPI;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local v92 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_popRenderLanes_0 = v92.popRenderLanes;
local l_markSpawnedWork_0 = v92.markSpawnedWork;
local l_renderDidSuspend_0 = v92.renderDidSuspend;
local l_renderDidSuspendDelayIfPossible_0 = v92.renderDidSuspendDelayIfPossible;
local l_NoLanes_0 = v4.NoLanes;
local l_includesSomeLane_0 = v4.includesSomeLane;
local l_mergeLanes_0 = v4.mergeLanes;
local l_transferActualDuration_0 = require(script.Parent["ReactProfilerTimer.new"]).transferActualDuration;
local function _(v101) --[[ Line: 189 ]] --[[ Name: markUpdate ]]
    -- upvalues: l_Update_0 (copy)
    v101.flags = bit32.bor(v101.flags, l_Update_0);
end;
local function _(v103) --[[ Line: 195 ]] --[[ Name: markRef ]]
    -- upvalues: l_Ref_0 (copy)
    v103.flags = bit32.bor(v103.flags, l_Ref_0);
end;
local function v109(v105, v106) --[[ Line: 201 ]] --[[ Name: hadNoMutationsEffects ]]
    -- upvalues: l_MutationMask_0 (copy), l_NoFlags_0 (copy)
    local v107 = false;
    if v105 ~= nil then
        v107 = v105.child == v106.child;
    end;
    if v107 then
        return true;
    else
        local l_child_0 = v106.child;
        while true do
            if l_child_0 ~= nil then
                if bit32.band(l_child_0.flags, l_MutationMask_0) ~= l_NoFlags_0 then
                    return false;
                elseif bit32.band(l_child_0.subtreeFlags, l_MutationMask_0) ~= l_NoFlags_0 then
                    return false;
                else
                    l_child_0 = l_child_0.sibling;
                end;
            else
                return true;
            end;
        end;
    end;
end;
local v110 = nil;
local v111 = nil;
local v112 = nil;
local v113 = nil;
if l_supportsMutation_0 then
    v110 = function(v114, v115, _, _) --[[ Line: 227 ]]
        -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_appendInitialChild_0 (copy), l_enableFundamentalAPI_0 (copy), l_FundamentalComponent_0 (copy), l_HostPortal_0 (copy)
        local l_child_1 = v115.child;
        while true do
            if l_child_1 ~= nil then
                if l_child_1.tag == l_HostComponent_0 or l_child_1.tag == l_HostText_0 then
                    l_appendInitialChild_0(v114, l_child_1.stateNode);
                elseif l_enableFundamentalAPI_0 and l_child_1.tag == l_FundamentalComponent_0 then
                    l_appendInitialChild_0(v114, l_child_1.stateNode.instance);
                elseif l_child_1.tag ~= l_HostPortal_0 and l_child_1.child ~= nil then
                    l_child_1.child.return_ = l_child_1;
                    l_child_1 = l_child_1.child;
                    continue;
                end;
                if l_child_1 == v115 then
                    return;
                else
                    while true do
                        if l_child_1.sibling == nil then
                            if l_child_1.return_ == nil or l_child_1.return_ == v115 then
                                return;
                            else
                                l_child_1 = l_child_1.return_;
                            end;
                        else
                            l_child_1.sibling.return_ = l_child_1.return_;
                            l_child_1 = l_child_1.sibling;
                            break;
                        end;
                    end;
                end;
            else
                return;
            end;
        end;
    end;
    v111 = function(_, _) --[[ Line: 265 ]]

    end;
    v112 = function(v121, v122, v123, v124, v125) --[[ Line: 268 ]] --[[ Name: updateHostComponent ]]
        -- upvalues: l_getHostContext_0 (copy), l_prepareUpdate_0 (copy), l_Update_0 (copy)
        local l_memoizedProps_0 = v121.memoizedProps;
        if l_memoizedProps_0 == v124 then
            return;
        else
            local l_stateNode_0 = v122.stateNode;
            local v128 = l_getHostContext_0();
            local v129 = l_prepareUpdate_0(l_stateNode_0, v123, l_memoizedProps_0, v124, v125, v128);
            v122.updateQueue = v129;
            if v129 then
                v122.flags = bit32.bor(v122.flags, l_Update_0);
            end;
            return;
        end;
    end;
    v113 = function(_, v131, v132, v133) --[[ Line: 309 ]] --[[ Name: updateHostText ]]
        -- upvalues: l_Update_0 (copy)
        if v132 ~= v133 then
            v131.flags = bit32.bor(v131.flags, l_Update_0);
        end;
    end;
elseif l_supportsPersistence_0 then
    v110 = function(_, _, _, _) --[[ Line: 322 ]]
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildren"));
        error("FIXME (roblox): appendAllChildren is unimplemented", 2);
    end;
    local _ = function(_, _, _, _) --[[ Line: 417 ]] --[[ Name: appendAllChildrenToContainer ]]
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"));
        error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2);
    end;
    v111 = function(v143, v144) --[[ Line: 511 ]] --[[ Name: updateHostContainer ]]
        -- upvalues: v109 (copy), l_createContainerChildSet_0 (copy), l_Update_0 (copy), l_finalizeContainerChildren_0 (copy)
        local l_stateNode_1 = v144.stateNode;
        if v109(v143, v144) then
            return;
        else
            local l_containerInfo_0 = l_stateNode_1.containerInfo;
            local v147 = l_createContainerChildSet_0(l_containerInfo_0);
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"));
            error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2);
            l_stateNode_1.pendingChildren = v147;
            v144.flags = bit32.bor(v144.flags, l_Update_0);
            l_finalizeContainerChildren_0(l_containerInfo_0, v147);
            return;
        end;
    end;
else
    v111 = function(_, _) --[[ Line: 627 ]]

    end;
end;
local function v161(v150) --[[ Line: 720 ]] --[[ Name: bubbleProperties ]]
    -- upvalues: l_NoLanes_0 (copy), l_NoFlags_0 (copy), l_enableProfilerTimer_0 (copy), l_ProfileMode_0 (copy), l_NoMode_0 (copy), l_mergeLanes_0 (copy), l_StaticMask_0 (copy)
    local v151 = false;
    if v150.alternate ~= nil then
        v151 = v150.alternate.child == v150.child;
    end;
    local l_l_NoLanes_0_0 = l_NoLanes_0;
    local l_l_NoFlags_0_0 = l_NoFlags_0;
    if not v151 then
        if l_enableProfilerTimer_0 and bit32.band(v150.mode, l_ProfileMode_0) ~= l_NoMode_0 then
            local l_actualDuration_0 = v150.actualDuration;
            local l_selfBaseDuration_0 = v150.selfBaseDuration;
            local l_child_2 = v150.child;
            while l_child_2 ~= nil do
                l_l_NoLanes_0_0 = l_mergeLanes_0(l_l_NoLanes_0_0, l_mergeLanes_0(l_child_2.lanes, l_child_2.childLanes));
                l_l_NoFlags_0_0 = bit32.bor(bit32.bor(l_l_NoFlags_0_0, l_child_2.subtreeFlags), l_child_2.flags);
                l_actualDuration_0 = l_actualDuration_0 + l_child_2.actualDuration;
                l_selfBaseDuration_0 = l_selfBaseDuration_0 + l_child_2.treeBaseDuration;
                l_child_2 = l_child_2.sibling;
            end;
            v150.actualDuration = l_actualDuration_0;
            v150.treeBaseDuration = l_selfBaseDuration_0;
        else
            local l_child_3 = v150.child;
            while l_child_3 ~= nil do
                l_l_NoLanes_0_0 = bit32.bor(l_l_NoLanes_0_0, (bit32.bor(l_child_3.lanes, l_child_3.childLanes)));
                l_l_NoFlags_0_0 = bit32.bor(bit32.bor(l_l_NoFlags_0_0, l_child_3.subtreeFlags), l_child_3.flags);
                l_child_3.return_ = v150;
                l_child_3 = l_child_3.sibling;
            end;
        end;
        v150.subtreeFlags = bit32.bor(v150.subtreeFlags, l_l_NoFlags_0_0);
    else
        if l_enableProfilerTimer_0 and bit32.band(v150.mode, l_ProfileMode_0) ~= l_NoMode_0 then
            local l_selfBaseDuration_1 = v150.selfBaseDuration;
            local l_child_4 = v150.child;
            while l_child_4 ~= nil do
                l_l_NoLanes_0_0 = l_mergeLanes_0(l_l_NoLanes_0_0, l_mergeLanes_0(l_child_4.lanes, l_child_4.childLanes));
                l_l_NoFlags_0_0 = bit32.bor(bit32.bor(l_l_NoFlags_0_0, (bit32.band(l_child_4.subtreeFlags, l_StaticMask_0))), (bit32.band(l_child_4.flags, l_StaticMask_0)));
                l_selfBaseDuration_1 = l_selfBaseDuration_1 + l_child_4.treeBaseDuration;
                l_child_4 = l_child_4.sibling;
            end;
            v150.treeBaseDuration = l_selfBaseDuration_1;
        else
            local l_child_5 = v150.child;
            while l_child_5 ~= nil do
                l_l_NoLanes_0_0 = bit32.bor(l_l_NoLanes_0_0, (bit32.bor(l_child_5.lanes, l_child_5.childLanes)));
                l_l_NoFlags_0_0 = bit32.bor(bit32.bor(l_l_NoFlags_0_0, (bit32.band(l_child_5.subtreeFlags, l_StaticMask_0))), (bit32.band(l_child_5.flags, l_StaticMask_0)));
                l_child_5.return_ = v150;
                l_child_5 = l_child_5.sibling;
            end;
        end;
        v150.subtreeFlags = bit32.bor(v150.subtreeFlags, l_l_NoFlags_0_0);
    end;
    v150.childLanes = l_l_NoLanes_0_0;
    return v151;
end;
return {
    completeWork = function(v162, v163, v164) --[[ Line: 859 ]] --[[ Name: completeWork ]]
        -- upvalues: l_IndeterminateComponent_0 (copy), l_LazyComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_Fragment_0 (copy), l_Mode_0 (copy), l_ContextConsumer_0 (copy), l_MemoComponent_0 (copy), v161 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_popContext_0 (copy), l_HostRoot_0 (copy), l_popHostContainer_0 (copy), l_popTopLevelContextObject_0 (copy), l_resetWorkInProgressVersions_0 (copy), l_popHydrationState_0 (copy), l_Update_0 (copy), l_Snapshot_0 (copy), v111 (ref), l_HostComponent_0 (copy), l_popHostContext_0 (copy), l_getRootHostContainer_0 (copy), v112 (ref), l_Ref_0 (copy), l_invariant_0 (copy), l_getHostContext_0 (copy), l_prepareToHydrateHostInstance_0 (copy), l_createInstance_0 (copy), v110 (ref), l_finalizeInitialChildren_0 (copy), l_HostText_0 (copy), v113 (ref), l_prepareToHydrateHostTextInstance_0 (copy), l_createTextInstance_0 (copy), l_Profiler_0 (copy), l_Callback_0 (copy), l_Passive_0 (copy), l_PerformedWork_0 (copy), l_NoFlags_0 (copy), l_LayoutMask_0 (copy), l_Deletion_0 (copy), l_PassiveMask_0 (copy), l_SuspenseComponent_0 (copy), l_popSuspenseContext_0 (copy), l_enableSuspenseServerRenderer_0 (copy), l_prepareToHydrateHostSuspenseInstance_0 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy), l_OffscreenLane_0 (copy), l_enableProfilerTimer_0 (copy), l_ProfileMode_0 (copy), l_NoMode_0 (copy), l_resetHydrationState_0 (copy), l_DidCapture_0 (copy), l_transferActualDuration_0 (copy), l_BlockingMode_0 (copy), l_hasSuspenseContext_0 (copy), l_suspenseStackCursor_0 (copy), l_InvisibleParentSuspenseContext_0 (copy), l_renderDidSuspend_0 (copy), l_renderDidSuspendDelayIfPossible_0 (copy), l_supportsPersistence_0 (copy), l_supportsMutation_0 (copy), l_enableSuspenseCallback_0 (copy), l_HostPortal_0 (copy), l_preparePortalMount_0 (copy), l_ContextProvider_0 (copy), l_popProvider_0 (copy), l_IncompleteClassComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_FundamentalComponent_0 (copy), l_ScopeComponent_0 (copy), l_Block_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), l_popRenderLanes_0 (copy), l_includesSomeLane_0 (copy), v92 (copy), l_ConcurrentMode_0 (copy)
        local l_pendingProps_0 = v163.pendingProps;
        if v163.tag == l_IndeterminateComponent_0 or v163.tag == l_LazyComponent_0 or v163.tag == l_SimpleMemoComponent_0 or v163.tag == l_FunctionComponent_0 or v163.tag == l_ForwardRef_0 or v163.tag == l_Fragment_0 or v163.tag == l_Mode_0 or v163.tag == l_ContextConsumer_0 or v163.tag == l_MemoComponent_0 then
            v161(v163);
            return nil;
        elseif v163.tag == l_ClassComponent_0 then
            local l_type_0 = v163.type;
            if l_isContextProvider_0(l_type_0) then
                l_popContext_0(v163);
            end;
            v161(v163);
            return nil;
        elseif v163.tag == l_HostRoot_0 then
            l_popHostContainer_0(v163);
            l_popTopLevelContextObject_0(v163);
            l_resetWorkInProgressVersions_0();
            local l_stateNode_2 = v163.stateNode;
            if l_stateNode_2.pendingContext then
                l_stateNode_2.context = l_stateNode_2.pendingContext;
                l_stateNode_2.pendingContext = nil;
            end;
            if v162 == nil or v162.child == nil then
                if l_popHydrationState_0(v163) then
                    v163.flags = bit32.bor(v163.flags, l_Update_0);
                elseif not l_stateNode_2.hydrate then
                    v163.flags = bit32.bor(v163.flags, l_Snapshot_0);
                end;
            end;
            v111(v162, v163);
            v161(v163);
            return nil;
        elseif v163.tag == l_HostComponent_0 then
            l_popHostContext_0(v163);
            local v168 = l_getRootHostContainer_0();
            local l_type_1 = v163.type;
            if v162 ~= nil and v163.stateNode ~= nil then
                v112(v162, v163, l_type_1, l_pendingProps_0, v168);
                if v162.ref ~= v163.ref then
                    v163.flags = bit32.bor(v163.flags, l_Ref_0);
                end;
            elseif not l_pendingProps_0 then
                l_invariant_0(v163.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.");
                v161(v163);
                return nil;
            else
                local v170 = l_getHostContext_0();
                if l_popHydrationState_0(v163) then
                    if l_prepareToHydrateHostInstance_0(v163, v168, v170) then
                        v163.flags = bit32.bor(v163.flags, l_Update_0);
                    end;
                else
                    local v171 = l_createInstance_0(l_type_1, l_pendingProps_0, v168, v170, v163);
                    v110(v171, v163, false, false);
                    v163.stateNode = v171;
                    if l_finalizeInitialChildren_0(v171, l_type_1, l_pendingProps_0, v168, v170) then
                        v163.flags = bit32.bor(v163.flags, l_Update_0);
                    end;
                end;
                if v163.ref ~= nil then
                    v163.flags = bit32.bor(v163.flags, l_Ref_0);
                end;
            end;
            v161(v163);
            return nil;
        elseif v163.tag == l_HostText_0 then
            if v162 and v163.stateNode ~= nil then
                local l_memoizedProps_1 = v162.memoizedProps;
                v113(v162, v163, l_memoizedProps_1, l_pendingProps_0);
            else
                if typeof(l_pendingProps_0) ~= "string" then
                    l_invariant_0(v163.stateNode ~= nil, "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue.");
                end;
                local v173 = l_getRootHostContainer_0();
                local v174 = l_getHostContext_0();
                if l_popHydrationState_0(v163) then
                    if l_prepareToHydrateHostTextInstance_0(v163) then
                        v163.flags = bit32.bor(v163.flags, l_Update_0);
                    end;
                else
                    v163.stateNode = l_createTextInstance_0(l_pendingProps_0, v173, v174, v163);
                end;
            end;
            v161(v163);
            return nil;
        elseif v163.tag == l_Profiler_0 then
            if not v161(v163) then
                local l_l_Update_0_0 = l_Update_0;
                local l_l_Callback_0_0 = l_Callback_0;
                local l_l_Passive_0_0 = l_Passive_0;
                local l_subtreeFlags_0 = v163.subtreeFlags;
                local l_flags_0 = v163.flags;
                local l_l_flags_0_0 = l_flags_0;
                if bit32.band(l_flags_0, l_PerformedWork_0) ~= l_NoFlags_0 or bit32.band(l_subtreeFlags_0, l_PerformedWork_0) ~= l_NoFlags_0 then
                    l_l_flags_0_0 = bit32.bor(l_l_flags_0_0, l_l_Update_0_0);
                end;
                if bit32.band(l_flags_0, (bit32.bor(l_LayoutMask_0, l_Deletion_0))) ~= l_NoFlags_0 or bit32.band(l_subtreeFlags_0, (bit32.bor(l_LayoutMask_0, l_Deletion_0))) ~= l_NoFlags_0 then
                    l_l_flags_0_0 = bit32.bor(l_l_flags_0_0, l_l_Callback_0_0);
                end;
                if bit32.band(l_flags_0, l_PassiveMask_0) ~= l_NoFlags_0 or bit32.band(l_subtreeFlags_0, l_PassiveMask_0) ~= l_NoFlags_0 then
                    l_l_flags_0_0 = bit32.bor(l_l_flags_0_0, l_l_Passive_0_0);
                end;
                v163.flags = l_l_flags_0_0;
            end;
            return nil;
        elseif v163.tag == l_SuspenseComponent_0 then
            l_popSuspenseContext_0(v163);
            local l_memoizedState_0 = v163.memoizedState;
            if l_enableSuspenseServerRenderer_0 and l_memoizedState_0 ~= nil and l_memoizedState_0.dehydrated ~= nil then
                if v162 == nil then
                    local v182 = l_popHydrationState_0(v163);
                    l_invariant_0(v182, "A dehydrated suspense component was completed without a hydrated node. This is probably a bug in React.");
                    l_prepareToHydrateHostSuspenseInstance_0(v163);
                    if l_enableSchedulerTracing_0 then
                        l_markSpawnedWork_0(l_OffscreenLane_0);
                    end;
                    v161(v163);
                    if l_enableProfilerTimer_0 and bit32.band(v163.mode, l_ProfileMode_0) ~= l_NoMode_0 and l_memoizedState_0 ~= nil then
                        local l_child_6 = v163.child;
                        if l_child_6 ~= nil then
                            v163.treeBaseDuration = l_child_6.treeBaseDuration;
                        end;
                    end;
                    return nil;
                else
                    l_resetHydrationState_0();
                    if bit32.band(v163.flags, l_DidCapture_0) == l_NoFlags_0 then
                        v163.memoizedState = nil;
                    end;
                    v163.flags = bit32.bor(v163.flags, l_Update_0);
                    v161(v163);
                    if l_enableProfilerTimer_0 and bit32.band(v163.mode, l_ProfileMode_0) ~= l_NoMode_0 and l_memoizedState_0 ~= nil then
                        local l_child_7 = v163.child;
                        if l_child_7 ~= nil then
                            v163.treeBaseDuration = v163.treeBaseDuration - l_child_7.treeBaseDuration;
                        end;
                    end;
                    return nil;
                end;
            elseif bit32.band(v163.flags, l_DidCapture_0) ~= l_NoFlags_0 then
                v163.lanes = v164;
                if l_enableProfilerTimer_0 and bit32.band(v163.mode, l_ProfileMode_0) ~= l_NoMode_0 then
                    l_transferActualDuration_0(v163);
                end;
                return v163;
            else
                local v185 = l_memoizedState_0 ~= nil;
                local v186 = false;
                if v162 == nil then
                    if v163.memoizedProps.fallback ~= nil then
                        l_popHydrationState_0(v163);
                    end;
                else
                    v186 = v162.memoizedState ~= nil;
                end;
                if v185 and not v186 and bit32.band(v163.mode, l_BlockingMode_0) ~= l_NoMode_0 then
                    local v187 = false;
                    if v162 == nil then
                        v187 = v163.memoizedProps.unstable_avoidThisFallback ~= true;
                    end;
                    if v187 or l_hasSuspenseContext_0(l_suspenseStackCursor_0.current, l_InvisibleParentSuspenseContext_0) then
                        l_renderDidSuspend_0();
                    else
                        l_renderDidSuspendDelayIfPossible_0();
                    end;
                end;
                if l_supportsPersistence_0 and v185 then
                    v163.flags = bit32.bor(v163.flags, l_Update_0);
                end;
                if l_supportsMutation_0 and (v185 or v186) then
                    v163.flags = bit32.bor(v163.flags, l_Update_0);
                end;
                if l_enableSuspenseCallback_0 and v163.updateQueue ~= nil and v163.memoizedProps.suspenseCallback ~= nil then
                    v163.flags = bit32.bor(v163.flags, l_Update_0);
                end;
                v161(v163);
                if l_enableProfilerTimer_0 and bit32.band(v163.mode, l_ProfileMode_0) ~= l_NoMode_0 and v185 then
                    local l_child_8 = v163.child;
                    if l_child_8 ~= nil then
                        v163.treeBaseDuration = v163.treeBaseDuration - l_child_8.treeBaseDuration;
                    end;
                end;
                return nil;
            end;
        elseif v163.tag == l_HostPortal_0 then
            l_popHostContainer_0(v163);
            v111(v162, v163);
            if v162 == nil then
                l_preparePortalMount_0(v163.stateNode.containerInfo);
            end;
            v161(v163);
            return nil;
        elseif v163.tag == l_ContextProvider_0 then
            l_popProvider_0(v163);
            v161(v163);
            return nil;
        elseif v163.tag == l_IncompleteClassComponent_0 then
            local l_type_2 = v163.type;
            if l_isContextProvider_0(l_type_2) then
                l_popContext_0(v163);
            end;
            v161(v163);
            return nil;
        else
            if v163.tag == l_SuspenseListComponent_0 then
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                print("UNIMPLEMENTED ERROR: " .. tostring("SuspenseListComponent"));
                error("FIXME (roblox): SuspenseListComponent is unimplemented", 2);
            elseif v163.tag == l_FundamentalComponent_0 then
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                print("UNIMPLEMENTED ERROR: " .. tostring("FundamentalComponent"));
                error("FIXME (roblox): FundamentalComponent is unimplemented", 2);
            elseif v163.tag == l_ScopeComponent_0 then
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                print("UNIMPLEMENTED ERROR: " .. tostring("ScopeComponent"));
                error("FIXME (roblox): ScopeComponent is unimplemented", 2);
            elseif v163.tag == l_Block_0 then
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                print("UNIMPLEMENTED ERROR: " .. tostring("Block"));
                error("FIXME (roblox): Block is unimplemented", 2);
            elseif v163.tag == l_OffscreenComponent_0 or v163.tag == l_LegacyHiddenComponent_0 then
                l_popRenderLanes_0(v163);
                local v190 = v163.memoizedState ~= nil;
                if v162 ~= nil and v162.memoizedState ~= nil ~= v190 and l_pendingProps_0.mode ~= "unstable-defer-without-hiding" then
                    v163.flags = bit32.bor(v163.flags, l_Update_0);
                end;
                if not v190 or l_includesSomeLane_0(v92.subtreeRenderLanes, l_OffscreenLane_0) or bit32.band(v163.mode, l_ConcurrentMode_0) == l_NoMode_0 then
                    v161(v163);
                end;
                return nil;
            end;
            l_invariant_0(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v163.tag)));
            return nil;
        end;
    end
};