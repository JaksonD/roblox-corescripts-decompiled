local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v3 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactFiberLane);
local v5 = require(script.Parent.ReactWorkTags);
local l_SuspenseComponent_0 = v5.SuspenseComponent;
local l_SuspenseListComponent_0 = v5.SuspenseListComponent;
local v8 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v8.NoFlags;
local l_DidCapture_0 = v8.DidCapture;
local l_isSuspenseInstancePending_0 = v3.isSuspenseInstancePending;
local l_isSuspenseInstanceFallback_0 = v3.isSuspenseInstanceFallback;
return {
    shouldCaptureSuspense = function(v13, v14) --[[ Line: 84 ]]
        local l_memoizedState_0 = v13.memoizedState;
        if l_memoizedState_0 then
            if l_memoizedState_0.dehydrated ~= nil then
                return true;
            else
                return false;
            end;
        else
            local l_memoizedProps_0 = v13.memoizedProps;
            if l_memoizedProps_0.fallback == nil then
                return false;
            elseif l_memoizedProps_0.unstable_avoidThisFallback ~= true then
                return true;
            elseif v14 then
                return false;
            else
                return true;
            end;
        end;
    end, 
    findFirstSuspended = function(v17) --[[ Line: 116 ]]
        -- upvalues: l_SuspenseComponent_0 (copy), l_isSuspenseInstancePending_0 (copy), l_isSuspenseInstanceFallback_0 (copy), l_SuspenseListComponent_0 (copy), l_DidCapture_0 (copy), l_NoFlags_0 (copy)
        local l_v17_0 = v17;
        while true do
            if l_v17_0 ~= nil then
                if l_v17_0.tag == l_SuspenseComponent_0 then
                    local l_memoizedState_1 = l_v17_0.memoizedState;
                    if l_memoizedState_1 then
                        local l_dehydrated_0 = l_memoizedState_1.dehydrated;
                        if l_dehydrated_0 == nil or l_isSuspenseInstancePending_0(l_dehydrated_0) or l_isSuspenseInstanceFallback_0(l_dehydrated_0) then
                            return l_v17_0;
                        end;
                    end;
                elseif l_v17_0.tag == l_SuspenseListComponent_0 and l_v17_0.memoizedProps.revealOrder ~= nil then
                    if bit32.band(l_v17_0.flags, l_DidCapture_0) ~= l_NoFlags_0 then
                        return l_v17_0;
                    end;
                elseif l_v17_0.child ~= nil then
                    l_v17_0.child.return_ = l_v17_0;
                    l_v17_0 = l_v17_0.child;
                    continue;
                end;
                if l_v17_0 == v17 then
                    return nil;
                else
                    while true do
                        if l_v17_0.sibling == nil then
                            if l_v17_0.return_ == nil or l_v17_0.return_ == v17 then
                                return nil;
                            else
                                l_v17_0 = l_v17_0.return_;
                            end;
                        else
                            l_v17_0.sibling.return_ = l_v17_0.return_;
                            l_v17_0 = l_v17_0.sibling;
                            break;
                        end;
                    end;
                end;
            else
                return nil;
            end;
        end;
    end
};