local function _(v0) --[[ Line: 14 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v4 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Object_0 = v4.Object;
local l_inspect_0 = v4.util.inspect;
local l___DEV___0 = require(l_Parent_0.ReactGlobals).__DEV__;
local l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 = require(l_Parent_0.ReactGlobals).__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__;
local l___COMPAT_WARNINGS___0 = require(l_Parent_0.ReactGlobals).__COMPAT_WARNINGS__;
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.React);
local _ = require(script.Parent.ReactInternalTypes);
local v14 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v16 = require(script.Parent["ReactFiberSuspenseContext.new"]);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local v19 = require(script.Parent.ReactWorkTags);
local l_FunctionComponent_0 = v19.FunctionComponent;
local l_ClassComponent_0 = v19.ClassComponent;
local l_HostRoot_0 = v19.HostRoot;
local l_HostComponent_0 = v19.HostComponent;
local l_HostText_0 = v19.HostText;
local l_HostPortal_0 = v19.HostPortal;
local l_ForwardRef_0 = v19.ForwardRef;
local l_Fragment_0 = v19.Fragment;
local l_Mode_0 = v19.Mode;
local l_ContextProvider_0 = v19.ContextProvider;
local l_ContextConsumer_0 = v19.ContextConsumer;
local l_Profiler_0 = v19.Profiler;
local l_SuspenseComponent_0 = v19.SuspenseComponent;
local l_SuspenseListComponent_0 = v19.SuspenseListComponent;
local l_MemoComponent_0 = v19.MemoComponent;
local l_SimpleMemoComponent_0 = v19.SimpleMemoComponent;
local l_LazyComponent_0 = v19.LazyComponent;
local l_IncompleteClassComponent_0 = v19.IncompleteClassComponent;
local l_OffscreenComponent_0 = v19.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v19.LegacyHiddenComponent;
local v40 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v40.NoFlags;
local l_StaticMask_0 = v40.StaticMask;
local l_PerformedWork_0 = v40.PerformedWork;
local l_Placement_0 = v40.Placement;
local l_Hydrating_0 = v40.Hydrating;
local l_ContentReset_0 = v40.ContentReset;
local l_DidCapture_0 = v40.DidCapture;
local l_Ref_0 = v40.Ref;
local l_Deletion_0 = v40.Deletion;
local l_ForceUpdateForLegacySuspense_0 = v40.ForceUpdateForLegacySuspense;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = l_ReactFeatureFlags_0.debugRenderPhaseSideEffectsForStrictMode;
local l_disableLegacyContext_0 = l_ReactFeatureFlags_0.disableLegacyContext;
local l_disableModulePatternComponents_0 = l_ReactFeatureFlags_0.disableModulePatternComponents;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableSuspenseServerRenderer_0 = l_ReactFeatureFlags_0.enableSuspenseServerRenderer;
local l_warnAboutDefaultPropsOnFunctionComponents_0 = l_ReactFeatureFlags_0.warnAboutDefaultPropsOnFunctionComponents;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_shallowEqual_0 = require(l_Parent_0.Shared).shallowEqual;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local _ = l_ReactSymbols_0.getIteratorFn;
local v67 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v68 = require(script.Parent.ReactCurrentFiber);
local l_getCurrentFiberOwnerNameInDevOrNull_0 = v68.getCurrentFiberOwnerNameInDevOrNull;
local l_setIsRendering_0 = v68.setIsRendering;
local v71 = require(script.Parent["ReactFiberHotReloading.new"]);
local l_resolveFunctionForHotReloading_0 = v71.resolveFunctionForHotReloading;
local l_resolveForwardRefForHotReloading_0 = v71.resolveForwardRefForHotReloading;
local l_resolveClassForHotReloading_0 = v71.resolveClassForHotReloading;
local v75 = require(script.Parent["ReactChildFiber.new"]);
local l_mountChildFibers_0 = v75.mountChildFibers;
local l_reconcileChildFibers_0 = v75.reconcileChildFibers;
local l_cloneChildFibers_0 = v75.cloneChildFibers;
local v79 = require(script.Parent["ReactUpdateQueue.new"]);
local l_processUpdateQueue_0 = v79.processUpdateQueue;
local l_cloneUpdateQueue_0 = v79.cloneUpdateQueue;
local l_initializeUpdateQueue_0 = v79.initializeUpdateQueue;
local v83 = require(script.Parent.ReactTypeOfMode);
local l_ConcurrentMode_0 = v83.ConcurrentMode;
local l_NoMode_0 = v83.NoMode;
local l_ProfileMode_0 = v83.ProfileMode;
local l_StrictMode_0 = v83.StrictMode;
local l_BlockingMode_0 = v83.BlockingMode;
local v89 = require(script.Parent.ReactFiberHostConfig);
local l_shouldSetTextContent_0 = v89.shouldSetTextContent;
local l_isSuspenseInstancePending_0 = v89.isSuspenseInstancePending;
local l_isSuspenseInstanceFallback_0 = v89.isSuspenseInstanceFallback;
local l_registerSuspenseInstanceRetry_0 = v89.registerSuspenseInstanceRetry;
local l_supportsHydration_0 = v89.supportsHydration;
local v95 = require(script.Parent["ReactFiberHostContext.new"]);
local l_pushHostContext_0 = v95.pushHostContext;
local l_pushHostContainer_0 = v95.pushHostContainer;
local l_suspenseStackCursor_0 = v16.suspenseStackCursor;
local l_hasSuspenseContext_0 = v16.hasSuspenseContext;
local l_ForceSuspenseFallback_0 = v16.ForceSuspenseFallback;
local l_addSubtreeSuspenseContext_0 = v16.addSubtreeSuspenseContext;
local l_InvisibleParentSuspenseContext_0 = v16.InvisibleParentSuspenseContext;
local l_pushSuspenseContext_0 = v16.pushSuspenseContext;
local l_setDefaultShallowSuspenseContext_0 = v16.setDefaultShallowSuspenseContext;
local v105 = require(script.Parent["ReactFiberNewContext.new"]);
local l_propagateContextChange_0 = v105.propagateContextChange;
local l_readContext_0 = v105.readContext;
local l_calculateChangedBits_0 = v105.calculateChangedBits;
local l_prepareToReadContext_0 = v105.prepareToReadContext;
local l_pushProvider_0 = v105.pushProvider;
local v111 = {
    renderWithHooksRef = nil, 
    bailoutHooksRef = nil, 
    shouldSuspendRef = nil
};
local function _(v112) --[[ Line: 189 ]] --[[ Name: shouldSuspend ]]
    -- upvalues: v111 (copy)
    if not v111.shouldSuspendRef then
        v111.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend;
    end;
    return v111.shouldSuspendRef(v112);
end;
local function _() --[[ Line: 198 ]] --[[ Name: initReactFiberHooks ]]
    -- upvalues: v111 (copy)
    local v114 = require(script.Parent["ReactFiberHooks.new"]);
    v111.renderWithHooksRef = v114.renderWithHooks;
    v111.bailoutHooksRef = v114.bailoutHooks;
end;
local function v117(...) --[[ Line: 205 ]] --[[ Name: renderWithHooks ]]
    -- upvalues: v111 (copy)
    if not v111.renderWithHooksRef then
        local v116 = require(script.Parent["ReactFiberHooks.new"]);
        v111.renderWithHooksRef = v116.renderWithHooks;
        v111.bailoutHooksRef = v116.bailoutHooks;
    end;
    return v111.renderWithHooksRef(...);
end;
local function v119(...) --[[ Line: 213 ]] --[[ Name: bailoutHooks ]]
    -- upvalues: v111 (copy)
    if not v111.bailoutHooksRef then
        local v118 = require(script.Parent["ReactFiberHooks.new"]);
        v111.renderWithHooksRef = v118.renderWithHooks;
        v111.bailoutHooksRef = v118.bailoutHooks;
    end;
    return v111.bailoutHooksRef(...);
end;
local l_stopProfilerTimerIfRunning_0 = require(script.Parent["ReactProfilerTimer.new"]).stopProfilerTimerIfRunning;
local v121 = require(script.Parent["ReactFiberContext.new"]);
local l_getMaskedContext_0 = v121.getMaskedContext;
local l_getUnmaskedContext_0 = v121.getUnmaskedContext;
local l_hasContextChanged_0 = v121.hasContextChanged;
local l_pushContextProvider_0 = v121.pushContextProvider;
local l_isContextProvider_0 = v121.isContextProvider;
local l_pushTopLevelContextObject_0 = v121.pushTopLevelContextObject;
local l_invalidateContextProvider_0 = v121.invalidateContextProvider;
local v129 = require(script.Parent["ReactFiberHydrationContext.new"]);
local l_resetHydrationState_0 = v129.resetHydrationState;
local l_enterHydrationState_0 = v129.enterHydrationState;
local l_reenterHydrationStateFromDehydratedSuspenseInstance_0 = v129.reenterHydrationStateFromDehydratedSuspenseInstance;
local l_tryToClaimNextHydratableInstance_0 = v129.tryToClaimNextHydratableInstance;
local l_warnIfHydrating_0 = v129.warnIfHydrating;
local v135 = require(script.Parent["ReactFiberClassComponent.new"]);
local l_adoptClassInstance_0 = v135.adoptClassInstance;
local l_applyDerivedStateFromProps_0 = v135.applyDerivedStateFromProps;
local l_constructClassInstance_0 = v135.constructClassInstance;
local l_mountClassInstance_0 = v135.mountClassInstance;
local l_resumeMountClassInstance_0 = v135.resumeMountClassInstance;
local l_updateClassInstance_0 = v135.updateClassInstance;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v143 = require(script.Parent["ReactFiber.new"]);
local l_resolveLazyComponentTag_0 = v143.resolveLazyComponentTag;
local l_createFiberFromFragment_0 = v143.createFiberFromFragment;
local l_createFiberFromOffscreen_0 = v143.createFiberFromOffscreen;
local l_createFiberFromTypeAndProps_0 = v143.createFiberFromTypeAndProps;
local l_isSimpleFunctionComponent_0 = v143.isSimpleFunctionComponent;
local l_createWorkInProgress_0 = v143.createWorkInProgress;
local v150 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_pushRenderLanes_0 = v150.pushRenderLanes;
local l_markSpawnedWork_0 = v150.markSpawnedWork;
local l_retryDehydratedSuspenseBoundary_0 = v150.retryDehydratedSuspenseBoundary;
local l_scheduleUpdateOnFiber_0 = v150.scheduleUpdateOnFiber;
local l_renderDidSuspendDelayIfPossible_0 = v150.renderDidSuspendDelayIfPossible;
local l_getWorkInProgressRoot_0 = v150.getWorkInProgressRoot;
local l_getExecutionContext_0 = v150.getExecutionContext;
local l_RetryAfterError_0 = v150.RetryAfterError;
local l_NoContext_0 = v150.NoContext;
local v160 = nil;
local l_setWorkInProgressVersion_0 = require(script.Parent["ReactMutableSource.new"]).setWorkInProgressVersion;
local l_markSkippedUpdateLanes_0 = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local l_ReactCurrentOwner_0 = l_ReactSharedInternals_0.ReactCurrentOwner;
local v167 = {};
local v168 = nil;
local v169 = nil;
local v170 = false;
local v171 = {
    didWarnAboutBadClass = {}, 
    didWarnAboutModulePatternComponent = {}, 
    didWarnAboutContextTypeOnFunctionComponent = {}, 
    didWarnAboutGetDerivedStateOnFunctionComponent = {}, 
    didWarnAboutFunctionRefs = {}, 
    didWarnAboutDefaultPropsOnFunctionComponent = {}
};
local v172 = nil;
if l___DEV___0 then
    v171.didWarnAboutBadClass = {};
    v171.didWarnAboutModulePatternComponent = {};
    v171.didWarnAboutContextTypeOnFunctionComponent = {};
    v171.didWarnAboutGetDerivedStateOnFunctionComponent = {};
    v171.didWarnAboutFunctionRefs = {};
    v167.didWarnAboutReassigningProps = false;
    v171.didWarnAboutDefaultPropsOnFunctionComponent = {};
end;
local function _(v173, v174, v175, v176) --[[ Line: 314 ]] --[[ Name: reconcileChildren ]]
    -- upvalues: l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if v173 == nil then
        v174.child = l_mountChildFibers_0(v174, nil, v175, v176);
        return;
    else
        v174.child = l_reconcileChildFibers_0(v174, v173.child, v175, v176);
        return;
    end;
end;
local function _(v178, v179, v180, v181) --[[ Line: 343 ]] --[[ Name: forceUnmountCurrentAndReconcile ]]
    -- upvalues: l_reconcileChildFibers_0 (copy)
    v179.child = l_reconcileChildFibers_0(v179, v178.child, nil, v181);
    v179.child = l_reconcileChildFibers_0(v179, nil, v180, v181);
end;
local function v196(v183, v184, v185, v186, v187) --[[ Line: 367 ]] --[[ Name: updateForwardRef ]]
    -- upvalues: l___DEV___0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_prepareToReadContext_0 (copy), v167 (copy), l_ReactCurrentOwner_0 (copy), l_setIsRendering_0 (copy), v117 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v170 (ref), v119 (copy), v168 (ref), l_PerformedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if (l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v184.type ~= v184.elementType then
        local l_propTypes_0 = v185.propTypes;
        local l_validateProps_0 = v185.validateProps;
        if l_propTypes_0 or l_validateProps_0 then
            l_checkPropTypes_0(l_propTypes_0, l_validateProps_0, v186, "prop", l_getComponentName_0(v185));
        end;
    end;
    local l_render_0 = v185.render;
    local l_ref_0 = v184.ref;
    local v192 = nil;
    l_prepareToReadContext_0(v184, v187, v167.markWorkInProgressReceivedUpdate);
    if l___DEV___0 then
        l_ReactCurrentOwner_0.current = v184;
        l_setIsRendering_0(true);
        v192 = v117(v183, v184, l_render_0, v186, l_ref_0, v187);
        if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v184.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v193, v194 = xpcall(v117, l_describeError_0, v183, v184, l_render_0, v186, l_ref_0, v187);
            if v193 then
                v192 = v194;
            end;
            l_reenableLogs_0();
            if not v193 then
                error(v194);
            end;
        end;
        l_setIsRendering_0(false);
    else
        v192 = v117(v183, v184, l_render_0, v186, l_ref_0, v187);
    end;
    if v183 ~= nil and not v170 then
        v119(v183, v184, v187);
        return v168(v183, v184, v187);
    else
        v184.flags = bit32.bor(v184.flags, l_PerformedWork_0);
        local l_v192_0 = v192;
        if v183 == nil then
            v184.child = l_mountChildFibers_0(v184, nil, l_v192_0, v187);
        else
            v184.child = l_reconcileChildFibers_0(v184, v183.child, l_v192_0, v187);
        end;
        return v184.child;
    end;
end;
local function v215(v197, v198, v199, v200, v201, v202) --[[ Line: 454 ]] --[[ Name: updateMemoComponent ]]
    -- upvalues: l_isSimpleFunctionComponent_0 (copy), l___DEV___0 (copy), l_resolveFunctionForHotReloading_0 (copy), l_SimpleMemoComponent_0 (copy), v172 (ref), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_createFiberFromTypeAndProps_0 (copy), v14 (copy), l_shallowEqual_0 (copy), v168 (ref), l_PerformedWork_0 (copy), l_createWorkInProgress_0 (copy)
    if v197 == nil then
        local l_type_0 = v199.type;
        if l_isSimpleFunctionComponent_0(l_type_0) and v199.compare == nil and v199.defaultProps == nil then
            local l_l_type_0_0 = l_type_0;
            if l___DEV___0 then
                l_l_type_0_0 = l_resolveFunctionForHotReloading_0(l_type_0);
            end;
            v198.tag = l_SimpleMemoComponent_0;
            v198.type = l_l_type_0_0;
            if l___DEV___0 then
                validateFunctionComponentInDev(v198, l_type_0);
            end;
            return v172(v197, v198, l_l_type_0_0, v200, v201, v202);
        else
            if l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 then
                local v205 = nil;
                local v206 = nil;
                if type(l_type_0) == "table" then
                    v205 = l_type_0.propTypes;
                    v206 = l_type_0.validateProps;
                end;
                if v205 or v206 then
                    l_checkPropTypes_0(v205, v206, v200, "prop", l_getComponentName_0(l_type_0));
                end;
            end;
            local v207 = l_createFiberFromTypeAndProps_0(v199.type, nil, v200, v198, v198.mode, v202);
            v207.ref = v198.ref;
            v207.return_ = v198;
            v198.child = v207;
            return v207;
        end;
    else
        if l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 then
            local l_type_1 = v199.type;
            local v209 = nil;
            local v210 = nil;
            if type(l_type_1) == "table" then
                v209 = l_type_1.propTypes;
                v210 = l_type_1.validateProps;
            end;
            if v209 or v210 then
                l_checkPropTypes_0(v209, v210, v200, "prop", l_getComponentName_0(l_type_1));
            end;
        end;
        local l_child_0 = v197.child;
        if not v14.includesSomeLane(v201, v202) then
            local l_memoizedProps_0 = l_child_0.memoizedProps;
            local l_compare_0 = v199.compare;
            if l_compare_0 == nil then
                l_compare_0 = l_shallowEqual_0;
            end;
            if l_compare_0(l_memoizedProps_0, v200) and v197.ref == v198.ref then
                return v168(v197, v198, v202);
            end;
        end;
        v198.flags = bit32.bor(v198.flags, l_PerformedWork_0);
        local v214 = l_createWorkInProgress_0(l_child_0, v200);
        v214.ref = v198.ref;
        v214.return_ = v198;
        v198.child = v214;
        return v214;
    end;
end;
v172 = function(v216, v217, v218, v219, v220, v221) --[[ Line: 575 ]] --[[ Name: updateSimpleMemoComponent ]]
    -- upvalues: l___DEV___0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_describeError_0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_shallowEqual_0 (copy), v170 (ref), v14 (copy), v168 (ref), l_ForceUpdateForLegacySuspense_0 (copy), l_NoFlags_0 (copy), v169 (ref)
    if (l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v217.type ~= v217.elementType then
        local l_elementType_0 = v217.elementType;
        if l_elementType_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
            local l_l_elementType_0_0 = l_elementType_0;
            local l__payload_0 = l_l_elementType_0_0._payload;
            local l__init_0 = l_l_elementType_0_0._init;
            local v226, v227 = xpcall(l__init_0, l_describeError_0, l__payload_0);
            l_elementType_0 = if v226 then v227 else nil;
            local v228 = nil;
            local v229 = nil;
            if l_elementType_0 ~= nil and type(l_elementType_0) == "table" then
                v228 = l_elementType_0.propTypes;
                v229 = l_elementType_0.validateProps;
            end;
            if v228 or v229 then
                l_checkPropTypes_0(v228, v229, v219, "prop", l_getComponentName_0(l_elementType_0));
            end;
        end;
    end;
    if v216 ~= nil then
        local l_memoizedProps_1 = v216.memoizedProps;
        local v231 = true;
        if l___DEV___0 then
            v231 = v217.type == v216.type;
        end;
        if l_shallowEqual_0(l_memoizedProps_1, v219) and v216.ref == v217.ref and v231 then
            v170 = false;
            if not v14.includesSomeLane(v221, v220) then
                v217.lanes = v216.lanes;
                return v168(v216, v217, v221);
            elseif bit32.band(v216.flags, l_ForceUpdateForLegacySuspense_0) ~= l_NoFlags_0 then
                v170 = true;
            end;
        end;
    end;
    return v169(v216, v217, v218, v219, v221);
end;
local function v242(v232, v233, v234) --[[ Line: 677 ]] --[[ Name: updateOffscreenComponent ]]
    -- upvalues: l_ConcurrentMode_0 (copy), l_NoMode_0 (copy), v14 (copy), l_pushRenderLanes_0 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_pendingProps_0 = v233.pendingProps;
    local l_children_0 = l_pendingProps_0.children;
    local v237 = nil;
    if v232 ~= nil then
        v237 = v232.memoizedState;
    end;
    if l_pendingProps_0.mode == "hidden" or l_pendingProps_0.mode == "unstable-defer-without-hiding" then
        if bit32.band(v233.mode, l_ConcurrentMode_0) == l_NoMode_0 then
            v233.memoizedState = {
                baseLanes = v14.NoLanes
            };
            l_pushRenderLanes_0(v233, v234);
        elseif not v14.includesSomeLane(v234, v14.OffscreenLane) then
            local v238 = nil;
            if v237 ~= nil then
                local l_baseLanes_0 = v237.baseLanes;
                v238 = v14.mergeLanes(l_baseLanes_0, v234);
            else
                v238 = v234;
            end;
            if l_enableSchedulerTracing_0 then
                l_markSpawnedWork_0(v14.OffscreenLane);
            end;
            v233.childLanes = v14.laneToLanes(v14.OffscreenLane);
            v233.lanes = v233.childLanes;
            v233.memoizedState = {
                baseLanes = v238
            };
            l_pushRenderLanes_0(v233, v238);
            return nil;
        else
            v233.memoizedState = {
                baseLanes = v14.NoLanes
            };
            local l_v234_0 = v234;
            if v237 ~= nil then
                l_v234_0 = v237.baseLanes;
            end;
            l_pushRenderLanes_0(v233, l_v234_0);
        end;
    else
        local v241 = nil;
        if v237 ~= nil then
            v241 = v14.mergeLanes(v237.baseLanes, v234);
            v233.memoizedState = nil;
        else
            v241 = v234;
        end;
        l_pushRenderLanes_0(v233, v241);
    end;
    if v232 == nil then
        v233.child = l_mountChildFibers_0(v233, nil, l_children_0, v234);
    else
        v233.child = l_reconcileChildFibers_0(v233, v232.child, l_children_0, v234);
    end;
    return v233.child;
end;
updateFragment = function(v243, v244, v245) --[[ Line: 779 ]] --[[ Name: updateFragment ]]
    -- upvalues: l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_pendingProps_1 = v244.pendingProps;
    if v243 == nil then
        v244.child = l_mountChildFibers_0(v244, nil, l_pendingProps_1, v245);
    else
        v244.child = l_reconcileChildFibers_0(v244, v243.child, l_pendingProps_1, v245);
    end;
    return v244.child;
end;
updateMode = function(v247, v248, v249) --[[ Line: 785 ]] --[[ Name: updateMode ]]
    -- upvalues: l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_children_1 = v248.pendingProps.children;
    if v247 == nil then
        v248.child = l_mountChildFibers_0(v248, nil, l_children_1, v249);
    else
        v248.child = l_reconcileChildFibers_0(v248, v247.child, l_children_1, v249);
    end;
    return v248.child;
end;
updateProfiler = function(v251, v252, v253) --[[ Line: 791 ]] --[[ Name: updateProfiler ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if l_enableProfilerTimer_0 then
        local l_stateNode_0 = v252.stateNode;
        l_stateNode_0.effectDuration = 0;
        l_stateNode_0.passiveEffectDuration = 0;
    end;
    local l_children_2 = v252.pendingProps.children;
    if v251 == nil then
        v252.child = l_mountChildFibers_0(v252, nil, l_children_2, v253);
    else
        v252.child = l_reconcileChildFibers_0(v252, v251.child, l_children_2, v253);
    end;
    return v252.child;
end;
local function _(v256, v257) --[[ Line: 805 ]] --[[ Name: markRef ]]
    -- upvalues: l_Ref_0 (copy)
    local l_ref_1 = v257.ref;
    if v256 == nil and l_ref_1 ~= nil or v256 ~= nil and v256.ref ~= l_ref_1 then
        v257.flags = bit32.bor(v257.flags, l_Ref_0);
    end;
end;
v169 = function(v260, v261, v262, v263, v264) --[[ Line: 816 ]] --[[ Name: updateFunctionComponent ]]
    -- upvalues: l___DEV___0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_prepareToReadContext_0 (copy), v167 (copy), l_ReactCurrentOwner_0 (copy), l_setIsRendering_0 (copy), v117 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v170 (ref), v119 (copy), v168 (ref), l_PerformedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if (l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and type(v262) ~= "function" and v261.type ~= v261.elementType then
        local v265 = nil;
        local v266 = nil;
        if type(v262) == "table" then
            v265 = v262.propTypes;
            v266 = v262.validateProps;
        end;
        if v265 or v266 then
            l_checkPropTypes_0(v265, v266, v263, "prop", l_getComponentName_0(v262));
        end;
    end;
    local v267 = nil;
    if not l_disableLegacyContext_0 then
        local v268 = l_getUnmaskedContext_0(v261, v262, true);
        v267 = l_getMaskedContext_0(v261, v268);
    end;
    local v269 = nil;
    l_prepareToReadContext_0(v261, v264, v167.markWorkInProgressReceivedUpdate);
    if l___DEV___0 then
        l_ReactCurrentOwner_0.current = v261;
        l_setIsRendering_0(true);
        v269 = v117(v260, v261, v262, v263, v267, v264);
        if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v261.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v270, v271 = xpcall(v117, l_describeError_0, v260, v261, v262, v263, v267, v264);
            l_reenableLogs_0();
            if v270 then
                v269 = v271;
            else
                error(v271);
            end;
        end;
        l_setIsRendering_0(false);
    else
        v269 = v117(v260, v261, v262, v263, v267, v264);
    end;
    if v260 ~= nil and not v170 then
        v119(v260, v261, v264);
        return v168(v260, v261, v264);
    else
        v261.flags = bit32.bor(v261.flags, l_PerformedWork_0);
        local l_v269_0 = v269;
        if v260 == nil then
            v261.child = l_mountChildFibers_0(v261, nil, l_v269_0, v264);
        else
            v261.child = l_reconcileChildFibers_0(v261, v260.child, l_v269_0, v264);
        end;
        return v261.child;
    end;
end;
local function v285(v273, v274, v275, v276, v277) --[[ Line: 995 ]] --[[ Name: updateClassComponent ]]
    -- upvalues: l___DEV___0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_prepareToReadContext_0 (copy), v167 (copy), l_Placement_0 (copy), l_constructClassInstance_0 (copy), l_mountClassInstance_0 (copy), l_resumeMountClassInstance_0 (copy), l_updateClassInstance_0 (copy), l_console_0 (copy)
    if (l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v274.type ~= v274.elementType then
        local l_propTypes_1 = v275.propTypes;
        local l_validateProps_1 = v275.validateProps;
        if l_propTypes_1 or l_validateProps_1 then
            l_checkPropTypes_0(l_propTypes_1, l_validateProps_1, v276, "prop", l_getComponentName_0(v275));
        end;
    end;
    local v280 = nil;
    if l_isContextProvider_0(v275) then
        v280 = true;
        l_pushContextProvider_0(v274);
    else
        v280 = false;
    end;
    l_prepareToReadContext_0(v274, v277, v167.markWorkInProgressReceivedUpdate);
    local l_stateNode_1 = v274.stateNode;
    local v282 = nil;
    if l_stateNode_1 == nil then
        if v273 ~= nil then
            v273.alternate = nil;
            v274.alternate = nil;
            v274.flags = bit32.bor(v274.flags, l_Placement_0);
        end;
        l_constructClassInstance_0(v274, v275, v276);
        l_mountClassInstance_0(v274, v275, v276, v277);
        v282 = true;
    else
        v282 = if v273 == nil then l_resumeMountClassInstance_0(v274, v275, v276, v277) else l_updateClassInstance_0(v273, v274, v275, v276, v277);
    end;
    local v283 = finishClassComponent(v273, v274, v275, v282, v280, v277);
    if l___DEV___0 then
        local l_stateNode_2 = v274.stateNode;
        if v282 and l_stateNode_2.props ~= v276 then
            if not v167.didWarnAboutReassigningProps then
                l_console_0.error("It looks like %s is reassigning its own `this.props` while rendering. This is not supported and can lead to confusing bugs.", l_getComponentName_0(v274.type) or "a component");
            end;
            v167.didWarnAboutReassigningProps = true;
        end;
    end;
    return v283;
end;
finishClassComponent = function(v286, v287, v288, v289, v290, v291) --[[ Line: 1092 ]] --[[ Name: finishClassComponent ]]
    -- upvalues: l_Ref_0 (copy), l_DidCapture_0 (copy), l_NoFlags_0 (copy), l_invalidateContextProvider_0 (copy), v168 (ref), l_ReactCurrentOwner_0 (copy), l_enableProfilerTimer_0 (copy), l_stopProfilerTimerIfRunning_0 (copy), l___DEV___0 (copy), l_setIsRendering_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), l_PerformedWork_0 (copy), l_reconcileChildFibers_0 (copy), l_mountChildFibers_0 (copy)
    local l_ref_2 = v287.ref;
    if v286 == nil and l_ref_2 ~= nil or v286 ~= nil and v286.ref ~= l_ref_2 then
        v287.flags = bit32.bor(v287.flags, l_Ref_0);
    end;
    l_ref_2 = bit32.band(v287.flags, l_DidCapture_0) ~= l_NoFlags_0;
    if not v289 and not l_ref_2 then
        if v290 then
            l_invalidateContextProvider_0(v287, v288, false);
        end;
        return v168(v286, v287, v291);
    else
        local l_stateNode_3 = v287.stateNode;
        l_ReactCurrentOwner_0.current = v287;
        local v294 = nil;
        if l_ref_2 and (v288.getDerivedStateFromError == nil or type(v288.getDerivedStateFromError) ~= "function") then
            v294 = nil;
            if l_enableProfilerTimer_0 then
                l_stopProfilerTimerIfRunning_0(v287);
            end;
        elseif l___DEV___0 then
            l_setIsRendering_0(true);
            v294 = l_stateNode_3:render();
            if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v287.mode, l_StrictMode_0) ~= 0 then
                l_disableLogs_0();
                local v295, v296 = xpcall(l_stateNode_3.render, l_describeError_0, l_stateNode_3);
                l_reenableLogs_0();
                if not v295 then
                    error(v296);
                end;
            end;
            l_setIsRendering_0(false);
        else
            v294 = l_stateNode_3:render();
        end;
        v287.flags = bit32.bor(v287.flags, l_PerformedWork_0);
        if v286 ~= nil and l_ref_2 then
            local l_v294_0 = v294;
            v287.child = l_reconcileChildFibers_0(v287, v286.child, nil, v291);
            v287.child = l_reconcileChildFibers_0(v287, nil, l_v294_0, v291);
        else
            local l_v294_1 = v294;
            if v286 == nil then
                v287.child = l_mountChildFibers_0(v287, nil, l_v294_1, v291);
            else
                v287.child = l_reconcileChildFibers_0(v287, v286.child, l_v294_1, v291);
            end;
        end;
        v287.memoizedState = l_stateNode_3.state;
        if v290 then
            l_invalidateContextProvider_0(v287, v288, true);
        end;
        return v287.child;
    end;
end;
local function _(v299) --[[ Line: 1190 ]] --[[ Name: pushHostRootContext ]]
    -- upvalues: l_pushTopLevelContextObject_0 (copy), l_pushHostContainer_0 (copy)
    local l_stateNode_4 = v299.stateNode;
    if l_stateNode_4.pendingContext then
        l_pushTopLevelContextObject_0(v299, l_stateNode_4.pendingContext, l_stateNode_4.pendingContext ~= l_stateNode_4.context);
    elseif l_stateNode_4.context then
        l_pushTopLevelContextObject_0(v299, l_stateNode_4.context, false);
    end;
    l_pushHostContainer_0(v299, l_stateNode_4.containerInfo);
end;
local function v317(v302, v303, v304) --[[ Line: 1206 ]] --[[ Name: updateHostRoot ]]
    -- upvalues: l_pushTopLevelContextObject_0 (copy), l_pushHostContainer_0 (copy), l_invariant_0 (copy), l_cloneUpdateQueue_0 (copy), l_processUpdateQueue_0 (copy), l_resetHydrationState_0 (copy), v168 (ref), l_enterHydrationState_0 (copy), l_supportsHydration_0 (copy), l_setWorkInProgressVersion_0 (copy), l_mountChildFibers_0 (copy), l_Placement_0 (copy), l_Hydrating_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_stateNode_5 = v303.stateNode;
    if l_stateNode_5.pendingContext then
        l_pushTopLevelContextObject_0(v303, l_stateNode_5.pendingContext, l_stateNode_5.pendingContext ~= l_stateNode_5.context);
    elseif l_stateNode_5.context then
        l_pushTopLevelContextObject_0(v303, l_stateNode_5.context, false);
    end;
    l_pushHostContainer_0(v303, l_stateNode_5.containerInfo);
    l_stateNode_5 = v303.updateQueue;
    local l_l_invariant_0_0 = l_invariant_0;
    local v307 = false;
    if v302 ~= nil then
        v307 = l_stateNode_5 ~= nil;
    end;
    l_l_invariant_0_0(v307, "If the root does not have an updateQueue, we should have already bailed out. This error is likely caused by a bug in React. Please file an issue.");
    l_l_invariant_0_0 = v303.pendingProps;
    v307 = v303.memoizedState;
    local v308 = nil;
    if v307 ~= nil then
        v308 = v307.element;
    end;
    l_cloneUpdateQueue_0(v302, v303);
    l_processUpdateQueue_0(v303, l_l_invariant_0_0, nil, v304);
    local l_element_0 = v303.memoizedState.element;
    if l_element_0 == v308 then
        l_resetHydrationState_0();
        return v168(v302, v303, v304);
    else
        local l_stateNode_6 = v303.stateNode;
        if l_stateNode_6.hydrate and l_enterHydrationState_0(v303) then
            if l_supportsHydration_0 then
                local l_mutableSourceEagerHydrationData_0 = l_stateNode_6.mutableSourceEagerHydrationData;
                if l_mutableSourceEagerHydrationData_0 ~= nil then
                    for v312 = 1, #l_mutableSourceEagerHydrationData_0, 2 do
                        local v313 = l_mutableSourceEagerHydrationData_0[v312];
                        local v314 = l_mutableSourceEagerHydrationData_0[v312 + 1];
                        l_setWorkInProgressVersion_0(v313, v314);
                    end;
                end;
            end;
            local v315 = l_mountChildFibers_0(v303, nil, l_element_0, v304);
            v303.child = v315;
            local l_v315_0 = v315;
            while l_v315_0 do
                l_v315_0.flags = bit32.bor(bit32.band(l_v315_0.flags, (bit32.bnot(l_Placement_0))), l_Hydrating_0);
                l_v315_0 = l_v315_0.sibling;
            end;
        else
            if v302 == nil then
                v303.child = l_mountChildFibers_0(v303, nil, l_element_0, v304);
            else
                v303.child = l_reconcileChildFibers_0(v303, v302.child, l_element_0, v304);
            end;
            l_resetHydrationState_0();
        end;
        return v303.child;
    end;
end;
local function v326(v318, v319, v320) --[[ Line: 1283 ]] --[[ Name: updateHostComponent ]]
    -- upvalues: l_pushHostContext_0 (copy), l_tryToClaimNextHydratableInstance_0 (copy), l_shouldSetTextContent_0 (copy), l_ContentReset_0 (copy), l_PerformedWork_0 (copy), l_Ref_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    l_pushHostContext_0(v319);
    if v318 == nil then
        l_tryToClaimNextHydratableInstance_0(v319);
    end;
    local l_type_2 = v319.type;
    local l_pendingProps_2 = v319.pendingProps;
    local v323 = nil;
    if v318 ~= nil then
        v323 = v318.memoizedProps;
    end;
    local l_children_3 = l_pendingProps_2.children;
    if l_shouldSetTextContent_0(l_type_2, l_pendingProps_2) then
        l_children_3 = nil;
    elseif v323 ~= nil and l_shouldSetTextContent_0(l_type_2, v323) then
        v319.flags = bit32.bor(v319.flags, l_ContentReset_0);
    end;
    v319.flags = bit32.bor(v319.flags, l_PerformedWork_0);
    local l_ref_3 = v319.ref;
    if v318 == nil and l_ref_3 ~= nil or v318 ~= nil and v318.ref ~= l_ref_3 then
        v319.flags = bit32.bor(v319.flags, l_Ref_0);
    end;
    l_ref_3 = l_children_3;
    if v318 == nil then
        v319.child = l_mountChildFibers_0(v319, nil, l_ref_3, v320);
    else
        v319.child = l_reconcileChildFibers_0(v319, v318.child, l_ref_3, v320);
    end;
    return v319.child;
end;
local function _(v327, v328) --[[ Line: 1324 ]] --[[ Name: updateHostText ]]
    -- upvalues: l_tryToClaimNextHydratableInstance_0 (copy)
    if v327 == nil then
        l_tryToClaimNextHydratableInstance_0(v328);
    end;
    return nil;
end;
local function v344(v330, v331, v332, v333, v334) --[[ Line: 1333 ]] --[[ Name: mountLazyComponent ]]
    -- upvalues: l_Placement_0 (copy), l_resolveLazyComponentTag_0 (copy), l_resolveDefaultProps_0 (copy), l_FunctionComponent_0 (copy), l___DEV___0 (copy), l_resolveFunctionForHotReloading_0 (copy), v169 (ref), l_ClassComponent_0 (copy), l_resolveClassForHotReloading_0 (copy), v285 (copy), l_ForwardRef_0 (copy), l_resolveForwardRefForHotReloading_0 (copy), v196 (copy), l_MemoComponent_0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), v215 (copy), l_REACT_LAZY_TYPE_0 (copy), l_inspect_0 (copy), l_invariant_0 (copy)
    if v330 ~= nil then
        v330.alternate = nil;
        v331.alternate = nil;
        v331.flags = bit32.bor(v331.flags, l_Placement_0);
    end;
    local l_pendingProps_3 = v331.pendingProps;
    local l__payload_1 = v332._payload;
    local v337 = v332._init(l__payload_1);
    v331.type = v337;
    v331.tag = l_resolveLazyComponentTag_0(v337);
    local l_tag_0 = v331.tag;
    local v339 = l_resolveDefaultProps_0(v337, l_pendingProps_3);
    local _ = nil;
    if l_tag_0 == l_FunctionComponent_0 then
        if l___DEV___0 then
            validateFunctionComponentInDev(v331, v337);
            v337 = l_resolveFunctionForHotReloading_0(v337);
            v331.type = v337;
        end;
        return (v169(nil, v331, v337, v339, v334));
    elseif l_tag_0 == l_ClassComponent_0 then
        if l___DEV___0 then
            v337 = l_resolveClassForHotReloading_0(v337);
            v331.type = v337;
        end;
        return (v285(nil, v331, v337, v339, v334));
    elseif l_tag_0 == l_ForwardRef_0 then
        if l___DEV___0 then
            v337 = l_resolveForwardRefForHotReloading_0(v337);
            v331.type = v337;
        end;
        return (v196(nil, v331, v337, v339, v334));
    elseif l_tag_0 == l_MemoComponent_0 then
        if (l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v331.type ~= v331.elementType then
            local l_propTypes_2 = v337.propTypes;
            local l_validateProps_2 = v337.validateProps;
            if l_propTypes_2 or l_validateProps_2 then
                l_checkPropTypes_0(l_propTypes_2, l_validateProps_2, v339, "prop", l_getComponentName_0(v337));
            end;
        end;
        return (v215(nil, v331, v337, l_resolveDefaultProps_0(v337.type, v339), v333, v334));
    else
        local v343 = "";
        if l___DEV___0 then
            if v337 ~= nil and type(v337) == "table" and v337["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                v343 = " Did you wrap a component in React.lazy() more than once?";
            elseif type(v337) == "table" and v337["$$typeof"] == nil then
                v343 = "\n" .. l_inspect_0(v337);
            end;
        end;
        l_invariant_0(false, "Element type is invalid. Received a promise that resolves to: %s. Lazy element type must resolve to a class or function.%s", tostring(v337), v343);
        return nil;
    end;
end;
mountIncompleteClassComponent = function(v345, v346, v347, v348, v349) --[[ Line: 1464 ]] --[[ Name: mountIncompleteClassComponent ]]
    -- upvalues: l_Placement_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_prepareToReadContext_0 (copy), v167 (copy), l_constructClassInstance_0 (copy), l_mountClassInstance_0 (copy)
    if v345 ~= nil then
        v345.alternate = nil;
        v346.alternate = nil;
        v346.flags = bit32.bor(v346.flags, l_Placement_0);
    end;
    v346.tag = l_ClassComponent_0;
    local v350 = nil;
    if l_isContextProvider_0(v347) then
        v350 = true;
        l_pushContextProvider_0(v346);
    else
        v350 = false;
    end;
    l_prepareToReadContext_0(v346, v349, v167.markWorkInProgressReceivedUpdate);
    l_constructClassInstance_0(v346, v347, v348);
    l_mountClassInstance_0(v346, v347, v348, v349);
    return finishClassComponent(nil, v346, v347, true, v350, v349);
end;
local function v367(v351, v352, v353, v354) --[[ Line: 1516 ]] --[[ Name: mountIndeterminateComponent ]]
    -- upvalues: l_Placement_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_prepareToReadContext_0 (copy), v167 (copy), l___DEV___0 (copy), l_getComponentName_0 (copy), v171 (copy), l_console_0 (copy), l_StrictMode_0 (copy), v67 (copy), l_setIsRendering_0 (copy), l_ReactCurrentOwner_0 (copy), v117 (copy), l_PerformedWork_0 (copy), l_disableModulePatternComponents_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_initializeUpdateQueue_0 (copy), l_applyDerivedStateFromProps_0 (copy), l_adoptClassInstance_0 (copy), l_mountClassInstance_0 (copy), l_FunctionComponent_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), l_mountChildFibers_0 (copy)
    if v351 ~= nil then
        v351.alternate = nil;
        v352.alternate = nil;
        v352.flags = bit32.bor(v352.flags, l_Placement_0);
    end;
    local l_pendingProps_4 = v352.pendingProps;
    local v356 = nil;
    if not l_disableLegacyContext_0 then
        local v357 = l_getUnmaskedContext_0(v352, v353, false);
        v356 = l_getMaskedContext_0(v352, v357);
    end;
    l_prepareToReadContext_0(v352, v354, v167.markWorkInProgressReceivedUpdate);
    local v358 = nil;
    if l___DEV___0 then
        if type(v353) == "table" and type(v353.render) == "function" then
            local v359 = l_getComponentName_0(v353) or "Unknown";
            if not v171.didWarnAboutBadClass[v359] then
                l_console_0.error("The <%s /> component appears to have a render method, but doesn't extend React.Component. This is likely to cause errors. Change %s to extend React.Component instead.", v359, v359);
                v171.didWarnAboutBadClass[v359] = true;
            end;
        end;
        if bit32.band(v352.mode, l_StrictMode_0) ~= 0 then
            v67.recordLegacyContextWarning(v352);
        end;
        l_setIsRendering_0(true);
        l_ReactCurrentOwner_0.current = v352;
        v358 = v117(nil, v352, v353, l_pendingProps_4, v356, v354);
        l_setIsRendering_0(false);
    else
        v358 = v117(nil, v352, v353, l_pendingProps_4, v356, v354);
    end;
    v352.flags = bit32.bor(v352.flags, l_PerformedWork_0);
    local v360 = type(v358);
    if l___DEV___0 and v358 ~= nil and v360 == "table" and type(v358.render) == "function" and v358["$$typeof"] == nil then
        local v361 = l_getComponentName_0(v353) or "Unknown";
        if not v171.didWarnAboutModulePatternComponent[v361] then
            l_console_0.error("The <%s /> component appears to be a function component that returns a class instance. Change %s to a class that extends React.Component instead. ", v361, v361);
            v171.didWarnAboutModulePatternComponent[v361] = true;
        end;
    end;
    if not l_disableModulePatternComponents_0 and v358 ~= nil and v360 == "table" and type(v358.render) == "function" and v358["$$typeof"] == nil then
        if l___DEV___0 then
            local v362 = l_getComponentName_0(v353) or "Unknown";
            if not v171.didWarnAboutModulePatternComponent[v362] then
                l_console_0.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. v362, v362);
                v171.didWarnAboutModulePatternComponent[v362] = true;
            end;
        end;
        v352.tag = l_ClassComponent_0;
        v352.memoizedState = nil;
        v352.updateQueue = nil;
        local v363 = false;
        if l_isContextProvider_0(v353) then
            v363 = true;
            l_pushContextProvider_0(v352);
        else
            v363 = false;
        end;
        v352.memoizedState = v358.state;
        l_initializeUpdateQueue_0(v352);
        local v364 = nil;
        if type(v353) ~= "function" then
            v364 = v353.getDerivedStateFromProps;
        end;
        if v364 ~= nil and type(v364) == "function" then
            l_applyDerivedStateFromProps_0(v352, v353, v364, l_pendingProps_4);
        end;
        l_adoptClassInstance_0(v352, v358);
        l_mountClassInstance_0(v352, v353, l_pendingProps_4, v354);
        return finishClassComponent(nil, v352, v353, true, v363, v354);
    else
        v352.tag = l_FunctionComponent_0;
        if l___DEV___0 then
            if l_disableLegacyContext_0 and v353.contextTypes then
                l_console_0.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with React.useContext() instead.", l_getComponentName_0(v353) or "Unknown");
            end;
            if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v352.mode, l_StrictMode_0) ~= 0 then
                l_disableLogs_0();
                local v365, v366 = xpcall(v117, l_describeError_0, nil, v352, v353, l_pendingProps_4, v356, v354);
                l_reenableLogs_0();
                if v365 then
                    v358 = v366;
                else
                    error(v366);
                end;
            end;
        end;
        v352.child = l_mountChildFibers_0(v352, nil, v358, v354);
        if l___DEV___0 then
            validateFunctionComponentInDev(v352, v353);
        end;
        return v352.child;
    end;
end;
validateFunctionComponentInDev = function(v368, v369) --[[ Line: 1733 ]] --[[ Name: validateFunctionComponentInDev ]]
    -- upvalues: l___DEV___0 (copy), l_getCurrentFiberOwnerNameInDevOrNull_0 (copy), v171 (copy), l_console_0 (copy), l_warnAboutDefaultPropsOnFunctionComponents_0 (copy), l_getComponentName_0 (copy)
    if l___DEV___0 then
        if v368.ref ~= nil then
            local v370 = "";
            local v371 = l_getCurrentFiberOwnerNameInDevOrNull_0();
            if v371 then
                v370 = v370 .. "\n\nCheck the render method of `" .. v371 .. "`.";
            end;
            local v372 = v371 or v368._debugID or "";
            local l__debugSource_0 = v368._debugSource;
            if l__debugSource_0 then
                v372 = l__debugSource_0.fileName .. ":" .. l__debugSource_0.lineNumber;
            end;
            if not v171.didWarnAboutFunctionRefs[v372] then
                v171.didWarnAboutFunctionRefs[v372] = true;
                l_console_0.error("Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?%s", v370);
            end;
        end;
        if l_warnAboutDefaultPropsOnFunctionComponents_0 and type(v369) ~= "function" and v369.defaultProps ~= nil then
            local v374 = l_getComponentName_0(v369) or "Unknown";
            if not v171.didWarnAboutDefaultPropsOnFunctionComponent[v374] then
                l_console_0.error("%s: Support for defaultProps will be removed from function components in a future major release.", v374);
                v171.didWarnAboutDefaultPropsOnFunctionComponent[v374] = true;
            end;
        end;
        if type(v369) ~= "function" and v369.getDerivedStateFromProps ~= nil and type(v369.getDerivedStateFromProps) == "function" then
            local v375 = l_getComponentName_0(v369) or "Unknown";
            if not v171.didWarnAboutGetDerivedStateOnFunctionComponent[v375] then
                l_console_0.error("%s: Function components do not support getDerivedStateFromProps.", v375);
                v171.didWarnAboutGetDerivedStateOnFunctionComponent[v375] = true;
            end;
        end;
        if type(v369) ~= "function" and v369.contextType ~= nil and type(v369.contextType) == "table" then
            local v376 = l_getComponentName_0(v369) or "Unknown";
            if not v171.didWarnAboutContextTypeOnFunctionComponent[v376] then
                l_console_0.error("%s: Function components do not support contextType.", v376);
                v171.didWarnAboutContextTypeOnFunctionComponent[v376] = true;
            end;
        end;
    end;
end;
local v377 = {
    dehydrated = nil, 
    retryLane = v14.NoLane
};
local function _(v378) --[[ Line: 1830 ]] --[[ Name: mountSuspenseOffscreenState ]]
    return {
        baseLanes = v378
    };
end;
local function _(v380, v381) --[[ Line: 1836 ]] --[[ Name: updateSuspenseOffscreenState ]]
    -- upvalues: v14 (copy)
    return {
        baseLanes = v14.mergeLanes(v380.baseLanes, v381)
    };
end;
local _ = function(v383, v384, _, _) --[[ Line: 1846 ]] --[[ Name: shouldRemainOnFallback ]]
    -- upvalues: l_hasSuspenseContext_0 (copy), l_ForceSuspenseFallback_0 (copy)
    if v384 ~= nil and v384.memoizedState == nil then
        return false;
    else
        return l_hasSuspenseContext_0(v383, l_ForceSuspenseFallback_0);
    end;
end;
local function _(v388, v389) --[[ Line: 1870 ]] --[[ Name: getRemainingWorkInPrimaryTree ]]
    -- upvalues: v14 (copy)
    return v14.removeLanes(v388.childLanes, v389);
end;
local v391 = nil;
local v392 = nil;
local v393 = nil;
local v394 = nil;
local v395 = nil;
local function v430(v396, v397, v398) --[[ Line: 1882 ]] --[[ Name: updateSuspenseComponent ]]
    -- upvalues: l___DEV___0 (copy), v111 (copy), l_DidCapture_0 (copy), l_suspenseStackCursor_0 (copy), l_NoFlags_0 (copy), l_hasSuspenseContext_0 (copy), l_ForceSuspenseFallback_0 (copy), l_addSubtreeSuspenseContext_0 (copy), l_InvisibleParentSuspenseContext_0 (copy), l_setDefaultShallowSuspenseContext_0 (copy), l_pushSuspenseContext_0 (copy), l_tryToClaimNextHydratableInstance_0 (copy), l_enableSuspenseServerRenderer_0 (copy), v392 (ref), v377 (copy), v14 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy), v393 (ref), v395 (ref), v394 (ref), v391 (ref)
    local v399 = false;
    local l_pendingProps_5 = v397.pendingProps;
    if l___DEV___0 then
        if not v111.shouldSuspendRef then
            v111.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend;
        end;
        if v111.shouldSuspendRef(v397) then
            v397.flags = bit32.bor(v397.flags, l_DidCapture_0);
        end;
    end;
    local l_current_0 = l_suspenseStackCursor_0.current;
    local v402 = false;
    local v403 = bit32.band(v397.flags, l_DidCapture_0) ~= l_NoFlags_0;
    if not v403 then
        local l_l_current_0_0 = l_current_0;
        if v396 ~= nil and v396.memoizedState == nil or not l_hasSuspenseContext_0(l_l_current_0_0, l_ForceSuspenseFallback_0) then
            if (v396 == nil or v396.memoizedState ~= nil) and l_pendingProps_5.fallback ~= nil and l_pendingProps_5.unstable_avoidThisFallback ~= true then
                l_current_0 = l_addSubtreeSuspenseContext_0(l_current_0, l_InvisibleParentSuspenseContext_0);
                v399 = true;
            else
                v399 = true;
            end;
        end;
    end;
    if not v399 then
        if not v399 then
            v402 = true;
            v397.flags = bit32.band(v397.flags, (bit32.bnot(l_DidCapture_0)));
        end;
    end;
    v399 = false;
    l_current_0 = l_setDefaultShallowSuspenseContext_0(l_current_0);
    l_pushSuspenseContext_0(v397, l_current_0);
    if v396 == nil then
        if l_pendingProps_5.fallback ~= nil then
            l_tryToClaimNextHydratableInstance_0(v397);
            if l_enableSuspenseServerRenderer_0 then
                local l_memoizedState_0 = v397.memoizedState;
                if l_memoizedState_0 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_0.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        return v392(v397, l_dehydrated_0, v398);
                    end;
                end;
            end;
        end;
        local l_children_4 = l_pendingProps_5.children;
        local l_fallback_0 = l_pendingProps_5.fallback;
        if v402 then
            local v409 = mountSuspenseFallbackChildren(v397, l_children_4, l_fallback_0, v398);
            v397.child.memoizedState = {
                baseLanes = v398
            };
            v397.memoizedState = v377;
            return v409;
        elseif l_pendingProps_5.unstable_expectedLoadTime ~= nil and type(l_pendingProps_5.unstable_expectedLoadTime) == "number" then
            local v410 = mountSuspenseFallbackChildren(v397, l_children_4, l_fallback_0, v398);
            v397.child.memoizedState = {
                baseLanes = v398
            };
            v397.memoizedState = v377;
            v397.lanes = v14.SomeRetryLane;
            if l_enableSchedulerTracing_0 then
                l_markSpawnedWork_0(v14.SomeRetryLane);
            end;
            return v410;
        else
            return v393(v397, l_children_4, v398);
        end;
    else
        local l_memoizedState_1 = v396.memoizedState;
        if l_memoizedState_1 ~= nil then
            if l_enableSuspenseServerRenderer_0 then
                local l_dehydrated_1 = l_memoizedState_1.dehydrated;
                if l_dehydrated_1 ~= nil then
                    if not v403 then
                        return v395(v396, v397, l_dehydrated_1, l_memoizedState_1, v398);
                    elseif v397.memoizedState ~= nil then
                        v397.child = v396.child;
                        v397.flags = bit32.bor(v397.flags, l_DidCapture_0);
                        return nil;
                    else
                        local l_children_5 = l_pendingProps_5.children;
                        local l_fallback_1 = l_pendingProps_5.fallback;
                        local v415 = mountSuspenseFallbackAfterRetryWithoutHydrating(v396, v397, l_children_5, l_fallback_1, v398);
                        v397.child.memoizedState = {
                            baseLanes = v398
                        };
                        v397.memoizedState = v377;
                        return v415;
                    end;
                end;
            end;
            if v402 then
                local l_fallback_2 = l_pendingProps_5.fallback;
                local l_children_6 = l_pendingProps_5.children;
                local v418 = v394(v396, v397, l_children_6, l_fallback_2, v398);
                local l_child_1 = v397.child;
                local l_memoizedState_2 = v396.child.memoizedState;
                if l_memoizedState_2 == nil then
                    l_child_1.memoizedState = {
                        baseLanes = v398
                    };
                else
                    l_child_1.memoizedState = {
                        baseLanes = v14.mergeLanes(l_memoizedState_2.baseLanes, v398)
                    };
                end;
                l_child_1.childLanes = v14.removeLanes(v396.childLanes, v398);
                v397.memoizedState = v377;
                return v418;
            else
                local l_children_7 = l_pendingProps_5.children;
                local v422 = v391(v396, v397, l_children_7, v398);
                v397.memoizedState = nil;
                return v422;
            end;
        elseif v402 then
            local l_fallback_3 = l_pendingProps_5.fallback;
            local l_children_8 = l_pendingProps_5.children;
            local v425 = v394(v396, v397, l_children_8, l_fallback_3, v398);
            local l_child_2 = v397.child;
            local l_memoizedState_3 = v396.child.memoizedState;
            if l_memoizedState_3 == nil then
                l_child_2.memoizedState = {
                    baseLanes = v398
                };
            else
                l_child_2.memoizedState = {
                    baseLanes = v14.mergeLanes(l_memoizedState_3.baseLanes, v398)
                };
            end;
            l_child_2.childLanes = v14.removeLanes(v396.childLanes, v398);
            v397.memoizedState = v377;
            return v425;
        else
            local l_children_9 = l_pendingProps_5.children;
            local v429 = v391(v396, v397, l_children_9, v398);
            v397.memoizedState = nil;
            return v429;
        end;
    end;
end;
v393 = function(v431, v432, v433) --[[ Line: 2167 ]] --[[ Name: mountSuspensePrimaryChildren ]]
    -- upvalues: l_createFiberFromOffscreen_0 (copy)
    local l_mode_0 = v431.mode;
    local v435 = {
        mode = "visible", 
        children = v432
    };
    local v436 = l_createFiberFromOffscreen_0(v435, l_mode_0, v433, nil);
    v436.return_ = v431;
    v431.child = v436;
    return v436;
end;
mountSuspenseFallbackChildren = function(v437, v438, v439, v440) --[[ Line: 2180 ]] --[[ Name: mountSuspenseFallbackChildren ]]
    -- upvalues: l_BlockingMode_0 (copy), l_NoMode_0 (copy), v14 (copy), l_enableProfilerTimer_0 (copy), l_ProfileMode_0 (copy), l_createFiberFromFragment_0 (copy), l_createFiberFromOffscreen_0 (copy)
    local l_mode_1 = v437.mode;
    local l_child_3 = v437.child;
    local v443 = {
        mode = "hidden", 
        children = v438
    };
    local v444 = nil;
    local v445 = nil;
    if bit32.band(l_mode_1, l_BlockingMode_0) == l_NoMode_0 and l_child_3 ~= nil then
        v444 = l_child_3;
        v444.childLanes = v14.NoLanes;
        v444.pendingProps = v443;
        if l_enableProfilerTimer_0 and bit32.band(v437.mode, l_ProfileMode_0) ~= 0 then
            v444.actualDuration = 0;
            v444.actualStartTime = -1;
            v444.selfBaseDuration = 0;
            v444.treeBaseDuration = 0;
        end;
        v445 = l_createFiberFromFragment_0(v439, l_mode_1, v440, nil);
    else
        v444 = l_createFiberFromOffscreen_0(v443, l_mode_1, v14.NoLanes, nil);
        v445 = l_createFiberFromFragment_0(v439, l_mode_1, v440, nil);
    end;
    v444.return_ = v437;
    v445.return_ = v437;
    v444.sibling = v445;
    v437.child = v444;
    return v445;
end;
local function _(v446, v447) --[[ Line: 2230 ]] --[[ Name: createWorkInProgressOffscreenFiber ]]
    -- upvalues: l_createWorkInProgress_0 (copy)
    return l_createWorkInProgress_0(v446, v447);
end;
v391 = function(v449, v450, v451, v452) --[[ Line: 2239 ]] --[[ Name: updateSuspensePrimaryChildren ]]
    -- upvalues: l_createWorkInProgress_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_Deletion_0 (copy)
    local l_child_4 = v449.child;
    local l_sibling_0 = l_child_4.sibling;
    local v455 = {
        mode = "visible", 
        children = v451
    };
    local v456 = l_createWorkInProgress_0(l_child_4, v455);
    if bit32.band(v450.mode, l_BlockingMode_0) == l_NoMode_0 then
        v456.lanes = v452;
    end;
    v456.return_ = v450;
    v456.sibling = nil;
    if l_sibling_0 ~= nil then
        v455 = v450.deletions;
        if v455 == nil then
            v450.deletions = {
                l_sibling_0
            };
            v450.flags = bit32.bor(v450.flags, l_Deletion_0);
        else
            table.insert(v455, l_sibling_0);
        end;
    end;
    v450.child = v456;
    return v456;
end;
v394 = function(v457, v458, v459, v460, v461) --[[ Line: 2274 ]] --[[ Name: updateSuspenseFallbackChildren ]]
    -- upvalues: l_BlockingMode_0 (copy), l_NoMode_0 (copy), v14 (copy), l_enableProfilerTimer_0 (copy), l_ProfileMode_0 (copy), l_createWorkInProgress_0 (copy), l_StaticMask_0 (copy), l_createFiberFromFragment_0 (copy), l_Placement_0 (copy)
    local l_mode_2 = v458.mode;
    local l_child_5 = v457.child;
    local l_sibling_1 = l_child_5.sibling;
    local v465 = {
        mode = "hidden", 
        children = v459
    };
    local v466 = nil;
    if bit32.band(l_mode_2, l_BlockingMode_0) == l_NoMode_0 and v458.child ~= l_child_5 then
        v466 = v458.child;
        v466.childLanes = v14.NoLanes;
        v466.pendingProps = v465;
        if l_enableProfilerTimer_0 and bit32.band(v458.mode, l_ProfileMode_0) ~= 0 then
            v466.actualDuration = 0;
            v466.actualStartTime = -1;
            v466.selfBaseDuration = l_child_5.selfBaseDuration;
            v466.treeBaseDuration = l_child_5.treeBaseDuration;
        end;
        v458.deletions = nil;
    else
        v466 = l_createWorkInProgress_0(l_child_5, v465);
        v466.subtreeFlags = bit32.band(l_child_5.subtreeFlags, l_StaticMask_0);
    end;
    local v467 = nil;
    if l_sibling_1 ~= nil then
        v467 = l_createWorkInProgress_0(l_sibling_1, v460);
    else
        v467 = l_createFiberFromFragment_0(v460, l_mode_2, v461, nil);
        v467.flags = bit32.bor(v467.flags, l_Placement_0);
    end;
    v467.return_ = v458;
    v466.return_ = v458;
    v466.sibling = v467;
    v458.child = v466;
    return v467;
end;
local function _(v468, v469, v470) --[[ Line: 2357 ]] --[[ Name: retrySuspenseComponentWithoutHydrating ]]
    -- upvalues: l_reconcileChildFibers_0 (copy), v393 (ref), l_Placement_0 (copy)
    l_reconcileChildFibers_0(v469, v468.child, nil, v470);
    local l_children_10 = v469.pendingProps.children;
    local v472 = v393(v469, l_children_10, v470);
    v472.flags = bit32.bor(v472.flags, l_Placement_0);
    v469.memoizedState = nil;
    return v472;
end;
mountSuspenseFallbackAfterRetryWithoutHydrating = function(v474, v475, v476, v477, v478) --[[ Line: 2378 ]] --[[ Name: mountSuspenseFallbackAfterRetryWithoutHydrating ]]
    -- upvalues: l_createFiberFromOffscreen_0 (copy), v14 (copy), l_createFiberFromFragment_0 (copy), l_Placement_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_mode_3 = v475.mode;
    local v480 = l_createFiberFromOffscreen_0(v476, l_mode_3, v14.NoLanes, nil);
    local v481 = l_createFiberFromFragment_0(v477, l_mode_3, v478, nil);
    v481.flags = bit32.bor(v481.flags, l_Placement_0);
    v480.return_ = v475;
    v481.return_ = v475;
    v480.sibling = v481;
    v475.child = v480;
    if bit32.band(v475.mode, l_BlockingMode_0) ~= l_NoMode_0 then
        l_reconcileChildFibers_0(v475, v474.child, nil, v478);
    end;
    return v481;
end;
v392 = function(v482, v483, _) --[[ Line: 2408 ]] --[[ Name: mountDehydratedSuspenseComponent ]]
    -- upvalues: l_BlockingMode_0 (copy), l_NoMode_0 (copy), l___DEV___0 (copy), l_console_0 (copy), v14 (copy), l_isSuspenseInstanceFallback_0 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy)
    if bit32.band(v482.mode, l_BlockingMode_0) == l_NoMode_0 then
        if l___DEV___0 then
            l_console_0.error("Cannot hydrate Suspense in legacy mode. Switch fromReactDOM.hydrate(element, container) to ReactDOM.createBlockingRoot(container, { hydrate: true }).render(element) or remove the Suspense componentsthe server rendered components.");
        end;
        v482.lanes = v14.laneToLanes(v14.SyncLane);
    elseif l_isSuspenseInstanceFallback_0(v483) then
        if l_enableSchedulerTracing_0 then
            l_markSpawnedWork_0(v14.DefaultHydrationLane);
        end;
        v482.lanes = v14.laneToLanes(v14.DefaultHydrationLane);
    else
        v482.lanes = v14.laneToLanes(v14.OffscreenLane);
        if l_enableSchedulerTracing_0 then
            l_markSpawnedWork_0(v14.OffscreenLane);
        end;
    end;
    return nil;
end;
v395 = function(v485, v486, v487, v488, v489) --[[ Line: 2455 ]] --[[ Name: updateDehydratedSuspenseComponent ]]
    -- upvalues: l_warnIfHydrating_0 (copy), l_getExecutionContext_0 (copy), l_RetryAfterError_0 (copy), l_NoContext_0 (copy), l_reconcileChildFibers_0 (copy), v393 (ref), l_Placement_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_isSuspenseInstanceFallback_0 (copy), v14 (copy), v170 (ref), l_getWorkInProgressRoot_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_renderDidSuspendDelayIfPossible_0 (copy), l_isSuspenseInstancePending_0 (copy), l_DidCapture_0 (copy), l_retryDehydratedSuspenseBoundary_0 (copy), l_enableSchedulerTracing_0 (copy), v160 (ref), l_Parent_0 (copy), l_registerSuspenseInstanceRetry_0 (copy), l_reenterHydrationStateFromDehydratedSuspenseInstance_0 (copy), l_Hydrating_0 (copy)
    l_warnIfHydrating_0();
    if bit32.band(l_getExecutionContext_0(), l_RetryAfterError_0) ~= l_NoContext_0 then
        l_reconcileChildFibers_0(v486, v485.child, nil, v489);
        local l_children_11 = v486.pendingProps.children;
        local v491 = v393(v486, l_children_11, v489);
        v491.flags = bit32.bor(v491.flags, l_Placement_0);
        v486.memoizedState = nil;
        return v491;
    elseif bit32.band(v486.mode, l_BlockingMode_0) == l_NoMode_0 then
        l_reconcileChildFibers_0(v486, v485.child, nil, v489);
        local l_children_12 = v486.pendingProps.children;
        local v493 = v393(v486, l_children_12, v489);
        v493.flags = bit32.bor(v493.flags, l_Placement_0);
        v486.memoizedState = nil;
        return v493;
    elseif l_isSuspenseInstanceFallback_0(v487) then
        l_reconcileChildFibers_0(v486, v485.child, nil, v489);
        local l_children_13 = v486.pendingProps.children;
        local v495 = v393(v486, l_children_13, v489);
        v495.flags = bit32.bor(v495.flags, l_Placement_0);
        v486.memoizedState = nil;
        return v495;
    else
        local v496 = v14.includesSomeLane(v489, v485.childLanes);
        if v170 or v496 then
            local v497 = l_getWorkInProgressRoot_0();
            if v497 ~= nil then
                local v498 = v14.getBumpedLaneForHydration(v497, v489);
                if v498 ~= v14.NoLane and v498 ~= v488.retryLane then
                    v488.retryLane = v498;
                    local l_NoTimestamp_0 = v14.NoTimestamp;
                    l_scheduleUpdateOnFiber_0(v485, v498, l_NoTimestamp_0);
                end;
            end;
            l_renderDidSuspendDelayIfPossible_0();
            l_reconcileChildFibers_0(v486, v485.child, nil, v489);
            local l_children_14 = v486.pendingProps.children;
            local v501 = v393(v486, l_children_14, v489);
            v501.flags = bit32.bor(v501.flags, l_Placement_0);
            v486.memoizedState = nil;
            return v501;
        elseif l_isSuspenseInstancePending_0(v487) then
            v486.flags = bit32.bor(v486.flags, l_DidCapture_0);
            v486.child = v485.child;
            local function v502() --[[ Line: 2551 ]]
                -- upvalues: l_retryDehydratedSuspenseBoundary_0 (ref), v485 (copy)
                return l_retryDehydratedSuspenseBoundary_0(v485);
            end;
            if l_enableSchedulerTracing_0 then
                if v160 == nil then
                    v160 = require(l_Parent_0.Scheduler).tracing.unstable_wrap;
                end;
                v502 = v160(v502);
            end;
            l_registerSuspenseInstanceRetry_0(v487, v502);
            return nil;
        else
            l_reenterHydrationStateFromDehydratedSuspenseInstance_0(v486, v487);
            local l_children_15 = v486.pendingProps.children;
            local v504 = v393(v486, l_children_15, v489);
            v504.flags = bit32.bor(v504.flags, l_Hydrating_0);
            return v504;
        end;
    end;
end;
updatePortalComponent = function(v505, v506, v507) --[[ Line: 2964 ]] --[[ Name: updatePortalComponent ]]
    -- upvalues: l_pushHostContainer_0 (copy), l_reconcileChildFibers_0 (copy), l_mountChildFibers_0 (copy)
    l_pushHostContainer_0(v506, v506.stateNode.containerInfo);
    local l_pendingProps_6 = v506.pendingProps;
    if v505 == nil then
        v506.child = l_reconcileChildFibers_0(v506, nil, l_pendingProps_6, v507);
    elseif v505 == nil then
        v506.child = l_mountChildFibers_0(v506, nil, l_pendingProps_6, v507);
    else
        v506.child = l_reconcileChildFibers_0(v506, v505.child, l_pendingProps_6, v507);
    end;
    return v506.child;
end;
local v509 = false;
local function v522(v510, v511, v512) --[[ Line: 2987 ]] --[[ Name: updateContextProvider ]]
    -- upvalues: l___DEV___0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_Array_0 (copy), l_Object_0 (copy), v509 (ref), l_console_0 (copy), l_checkPropTypes_0 (copy), l_pushProvider_0 (copy), l_calculateChangedBits_0 (copy), l_hasContextChanged_0 (copy), v168 (ref), l_propagateContextChange_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l__context_0 = v511.type._context;
    local l_pendingProps_7 = v511.pendingProps;
    local l_memoizedProps_2 = v511.memoizedProps;
    local l_value_0 = l_pendingProps_7.value;
    if l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 then
        if l_Array_0.indexOf(l_Object_0.keys(l_pendingProps_7), "value") < 1 and not v509 then
            v509 = true;
            l_console_0.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?");
        end;
        local l_propTypes_3 = v511.type.propTypes;
        local l_validateProps_3 = v511.type.validateProps;
        if l_propTypes_3 or l_validateProps_3 then
            l_checkPropTypes_0(l_propTypes_3, l_validateProps_3, l_pendingProps_7, "prop", "Context.Provider");
        end;
    end;
    l_pushProvider_0(v511, l_value_0);
    if l_memoizedProps_2 ~= nil then
        local l_value_1 = l_memoizedProps_2.value;
        local v520 = l_calculateChangedBits_0(l__context_0, l_value_0, l_value_1);
        if v520 == 0 then
            if l_memoizedProps_2.children == l_pendingProps_7.children and not l_hasContextChanged_0() then
                return v168(v510, v511, v512);
            end;
        else
            l_propagateContextChange_0(v511, l__context_0, v520, v512);
        end;
    end;
    local l_children_16 = l_pendingProps_7.children;
    if v510 == nil then
        v511.child = l_mountChildFibers_0(v511, nil, l_children_16, v512);
    else
        v511.child = l_reconcileChildFibers_0(v511, v510.child, l_children_16, v512);
    end;
    return v511.child;
end;
local v523 = {
    usingContextAsConsumer = false, 
    usingLegacyConsumer = false
};
updateContextConsumer = function(v524, v525, v526) --[[ Line: 3055 ]] --[[ Name: updateContextConsumer ]]
    -- upvalues: l___DEV___0 (copy), v523 (copy), l_console_0 (copy), l___COMPAT_WARNINGS___0 (copy), l_prepareToReadContext_0 (copy), v167 (copy), l_readContext_0 (copy), l_ReactCurrentOwner_0 (copy), l_setIsRendering_0 (copy), l_PerformedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_type_3 = v525.type;
    if l___DEV___0 then
        if l_type_3._context == nil then
            if l_type_3 ~= l_type_3.Consumer and not v523.usingContextAsConsumer then
                v523.usingContextAsConsumer = true;
                l_console_0.error("Rendering <Context> directly is not supported and will be removed in a future major release. Did you mean to render <Context.Consumer> instead?");
            end;
        else
            l_type_3 = l_type_3._context;
        end;
    end;
    local l_pendingProps_8 = v525.pendingProps;
    local v529 = nil;
    if l_pendingProps_8.render then
        if l___DEV___0 and l___COMPAT_WARNINGS___0 and not v523.usingLegacyConsumer then
            v523.usingLegacyConsumer = true;
            l_console_0.warn("Your Context.Consumer component is using legacy Roact syntax, which won't be supported in future versions of Roact. \nPlease provide no props and supply the 'render' function as a child (the 3rd argument of createElement). For example: \n       createElement(ContextConsumer, {render = function(...) end})\nbecomes:\n       createElement(ContextConsumer, nil, function(...) end)\nFor more info, reference the React documentation here: \nhttps://reactjs.org/docs/context.html#contextconsumer");
        end;
        v529 = l_pendingProps_8.render;
    else
        v529 = l_pendingProps_8.children;
    end;
    if l___DEV___0 and type(v529) ~= "function" then
        l_console_0.error("A context consumer was rendered with multiple children, or a child that isn't a function. A context consumer expects a single child that is a function. If you did pass a function, make sure there is no trailing or leading whitespace around it.");
    end;
    l_prepareToReadContext_0(v525, v526, v167.markWorkInProgressReceivedUpdate);
    local v530 = l_readContext_0(l_type_3, l_pendingProps_8.unstable_observedBits);
    local v531 = nil;
    if l___DEV___0 then
        l_ReactCurrentOwner_0.current = v525;
        l_setIsRendering_0(true);
        v531 = v529(v530);
        l_setIsRendering_0(false);
    else
        v531 = v529(v530);
    end;
    v525.flags = bit32.bor(v525.flags, l_PerformedWork_0);
    local l_v531_0 = v531;
    if v524 == nil then
        v525.child = l_mountChildFibers_0(v525, nil, l_v531_0, v526);
    else
        v525.child = l_reconcileChildFibers_0(v525, v524.child, l_v531_0, v526);
    end;
    return v525.child;
end;
v167.markWorkInProgressReceivedUpdate = function() --[[ Line: 3165 ]]
    -- upvalues: v170 (ref)
    v170 = true;
end;
v168 = function(v533, v534, v535) --[[ Line: 3169 ]] --[[ Name: bailoutOnAlreadyFinishedWork ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_stopProfilerTimerIfRunning_0 (copy), l_markSkippedUpdateLanes_0 (copy), v14 (copy), l_cloneChildFibers_0 (copy)
    if v533 then
        v534.dependencies = v533.dependencies;
    end;
    if l_enableProfilerTimer_0 then
        l_stopProfilerTimerIfRunning_0(v534);
    end;
    l_markSkippedUpdateLanes_0(v534.lanes);
    if not v14.includesSomeLane(v535, v534.childLanes) then
        return nil;
    else
        l_cloneChildFibers_0(v533, v534);
        return v534.child;
    end;
end;
remountFiber = function(v536, v537, v538) --[[ Line: 3200 ]] --[[ Name: remountFiber ]]
    -- upvalues: l___DEV___0 (copy), l_Deletion_0 (copy), l_Placement_0 (copy)
    if l___DEV___0 then
        local l_return__0 = v537.return_;
        if l_return__0 == nil then
            error("Cannot swap the root fiber.");
        end;
        assert(l_return__0 ~= nil, "returnFiber was nil in remountFiber");
        v536.alternate = nil;
        v537.alternate = nil;
        v538.index = v537.index;
        v538.sibling = v537.sibling;
        v538.return_ = v537.return_;
        v538.ref = v537.ref;
        if v537 == l_return__0.child then
            l_return__0.child = v538;
        else
            local l_child_6 = l_return__0.child;
            if l_child_6 == nil then
                error("Expected parent to have a child.");
            end;
            assert(l_child_6 ~= nil, "prevSibling was nil in remountFiber");
            while l_child_6.sibling ~= v537 do
                l_child_6 = l_child_6.sibling;
                if l_child_6 == nil then
                    error("Expected to find the previous sibling.");
                end;
            end;
            l_child_6.sibling = v538;
        end;
        local l_deletions_0 = l_return__0.deletions;
        if l_deletions_0 == nil then
            l_return__0.deletions = {
                v536
            };
            l_return__0.flags = bit32.bor(l_return__0.flags, l_Deletion_0);
        else
            table.insert(l_deletions_0, v536);
        end;
        v538.flags = bit32.bor(v538.flags, l_Placement_0);
        return v538;
    else
        error("Did not expect this call in production. This is a bug in React. Please file an issue.");
        return;
    end;
end;
v167.beginWork = function(v542, v543, v544) --[[ Line: 3269 ]] --[[ Name: beginWork ]]
    -- upvalues: l___DEV___0 (copy), l_createFiberFromTypeAndProps_0 (copy), l_hasContextChanged_0 (copy), v170 (ref), v14 (copy), l_HostRoot_0 (copy), l_pushTopLevelContextObject_0 (copy), l_pushHostContainer_0 (copy), l_resetHydrationState_0 (copy), l_HostComponent_0 (copy), l_pushHostContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_HostPortal_0 (copy), l_ContextProvider_0 (copy), l_pushProvider_0 (copy), l_Profiler_0 (copy), l_enableProfilerTimer_0 (copy), l_SuspenseComponent_0 (copy), l_enableSuspenseServerRenderer_0 (copy), l_pushSuspenseContext_0 (copy), l_setDefaultShallowSuspenseContext_0 (copy), l_suspenseStackCursor_0 (copy), l_DidCapture_0 (copy), v430 (copy), v168 (ref), l_SuspenseListComponent_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), v242 (copy), l_ForceUpdateForLegacySuspense_0 (copy), l_NoFlags_0 (copy), v19 (copy), v367 (copy), l_LazyComponent_0 (copy), v344 (copy), l_FunctionComponent_0 (copy), l_resolveDefaultProps_0 (copy), v169 (ref), v285 (copy), v317 (copy), v326 (copy), l_HostText_0 (copy), l_tryToClaimNextHydratableInstance_0 (copy), l_ForwardRef_0 (copy), v196 (copy), l_Fragment_0 (copy), l_Mode_0 (copy), v522 (copy), l_ContextConsumer_0 (copy), l_MemoComponent_0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), v215 (copy), l_SimpleMemoComponent_0 (copy), v172 (ref), l_IncompleteClassComponent_0 (copy), v242 (copy), l_invariant_0 (copy)
    local l_lanes_0 = v543.lanes;
    if l___DEV___0 and v543._debugNeedsRemount and v542 ~= nil then
        return remountFiber(v542, v543, l_createFiberFromTypeAndProps_0(v543.type, v543.key, v543.pendingProps, v543._debugOwner or nil, v543.mode, v543.lanes));
    else
        if v542 ~= nil then
            if v542.memoizedProps ~= v543.pendingProps or l_hasContextChanged_0() or if l___DEV___0 then v543.type ~= v542.type else false then
                v170 = true;
            elseif not v14.includesSomeLane(v544, l_lanes_0) then
                v170 = false;
                if v543.tag == l_HostRoot_0 then
                    local l_stateNode_7 = v543.stateNode;
                    if l_stateNode_7.pendingContext then
                        l_pushTopLevelContextObject_0(v543, l_stateNode_7.pendingContext, l_stateNode_7.pendingContext ~= l_stateNode_7.context);
                    elseif l_stateNode_7.context then
                        l_pushTopLevelContextObject_0(v543, l_stateNode_7.context, false);
                    end;
                    l_pushHostContainer_0(v543, l_stateNode_7.containerInfo);
                    l_resetHydrationState_0();
                elseif v543.tag == l_HostComponent_0 then
                    l_pushHostContext_0(v543);
                elseif v543.tag == l_ClassComponent_0 then
                    local l_type_4 = v543.type;
                    if l_isContextProvider_0(l_type_4) then
                        l_pushContextProvider_0(v543);
                    end;
                elseif v543.tag == l_HostPortal_0 then
                    l_pushHostContainer_0(v543, v543.stateNode.containerInfo);
                elseif v543.tag == l_ContextProvider_0 then
                    local l_value_2 = v543.memoizedProps.value;
                    l_pushProvider_0(v543, l_value_2);
                elseif v543.tag == l_Profiler_0 then
                    if l_enableProfilerTimer_0 then
                        local l_stateNode_8 = v543.stateNode;
                        l_stateNode_8.effectDuration = 0;
                        l_stateNode_8.passiveEffectDuration = 0;
                    end;
                elseif v543.tag == l_SuspenseComponent_0 then
                    local l_memoizedState_4 = v543.memoizedState;
                    if l_memoizedState_4 ~= nil then
                        if l_enableSuspenseServerRenderer_0 and l_memoizedState_4.dehydrated ~= nil then
                            l_pushSuspenseContext_0(v543, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                            v543.flags = bit32.bor(v543.flags, l_DidCapture_0);
                            return nil;
                        else
                            local l_childLanes_0 = v543.child.childLanes;
                            if v14.includesSomeLane(v544, l_childLanes_0) then
                                return v430(v542, v543, v544);
                            else
                                l_pushSuspenseContext_0(v543, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                                local v552 = v168(v542, v543, v544);
                                if v552 ~= nil then
                                    return v552.sibling;
                                else
                                    return nil;
                                end;
                            end;
                        end;
                    else
                        l_pushSuspenseContext_0(v543, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                    end;
                elseif v543.tag == l_SuspenseListComponent_0 then
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"));
                    error("FIXME (roblox): beginWork: SuspenseListComponent is unimplemented", 2);
                elseif v543.tag == l_OffscreenComponent_0 or v543.tag == l_LegacyHiddenComponent_0 then
                    v543.lanes = v14.NoLanes;
                    return (v242(v542, v543, v544));
                end;
                return v168(v542, v543, v544);
            elseif bit32.band(v542.flags, l_ForceUpdateForLegacySuspense_0) ~= l_NoFlags_0 then
                v170 = true;
            else
                v170 = false;
            end;
        else
            v170 = false;
        end;
        v543.lanes = v14.NoLanes;
        if v543.tag == v19.IndeterminateComponent then
            return v367(v542, v543, v543.type, v544);
        elseif v543.tag == l_LazyComponent_0 then
            local l_elementType_1 = v543.elementType;
            return (v344(v542, v543, l_elementType_1, l_lanes_0, v544));
        elseif v543.tag == l_FunctionComponent_0 then
            local l_type_5 = v543.type;
            local l_pendingProps_9 = v543.pendingProps;
            local v556 = nil;
            v556 = if v543.elementType == l_type_5 then l_pendingProps_9 else l_resolveDefaultProps_0(l_type_5, l_pendingProps_9);
            return v169(v542, v543, l_type_5, v556, v544);
        elseif v543.tag == l_ClassComponent_0 then
            local l_type_6 = v543.type;
            local l_pendingProps_10 = v543.pendingProps;
            local v559 = v543.elementType == l_type_6 and l_pendingProps_10 or l_resolveDefaultProps_0(l_type_6, l_pendingProps_10);
            return (v285(v542, v543, l_type_6, v559, v544));
        elseif v543.tag == l_HostRoot_0 then
            return v317(v542, v543, v544);
        elseif v543.tag == l_HostComponent_0 then
            return (v326(v542, v543, v544));
        elseif v543.tag == l_HostText_0 then
            if v542 == nil then
                l_tryToClaimNextHydratableInstance_0(v543);
            end;
            return nil;
        elseif v543.tag == l_SuspenseComponent_0 then
            return v430(v542, v543, v544);
        elseif v543.tag == l_HostPortal_0 then
            return updatePortalComponent(v542, v543, v544);
        elseif v543.tag == l_ForwardRef_0 then
            local l_type_7 = v543.type;
            local l_pendingProps_11 = v543.pendingProps;
            local l_l_pendingProps_11_0 = l_pendingProps_11;
            if v543.elementType ~= l_type_7 then
                l_l_pendingProps_11_0 = l_resolveDefaultProps_0(l_type_7, l_pendingProps_11);
            end;
            return v196(v542, v543, l_type_7, l_l_pendingProps_11_0, v544);
        elseif v543.tag == l_Fragment_0 then
            return updateFragment(v542, v543, v544);
        elseif v543.tag == l_Mode_0 then
            return updateMode(v542, v543, v544);
        elseif v543.tag == l_Profiler_0 then
            return updateProfiler(v542, v543, v544);
        elseif v543.tag == l_ContextProvider_0 then
            return v522(v542, v543, v544);
        elseif v543.tag == l_ContextConsumer_0 then
            return updateContextConsumer(v542, v543, v544);
        elseif v543.tag == l_MemoComponent_0 then
            local l_type_8 = v543.type;
            local l_pendingProps_12 = v543.pendingProps;
            local v565 = l_resolveDefaultProps_0(l_type_8, l_pendingProps_12);
            if (l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0) and v543.type ~= v543.elementType then
                local v566 = nil;
                local v567 = nil;
                if type(l_type_8) == "table" then
                    v566 = l_type_8.propTypes;
                    v567 = l_type_8.validateProps;
                end;
                if v566 or v567 then
                    l_checkPropTypes_0(v566, v567, v565, "prop", l_getComponentName_0(l_type_8));
                end;
            end;
            v565 = l_resolveDefaultProps_0(l_type_8.type, v565);
            return v215(v542, v543, l_type_8, v565, l_lanes_0, v544);
        elseif v543.tag == l_SimpleMemoComponent_0 then
            return v172(v542, v543, v543.type, v543.pendingProps, l_lanes_0, v544);
        elseif v543.tag == l_IncompleteClassComponent_0 then
            local l_type_9 = v543.type;
            local l_pendingProps_13 = v543.pendingProps;
            local v570 = v543.elementType == l_type_9 and l_pendingProps_13 or l_resolveDefaultProps_0(l_type_9, l_pendingProps_13);
            return mountIncompleteClassComponent(v542, v543, l_type_9, v570, v544);
        elseif v543.tag == l_OffscreenComponent_0 then
            return (v242(v542, v543, v544));
        elseif v543.tag == l_LegacyHiddenComponent_0 then
            return (v242(v542, v543, v544));
        else
            l_invariant_0(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.", (tostring(v543.tag)));
            return nil;
        end;
    end;
end;
return v167;