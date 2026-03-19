local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_get_0 = require(l_Parent_0.Shared).ReactInstanceMap.get;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v10 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v10.ClassComponent;
local l_HostComponent_0 = v10.HostComponent;
local l_HostRoot_0 = v10.HostRoot;
local l_HostPortal_0 = v10.HostPortal;
local l_HostText_0 = v10.HostText;
local l_FundamentalComponent_0 = v10.FundamentalComponent;
local l_SuspenseComponent_0 = v10.SuspenseComponent;
local v18 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v18.NoFlags;
local l_Placement_0 = v18.Placement;
local l_Hydrating_0 = v18.Hydrating;
local l_enableFundamentalAPI_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableFundamentalAPI;
local l_ReactCurrentOwner_0 = l_ReactSharedInternals_0.ReactCurrentOwner;
local v24 = {};
local function v29(v25) --[[ Line: 50 ]] --[[ Name: getNearestMountedFiber ]]
    -- upvalues: l_Placement_0 (copy), l_Hydrating_0 (copy), l_NoFlags_0 (copy), l_HostRoot_0 (copy)
    local l_v25_0 = v25;
    local l_v25_1 = v25;
    if not v25.alternate then
        local l_l_v25_0_0 = l_v25_0;
        repeat
            l_v25_0 = l_l_v25_0_0;
            if bit32.band(l_v25_0.flags, (bit32.bor(l_Placement_0, l_Hydrating_0))) ~= l_NoFlags_0 then
                l_v25_1 = l_v25_0.return_;
            end;
            l_l_v25_0_0 = l_v25_0.return_;
        until not l_l_v25_0_0;
    else
        while l_v25_0.return_ do
            l_v25_0 = l_v25_0.return_;
        end;
    end;
    if l_v25_0.tag == l_HostRoot_0 then
        return l_v25_1;
    else
        return nil;
    end;
end;
v24.getNearestMountedFiber = v29;
v24.getSuspenseInstanceFromFiber = function(v30) --[[ Line: 84 ]]
    -- upvalues: l_SuspenseComponent_0 (copy)
    if v30.tag == l_SuspenseComponent_0 then
        local l_memoizedState_0 = v30.memoizedState;
        if l_memoizedState_0 == nil then
            local l_alternate_0 = v30.alternate;
            if l_alternate_0 ~= nil then
                l_memoizedState_0 = l_alternate_0.memoizedState;
            end;
        end;
        if l_memoizedState_0 then
            return l_memoizedState_0.dehydrated;
        end;
    end;
    return nil;
end;
v24.getContainerFromFiber = function(v33) --[[ Line: 100 ]]
    -- upvalues: l_HostRoot_0 (copy)
    if v33.tag == l_HostRoot_0 then
        return v33.stateNode.containerInfo;
    else
        return nil;
    end;
end;
v24.isFiberMounted = function(v34) --[[ Line: 104 ]]
    -- upvalues: v29 (copy)
    return v29(v34) == v34;
end;
v24.isMounted = function(v35) --[[ Line: 110 ]]
    -- upvalues: v1 (copy), l_ReactCurrentOwner_0 (copy), l_ClassComponent_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_get_0 (copy), v29 (copy)
    if v1.__DEV__ then
        local l_current_0 = l_ReactCurrentOwner_0.current;
        if l_current_0 ~= nil and l_current_0.tag == l_ClassComponent_0 then
            local l_stateNode_0 = l_current_0.stateNode;
            if not l_stateNode_0._warnedAboutRefsInRender then
                l_console_0.error("%s is accessing isMounted inside its render() function. render() should be a pure function of props and state. It should never access something that requires stale data from the previous render, such as refs. Move this logic to componentDidMount and componentDidUpdate instead.", l_getComponentName_0(l_current_0.type) or "A component");
            end;
            l_stateNode_0._warnedAboutRefsInRender = true;
        end;
    end;
    local v38 = l_get_0(v35);
    if not v38 then
        return false;
    else
        return v29(v38) == v38;
    end;
end;
local function _(v39) --[[ Line: 140 ]] --[[ Name: assertIsMounted ]]
    -- upvalues: l_invariant_0 (copy), v29 (copy)
    l_invariant_0(v29(v39) == v39, "Unable to find node on an unmounted component.");
end;
local function v52(v41) --[[ Line: 147 ]] --[[ Name: findCurrentFiberUsingSlowPath ]]
    -- upvalues: v29 (copy), l_invariant_0 (copy), l_HostRoot_0 (copy)
    local l_alternate_1 = v41.alternate;
    if not l_alternate_1 then
        local v43 = v29(v41);
        l_invariant_0(v43 ~= nil, "Unable to find node on an unmounted component.");
        if v43 ~= v41 then
            return nil;
        else
            return v41;
        end;
    else
        local l_v41_0 = v41;
        local l_l_alternate_1_0 = l_alternate_1;
        while true do
            local l_return__0 = l_v41_0.return_;
            if l_return__0 ~= nil then
                local l_alternate_2 = l_return__0.alternate;
                if l_alternate_2 == nil then
                    local l_return__1 = l_return__0.return_;
                    if l_return__1 ~= nil then
                        l_v41_0 = l_return__1;
                        l_l_alternate_1_0 = l_return__1;
                    else
                        break;
                    end;
                else
                    if l_return__0.child == l_alternate_2.child then
                        local l_child_0 = l_return__0.child;
                        while true do
                            if l_child_0 then
                                if l_child_0 == l_v41_0 then
                                    l_invariant_0(v29(l_return__0) == l_return__0, "Unable to find node on an unmounted component.");
                                    return v41;
                                elseif l_child_0 == l_l_alternate_1_0 then
                                    l_invariant_0(v29(l_return__0) == l_return__0, "Unable to find node on an unmounted component.");
                                    return l_alternate_1;
                                else
                                    l_child_0 = l_child_0.sibling;
                                end;
                            else
                                l_invariant_0(false, "Unable to find node on an unmounted component.");
                                break;
                            end;
                        end;
                    end;
                    if l_v41_0.return_ ~= l_l_alternate_1_0.return_ then
                        l_v41_0 = l_return__0;
                        l_l_alternate_1_0 = l_alternate_2;
                    else
                        local v50 = false;
                        local l_child_1 = l_return__0.child;
                        while l_child_1 do
                            if l_child_1 == l_v41_0 then
                                v50 = true;
                                l_v41_0 = l_return__0;
                                l_l_alternate_1_0 = l_alternate_2;
                                break;
                            elseif l_child_1 == l_l_alternate_1_0 then
                                v50 = true;
                                l_l_alternate_1_0 = l_return__0;
                                l_v41_0 = l_alternate_2;
                                break;
                            else
                                l_child_1 = l_child_1.sibling;
                            end;
                        end;
                        if not v50 then
                            l_child_1 = l_alternate_2.child;
                            while l_child_1 do
                                if l_child_1 == l_v41_0 then
                                    v50 = true;
                                    l_v41_0 = l_alternate_2;
                                    l_l_alternate_1_0 = l_return__0;
                                    break;
                                elseif l_child_1 == l_l_alternate_1_0 then
                                    v50 = true;
                                    l_l_alternate_1_0 = l_alternate_2;
                                    l_v41_0 = l_return__0;
                                    break;
                                else
                                    l_child_1 = l_child_1.sibling;
                                end;
                            end;
                            l_invariant_0(v50, "Child was not found in either parent set. This indicates a bug in React related to the return pointer. Please file an issue.");
                        end;
                    end;
                    l_invariant_0(l_v41_0.alternate == l_l_alternate_1_0, "Return fibers should always be each others' alternates. This error is likely caused by a bug in React. Please file an issue.");
                end;
            else
                break;
            end;
        end;
        l_invariant_0(l_v41_0.tag == l_HostRoot_0, "Unable to find node on an unmounted component.");
        if l_v41_0.stateNode.current == l_v41_0 then
            return v41;
        else
            return l_alternate_1;
        end;
    end;
end;
v24.findCurrentFiberUsingSlowPath = v52;
v24.findCurrentHostFiber = function(v53) --[[ Line: 282 ]]
    -- upvalues: v52 (copy), l_HostComponent_0 (copy), l_HostText_0 (copy)
    local v54 = v52(v53);
    if not v54 then
        return nil;
    else
        local l_v54_0 = v54;
        while true do
            local l_child_2 = l_v54_0.child;
            if l_v54_0.tag == l_HostComponent_0 or l_v54_0.tag == l_HostText_0 then
                return l_v54_0;
            elseif l_child_2 then
                l_child_2.return_ = l_v54_0;
                l_v54_0 = l_child_2;
            elseif l_v54_0 == v54 then
                return nil;
            else
                local l_return__2 = l_v54_0.return_;
                local l_sibling_0 = l_v54_0.sibling;
                while true do
                    if not l_sibling_0 then
                        if not l_return__2 or l_return__2 == v54 then
                            return nil;
                        else
                            l_v54_0 = l_return__2;
                        end;
                    else
                        l_sibling_0.return_ = l_return__2;
                        l_v54_0 = l_sibling_0;
                        break;
                    end;
                end;
            end;
        end;
    end;
end;
v24.findCurrentHostFiberWithNoPortals = function(v59) --[[ Line: 321 ]]
    -- upvalues: v52 (copy), l_HostComponent_0 (copy), l_HostText_0 (copy), l_enableFundamentalAPI_0 (copy), l_FundamentalComponent_0 (copy), l_HostPortal_0 (copy)
    local v60 = v52(v59);
    if not v60 then
        return nil;
    else
        local l_v60_0 = v60;
        while true do
            local l_child_3 = l_v60_0.child;
            if l_v60_0.tag == l_HostComponent_0 or l_v60_0.tag == l_HostText_0 or l_enableFundamentalAPI_0 and l_v60_0.tag == l_FundamentalComponent_0 then
                return l_v60_0;
            elseif l_child_3 and l_v60_0.tag ~= l_HostPortal_0 then
                l_child_3.return_ = l_v60_0;
                l_v60_0 = l_child_3;
            elseif l_v60_0 == v60 then
                return nil;
            else
                local l_return__3 = l_v60_0.return_;
                local l_sibling_1 = l_v60_0.sibling;
                while true do
                    if not l_sibling_1 then
                        if not l_return__3 or l_return__3 == v60 then
                            return nil;
                        else
                            l_v60_0 = l_return__3;
                        end;
                    else
                        l_sibling_1.return_ = l_return__3;
                        l_v60_0 = l_sibling_1;
                        break;
                    end;
                end;
            end;
        end;
    end;
end;
v24.isFiberSuspenseAndTimedOut = function(v65) --[[ Line: 363 ]]
    -- upvalues: l_SuspenseComponent_0 (copy)
    local l_memoizedState_1 = v65.memoizedState;
    local v67 = false;
    if v65.tag == l_SuspenseComponent_0 then
        v67 = false;
        if l_memoizedState_1 ~= nil then
            v67 = l_memoizedState_1.dehydrated == nil;
        end;
    end;
    return v67;
end;
v24.doesFiberContain = function(v68, v69) --[[ Line: 370 ]]
    local l_v69_0 = v69;
    local l_alternate_3 = v68.alternate;
    while true do
        if l_v69_0 ~= nil then
            if l_v69_0 == v68 or l_v69_0 == l_alternate_3 then
                return true;
            else
                l_v69_0 = l_v69_0.return_;
            end;
        else
            return false;
        end;
    end;
end;
return v24;