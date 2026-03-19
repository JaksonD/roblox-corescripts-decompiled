local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local function _(v3) --[[ Line: 18 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. v3);
    error("FIXME (roblox): " .. v3 .. " is unimplemented", 2);
end;
local _ = require(script.Parent.ReactInternalTypes);
local v6 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v8 = require(script.Parent.ReactWorkTags);
local l_HostComponent_0 = v8.HostComponent;
local l_HostText_0 = v8.HostText;
local l_HostRoot_0 = v8.HostRoot;
local l_SuspenseComponent_0 = v8.SuspenseComponent;
local v13 = require(script.Parent.ReactFiberFlags);
local l_Placement_0 = v13.Placement;
local l_Hydrating_0 = v13.Hydrating;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_createFiberFromDehydratedFragment_0 = require(script.Parent["ReactFiber.new"]).createFiberFromDehydratedFragment;
local l_supportsHydration_0 = v6.supportsHydration;
local l_getNextHydratableSibling_0 = v6.getNextHydratableSibling;
local l_getFirstHydratableChild_0 = v6.getFirstHydratableChild;
local l_canHydrateInstance_0 = v6.canHydrateInstance;
local l_canHydrateTextInstance_0 = v6.canHydrateTextInstance;
local l_canHydrateSuspenseInstance_0 = v6.canHydrateSuspenseInstance;
local l_hydrateInstance_0 = v6.hydrateInstance;
local l_hydrateTextInstance_0 = v6.hydrateTextInstance;
local l_hydrateSuspenseInstance_0 = v6.hydrateSuspenseInstance;
local l_getNextHydratableInstanceAfterSuspenseInstance_0 = v6.getNextHydratableInstanceAfterSuspenseInstance;
local l_didNotMatchHydratedContainerTextInstance_0 = v6.didNotMatchHydratedContainerTextInstance;
local l_didNotMatchHydratedTextInstance_0 = v6.didNotMatchHydratedTextInstance;
local l_shouldSetTextContent_0 = v6.shouldSetTextContent;
local l_enableSuspenseServerRenderer_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSuspenseServerRenderer;
local l_OffscreenLane_0 = require(script.Parent.ReactFiberLane).OffscreenLane;
local v33 = nil;
local v34 = nil;
local v35 = false;
warnIfHydrating = function() --[[ Line: 92 ]] --[[ Name: warnIfHydrating ]]
    -- upvalues: v1 (copy), v35 (ref), l_console_0 (copy)
    if v1.__DEV__ and v35 then
        l_console_0.error("We should not be hydrating here. This is a bug in React. Please file a bug.");
    end;
end;
enterHydrationState = function(v36) --[[ Line: 102 ]] --[[ Name: enterHydrationState ]]
    -- upvalues: l_supportsHydration_0 (copy), v34 (ref), l_getFirstHydratableChild_0 (copy), v33 (ref), v35 (ref)
    if not l_supportsHydration_0 then
        return false;
    else
        local l_containerInfo_0 = v36.stateNode.containerInfo;
        v34 = l_getFirstHydratableChild_0(l_containerInfo_0);
        v33 = v36;
        v35 = true;
        return true;
    end;
end;
reenterHydrationStateFromDehydratedSuspenseInstance = function(v38, v39) --[[ Line: 114 ]] --[[ Name: reenterHydrationStateFromDehydratedSuspenseInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), v34 (ref), l_getNextHydratableSibling_0 (copy), v35 (ref)
    if not l_supportsHydration_0 then
        return false;
    else
        v34 = l_getNextHydratableSibling_0(v39);
        popToNextHostParent(v38);
        v35 = true;
        return true;
    end;
end;
deleteHydratableInstance = function(_, _) --[[ Line: 128 ]] --[[ Name: deleteHydratableInstance ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: deleteHydratableInstance");
    error("FIXME (roblox): deleteHydratableInstance is unimplemented", 2);
end;
insertNonHydratedInstance = function(_, v43) --[[ Line: 163 ]] --[[ Name: insertNonHydratedInstance ]]
    -- upvalues: l_Hydrating_0 (copy), l_Placement_0 (copy), v1 (copy)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: insertNonHydratedInstance");
    error("FIXME (roblox): insertNonHydratedInstance is unimplemented", 2);
    v43.flags = bit32.bor(bit32.band(v43.flags, (bit32.bnot(l_Hydrating_0))), l_Placement_0);
    if v1.__DEV__ then

    end;
end;
tryHydrate = function(v44, v45) --[[ Line: 227 ]] --[[ Name: tryHydrate ]]
    -- upvalues: l_HostComponent_0 (copy), l_canHydrateInstance_0 (copy), l_HostText_0 (copy), l_canHydrateTextInstance_0 (copy), l_SuspenseComponent_0 (copy), l_enableSuspenseServerRenderer_0 (copy), l_canHydrateSuspenseInstance_0 (copy), l_OffscreenLane_0 (copy), l_createFiberFromDehydratedFragment_0 (copy)
    if v44.tag == l_HostComponent_0 then
        local l_type_0 = v44.type;
        local l_pendingProps_0 = v44.pendingProps;
        local v48 = l_canHydrateInstance_0(v45, l_type_0, l_pendingProps_0);
        if v48 ~= nil then
            v44.stateNode = v48;
            return true;
        else
            return false;
        end;
    elseif v44.tag == l_HostText_0 then
        local l_pendingProps_1 = v44.pendingProps;
        local v50 = l_canHydrateTextInstance_0(v45, l_pendingProps_1);
        if v50 ~= nil then
            v44.stateNode = v50;
            return true;
        else
            return false;
        end;
    elseif v44.tag == l_SuspenseComponent_0 then
        if l_enableSuspenseServerRenderer_0 then
            local v51 = l_canHydrateSuspenseInstance_0(v45);
            if v51 ~= nil then
                v44.memoizedState = {
                    dehydrated = v51, 
                    retryLane = l_OffscreenLane_0
                };
                local v52 = l_createFiberFromDehydratedFragment_0(v51);
                v52.return_ = v44;
                v44.child = v52;
                return true;
            end;
        end;
        return false;
    else
        return false;
    end;
end;
tryToClaimNextHydratableInstance = function(v53) --[[ Line: 272 ]] --[[ Name: tryToClaimNextHydratableInstance ]]
    -- upvalues: v35 (ref), v34 (ref), v33 (ref), l_getNextHydratableSibling_0 (copy), l_getFirstHydratableChild_0 (copy)
    if not v35 then
        return;
    else
        local l_v34_0 = v34;
        if not l_v34_0 then
            insertNonHydratedInstance(v33, v53);
            v35 = false;
            v33 = v53;
            return;
        else
            local l_l_v34_0_0 = l_v34_0;
            if not tryHydrate(v53, l_v34_0) then
                l_v34_0 = l_getNextHydratableSibling_0(l_l_v34_0_0);
                if not l_v34_0 or not tryHydrate(v53, l_v34_0) then
                    insertNonHydratedInstance(v33, v53);
                    v35 = false;
                    v33 = v53;
                    return;
                else
                    deleteHydratableInstance(v33, l_l_v34_0_0);
                end;
            end;
            v33 = v53;
            v34 = l_getFirstHydratableChild_0(l_v34_0);
            return;
        end;
    end;
end;
prepareToHydrateHostInstance = function(v56, v57, v58) --[[ Line: 308 ]] --[[ Name: prepareToHydrateHostInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), l_invariant_0 (copy), l_hydrateInstance_0 (copy)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected prepareToHydrateHostInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_stateNode_0 = v56.stateNode;
    local v60 = l_hydrateInstance_0(l_stateNode_0, v56.type, v56.memoizedProps, v57, v58, v56);
    v56.updateQueue = v60;
    if v60 ~= nil then
        return true;
    else
        return false;
    end;
end;
prepareToHydrateHostTextInstance = function(v61) --[[ Line: 340 ]] --[[ Name: prepareToHydrateHostTextInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), l_invariant_0 (copy), l_hydrateTextInstance_0 (copy), v1 (copy), v33 (ref), l_HostRoot_0 (copy), l_didNotMatchHydratedContainerTextInstance_0 (copy), l_HostComponent_0 (copy), l_didNotMatchHydratedTextInstance_0 (copy)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected prepareToHydrateHostTextInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_stateNode_1 = v61.stateNode;
    local l_memoizedProps_0 = v61.memoizedProps;
    local v64 = l_hydrateTextInstance_0(l_stateNode_1, l_memoizedProps_0, v61);
    if v1.__DEV__ and v64 then
        local l_v33_0 = v33;
        if l_v33_0 ~= nil then
            if l_v33_0.tag == l_HostRoot_0 then
                local l_containerInfo_1 = l_v33_0.stateNode.containerInfo;
                l_didNotMatchHydratedContainerTextInstance_0(l_containerInfo_1, l_stateNode_1, l_memoizedProps_0);
                return v64;
            elseif l_v33_0.tag == l_HostComponent_0 then
                local l_type_1 = l_v33_0.type;
                local l_memoizedProps_1 = l_v33_0.memoizedProps;
                local l_stateNode_2 = l_v33_0.stateNode;
                l_didNotMatchHydratedTextInstance_0(l_type_1, l_memoizedProps_1, l_stateNode_2, l_stateNode_1, l_memoizedProps_0);
            end;
        end;
    end;
    return v64;
end;
prepareToHydrateHostSuspenseInstance = function(v70) --[[ Line: 383 ]] --[[ Name: prepareToHydrateHostSuspenseInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), l_invariant_0 (copy), l_hydrateSuspenseInstance_0 (copy)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected prepareToHydrateHostSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_memoizedState_0 = v70.memoizedState;
    local v72 = nil;
    v72 = if l_memoizedState_0 ~= nil then l_memoizedState_0.dehydrated else nil;
    l_invariant_0(v72, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.");
    l_hydrateSuspenseInstance_0(v72, v70);
end;
skipPastDehydratedSuspenseInstance = function(v73) --[[ Line: 408 ]] --[[ Name: skipPastDehydratedSuspenseInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), l_invariant_0 (copy), l_getNextHydratableInstanceAfterSuspenseInstance_0 (copy)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected skipPastDehydratedSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_memoizedState_1 = v73.memoizedState;
    local v75 = nil;
    v75 = if l_memoizedState_1 ~= nil then l_memoizedState_1.dehydrated else nil;
    l_invariant_0(v75, "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue.");
    return l_getNextHydratableInstanceAfterSuspenseInstance_0(v75);
end;
popToNextHostParent = function(v76) --[[ Line: 431 ]] --[[ Name: popToNextHostParent ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_SuspenseComponent_0 (copy), v33 (ref)
    local l_return__0 = v76.return_;
    while l_return__0 ~= nil and l_return__0.tag ~= l_HostComponent_0 and l_return__0.tag ~= l_HostRoot_0 and l_return__0.tag ~= l_SuspenseComponent_0 do
        l_return__0 = l_return__0.return_;
    end;
    v33 = l_return__0;
end;
popHydrationState = function(v78) --[[ Line: 444 ]] --[[ Name: popHydrationState ]]
    -- upvalues: l_supportsHydration_0 (copy), v33 (ref), v35 (ref), l_HostComponent_0 (copy), l_shouldSetTextContent_0 (copy), v34 (ref), l_getNextHydratableSibling_0 (copy), l_SuspenseComponent_0 (copy)
    if not l_supportsHydration_0 then
        return false;
    elseif v78 ~= v33 then
        return false;
    elseif not v35 then
        popToNextHostParent(v78);
        v35 = true;
        return false;
    else
        local l_type_2 = v78.type;
        if v78.tag ~= l_HostComponent_0 or l_type_2 ~= "head" and l_type_2 ~= "body" and not l_shouldSetTextContent_0(l_type_2, v78.memoizedProps) then
            local l_v34_1 = v34;
            while l_v34_1 do
                deleteHydratableInstance(v78, l_v34_1);
                l_v34_1 = l_getNextHydratableSibling_0(l_v34_1);
            end;
        end;
        popToNextHostParent(v78);
        if v78.tag == l_SuspenseComponent_0 then
            v34 = skipPastDehydratedSuspenseInstance(v78);
        elseif v33 then
            v34 = l_getNextHydratableSibling_0(v78.stateNode);
        else
            v34 = nil;
        end;
        return true;
    end;
end;
resetHydrationState = function() --[[ Line: 497 ]] --[[ Name: resetHydrationState ]]
    -- upvalues: l_supportsHydration_0 (copy), v33 (ref), v34 (ref), v35 (ref)
    if not l_supportsHydration_0 then
        return;
    else
        v33 = nil;
        v34 = nil;
        v35 = false;
        return;
    end;
end;
getIsHydrating = function() --[[ Line: 507 ]] --[[ Name: getIsHydrating ]]
    -- upvalues: v35 (ref)
    return v35;
end;
return {
    warnIfHydrating = warnIfHydrating, 
    enterHydrationState = enterHydrationState, 
    getIsHydrating = getIsHydrating, 
    reenterHydrationStateFromDehydratedSuspenseInstance = reenterHydrationStateFromDehydratedSuspenseInstance, 
    resetHydrationState = resetHydrationState, 
    tryToClaimNextHydratableInstance = tryToClaimNextHydratableInstance, 
    prepareToHydrateHostInstance = prepareToHydrateHostInstance, 
    prepareToHydrateHostTextInstance = prepareToHydrateHostTextInstance, 
    prepareToHydrateHostSuspenseInstance = prepareToHydrateHostSuspenseInstance, 
    popHydrationState = popHydrationState
};