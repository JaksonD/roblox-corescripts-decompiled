local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local l_resetWorkInProgressVersions_0 = require(script.Parent["ReactMutableSource.new"]).resetWorkInProgressVersions;
local v5 = require(script.Parent.ReactWorkTags);
local v6 = require(script.Parent.ReactFiberFlags);
local v7 = require(script.Parent.ReactTypeOfMode);
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSuspenseServerRenderer_0 = l_ReactFeatureFlags_0.enableSuspenseServerRenderer;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local v11 = require(script.Parent["ReactFiberHostContext.new"]);
local l_popHostContainer_0 = v11.popHostContainer;
local l_popHostContext_0 = v11.popHostContext;
local l_popSuspenseContext_0 = require(script.Parent["ReactFiberSuspenseContext.new"]).popSuspenseContext;
local l_resetHydrationState_0 = require(script.Parent["ReactFiberHydrationContext.new"]).resetHydrationState;
local v16 = require(script.Parent["ReactFiberContext.new"]);
local l_isContextProvider_0 = v16.isContextProvider;
local l_popContext_0 = v16.popContext;
local l_popTopLevelContextObject_0 = v16.popTopLevelContextObject;
local l_popProvider_0 = require(script.Parent["ReactFiberNewContext.new"]).popProvider;
local v21 = nil;
local function v22(...) --[[ Line: 47 ]]
    -- upvalues: v21 (ref)
    if not v21 then
        v21 = require(script.Parent["ReactFiberWorkLoop.new"]).popRenderLanes;
    end;
    return v21(...);
end;
local l_transferActualDuration_0 = require(script.Parent["ReactProfilerTimer.new"]).transferActualDuration;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local function v32(v25, _) --[[ Line: 59 ]] --[[ Name: unwindWork ]]
    -- upvalues: v5 (copy), l_isContextProvider_0 (copy), l_popContext_0 (copy), v6 (copy), l_enableProfilerTimer_0 (copy), v7 (copy), l_transferActualDuration_0 (copy), l_popHostContainer_0 (copy), l_popTopLevelContextObject_0 (copy), l_resetWorkInProgressVersions_0 (copy), l_invariant_0 (copy), l_popHostContext_0 (copy), l_popSuspenseContext_0 (copy), l_enableSuspenseServerRenderer_0 (copy), l_resetHydrationState_0 (copy), l_popProvider_0 (copy), v22 (copy)
    if v25.tag == v5.ClassComponent then
        local l_type_0 = v25.type;
        if l_isContextProvider_0(l_type_0) then
            l_popContext_0(v25);
        end;
        local l_flags_0 = v25.flags;
        if bit32.band(l_flags_0, v6.ShouldCapture) ~= 0 then
            v25.flags = bit32.bor(bit32.band(l_flags_0, (bit32.bnot(v6.ShouldCapture))), v6.DidCapture);
            if l_enableProfilerTimer_0 and bit32.band(v25.mode, v7.ProfileMode) ~= v7.NoMode then
                l_transferActualDuration_0(v25);
            end;
            return v25;
        else
            return nil;
        end;
    elseif v25.tag == v5.HostRoot then
        l_popHostContainer_0(v25);
        l_popTopLevelContextObject_0(v25);
        l_resetWorkInProgressVersions_0();
        local l_flags_1 = v25.flags;
        l_invariant_0(bit32.band(l_flags_1, v6.DidCapture) == v6.NoFlags, "The root failed to unmount after an error. This is likely a bug in React. Please file an issue.");
        v25.flags = bit32.bor(bit32.band(l_flags_1, (bit32.bnot(v6.ShouldCapture))), v6.DidCapture);
        return v25;
    elseif v25.tag == v5.HostComponent then
        l_popHostContext_0(v25);
        return nil;
    elseif v25.tag == v5.SuspenseComponent then
        l_popSuspenseContext_0(v25);
        if l_enableSuspenseServerRenderer_0 then
            local l_memoizedState_0 = v25.memoizedState;
            if l_memoizedState_0 ~= nil and l_memoizedState_0.dehydrated ~= nil then
                l_invariant_0(v25.alternate ~= nil, "Threw in newly mounted dehydrated component. This is likely a bug in React. Please file an issue.");
                l_resetHydrationState_0();
            end;
        end;
        local l_flags_2 = v25.flags;
        if bit32.band(l_flags_2, v6.ShouldCapture) ~= 0 then
            v25.flags = bit32.bor(bit32.band(l_flags_2, (bit32.bnot(v6.ShouldCapture))), v6.DidCapture);
            if l_enableProfilerTimer_0 and bit32.band(v25.mode, v7.ProfileMode) ~= v7.NoMode then
                l_transferActualDuration_0(v25);
            end;
            return v25;
        else
            return nil;
        end;
    elseif v25.tag == v5.SuspenseListComponent then
        l_popSuspenseContext_0(v25);
        return nil;
    elseif v25.tag == v5.HostPortal then
        l_popHostContainer_0(v25);
        return nil;
    elseif v25.tag == v5.ContextProvider then
        l_popProvider_0(v25);
        return nil;
    elseif v25.tag == v5.OffscreenComponent or v25.tag == v5.LegacyHiddenComponent then
        v22(v25);
        return nil;
    else
        return nil;
    end;
end;
unwindInterruptedWork = function(v33) --[[ Line: 154 ]] --[[ Name: unwindInterruptedWork ]]
    -- upvalues: v5 (copy), l_popContext_0 (copy), l_popHostContainer_0 (copy), l_popTopLevelContextObject_0 (copy), l_resetWorkInProgressVersions_0 (copy), l_popHostContext_0 (copy), l_popSuspenseContext_0 (copy), l_popProvider_0 (copy), v22 (copy)
    if v33.tag == v5.ClassComponent then
        local v34 = nil;
        if typeof(v33.type) == "table" then
            v34 = v33.type.childContextTypes;
        end;
        if v34 ~= nil then
            l_popContext_0(v33);
            return;
        else
            return;
        end;
    elseif v33.tag == v5.HostRoot then
        l_popHostContainer_0(v33);
        l_popTopLevelContextObject_0(v33);
        l_resetWorkInProgressVersions_0();
        return;
    elseif v33.tag == v5.HostComponent then
        l_popHostContext_0(v33);
        return;
    elseif v33.tag == v5.HostPortal then
        l_popHostContainer_0(v33);
        return;
    elseif v33.tag == v5.SuspenseComponent then
        l_popSuspenseContext_0(v33);
        return;
    elseif v33.tag == v5.SuspenseListComponent then
        l_popSuspenseContext_0(v33);
        return;
    elseif v33.tag == v5.ContextProvider then
        l_popProvider_0(v33);
        return;
    elseif v33.tag == v5.OffscreenComponent or v33.tag == v5.LegacyHiddenComponent then
        v22(v33);
        return;
    else
        return;
    end;
end;
return {
    unwindWork = v32, 
    unwindInterruptedWork = unwindInterruptedWork
};