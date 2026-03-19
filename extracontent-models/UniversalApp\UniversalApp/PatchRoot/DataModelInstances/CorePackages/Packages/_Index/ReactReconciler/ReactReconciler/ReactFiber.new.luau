local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_Array_0 = v2.Array;
local l_inspect_0 = v2.util.inspect;
local l___DEV___0 = v1.__DEV__;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v10 = require(script.Parent.ReactRootTags);
local v11 = require(script.Parent.ReactWorkTags);
local v12 = require(script.Parent.ReactTypeOfMode);
local v13 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableProfilerTimer_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableProfilerTimer;
local v18 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v18.NoFlags;
local l_Placement_0 = v18.Placement;
local l_StaticMask_0 = v18.StaticMask;
local l_ConcurrentRoot_0 = v10.ConcurrentRoot;
local l_BlockingRoot_0 = v10.BlockingRoot;
local l_IndeterminateComponent_0 = v11.IndeterminateComponent;
local l_ClassComponent_0 = v11.ClassComponent;
local l_HostRoot_0 = v11.HostRoot;
local l_HostComponent_0 = v11.HostComponent;
local l_HostText_0 = v11.HostText;
local l_HostPortal_0 = v11.HostPortal;
local l_ForwardRef_0 = v11.ForwardRef;
local l_Fragment_0 = v11.Fragment;
local l_Mode_0 = v11.Mode;
local l_ContextProvider_0 = v11.ContextProvider;
local l_ContextConsumer_0 = v11.ContextConsumer;
local l_Profiler_0 = v11.Profiler;
local l_SuspenseComponent_0 = v11.SuspenseComponent;
local l_SuspenseListComponent_0 = v11.SuspenseListComponent;
local l_DehydratedFragment_0 = v11.DehydratedFragment;
local l_FunctionComponent_0 = v11.FunctionComponent;
local l_MemoComponent_0 = v11.MemoComponent;
local l_SimpleMemoComponent_0 = v11.SimpleMemoComponent;
local l_LazyComponent_0 = v11.LazyComponent;
local l_FundamentalComponent_0 = v11.FundamentalComponent;
local l_ScopeComponent_0 = v11.ScopeComponent;
local l_OffscreenComponent_0 = v11.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v11.LegacyHiddenComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_isDevToolsPresent_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).isDevToolsPresent;
local v49 = require(script.Parent["ReactFiberHotReloading.new"]);
local l_resolveClassForHotReloading_0 = v49.resolveClassForHotReloading;
local l_resolveFunctionForHotReloading_0 = v49.resolveFunctionForHotReloading;
local l_resolveForwardRefForHotReloading_0 = v49.resolveForwardRefForHotReloading;
local l_NoLanes_0 = v13.NoLanes;
local l_NoMode_0 = v12.NoMode;
local l_ConcurrentMode_0 = v12.ConcurrentMode;
local l_DebugTracingMode_0 = v12.DebugTracingMode;
local l_ProfileMode_0 = v12.ProfileMode;
local l_StrictMode_0 = v12.StrictMode;
local l_BlockingMode_0 = v12.BlockingMode;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_DEBUG_TRACING_MODE_TYPE_0 = l_ReactSymbols_0.REACT_DEBUG_TRACING_MODE_TYPE;
local l_REACT_STRICT_MODE_TYPE_0 = l_ReactSymbols_0.REACT_STRICT_MODE_TYPE;
local l_REACT_PROFILER_TYPE_0 = l_ReactSymbols_0.REACT_PROFILER_TYPE;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
local l_REACT_SUSPENSE_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_LIST_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_OFFSCREEN_TYPE_0 = l_ReactSymbols_0.REACT_OFFSCREEN_TYPE;
local l_REACT_LEGACY_HIDDEN_TYPE_0 = l_ReactSymbols_0.REACT_LEGACY_HIDDEN_TYPE;
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = nil;
local v83 = 1;
local function v93(v84, v85, v86, v87, v88, v89, v90, v91) --[[ Line: 167 ]] --[[ Name: createFiber ]]
    -- upvalues: l_NoFlags_0 (copy), l_NoLanes_0 (copy), l_enableProfilerTimer_0 (copy), l___DEV___0 (copy), v83 (ref)
    local v92 = {
        tag = v84, 
        key = v86, 
        elementType = v88, 
        type = v89, 
        stateNode = v90, 
        index = 1, 
        pendingProps = v85, 
        mode = v87, 
        flags = l_NoFlags_0, 
        subtreeFlags = l_NoFlags_0, 
        lanes = v91 or l_NoLanes_0, 
        childLanes = l_NoLanes_0
    };
    if l_enableProfilerTimer_0 then
        v92.actualDuration = 0;
        v92.actualStartTime = -1;
        v92.selfBaseDuration = 0;
        v92.treeBaseDuration = 0;
    end;
    if l___DEV___0 then
        v92._debugID = v83;
        v83 = v83 + 1;
        v92._debugSource = nil;
        v92._debugOwner = nil;
        v92._debugNeedsRemount = false;
        v92._debugHookTypes = nil;
    end;
    return v92;
end;
_shouldConstruct = function(v94) --[[ Line: 267 ]] --[[ Name: _shouldConstruct ]]
    local v95 = false;
    if type(v94) ~= "function" then
        v95 = not not v94.isReactComponent;
    end;
    return v95;
end;
local function v97(v96) --[[ Line: 274 ]] --[[ Name: isSimpleFunctionComponent ]]
    return type(v96) == "function";
end;
local function v101(v98) --[[ Line: 282 ]] --[[ Name: resolveLazyComponentTag ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ClassComponent_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_ForwardRef_0 (copy), l_REACT_MEMO_TYPE_0 (copy), l_MemoComponent_0 (copy), l_IndeterminateComponent_0 (copy)
    local v99 = typeof(v98);
    if v99 == "function" then
        return l_FunctionComponent_0;
    else
        if v99 == "table" then
            if v98.isReactComponent then
                return l_ClassComponent_0;
            else
                local v100 = v98["$$typeof"];
                if v100 == l_REACT_FORWARD_REF_TYPE_0 then
                    return l_ForwardRef_0;
                elseif v100 == l_REACT_MEMO_TYPE_0 then
                    return l_MemoComponent_0;
                end;
            end;
        end;
        return l_IndeterminateComponent_0;
    end;
end;
local function v106(v102, v103) --[[ Line: 305 ]] --[[ Name: createWorkInProgress ]]
    -- upvalues: v93 (copy), l___DEV___0 (copy), l_NoFlags_0 (copy), l_enableProfilerTimer_0 (copy), l_StaticMask_0 (copy), l_IndeterminateComponent_0 (copy), l_FunctionComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_resolveFunctionForHotReloading_0 (copy), l_ClassComponent_0 (copy), l_resolveClassForHotReloading_0 (copy), l_ForwardRef_0 (copy), l_resolveForwardRefForHotReloading_0 (copy)
    local l_alternate_0 = v102.alternate;
    if l_alternate_0 == nil then
        l_alternate_0 = v93(v102.tag, v103, v102.key, v102.mode, v102.elementType, v102.type, v102.stateNode);
        if l___DEV___0 then
            l_alternate_0._debugID = v102._debugID;
            l_alternate_0._debugSource = v102._debugSource;
            l_alternate_0._debugOwner = v102._debugOwner;
            l_alternate_0._debugHookTypes = v102._debugHookTypes;
        end;
        l_alternate_0.alternate = v102;
        v102.alternate = l_alternate_0;
    else
        l_alternate_0.pendingProps = v103;
        l_alternate_0.type = v102.type;
        l_alternate_0.flags = l_NoFlags_0;
        l_alternate_0.subtreeFlags = l_NoFlags_0;
        l_alternate_0.deletions = nil;
        if l_enableProfilerTimer_0 then
            l_alternate_0.actualDuration = 0;
            l_alternate_0.actualStartTime = -1;
        end;
    end;
    l_alternate_0.flags = bit32.band(v102.flags, l_StaticMask_0);
    l_alternate_0.childLanes = v102.childLanes;
    l_alternate_0.lanes = v102.lanes;
    l_alternate_0.child = v102.child;
    l_alternate_0.memoizedProps = v102.memoizedProps;
    l_alternate_0.memoizedState = v102.memoizedState;
    l_alternate_0.updateQueue = v102.updateQueue;
    local l_dependencies_0 = v102.dependencies;
    if l_dependencies_0 == nil then
        l_alternate_0.dependencies = nil;
    else
        l_alternate_0.dependencies = {
            lanes = l_dependencies_0.lanes, 
            firstContext = l_dependencies_0.firstContext
        };
    end;
    l_alternate_0.sibling = v102.sibling;
    l_alternate_0.index = v102.index;
    l_alternate_0.ref = v102.ref;
    if l_enableProfilerTimer_0 then
        l_alternate_0.selfBaseDuration = v102.selfBaseDuration;
        l_alternate_0.treeBaseDuration = v102.treeBaseDuration;
    end;
    if l___DEV___0 then
        l_alternate_0._debugNeedsRemount = v102._debugNeedsRemount;
        if l_alternate_0.tag == l_IndeterminateComponent_0 or l_alternate_0.tag == l_FunctionComponent_0 or l_alternate_0.tag == l_SimpleMemoComponent_0 then
            l_alternate_0.type = l_resolveFunctionForHotReloading_0(v102.type);
            return l_alternate_0;
        elseif l_alternate_0.tag == l_ClassComponent_0 then
            l_alternate_0.type = l_resolveClassForHotReloading_0(v102.type);
            return l_alternate_0;
        elseif l_alternate_0.tag == l_ForwardRef_0 then
            l_alternate_0.type = l_resolveForwardRefForHotReloading_0(v102.type);
        end;
    end;
    return l_alternate_0;
end;
local function v111(v107, v108) --[[ Line: 409 ]] --[[ Name: resetWorkInProgress ]]
    -- upvalues: l_StaticMask_0 (copy), l_Placement_0 (copy), l_NoLanes_0 (copy), l_NoFlags_0 (copy), l_enableProfilerTimer_0 (copy)
    v107.flags = bit32.band(v107.flags, (bit32.bor(l_StaticMask_0, l_Placement_0)));
    local l_alternate_1 = v107.alternate;
    if l_alternate_1 == nil then
        v107.childLanes = l_NoLanes_0;
        v107.lanes = v108;
        v107.child = nil;
        v107.subtreeFlags = l_NoFlags_0;
        v107.memoizedProps = nil;
        v107.memoizedState = nil;
        v107.updateQueue = nil;
        v107.dependencies = nil;
        v107.stateNode = nil;
        if l_enableProfilerTimer_0 then
            v107.selfBaseDuration = 0;
            v107.treeBaseDuration = 0;
            return v107;
        end;
    else
        v107.childLanes = l_alternate_1.childLanes;
        v107.lanes = l_alternate_1.lanes;
        v107.child = l_alternate_1.child;
        v107.subtreeFlags = l_alternate_1.subtreeFlags;
        v107.deletions = nil;
        v107.memoizedProps = l_alternate_1.memoizedProps;
        v107.memoizedState = l_alternate_1.memoizedState;
        v107.updateQueue = l_alternate_1.updateQueue;
        v107.type = l_alternate_1.type;
        local l_dependencies_1 = l_alternate_1.dependencies;
        if l_dependencies_1 == nil then
            v107.dependencies = nil;
        else
            v107.dependencies = {
                lanes = l_dependencies_1.lanes, 
                firstContext = l_dependencies_1.firstContext
            };
        end;
        if l_enableProfilerTimer_0 then
            v107.selfBaseDuration = l_alternate_1.selfBaseDuration;
            v107.treeBaseDuration = l_alternate_1.treeBaseDuration;
        end;
    end;
    return v107;
end;
local function v114(v112) --[[ Line: 484 ]] --[[ Name: createHostRootFiber ]]
    -- upvalues: l_ConcurrentRoot_0 (copy), l_ConcurrentMode_0 (copy), l_BlockingMode_0 (copy), l_StrictMode_0 (copy), l_BlockingRoot_0 (copy), l_NoMode_0 (copy), l_enableProfilerTimer_0 (copy), l_isDevToolsPresent_0 (copy), l_ProfileMode_0 (copy), v93 (copy), l_HostRoot_0 (copy)
    local v113 = nil;
    v113 = if v112 == l_ConcurrentRoot_0 then bit32.bor(l_ConcurrentMode_0, l_BlockingMode_0, l_StrictMode_0) else if v112 == l_BlockingRoot_0 then bit32.bor(l_BlockingMode_0, l_StrictMode_0) else l_NoMode_0;
    if l_enableProfilerTimer_0 and l_isDevToolsPresent_0() then
        v113 = bit32.bor(v113, l_ProfileMode_0);
    end;
    return (v93(l_HostRoot_0, nil, nil, v113));
end;
local function v130(v115, v116, v117, v118, v119, v120) --[[ Line: 505 ]] --[[ Name: createFiberFromTypeAndProps ]]
    -- upvalues: l_IndeterminateComponent_0 (copy), l___DEV___0 (copy), l_resolveFunctionForHotReloading_0 (copy), l_ClassComponent_0 (copy), l_resolveClassForHotReloading_0 (copy), l_HostComponent_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v77 (ref), l_REACT_DEBUG_TRACING_MODE_TYPE_0 (copy), l_Mode_0 (copy), l_DebugTracingMode_0 (copy), l_REACT_STRICT_MODE_TYPE_0 (copy), l_StrictMode_0 (copy), l_REACT_PROFILER_TYPE_0 (copy), v76 (ref), l_REACT_SUSPENSE_TYPE_0 (copy), v79 (ref), l_REACT_OFFSCREEN_TYPE_0 (copy), v80 (ref), l_REACT_LEGACY_HIDDEN_TYPE_0 (copy), v81 (ref), l_REACT_PROVIDER_TYPE_0 (copy), l_ContextProvider_0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), l_ContextConsumer_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_ForwardRef_0 (copy), l_resolveForwardRefForHotReloading_0 (copy), l_REACT_MEMO_TYPE_0 (copy), l_MemoComponent_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_LazyComponent_0 (copy), l_Object_0 (copy), l_inspect_0 (copy), l_getComponentName_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_invariant_0 (copy), v93 (copy)
    local l_l_IndeterminateComponent_0_0 = l_IndeterminateComponent_0;
    local l_v115_0 = v115;
    local v123 = type(v115);
    if v123 == "function" then
        if l___DEV___0 then
            l_v115_0 = l_resolveFunctionForHotReloading_0(l_v115_0);
        end;
    elseif v123 == "table" and v115.isReactComponent then
        l_l_IndeterminateComponent_0_0 = l_ClassComponent_0;
        if l___DEV___0 then
            l_v115_0 = l_resolveClassForHotReloading_0(l_v115_0);
        end;
    elseif v123 == "string" then
        l_l_IndeterminateComponent_0_0 = l_HostComponent_0;
    elseif v115 == l_REACT_FRAGMENT_TYPE_0 then
        return v77(v117.children, v119, v120, v116);
    elseif v115 == l_REACT_DEBUG_TRACING_MODE_TYPE_0 then
        l_l_IndeterminateComponent_0_0 = l_Mode_0;
        v119 = bit32.bor(v119, l_DebugTracingMode_0);
    elseif v115 == l_REACT_STRICT_MODE_TYPE_0 then
        l_l_IndeterminateComponent_0_0 = l_Mode_0;
        v119 = bit32.bor(v119, l_StrictMode_0);
    elseif v115 == l_REACT_PROFILER_TYPE_0 then
        return v76(v117, v119, v120, v116);
    elseif v115 == l_REACT_SUSPENSE_TYPE_0 then
        return v79(v117, v119, v120, v116);
    elseif v115 == l_REACT_OFFSCREEN_TYPE_0 then
        return v80(v117, v119, v120, v116);
    elseif v115 == l_REACT_LEGACY_HIDDEN_TYPE_0 then
        return v81(v117, v119, v120, v116);
    else
        local v124 = false;
        local v125 = nil;
        if v123 == "table" then
            v125 = v115["$$typeof"];
            if v125 == l_REACT_PROVIDER_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_ContextProvider_0;
                v124 = true;
            elseif v125 == l_REACT_CONTEXT_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_ContextConsumer_0;
                v124 = true;
            elseif v125 == l_REACT_FORWARD_REF_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_ForwardRef_0;
                if l___DEV___0 then
                    l_v115_0 = l_resolveForwardRefForHotReloading_0(l_v115_0);
                end;
                v124 = true;
            elseif v125 == l_REACT_MEMO_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_MemoComponent_0;
                v124 = true;
            elseif v125 == l_REACT_LAZY_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_LazyComponent_0;
                l_v115_0 = nil;
                v124 = true;
            end;
        end;
        if not v124 then
            local v126 = "";
            if l___DEV___0 then
                if v115 == nil or v123 == "table" and #l_Object_0.keys(v115) == 0 then
                    v126 = v126 .. " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and " .. "named imports.";
                elseif v115 ~= nil and v123 == "table" then
                    v126 = v126 .. "\n" .. l_inspect_0(v115);
                end;
                local v127 = nil;
                if v118 then
                    v127 = l_getComponentName_0(v118.type);
                end;
                if v127 ~= nil and v127 ~= "" then
                    v126 = v126 .. "\n\nCheck the render method of `" .. v127 .. "`.";
                elseif v118 then
                    v126 = v126 .. "\n" .. l_inspect_0(v118);
                end;
            end;
            local v128 = nil;
            if v115 == nil then
                v128 = "nil";
            elseif l_Array_0.isArray(v115) then
                v128 = "array";
            elseif v123 == "table" and v125 == l_REACT_ELEMENT_TYPE_0 then
                v128 = string.format("<%s />", l_getComponentName_0(v115.type) or "Unknown");
                v126 = " Did you accidentally export a JSX literal or Element instead of a component?";
            else
                v128 = v123;
            end;
            l_invariant_0(false, "Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v128, v126);
        end;
    end;
    local v129 = v93(l_l_IndeterminateComponent_0_0, v117, v116, v119, v115, l_v115_0, nil, v120);
    if l___DEV___0 then
        v129._debugOwner = v118;
    end;
    return v129;
end;
local function v139(v131, v132, v133) --[[ Line: 659 ]] --[[ Name: createFiberFromElement ]]
    -- upvalues: l___DEV___0 (copy), v130 (copy)
    local v134 = nil;
    if l___DEV___0 then
        v134 = v131._owner;
    end;
    local l_type_0 = v131.type;
    local l_key_0 = v131.key;
    local l_props_0 = v131.props;
    local v138 = v130(l_type_0, l_key_0, l_props_0, v134, v132, v133);
    if l___DEV___0 then
        v138._debugSource = v131._source;
        v138._debugOwner = v131._owner;
    end;
    return v138;
end;
v77 = function(v140, v141, v142, v143) --[[ Line: 687 ]] --[[ Name: createFiberFromFragment ]]
    -- upvalues: v93 (copy), l_Fragment_0 (copy)
    return (v93(l_Fragment_0, v140, v143, v141, nil, nil, nil, v142));
end;
v78 = function(v144, v145, v146, v147, v148) --[[ Line: 700 ]] --[[ Name: createFiberFromFundamental ]]
    -- upvalues: v93 (copy), l_FundamentalComponent_0 (copy)
    return (v93(l_FundamentalComponent_0, v145, v148, v146, v144, v144, nil, v147));
end;
v75 = function(v149, v150, v151, v152, v153) --[[ Line: 725 ]] --[[ Name: createFiberFromScope ]]
    -- upvalues: v93 (copy), l_ScopeComponent_0 (copy)
    return (v93(l_ScopeComponent_0, v150, v153, v151, v149, v149, nil, v152));
end;
v76 = function(v154, v155, v156, v157) --[[ Line: 742 ]] --[[ Name: createFiberFromProfiler ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), v93 (copy), l_Profiler_0 (copy), l_ProfileMode_0 (copy), l_REACT_PROFILER_TYPE_0 (copy), l_enableProfilerTimer_0 (copy)
    if l___DEV___0 and typeof(v154.id) ~= "string" then
        l_console_0.error("Profiler must specify an \"id\" as a prop");
    end;
    return (v93(l_Profiler_0, v154, v157, bit32.bor(v155, l_ProfileMode_0), l_REACT_PROFILER_TYPE_0, l_REACT_PROFILER_TYPE_0, if l_enableProfilerTimer_0 then {
        effectDuration = 0, 
        passiveEffectDuration = 0
    } else nil, v156));
end;
v79 = function(v158, v159, v160, v161) --[[ Line: 786 ]] --[[ Name: createFiberFromSuspense ]]
    -- upvalues: v93 (copy), l_SuspenseComponent_0 (copy), l_REACT_SUSPENSE_TYPE_0 (copy)
    return (v93(l_SuspenseComponent_0, v158, v161, v159, l_REACT_SUSPENSE_TYPE_0, l_REACT_SUSPENSE_TYPE_0, nil, v160));
end;
v82 = function(v162, v163, v164, v165) --[[ Line: 815 ]] --[[ Name: createFiberFromSuspenseList ]]
    -- upvalues: v93 (copy), l_SuspenseListComponent_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), l___DEV___0 (copy)
    return (v93(l_SuspenseListComponent_0, v162, v165, v163, l_REACT_SUSPENSE_LIST_TYPE_0, if l___DEV___0 then l_REACT_SUSPENSE_LIST_TYPE_0 else nil, nil, v164));
end;
v80 = function(v166, v167, v168, v169) --[[ Line: 844 ]] --[[ Name: createFiberFromOffscreen ]]
    -- upvalues: v93 (copy), l_OffscreenComponent_0 (copy), l_REACT_OFFSCREEN_TYPE_0 (copy), l___DEV___0 (copy)
    return (v93(l_OffscreenComponent_0, v166, v169, v167, l_REACT_OFFSCREEN_TYPE_0, if l___DEV___0 then l_REACT_OFFSCREEN_TYPE_0 else nil, nil, v168));
end;
v81 = function(v170, v171, v172, v173) --[[ Line: 873 ]] --[[ Name: createFiberFromLegacyHidden ]]
    -- upvalues: v93 (copy), l_LegacyHiddenComponent_0 (copy), l_REACT_LEGACY_HIDDEN_TYPE_0 (copy), l___DEV___0 (copy)
    return (v93(l_LegacyHiddenComponent_0, v170, v173, v171, l_REACT_LEGACY_HIDDEN_TYPE_0, if l___DEV___0 then l_REACT_LEGACY_HIDDEN_TYPE_0 else nil, nil, v172));
end;
return {
    isSimpleFunctionComponent = v97, 
    resolveLazyComponentTag = v101, 
    createWorkInProgress = v106, 
    resetWorkInProgress = v111, 
    createHostRootFiber = v114, 
    createFiberFromTypeAndProps = v130, 
    createFiberFromElement = v139, 
    createFiberFromFragment = v77, 
    createFiberFromFundamental = v78, 
    createFiberFromSuspense = v79, 
    createFiberFromSuspenseList = v82, 
    createFiberFromOffscreen = v80, 
    createFiberFromLegacyHidden = v81, 
    createFiberFromText = function(v174, v175, v176) --[[ Line: 902 ]] --[[ Name: createFiberFromText ]]
        -- upvalues: v93 (copy), l_HostText_0 (copy)
        return (v93(l_HostText_0, v174, nil, v175, nil, nil, nil, v176));
    end, 
    createFiberFromHostInstanceForDeletion = function() --[[ Line: 910 ]] --[[ Name: createFiberFromHostInstanceForDeletion ]]
        -- upvalues: v93 (copy), l_HostComponent_0 (copy), l_NoMode_0 (copy)
        return (v93(l_HostComponent_0, nil, nil, l_NoMode_0, "DELETED", "DELETED"));
    end, 
    createFiberFromDehydratedFragment = function(v177) --[[ Line: 920 ]] --[[ Name: createFiberFromDehydratedFragment ]]
        -- upvalues: v93 (copy), l_DehydratedFragment_0 (copy), l_NoMode_0 (copy)
        return (v93(l_DehydratedFragment_0, nil, nil, l_NoMode_0, nil, nil, v177));
    end, 
    createFiberFromPortal = function(v178, v179, v180) --[[ Line: 929 ]] --[[ Name: createFiberFromPortal ]]
        -- upvalues: v93 (copy), l_HostPortal_0 (copy)
        local v181 = if v178.children ~= nil then v178.children else {};
        return (v93(l_HostPortal_0, v181, v178.key, v179, nil, nil, {
            containerInfo = v178.containerInfo, 
            pendingChildren = nil, 
            implementation = v178.implementation
        }, v180));
    end, 
    assignFiberPropertiesInDEV = function(v182, v183) --[[ Line: 953 ]] --[[ Name: assignFiberPropertiesInDEV ]]
        -- upvalues: v93 (copy), l_IndeterminateComponent_0 (copy), l_NoMode_0 (copy), l_enableProfilerTimer_0 (copy)
        if v182 == nil then
            v182 = v93(l_IndeterminateComponent_0, nil, nil, l_NoMode_0);
        end;
        v182.tag = v183.tag;
        v182.key = v183.key;
        v182.elementType = v183.elementType;
        v182.type = v183.type;
        v182.stateNode = v183.stateNode;
        v182.return_ = v183.return_;
        v182.child = v183.child;
        v182.sibling = v183.sibling;
        v182.index = v183.index;
        v182.ref = v183.ref;
        v182.pendingProps = v183.pendingProps;
        v182.memoizedProps = v183.memoizedProps;
        v182.updateQueue = v183.updateQueue;
        v182.memoizedState = v183.memoizedState;
        v182.dependencies = v183.dependencies;
        v182.mode = v183.mode;
        v182.flags = v183.flags;
        v182.subtreeFlags = v183.subtreeFlags;
        v182.deletions = v183.deletions;
        v182.lanes = v183.lanes;
        v182.childLanes = v183.childLanes;
        v182.alternate = v183.alternate;
        if l_enableProfilerTimer_0 then
            v182.actualDuration = v183.actualDuration;
            v182.actualStartTime = v183.actualStartTime;
            v182.selfBaseDuration = v183.selfBaseDuration;
            v182.treeBaseDuration = v183.treeBaseDuration;
        end;
        v182._debugID = v183._debugID;
        v182._debugSource = v183._debugSource;
        v182._debugOwner = v183._debugOwner;
        v182._debugNeedsRemount = v183._debugNeedsRemount;
        v182._debugHookTypes = v183._debugHookTypes;
        return v182;
    end
};