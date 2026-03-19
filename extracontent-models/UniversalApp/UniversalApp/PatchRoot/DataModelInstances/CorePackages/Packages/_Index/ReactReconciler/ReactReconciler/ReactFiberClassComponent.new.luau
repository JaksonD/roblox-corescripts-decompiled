local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l___DEV___0 = v1.__DEV__;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v6 = require(script.Parent.ReactFiberLane);
local v7 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local v9 = require(l_Parent_0.React);
local v10 = require(script.Parent.ReactFiberFlags);
local l_Update_0 = v10.Update;
local l_Snapshot_0 = v10.Snapshot;
local l_MountLayoutDev_0 = v10.MountLayoutDev;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = l_ReactFeatureFlags_0.debugRenderPhaseSideEffectsForStrictMode;
local l_disableLegacyContext_0 = l_ReactFeatureFlags_0.disableLegacyContext;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_warnAboutDeprecatedLifecycles_0 = l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v21 = require(script.Parent["ReactStrictModeWarnings.new"]);
local l_isMounted_0 = require(script.Parent.ReactFiberTreeReflection).isMounted;
local l_ReactInstanceMap_0 = require(l_Parent_0.Shared).ReactInstanceMap;
local l_get_0 = l_ReactInstanceMap_0.get;
local l_set_0 = l_ReactInstanceMap_0.set;
local l_shallowEqual_0 = require(l_Parent_0.Shared).shallowEqual;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_UninitializedState_0 = require(l_Parent_0.Shared).UninitializedState;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v34 = require(script.Parent.ReactTypeOfMode);
local l_DebugTracingMode_0 = v34.DebugTracingMode;
local l_StrictMode_0 = v34.StrictMode;
local l_enqueueUpdate_0 = v7.enqueueUpdate;
local l_processUpdateQueue_0 = v7.processUpdateQueue;
local l_checkHasForceUpdateAfterProcessing_0 = v7.checkHasForceUpdateAfterProcessing;
local l_resetHasForceUpdateBeforeProcessing_0 = v7.resetHasForceUpdateBeforeProcessing;
local l_createUpdate_0 = v7.createUpdate;
local l_ReplaceState_0 = v7.ReplaceState;
local l_ForceUpdate_0 = v7.ForceUpdate;
local l_initializeUpdateQueue_0 = v7.initializeUpdateQueue;
local l_cloneUpdateQueue_0 = v7.cloneUpdateQueue;
local l_NoLanes_0 = v6.NoLanes;
local v47 = require(script.Parent["ReactFiberContext.new"]);
local l_cacheContext_0 = v47.cacheContext;
local l_getMaskedContext_0 = v47.getMaskedContext;
local l_getUnmaskedContext_0 = v47.getUnmaskedContext;
local l_hasContextChanged_0 = v47.hasContextChanged;
local l_emptyContextObject_0 = v47.emptyContextObject;
local l_readContext_0 = require(script.Parent["ReactFiberNewContext.new"]).readContext;
local v54 = require(script.Parent.DebugTracing);
local l_logForceUpdateScheduled_0 = v54.logForceUpdateScheduled;
local l_logStateUpdateScheduled_0 = v54.logStateUpdateScheduled;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local v60 = require(script.Parent.SchedulingProfiler);
local l_markForceUpdateScheduled_0 = v60.markForceUpdateScheduled;
local l_markStateUpdateScheduled_0 = v60.markStateUpdateScheduled;
local v63 = {};
local l___refs_0 = v9.Component:extend("").__refs;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
local v74 = nil;
if l___DEV___0 then
    v65 = {};
    v66 = {};
    v67 = {};
    v68 = {};
    v72 = {};
    v69 = {};
    v73 = {};
    v74 = {};
    local v75 = {};
    local l_v75_0 = v75 --[[ copy: 77 -> 86 ]];
    v71 = function(v77, v78) --[[ Line: 140 ]] --[[ Name: warnOnInvalidCallback ]]
        -- upvalues: l_v75_0 (copy), l_console_0 (copy)
        if v77 == nil or type(v77) == "function" then
            return;
        else
            local v79 = v78 .. "_" .. tostring(v77);
            if not l_v75_0[v79] then
                l_v75_0[v79] = true;
                l_console_0.error("%s(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", v78, (tostring(v77)));
            end;
            return;
        end;
    end;
    v70 = function(_, _) --[[ Line: 156 ]] --[[ Name: warnOnUndefinedDerivedState ]]

    end;
end;
local function v91(v82, v83, v84, v85) --[[ Line: 199 ]] --[[ Name: applyDerivedStateFromProps ]]
    -- upvalues: l___DEV___0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v70 (ref), l_Object_0 (copy), l_NoLanes_0 (copy)
    local l_memoizedState_0 = v82.memoizedState;
    if l___DEV___0 and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v82.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local v87, v88 = xpcall(v84, l_describeError_0, v85, l_memoizedState_0);
        l_reenableLogs_0();
        if not v87 then
            error(v88);
        end;
    end;
    local v89 = v84(v85, l_memoizedState_0);
    if l___DEV___0 then
        v70(v83, v89);
    end;
    local v90 = if v89 == nil then l_memoizedState_0 else l_Object_0.assign({}, l_memoizedState_0, v89);
    v82.memoizedState = v90;
    if v82.lanes == l_NoLanes_0 then
        v82.updateQueue.baseState = v90;
    end;
end;
local v92 = nil;
local function v120() --[[ Line: 247 ]] --[[ Name: initializeClassComponentUpdater ]]
    -- upvalues: v92 (ref), l_isMounted_0 (copy), l_get_0 (copy), l_createUpdate_0 (copy), l___DEV___0 (copy), v71 (ref), l_enqueueUpdate_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logStateUpdateScheduled_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markStateUpdateScheduled_0 (copy), l_ReplaceState_0 (copy), l_ForceUpdate_0 (copy), l_logForceUpdateScheduled_0 (copy), l_markForceUpdateScheduled_0 (copy)
    local v93 = require(script.Parent["ReactFiberWorkLoop.new"]);
    local l_requestEventTime_0 = v93.requestEventTime;
    local l_requestUpdateLane_0 = v93.requestUpdateLane;
    local l_scheduleUpdateOnFiber_0 = v93.scheduleUpdateOnFiber;
    v92 = {
        isMounted = l_isMounted_0, 
        enqueueSetState = function(v97, v98, v99) --[[ Line: 255 ]] --[[ Name: enqueueSetState ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l___DEV___0 (ref), v71 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logStateUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markStateUpdateScheduled_0 (ref)
            local v100 = l_get_0(v97);
            local v101 = l_requestEventTime_0();
            local v102 = l_requestUpdateLane_0(v100);
            local v103 = l_createUpdate_0(v101, v102, v98, v99);
            if v99 ~= nil and l___DEV___0 then
                v71(v99, "setState");
            end;
            l_enqueueUpdate_0(v100, v103);
            l_scheduleUpdateOnFiber_0(v100, v102, v101);
            if l___DEV___0 and l_enableDebugTracing_0 and bit32.band(v100.mode, l_DebugTracingMode_0) ~= 0 then
                local v104 = l_getComponentName_0(v100.type) or "Unknown";
                l_logStateUpdateScheduled_0(v104, v102, v98);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v100, v102);
            end;
        end, 
        enqueueReplaceState = function(v105, v106, v107) --[[ Line: 285 ]] --[[ Name: enqueueReplaceState ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l_ReplaceState_0 (ref), l___DEV___0 (ref), v71 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logStateUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markStateUpdateScheduled_0 (ref)
            local v108 = l_get_0(v105);
            local v109 = l_requestEventTime_0();
            local v110 = l_requestUpdateLane_0(v108);
            local v111 = l_createUpdate_0(v109, v110, v106, v107);
            v111.tag = l_ReplaceState_0;
            if v107 ~= nil and l___DEV___0 then
                v71(v107, "replaceState");
            end;
            l_enqueueUpdate_0(v108, v111);
            l_scheduleUpdateOnFiber_0(v108, v110, v109);
            if l___DEV___0 and l_enableDebugTracing_0 and bit32.band(v108.mode, l_DebugTracingMode_0) ~= 0 then
                local v112 = l_getComponentName_0(v108.type) or "Unknown";
                l_logStateUpdateScheduled_0(v112, v110, v106);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v108, v110);
            end;
        end, 
        enqueueForceUpdate = function(v113, v114) --[[ Line: 317 ]] --[[ Name: enqueueForceUpdate ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l_ForceUpdate_0 (ref), l___DEV___0 (ref), v71 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logForceUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markForceUpdateScheduled_0 (ref)
            local v115 = l_get_0(v113);
            local v116 = l_requestEventTime_0();
            local v117 = l_requestUpdateLane_0(v115);
            local v118 = l_createUpdate_0(v116, v117, nil, v114);
            v118.tag = l_ForceUpdate_0;
            if v114 ~= nil and l___DEV___0 then
                v71(v114, "forceUpdate");
            end;
            l_enqueueUpdate_0(v115, v118);
            l_scheduleUpdateOnFiber_0(v115, v117, v116);
            if l___DEV___0 and l_enableDebugTracing_0 and bit32.band(v115.mode, l_DebugTracingMode_0) ~= 0 then
                local v119 = l_getComponentName_0(v115.type) or "Unknown";
                l_logForceUpdateScheduled_0(v119, v117);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markForceUpdateScheduled_0(v115, v117);
            end;
        end
    };
end;
local function _() --[[ Line: 351 ]] --[[ Name: getClassComponentUpdater ]]
    -- upvalues: v92 (ref), v120 (copy)
    if v92 == nil then
        v120();
    end;
    return v92;
end;
checkShouldComponentUpdate = function(v122, v123, v124, v125, v126, v127, v128) --[[ Line: 358 ]] --[[ Name: checkShouldComponentUpdate ]]
    -- upvalues: l___DEV___0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_shallowEqual_0 (copy)
    local l_stateNode_0 = v122.stateNode;
    if l_stateNode_0.shouldComponentUpdate ~= nil and type(l_stateNode_0.shouldComponentUpdate) == "function" then
        if l___DEV___0 and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v122.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v130, v131 = xpcall(l_stateNode_0.shouldComponentUpdate, l_describeError_0, l_stateNode_0, v125, v127, v128);
            l_reenableLogs_0();
            if not v130 then
                error(v131);
            end;
        end;
        local v132 = l_stateNode_0:shouldComponentUpdate(v125, v127, v128);
        if l___DEV___0 and v132 == nil then
            l_console_0.error("%s.shouldComponentUpdate(): Returned nil instead of a boolean value. Make sure to return true or false.", l_getComponentName_0(v123) or "Component");
        end;
        return v132;
    elseif type(v123) == "table" and v123.isPureReactComponent then
        return not l_shallowEqual_0(v124, v125) or not l_shallowEqual_0(v126, v127);
    else
        return true;
    end;
end;
local function v140(v133, v134, v135) --[[ Line: 423 ]] --[[ Name: checkClassInstance ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), l_console_0 (copy), l_disableLegacyContext_0 (copy), v73 (ref), v67 (ref)
    local l_stateNode_1 = v133.stateNode;
    if l___DEV___0 then
        local v137 = l_getComponentName_0(v134) or "Component";
        if not l_stateNode_1.render then
            if type(v134.render) == "function" then
                l_console_0.error("%s(...): No `render` method found on the returned component instance: did you accidentally return an object from the constructor?", v137);
            else
                l_console_0.error("%s(...): No `render` method found on the returned component instance: you may have forgotten to define `render`.", v137);
            end;
        end;
        if l_stateNode_1.getInitialState and not l_stateNode_1.getInitialState.isReactClassApproved and not l_stateNode_1.state then
            l_console_0.error("getInitialState was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Did you mean to define a state property instead?", v137);
        end;
        if l_stateNode_1.getDefaultProps and not l_stateNode_1.getDefaultProps.isReactClassApproved then
            l_console_0.error("getDefaultProps was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Use a static property to define defaultProps instead.", v137);
        end;
        if l_stateNode_1.propTypes and not v134.propTypes then
            l_console_0.error("propTypes was defined as an instance property on %s. Use a static property to define propTypes instead.", v137);
        end;
        if l_stateNode_1.contextType and not v134.contextType then
            l_console_0.error("contextType was defined as an instance property on %s. Use a static property to define contextType instead.", v137);
        end;
        if l_disableLegacyContext_0 then
            if v134.childContextTypes then
                l_console_0.error("%s uses the legacy childContextTypes API which is no longer supported. Use React.createContext() instead.", v137);
            end;
            if v134.contextTypes then
                l_console_0.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with static contextType instead.", v137);
            end;
        else
            if l_stateNode_1.contextTypes and not v134.contextTypes then
                l_console_0.error("contextTypes was defined as an instance property on %s. Use a static property to define contextTypes instead.", v137);
            end;
            if type(v134) == "table" and v134.contextType and v134.contextTypes and not v73[v134] then
                v73[v134] = true;
                l_console_0.error("%s declares both contextTypes and contextType static properties. The legacy contextTypes property will be ignored.", v137);
            end;
        end;
        if type(l_stateNode_1.componentShouldUpdate) == "function" then
            l_console_0.error("%s has a method called componentShouldUpdate(). Did you mean shouldComponentUpdate()? The name is phrased as a question because the function is expected to return a value.", v137);
        end;
        if type(v134) == "table" and v134.isPureReactComponent and l_stateNode_1.shouldComponentUpdate ~= nil then
            l_console_0.error("%s has a method called shouldComponentUpdate(). shouldComponentUpdate should not be used when extending React.PureComponent. Please extend React.Component if shouldComponentUpdate is used.", l_getComponentName_0(v134) or "A pure component");
        end;
        if type(l_stateNode_1.componentDidUnmount) == "function" then
            l_console_0.error("%s has a method called componentDidUnmount(). But there is no such lifecycle method. Did you mean componentWillUnmount()?", v137);
        end;
        if type(l_stateNode_1.componentDidReceiveProps) == "function" then
            l_console_0.error("%s has a method called componentDidReceiveProps(). But there is no such lifecycle method. If you meant to update the state in response to changing props, use componentWillReceiveProps(). If you meant to fetch data or run side-effects or mutations after React has updated the UI, use componentDidUpdate().", v137);
        end;
        if type(l_stateNode_1.componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", v137);
        end;
        if type(l_stateNode_1.UNSAFE_componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", v137);
        end;
        local v138 = l_stateNode_1.props ~= v135;
        if l_stateNode_1.props ~= nil and v138 then
            l_console_0.error("%s(...): When calling super() in `%s`, make sure to pass up the same props that your component's constructor was passed.", v137, v137);
        end;
        if rawget(l_stateNode_1, "defaultProps") then
            l_console_0.error("Setting defaultProps as an instance property on %s is not supported and will be ignored. Instead, define defaultProps as a static property on %s.", v137, v137);
        end;
        if type(l_stateNode_1.getSnapshotBeforeUpdate) == "function" and type(l_stateNode_1.componentDidUpdate) ~= "function" and not v67[v134] then
            v67[v134] = true;
            l_console_0.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). This component defines getSnapshotBeforeUpdate() only.", l_getComponentName_0(v134));
        end;
        local l_state_0 = l_stateNode_1.state;
        if l_state_0 ~= nil and type(l_state_0) ~= "table" then
            l_console_0.error("%s.state: must be set to an object or nil", v137);
        end;
        if type(v134) == "table" and type(l_stateNode_1.getChildContext) == "function" and type(v134.childContextTypes) ~= "table" then
            l_console_0.error("%s.getChildContext(): childContextTypes must be defined in order to use getChildContext().", v137);
        end;
    end;
end;
local function v143(v141, v142) --[[ Line: 657 ]] --[[ Name: adoptClassInstance ]]
    -- upvalues: v92 (ref), v120 (copy), l_set_0 (copy), l___DEV___0 (copy), v63 (copy)
    if v92 == nil then
        v120();
    end;
    v142.__updater = v92;
    v141.stateNode = v142;
    l_set_0(v142, v141);
    if l___DEV___0 then
        v142._reactInternalInstance = v63;
    end;
end;
local function v168(v144, v145, v146) --[[ Line: 668 ]] --[[ Name: constructClassInstance ]]
    -- upvalues: l_emptyContextObject_0 (copy), l___DEV___0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), v74 (ref), l_REACT_PROVIDER_TYPE_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v92 (ref), v120 (copy), l_set_0 (copy), v63 (copy), l_UninitializedState_0 (copy), v66 (ref), v68 (ref), l_cacheContext_0 (copy)
    local v147 = false;
    local l_l_emptyContextObject_0_0 = l_emptyContextObject_0;
    local l_l_emptyContextObject_0_1 = l_emptyContextObject_0;
    local l_contextType_0 = v145.contextType;
    if l___DEV___0 and v145.contextType ~= nil then
        local v151 = true;
        if l_contextType_0 ~= nil then
            v151 = false;
            if l_contextType_0["$$typeof"] == l_REACT_CONTEXT_TYPE_0 then
                v151 = l_contextType_0._context == nil;
            end;
        end;
        if not v151 and not v74[v145] then
            v74[v145] = true;
            local v152 = "";
            if l_contextType_0 == nil then
                v152 = " However, it is set to nil. This can be caused by a typo or by mixing up named and default imports. This can also happen due to a circular dependency, so try moving the createContext() call to a separate file.";
            elseif type(l_contextType_0) ~= "table" then
                v152 = " However, it is set to a " .. type(l_contextType_0) .. ".";
            elseif l_contextType_0["$$typeof"] == l_REACT_PROVIDER_TYPE_0 then
                v152 = " Did you accidentally pass the Context.Provider instead?";
            elseif l_contextType_0._context ~= nil then
                v152 = " Did you accidentally pass the Context.Consumer instead?";
            else
                v152 = v152 .. " However, it is set to an object with keys {";
                for v153, _ in l_contextType_0 do
                    v152 = v152 .. v153 .. ", ";
                end;
                v152 = v152 .. "}.";
            end;
            l_console_0.error("%s defines an invalid contextType. contextType should point to the Context object returned by React.createContext().%s", l_getComponentName_0(v145) or "Component", v152);
        end;
    end;
    if l_contextType_0 ~= nil and type(l_contextType_0) == "table" then
        l_l_emptyContextObject_0_1 = l_readContext_0(l_contextType_0);
    elseif not l_disableLegacyContext_0 then
        l_l_emptyContextObject_0_0 = l_getUnmaskedContext_0(v144, v145, true);
        v147 = v145.contextTypes ~= nil;
        l_l_emptyContextObject_0_1 = v147 and l_getMaskedContext_0(v144, l_l_emptyContextObject_0_0) or l_emptyContextObject_0;
    end;
    if l___DEV___0 and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v144.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local v155, v156 = xpcall(v145.__ctor, l_describeError_0, v146, l_l_emptyContextObject_0_1);
        l_reenableLogs_0();
        if not v155 then
            error(v156);
        end;
    end;
    local v157 = v145.__ctor(v146, l_l_emptyContextObject_0_1);
    v144.memoizedState = v157.state;
    local l_memoizedState_1 = v144.memoizedState;
    if v92 == nil then
        v120();
    end;
    v157.__updater = v92;
    v144.stateNode = v157;
    l_set_0(v157, v144);
    if l___DEV___0 then
        v157._reactInternalInstance = v63;
    end;
    if l___DEV___0 then
        if type(v145.getDerivedStateFromProps) == "function" and l_memoizedState_1 == l_UninitializedState_0 then
            local v159 = l_getComponentName_0(v145) or "Component";
            if not v66[v159] then
                v66[v159] = true;
                l_console_0.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. This is not recommended. Instead, define the initial state by passing an object to `self:setState` in the `init` method of `%s`. This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", v159, v159);
            end;
        end;
        if type(v145.getDerivedStateFromProps) == "function" or type(v157.getSnapshotBeforeUpdate) == "function" then
            local v160 = nil;
            local v161 = nil;
            local v162 = nil;
            if type(v157.componentWillMount) == "function" then
                v160 = "componentWillMount";
            elseif type(v157.UNSAFE_componentWillMount) == "function" then
                v160 = "UNSAFE_componentWillMount";
            end;
            if type(v157.componentWillReceiveProps) == "function" then
                v161 = "componentWillReceiveProps";
            elseif type(v157.UNSAFE_componentWillReceiveProps) == "function" then
                v161 = "UNSAFE_componentWillReceiveProps";
            end;
            if type(v157.componentWillUpdate) == "function" then
                v162 = "componentWillUpdate";
            elseif type(v157.UNSAFE_componentWillUpdate) == "function" then
                v162 = "UNSAFE_componentWillUpdate";
            end;
            if v160 ~= nil or v161 ~= nil or v162 ~= nil then
                local v163 = l_getComponentName_0(v145) or "Component";
                local v164 = nil;
                v164 = type(v145.getDerivedStateFromProps) == "function" and "getDerivedStateFromProps()" or "getSnapshotBeforeUpdate()";
                local v165 = nil;
                v165 = if v160 ~= nil then "\n  " .. tostring(v160) else "";
                local v166 = nil;
                v166 = if v161 ~= nil then "\n  " .. tostring(v161) else "";
                local v167 = nil;
                v167 = if v162 ~= nil then "\n  " .. tostring(v162) else "";
                if not v68[v163] then
                    v68[v163] = true;
                    l_console_0.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\nThe above lifecycles should be removed. Learn more about this warning here:\nhttps://reactjs.org/link/unsafe-component-lifecycles", v163, v164, v165, v166, v167);
                end;
            end;
        end;
    end;
    if v147 then
        l_cacheContext_0(v144, l_l_emptyContextObject_0_0, l_l_emptyContextObject_0_1);
    end;
    return v157;
end;
local function v172(v169, v170) --[[ Line: 881 ]] --[[ Name: callComponentWillMount ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), v92 (ref), v120 (copy)
    local l_state_1 = v170.state;
    if v170.componentWillMount ~= nil and type(v170.componentWillMount) == "function" then
        v170:componentWillMount();
    end;
    if v170.UNSAFE_componentWillMount ~= nil and type(v170.UNSAFE_componentWillMount) == "function" then
        v170:UNSAFE_componentWillMount();
    end;
    if l_state_1 ~= v170.state then
        if l___DEV___0 then
            l_console_0.error("%s.componentWillMount(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", l_getComponentName_0(v169.type) or "Component");
        end;
        if v92 == nil then
            v120();
        end;
        v92.enqueueReplaceState(v170, v170.state);
    end;
end;
callComponentWillReceiveProps = function(v173, v174, v175, v176) --[[ Line: 913 ]] --[[ Name: callComponentWillReceiveProps ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), v65 (ref), l_console_0 (copy), v92 (ref), v120 (copy)
    local l_state_2 = v174.state;
    if v174.componentWillReceiveProps ~= nil and type(v174.componentWillReceiveProps) == "function" then
        v174:componentWillReceiveProps(v175, v176);
    end;
    if v174.UNSAFE_componentWillReceiveProps ~= nil and type(v174.UNSAFE_componentWillReceiveProps) == "function" then
        v174:UNSAFE_componentWillReceiveProps(v175, v176);
    end;
    if v174.state ~= l_state_2 then
        if l___DEV___0 then
            local v178 = l_getComponentName_0(v173.type) or "Component";
            if not v65[v178] then
                v65[v178] = true;
                l_console_0.error("%s.componentWillReceiveProps(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", v178);
            end;
        end;
        if v92 == nil then
            v120();
        end;
        v92.enqueueReplaceState(v174, v174.state);
    end;
end;
local function v189(v179, v180, v181, v182) --[[ Line: 948 ]] --[[ Name: mountClassInstance ]]
    -- upvalues: l___DEV___0 (copy), v140 (copy), l___refs_0 (copy), l_initializeUpdateQueue_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_emptyContextObject_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_getComponentName_0 (copy), v72 (ref), l_console_0 (copy), l_StrictMode_0 (copy), v21 (copy), l_warnAboutDeprecatedLifecycles_0 (copy), l_processUpdateQueue_0 (copy), v91 (copy), v172 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy)
    if l___DEV___0 then
        v140(v179, v180, v181);
    end;
    local l_stateNode_2 = v179.stateNode;
    l_stateNode_2.props = v181;
    l_stateNode_2.state = v179.memoizedState;
    l_stateNode_2.__refs = l___refs_0;
    l_initializeUpdateQueue_0(v179);
    local v184 = nil;
    if type(v180) == "table" then
        v184 = v180.contextType;
    end;
    if v184 ~= nil and type(v184) == "table" then
        l_stateNode_2.context = l_readContext_0(v184);
    elseif l_disableLegacyContext_0 then
        l_stateNode_2.context = l_emptyContextObject_0;
    else
        local v185 = l_getUnmaskedContext_0(v179, v180, true);
        l_stateNode_2.context = l_getMaskedContext_0(v179, v185);
    end;
    if l___DEV___0 then
        if l_stateNode_2.state == v181 then
            local v186 = l_getComponentName_0(v180) or "Component";
            if not v72[v186] then
                v72[v186] = true;
                l_console_0.error("%s: It is not recommended to assign props directly to state because updates to props won't be reflected in state. In most cases, it is better to use props directly.", v186);
            end;
        end;
        if bit32.band(v179.mode, l_StrictMode_0) ~= 0 then
            v21.recordLegacyContextWarning(v179, l_stateNode_2);
        end;
        if l_warnAboutDeprecatedLifecycles_0 then
            v21.recordUnsafeLifecycleWarnings(v179, l_stateNode_2);
        end;
    end;
    l_processUpdateQueue_0(v179, v181, l_stateNode_2, v182);
    l_stateNode_2.state = v179.memoizedState;
    local v187 = type(v180);
    local v188 = nil;
    if type(v180) == "table" then
        v188 = v180.getDerivedStateFromProps;
    end;
    if v188 ~= nil and type(v188) == "function" then
        v91(v179, v180, v188, v181);
        l_stateNode_2.state = v179.memoizedState;
    end;
    if v187 == "table" and type(v180.getDerivedStateFromProps) ~= "function" and type(l_stateNode_2.getSnapshotBeforeUpdate) ~= "function" and (type(l_stateNode_2.UNSAFE_componentWillMount) == "function" or type(l_stateNode_2.componentWillMount) == "function") then
        v172(v179, l_stateNode_2);
        l_processUpdateQueue_0(v179, v181, l_stateNode_2, v182);
        l_stateNode_2.state = v179.memoizedState;
    end;
    if type(l_stateNode_2.componentDidMount) == "function" then
        if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
            v179.flags = bit32.bor(v179.flags, (bit32.bor(l_MountLayoutDev_0, l_Update_0)));
            return;
        else
            v179.flags = bit32.bor(v179.flags, l_Update_0);
        end;
    end;
end;
resumeMountClassInstance = function(v190, v191, v192, v193) --[[ Line: 1059 ]] --[[ Name: resumeMountClassInstance ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_resetHasForceUpdateBeforeProcessing_0 (copy), l_processUpdateQueue_0 (copy), l_hasContextChanged_0 (copy), l_checkHasForceUpdateAfterProcessing_0 (copy), l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), v91 (copy)
    local l_stateNode_3 = v190.stateNode;
    local l_memoizedProps_0 = v190.memoizedProps;
    l_stateNode_3.props = l_memoizedProps_0;
    local l_context_0 = l_stateNode_3.context;
    local l_contextType_1 = v191.contextType;
    local l_l_emptyContextObject_0_2 = l_emptyContextObject_0;
    if l_contextType_1 ~= nil and type(l_contextType_1) == "table" then
        l_l_emptyContextObject_0_2 = l_readContext_0(l_contextType_1);
    elseif not l_disableLegacyContext_0 then
        local v199 = l_getUnmaskedContext_0(v190, v191, true);
        l_l_emptyContextObject_0_2 = l_getMaskedContext_0(v190, v199);
    end;
    local l_getDerivedStateFromProps_0 = v191.getDerivedStateFromProps;
    local v201 = true;
    if type(l_getDerivedStateFromProps_0) ~= "function" then
        v201 = type(l_stateNode_3.getSnapshotBeforeUpdate) == "function";
    end;
    if not v201 and (type(l_stateNode_3.UNSAFE_componentWillReceiveProps) == "function" or type(l_stateNode_3.componentWillReceiveProps) == "function") and (l_memoizedProps_0 ~= v192 or l_context_0 ~= l_l_emptyContextObject_0_2) then
        callComponentWillReceiveProps(v190, l_stateNode_3, v192, l_l_emptyContextObject_0_2);
    end;
    l_resetHasForceUpdateBeforeProcessing_0();
    local l_memoizedState_2 = v190.memoizedState;
    l_stateNode_3.state = l_memoizedState_2;
    local l_l_memoizedState_2_0 = l_memoizedState_2;
    l_processUpdateQueue_0(v190, v192, l_stateNode_3, v193);
    l_l_memoizedState_2_0 = v190.memoizedState;
    if l_memoizedProps_0 == v192 and l_memoizedState_2 == l_l_memoizedState_2_0 and not l_hasContextChanged_0() and not l_checkHasForceUpdateAfterProcessing_0() then
        if type(l_stateNode_3.componentDidMount) == "function" then
            if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
                v190.flags = bit32.bor(v190.flags, l_MountLayoutDev_0, l_Update_0);
            else
                v190.flags = bit32.bor(v190.flags, l_Update_0);
            end;
        end;
        return false;
    else
        if l_getDerivedStateFromProps_0 ~= nil and type(l_getDerivedStateFromProps_0) == "function" then
            v91(v190, v191, l_getDerivedStateFromProps_0, v192);
            l_l_memoizedState_2_0 = v190.memoizedState;
        end;
        local v204 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v190, v191, l_memoizedProps_0, v192, l_memoizedState_2, l_l_memoizedState_2_0, l_l_emptyContextObject_0_2);
        if v204 then
            if not v201 and (type(l_stateNode_3.UNSAFE_componentWillMount) == "function" or type(l_stateNode_3.componentWillMount) == "function") then
                if type(l_stateNode_3.componentWillMount) == "function" then
                    l_stateNode_3:componentWillMount();
                end;
                if type(l_stateNode_3.UNSAFE_componentWillMount) == "function" then
                    l_stateNode_3:UNSAFE_componentWillMount();
                end;
            end;
            if type(l_stateNode_3.componentDidMount) == "function" then
                if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
                    v190.flags = bit32.bor(v190.flags, l_MountLayoutDev_0, l_Update_0);
                else
                    v190.flags = bit32.bor(v190.flags, l_Update_0);
                end;
            end;
        else
            if type(l_stateNode_3.componentDidMount) == "function" then
                if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
                    v190.flags = bit32.bor(v190.flags, l_MountLayoutDev_0, l_Update_0);
                else
                    v190.flags = bit32.bor(v190.flags, l_Update_0);
                end;
            end;
            v190.memoizedProps = v192;
            v190.memoizedState = l_l_memoizedState_2_0;
        end;
        l_stateNode_3.props = v192;
        l_stateNode_3.state = l_l_memoizedState_2_0;
        l_stateNode_3.context = l_l_emptyContextObject_0_2;
        return v204;
    end;
end;
return {
    adoptClassInstance = v143, 
    constructClassInstance = v168, 
    mountClassInstance = v189, 
    resumeMountClassInstance = resumeMountClassInstance, 
    updateClassInstance = function(v205, v206, v207, v208, v209) --[[ Line: 1207 ]] --[[ Name: updateClassInstance ]]
        -- upvalues: l_cloneUpdateQueue_0 (copy), l_resolveDefaultProps_0 (copy), l_emptyContextObject_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_resetHasForceUpdateBeforeProcessing_0 (copy), l_processUpdateQueue_0 (copy), l_hasContextChanged_0 (copy), l_checkHasForceUpdateAfterProcessing_0 (copy), l_Update_0 (copy), l_Snapshot_0 (copy), v91 (copy)
        local l_stateNode_4 = v206.stateNode;
        l_cloneUpdateQueue_0(v205, v206);
        local l_memoizedProps_1 = v206.memoizedProps;
        local v212 = if v206.type == v206.elementType then l_memoizedProps_1 else l_resolveDefaultProps_0(v206.type, l_memoizedProps_1);
        l_stateNode_4.props = v212;
        local l_pendingProps_0 = v206.pendingProps;
        local l_context_1 = l_stateNode_4.context;
        local v215 = nil;
        local v216 = nil;
        if type(v207) == "table" then
            v215 = v207.contextType;
            v216 = v207.getDerivedStateFromProps;
        end;
        local l_l_emptyContextObject_0_3 = l_emptyContextObject_0;
        if type(v215) == "table" then
            l_l_emptyContextObject_0_3 = l_readContext_0(v215);
        elseif not l_disableLegacyContext_0 then
            local v218 = l_getUnmaskedContext_0(v206, v207, true);
            l_l_emptyContextObject_0_3 = l_getMaskedContext_0(v206, v218);
        end;
        local v219 = v216 ~= nil and type(v216) == "function" or l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function";
        if not v219 and (l_stateNode_4.UNSAFE_componentWillReceiveProps ~= nil and type(l_stateNode_4.UNSAFE_componentWillReceiveProps) == "function" or l_stateNode_4.componentWillReceiveProps ~= nil and type(l_stateNode_4.componentWillReceiveProps) == "function") and (l_memoizedProps_1 ~= l_pendingProps_0 or l_context_1 ~= l_l_emptyContextObject_0_3) then
            callComponentWillReceiveProps(v206, l_stateNode_4, v208, l_l_emptyContextObject_0_3);
        end;
        l_resetHasForceUpdateBeforeProcessing_0();
        local l_memoizedState_3 = v206.memoizedState;
        l_stateNode_4.state = l_memoizedState_3;
        local l_state_3 = l_stateNode_4.state;
        l_processUpdateQueue_0(v206, v208, l_stateNode_4, v209);
        l_state_3 = v206.memoizedState;
        if l_memoizedProps_1 == l_pendingProps_0 and l_memoizedState_3 == l_state_3 and not l_hasContextChanged_0() and not l_checkHasForceUpdateAfterProcessing_0() then
            if l_stateNode_4.componentDidUpdate ~= nil and type(l_stateNode_4.componentDidUpdate) == "function" and (l_memoizedProps_1 ~= v205.memoizedProps or l_memoizedState_3 ~= v205.memoizedState) then
                v206.flags = bit32.bor(v206.flags, l_Update_0);
            end;
            if l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function" and (l_memoizedProps_1 ~= v205.memoizedProps or l_memoizedState_3 ~= v205.memoizedState) then
                v206.flags = bit32.bor(v206.flags, l_Snapshot_0);
            end;
            return false;
        else
            if v216 ~= nil and type(v216) == "function" then
                v91(v206, v207, v216, v208);
                l_state_3 = v206.memoizedState;
            end;
            local v222 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v206, v207, v212, v208, l_memoizedState_3, l_state_3, l_l_emptyContextObject_0_3);
            if v222 then
                if not v219 and (l_stateNode_4.UNSAFE_componentWillUpdate ~= nil and type(l_stateNode_4.UNSAFE_componentWillUpdate) == "function" or l_stateNode_4.componentWillUpdate ~= nil and type(l_stateNode_4.componentWillUpdate) == "function") then
                    if l_stateNode_4.componentWillUpdate ~= nil and type(l_stateNode_4.componentWillUpdate) == "function" then
                        l_stateNode_4:componentWillUpdate(v208, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                    if l_stateNode_4.UNSAFE_componentWillUpdate ~= nil and type(l_stateNode_4.UNSAFE_componentWillUpdate) == "function" then
                        l_stateNode_4:UNSAFE_componentWillUpdate(v208, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                end;
                if l_stateNode_4.componentDidUpdate ~= nil and type(l_stateNode_4.componentDidUpdate) == "function" then
                    v206.flags = bit32.bor(v206.flags, l_Update_0);
                end;
                if l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function" then
                    v206.flags = bit32.bor(v206.flags, l_Snapshot_0);
                end;
            else
                if l_stateNode_4.componentDidUpdate ~= nil and type(l_stateNode_4.componentDidUpdate) == "function" and (l_memoizedProps_1 ~= v205.memoizedProps or l_memoizedState_3 ~= v205.memoizedState) then
                    v206.flags = bit32.bor(v206.flags, l_Update_0);
                end;
                if l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function" and (l_memoizedProps_1 ~= v205.memoizedProps or l_memoizedState_3 ~= v205.memoizedState) then
                    v206.flags = bit32.bor(v206.flags, l_Snapshot_0);
                end;
                v206.memoizedProps = v208;
                v206.memoizedState = l_state_3;
            end;
            l_stateNode_4.props = v208;
            l_stateNode_4.state = l_state_3;
            l_stateNode_4.context = l_l_emptyContextObject_0_3;
            return v222;
        end;
    end, 
    applyDerivedStateFromProps = v91, 
    emptyRefsObject = l___refs_0
};