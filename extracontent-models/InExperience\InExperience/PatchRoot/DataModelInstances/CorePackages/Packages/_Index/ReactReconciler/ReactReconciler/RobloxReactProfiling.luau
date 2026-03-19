local l_Parent_0 = script.Parent.Parent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v2 = require(script.Parent.ReactWorkTags);
local _ = require(script.Parent.ReactInternalTypes);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
    return game:DefineFastInt("ReactMicroprofilerLevel5", 0);
end);
if not l_status_0 then
    l_result_0 = 0;
end;
noop = function(...) --[[ Line: 43 ]] --[[ Name: noop ]]

end;
local v6 = false;
local v7 = nil;
local v8 = 0;
if l_result_0 >= 5 then
    game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 52 ]]
        -- upvalues: v8 (ref)
        v8 = 0;
    end);
end;
local v9 = if l_result_0 >= 5 then {
    profilebegin = function(...) --[[ Line: 59 ]] --[[ Name: profilebegin ]]
        -- upvalues: v8 (ref)
        debug.profilebegin(...);
        v8 = v8 + 1;
    end, 
    profileend = function() --[[ Line: 63 ]] --[[ Name: profileend ]]
        -- upvalues: v8 (ref)
        if v8 > 0 then
            debug.profileend();
            v8 = v8 - 1;
        end;
    end
} else {
    profilebegin = noop, 
    profileend = noop
};
startTimerSampling = function(v10) --[[ Line: 75 ]] --[[ Name: startTimerSampling ]]
    -- upvalues: v6 (ref), v7 (ref)
    if v6 then
        warn("RobloxReactProfiling Timer Sampling already running.");
    end;
    v6 = true;
    v7 = v10;
end;
endTimerSampling = function() --[[ Line: 83 ]] --[[ Name: endTimerSampling ]]
    -- upvalues: v6 (ref), v7 (ref)
    v6 = false;
    v7 = nil;
end;
getFirstStringKey = function(v11) --[[ Line: 88 ]] --[[ Name: getFirstStringKey ]]
    for v12, _ in v11 do
        if type(v12) == "string" then
            return v12;
        end;
    end;
    return nil;
end;
startTimer = function(v14) --[[ Line: 97 ]] --[[ Name: startTimer ]]
    -- upvalues: v6 (ref)
    if v6 then
        v14.startTime = os.clock();
    end;
end;
endTimer = function(v15) --[[ Line: 102 ]] --[[ Name: endTimer ]]
    -- upvalues: v6 (ref), v7 (ref)
    if v6 then
        v15.endTime = os.clock();
        if v7 then
            v7(v15);
        end;
    end;
end;
profileRootBeforeUnitOfWork = function(v16) --[[ Line: 111 ]] --[[ Name: profileRootBeforeUnitOfWork ]]
    -- upvalues: v9 (copy)
    local l_current_0 = v16.current;
    local v18 = nil;
    if l_current_0 then
        if l_current_0.memoizedProps then
            v18 = getFirstStringKey(l_current_0.memoizedProps);
        end;
        if v18 == nil and l_current_0.stateNode and l_current_0.stateNode.containerInfo then
            v18 = l_current_0.stateNode.containerInfo.Name;
        end;
    end;
    if v18 == "Folder" and l_current_0.child then
        local l_child_0 = l_current_0.child;
        local v20 = nil;
        if l_child_0.memoizedProps then
            v20 = getFirstStringKey(l_child_0.memoizedProps);
        end;
        if v20 == nil and l_child_0.stateNode and l_child_0.stateNode.containerInfo then
            v20 = l_child_0.stateNode.containerInfo.Name;
        end;
        if v20 ~= nil then
            v18 = v20;
        end;
    end;
    if v18 ~= nil then
        local v21 = {
            id = v18, 
            startTime = 0, 
            endTime = 0
        };
        startTimer(v21);
        v9.profilebegin(v18);
        return v21;
    else
        return nil;
    end;
end;
profileRootAfterYielding = function(v22) --[[ Line: 165 ]] --[[ Name: profileRootAfterYielding ]]
    -- upvalues: v9 (copy)
    if v22 then
        endTimer(v22);
        v9.profileend();
    end;
end;
profileUnitOfWorkBefore = function(v23) --[[ Line: 172 ]] --[[ Name: profileUnitOfWorkBefore ]]
    -- upvalues: l_getComponentName_0 (copy), v2 (copy), v9 (copy)
    local v24 = l_getComponentName_0(v23.type);
    if v23.key then
        v24 = tostring(v23.key) .. "=" .. (v24 or "?");
    end;
    local v25 = nil;
    if v23.stateNode and (v23.tag == v2.HostComponent or v23.tag == v2.HostText) then
        local l_FirstAncestorWhichIsA_0 = v23.stateNode:FindFirstAncestorWhichIsA("LayerCollector");
        if l_FirstAncestorWhichIsA_0 then
            v25 = "[" .. l_FirstAncestorWhichIsA_0:GetFullName() .. "] ";
        end;
    end;
    if v25 then
        v24 = v25 .. " : " .. (v24 or "?");
    end;
    if v24 ~= nil then
        v9.profilebegin(v24);
        return true;
    else
        return false;
    end;
end;
profileUnitOfWorkAfter = function(v27) --[[ Line: 205 ]] --[[ Name: profileUnitOfWorkAfter ]]
    -- upvalues: v9 (copy)
    if v27 then
        v9.profileend();
    end;
end;
profileCommitBefore = function() --[[ Line: 211 ]] --[[ Name: profileCommitBefore ]]
    -- upvalues: v9 (copy)
    v9.profilebegin("Commit");
end;
profileCommitAfter = function() --[[ Line: 214 ]] --[[ Name: profileCommitAfter ]]
    -- upvalues: v9 (copy)
    v9.profileend();
end;
return {
    startTimerSampling = startTimerSampling, 
    endTimerSampling = endTimerSampling, 
    profileRootBeforeUnitOfWork = if l_result_0 >= 1 then profileRootBeforeUnitOfWork else noop, 
    profileRootAfterYielding = if l_result_0 >= 1 then profileRootAfterYielding else noop, 
    profileUnitOfWorkBefore = if l_result_0 >= 10 then profileUnitOfWorkBefore else noop, 
    profileUnitOfWorkAfter = if l_result_0 >= 10 then profileUnitOfWorkAfter else noop, 
    profileCommitBefore = if l_result_0 >= 5 then profileCommitBefore else noop, 
    profileCommitAfter = if l_result_0 >= 5 then profileCommitAfter else noop
};