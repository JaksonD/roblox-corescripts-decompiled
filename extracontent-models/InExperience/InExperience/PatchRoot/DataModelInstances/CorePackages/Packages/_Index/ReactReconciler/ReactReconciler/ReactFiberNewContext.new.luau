local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Number_0 = v2.Number;
local l_Error_0 = v2.Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v8 = require(script.Parent["ReactFiberStack.new"]);
local v9 = require(script.Parent.ReactFiberLane);
local v10 = require(script.Parent["ReactUpdateQueue.new"]);
local l_isPrimaryRenderer_0 = require(script.Parent.ReactFiberHostConfig).isPrimaryRenderer;
local l_createCursor_0 = v8.createCursor;
local l_push_0 = v8.push;
local l_pop_0 = v8.pop;
local l_MAX_SIGNED_31_BIT_INT_0 = require(script.Parent.MaxInts).MAX_SIGNED_31_BIT_INT;
local v16 = require(script.Parent.ReactWorkTags);
local l_ContextProvider_0 = v16.ContextProvider;
local l_ClassComponent_0 = v16.ClassComponent;
local l_NoLanes_0 = v9.NoLanes;
local l_NoTimestamp_0 = v9.NoTimestamp;
local l_isSubsetOfLanes_0 = v9.isSubsetOfLanes;
local l_includesSomeLane_0 = v9.includesSomeLane;
local l_mergeLanes_0 = v9.mergeLanes;
local l_pickArbitraryLane_0 = v9.pickArbitraryLane;
local l_objectIs_0 = require(l_Parent_0.Shared).objectIs;
local l_createUpdate_0 = v10.createUpdate;
local l_ForceUpdate_0 = v10.ForceUpdate;
local v28 = {};
local v29 = l_createCursor_0(nil);
local v30 = nil;
if v1.__DEV__ then
    v30 = {};
end;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = false;
v28.resetContextDependencies = function() --[[ Line: 74 ]]
    -- upvalues: v31 (ref), v32 (ref), v33 (ref), v1 (copy), v34 (ref)
    v31 = nil;
    v32 = nil;
    v33 = nil;
    if v1.__DEV__ then
        v34 = false;
    end;
end;
v28.enterDisallowedContextReadInDEV = function() --[[ Line: 85 ]]
    -- upvalues: v1 (copy), v34 (ref)
    if v1.__DEV__ then
        v34 = true;
    end;
end;
v28.exitDisallowedContextReadInDEV = function() --[[ Line: 91 ]]
    -- upvalues: v1 (copy), v34 (ref)
    if v1.__DEV__ then
        v34 = false;
    end;
end;
v28.pushProvider = function(v35, v36) --[[ Line: 97 ]]
    -- upvalues: l_isPrimaryRenderer_0 (copy), l_push_0 (copy), v29 (copy), v1 (copy), v30 (ref), l_console_0 (copy)
    local l__context_0 = v35.type._context;
    if l_isPrimaryRenderer_0 then
        l_push_0(v29, l__context_0._currentValue, v35);
        l__context_0._currentValue = v36;
        if v1.__DEV__ then
            if l__context_0._currentRenderer ~= nil and l__context_0._currentRenderer ~= v30 then
                l_console_0.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.");
            end;
            l__context_0._currentRenderer = v30;
            return;
        end;
    else
        l_push_0(v29, l__context_0._currentValue2, v35);
        l__context_0._currentValue2 = v36;
        if v1.__DEV__ then
            if l__context_0._currentRenderer2 ~= nil and l__context_0._currentRenderer2 ~= v30 then
                l_console_0.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.");
            end;
            l__context_0._currentRenderer2 = v30;
        end;
    end;
end;
v28.popProvider = function(v38) --[[ Line: 135 ]]
    -- upvalues: v29 (copy), l_pop_0 (copy), l_isPrimaryRenderer_0 (copy)
    local l_current_0 = v29.current;
    l_pop_0(v29, v38);
    local l__context_1 = v38.type._context;
    if l_isPrimaryRenderer_0 then
        l__context_1._currentValue = l_current_0;
        return;
    else
        l__context_1._currentValue2 = l_current_0;
        return;
    end;
end;
v28.calculateChangedBits = function(v41, v42, v43) --[[ Line: 148 ]]
    -- upvalues: l_objectIs_0 (copy), l_MAX_SIGNED_31_BIT_INT_0 (copy)
    if l_objectIs_0(v43, v42) then
        return 0;
    else
        local l_l_MAX_SIGNED_31_BIT_INT_0_0 = l_MAX_SIGNED_31_BIT_INT_0;
        if typeof(v41._calculateChangedBits) == "function" then
            l_l_MAX_SIGNED_31_BIT_INT_0_0 = v41._calculateChangedBits(v43, v42);
        end;
        return (math.floor(l_l_MAX_SIGNED_31_BIT_INT_0_0));
    end;
end;
v28.scheduleWorkOnParentPath = function(v45, v46) --[[ Line: 179 ]]
    -- upvalues: l_isSubsetOfLanes_0 (copy), l_mergeLanes_0 (copy)
    local l_v45_0 = v45;
    while l_v45_0 ~= nil do
        local l_alternate_0 = l_v45_0.alternate;
        if not l_isSubsetOfLanes_0(l_v45_0.childLanes, v46) then
            l_v45_0.childLanes = l_mergeLanes_0(l_v45_0.childLanes, v46);
            if l_alternate_0 ~= nil then
                l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v46);
            end;
        elseif l_alternate_0 ~= nil and not l_isSubsetOfLanes_0(l_alternate_0.childLanes, v46) then
            l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v46);
        else
            break;
        end;
        l_v45_0 = l_v45_0.return_;
    end;
end;
v28.propagateContextChange = function(v49, v50, v51, v52) --[[ Line: 202 ]]
    -- upvalues: l_ClassComponent_0 (copy), l_createUpdate_0 (copy), l_NoTimestamp_0 (copy), l_pickArbitraryLane_0 (copy), l_ForceUpdate_0 (copy), v28 (copy), l_ContextProvider_0 (copy)
    local l_child_0 = v49.child;
    if l_child_0 ~= nil then
        l_child_0.return_ = v49;
    end;
    while l_child_0 ~= nil do
        local v54 = nil;
        local l_dependencies_0 = l_child_0.dependencies;
        if l_dependencies_0 ~= nil then
            v54 = l_child_0.child;
            local l_firstContext_0 = l_dependencies_0.firstContext;
            while l_firstContext_0 ~= nil do
                if l_firstContext_0.context == v50 and bit32.band(l_firstContext_0.observedBits, v51) ~= 0 then
                    if l_child_0.tag == l_ClassComponent_0 then
                        local v57 = l_createUpdate_0(l_NoTimestamp_0, l_pickArbitraryLane_0(v52));
                        v57.tag = l_ForceUpdate_0;
                        local l_updateQueue_0 = l_child_0.updateQueue;
                        if l_updateQueue_0 ~= nil then
                            local l_shared_0 = l_updateQueue_0.shared;
                            local l_pending_0 = l_shared_0.pending;
                            if l_pending_0 == nil then
                                v57.next = v57;
                            else
                                v57.next = l_pending_0.next;
                                l_pending_0.next = v57;
                            end;
                            l_shared_0.pending = v57;
                        end;
                    end;
                    l_child_0.lanes = bit32.bor(l_child_0.lanes, v52);
                    local l_alternate_1 = l_child_0.alternate;
                    if l_alternate_1 ~= nil then
                        l_alternate_1.lanes = bit32.bor(l_alternate_1.lanes, v52);
                    end;
                    v28.scheduleWorkOnParentPath(l_child_0.return_, v52);
                    l_dependencies_0.lanes = bit32.bor(l_dependencies_0.lanes, v52);
                    break;
                else
                    l_firstContext_0 = l_firstContext_0.next;
                end;
            end;
        else
            v54 = if l_child_0.tag == l_ContextProvider_0 then if l_child_0.type == v49.type then nil else l_child_0.child else l_child_0.child;
        end;
        if v54 ~= nil then
            v54.return_ = l_child_0;
        else
            v54 = l_child_0;
            while v54 ~= nil do
                if v54 == v49 then
                    v54 = nil;
                    break;
                else
                    local l_sibling_0 = v54.sibling;
                    if l_sibling_0 ~= nil then
                        l_sibling_0.return_ = v54.return_;
                        v54 = l_sibling_0;
                        break;
                    else
                        v54 = v54.return_;
                    end;
                end;
            end;
        end;
        l_child_0 = v54;
    end;
end;
v28.prepareToReadContext = function(v63, v64, v65) --[[ Line: 341 ]]
    -- upvalues: v31 (ref), v32 (ref), v33 (ref), l_includesSomeLane_0 (copy)
    v31 = v63;
    v32 = nil;
    v33 = nil;
    local l_dependencies_1 = v63.dependencies;
    if l_dependencies_1 ~= nil and l_dependencies_1.firstContext ~= nil then
        if l_includesSomeLane_0(l_dependencies_1.lanes, v64) then
            v65();
        end;
        l_dependencies_1.firstContext = nil;
    end;
end;
v28.readContext = function(v67, v68) --[[ Line: 364 ]]
    -- upvalues: v1 (copy), v34 (ref), l_console_0 (copy), v33 (ref), l_Number_0 (copy), v32 (ref), v31 (ref), l_Error_0 (copy), l_NoLanes_0 (copy), l_isPrimaryRenderer_0 (copy)
    if v1.__DEV__ and v34 then
        l_console_0.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().");
    end;
    if v33 ~= v67 and v68 ~= false and v68 ~= 0 then
        local v69 = nil;
        if typeof(v68) ~= "number" or v68 == l_Number_0.MAX_SAFE_INTEGER then
            v33 = v67;
            v69 = l_Number_0.MAX_SAFE_INTEGER;
        else
            v69 = v68;
        end;
        local v70 = {
            context = v67, 
            observedBits = v69, 
            next = nil
        };
        if v32 == nil then
            if v31 == nil then
                error(l_Error_0.new("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo()."));
            end;
            v32 = v70;
            v31.dependencies = {
                lanes = l_NoLanes_0, 
                firstContext = v70, 
                responders = nil
            };
        else
            v32.next = v70;
            v32 = v70;
        end;
    end;
    if l_isPrimaryRenderer_0 then
        return v67._currentValue;
    else
        return v67._currentValue2;
    end;
end;
return v28;