local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local _ = require(script.Parent.ReactInternalTypes);
local l_console_0 = require(l_Parent_0.Shared).console;
local v4 = require(script.Parent["ReactFiberSchedulerPriorities.roblox"]);
local v5 = require(l_Parent_0.SafeFlags).createGetFFlag("ReactInlineMergeLanes")();
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ImmediatePriority_0 = v4.ImmediatePriority;
local l_UserBlockingPriority_0 = v4.UserBlockingPriority;
local l_NormalPriority_0 = v4.NormalPriority;
local l_LowPriority_0 = v4.LowPriority;
local l_IdlePriority_0 = v4.IdlePriority;
local l_NoPriority_0 = v4.NoPriority;
local v13 = {
    SyncLanePriority = 15, 
    SyncBatchedLanePriority = 14, 
    InputDiscreteLanePriority = 12, 
    InputContinuousLanePriority = 10, 
    DefaultLanePriority = 8, 
    TransitionPriority = 6, 
    NoLanePriority = 0, 
    NoLanes = 0, 
    NoLane = 0, 
    SyncLane = 1, 
    SyncBatchedLane = 2, 
    InputDiscreteHydrationLane = 4, 
    DefaultHydrationLane = 256, 
    DefaultLanes = 3584, 
    RetryLanes = 62914560, 
    SomeRetryLane = 33554432, 
    SelectiveHydrationLane = 67108864, 
    IdleHydrationLane = 134217728, 
    OffscreenLane = 1073741824, 
    NoTimestamp = -1
};
local l_NoLanePriority_0 = v13.NoLanePriority;
v13.getCurrentUpdateLanePriority = function() --[[ Line: 147 ]]
    -- upvalues: l_NoLanePriority_0 (ref)
    return l_NoLanePriority_0;
end;
v13.setCurrentUpdateLanePriority = function(v15) --[[ Line: 151 ]]
    -- upvalues: l_NoLanePriority_0 (ref)
    l_NoLanePriority_0 = v15;
end;
local l_DefaultLanePriority_0 = v13.DefaultLanePriority;
local function v24(v17) --[[ Line: 159 ]] --[[ Name: getHighestPriorityLanes ]]
    -- upvalues: l_DefaultLanePriority_0 (ref), v1 (copy), l_console_0 (copy)
    if bit32.band(1, v17) ~= 0 then
        l_DefaultLanePriority_0 = 15;
        return 1;
    elseif bit32.band(2, v17) ~= 0 then
        l_DefaultLanePriority_0 = 14;
        return 2;
    elseif bit32.band(4, v17) ~= 0 then
        l_DefaultLanePriority_0 = 13;
        return 4;
    else
        local v18 = bit32.band(24, v17);
        if v18 ~= 0 then
            l_DefaultLanePriority_0 = 12;
            return v18;
        elseif bit32.band(v17, 32) ~= 0 then
            l_DefaultLanePriority_0 = 11;
            return 32;
        else
            local v19 = bit32.band(192, v17);
            if v19 ~= 0 then
                l_DefaultLanePriority_0 = 10;
                return v19;
            elseif bit32.band(v17, 256) ~= 0 then
                l_DefaultLanePriority_0 = 9;
                return 256;
            else
                local v20 = bit32.band(3584, v17);
                if v20 ~= 0 then
                    l_DefaultLanePriority_0 = 8;
                    return v20;
                elseif bit32.band(v17, 4096) ~= 0 then
                    l_DefaultLanePriority_0 = 7;
                    return 4096;
                else
                    local v21 = bit32.band(4186112, v17);
                    if v21 ~= 0 then
                        l_DefaultLanePriority_0 = 6;
                        return v21;
                    else
                        local v22 = bit32.band(62914560, v17);
                        if v22 ~= 0 then
                            l_DefaultLanePriority_0 = 5;
                            return v22;
                        elseif bit32.band(v17, 67108864) ~= 0 then
                            l_DefaultLanePriority_0 = 4;
                            return 67108864;
                        elseif bit32.band(v17, 134217728) ~= 0 then
                            l_DefaultLanePriority_0 = 3;
                            return 134217728;
                        else
                            local v23 = bit32.band(805306368, v17);
                            if v23 ~= 0 then
                                l_DefaultLanePriority_0 = 2;
                                return v23;
                            elseif bit32.band(1073741824, v17) ~= 0 then
                                l_DefaultLanePriority_0 = 1;
                                return 1073741824;
                            else
                                if v1.__DEV__ then
                                    l_console_0.error("Should have found matching lanes. This is a bug in React.");
                                end;
                                l_DefaultLanePriority_0 = 8;
                                return v17;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v13.schedulerPriorityToLanePriority = function(v25) --[[ Line: 234 ]] --[[ Name: schedulerPriorityToLanePriority ]]
    -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_IdlePriority_0 (copy)
    if v25 == l_ImmediatePriority_0 then
        return 15;
    elseif v25 == l_UserBlockingPriority_0 then
        return 10;
    elseif v25 == l_NormalPriority_0 or v25 == l_LowPriority_0 then
        return 8;
    elseif v25 == l_IdlePriority_0 then
        return 2;
    else
        return 0;
    end;
end;
v13.lanePriorityToSchedulerPriority = function(v26) --[[ Line: 255 ]] --[[ Name: lanePriorityToSchedulerPriority ]]
    -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_IdlePriority_0 (copy), l_NoPriority_0 (copy), l_invariant_0 (copy)
    if v26 == 15 or v26 == 14 then
        return l_ImmediatePriority_0;
    elseif v26 == 13 or v26 == 12 or v26 == 11 or v26 == 10 then
        return l_UserBlockingPriority_0;
    elseif v26 == 9 or v26 == 8 or v26 == 7 or v26 == 6 or v26 == 4 or v26 == 5 then
        return l_NormalPriority_0;
    elseif v26 == 3 or v26 == 2 or v26 == 1 then
        return l_IdlePriority_0;
    elseif v26 == 0 then
        return l_NoPriority_0;
    else
        l_invariant_0(false, "Invalid update priority: %s. This is a bug in React.", v26);
        error("unreachable");
        return;
    end;
end;
local v27 = nil;
local v28 = nil;
local v29 = nil;
v13.getNextLanes = function(v30, v31) --[[ Line: 299 ]] --[[ Name: getNextLanes ]]
    -- upvalues: l_DefaultLanePriority_0 (ref), v24 (copy), v28 (ref), v27 (ref)
    local l_pendingLanes_0 = v30.pendingLanes;
    if l_pendingLanes_0 == 0 then
        l_DefaultLanePriority_0 = 0;
        return 0;
    else
        local v33 = 0;
        local v34 = 0;
        local l_expiredLanes_0 = v30.expiredLanes;
        local l_suspendedLanes_0 = v30.suspendedLanes;
        local l_pingedLanes_0 = v30.pingedLanes;
        if l_expiredLanes_0 ~= 0 then
            v33 = l_expiredLanes_0;
            l_DefaultLanePriority_0 = 15;
            v34 = 15;
        else
            local v38 = bit32.band(l_pendingLanes_0, 134217727);
            if v38 ~= 0 then
                local v39 = bit32.band(v38, (bit32.bnot(l_suspendedLanes_0)));
                if v39 ~= 0 then
                    v33 = v24(v39);
                    v34 = l_DefaultLanePriority_0;
                else
                    local v40 = bit32.band(v38, l_pingedLanes_0);
                    if v40 ~= 0 then
                        v33 = v24(v40);
                        v34 = l_DefaultLanePriority_0;
                    end;
                end;
            else
                local v41 = bit32.band(l_pendingLanes_0, (bit32.bnot(l_suspendedLanes_0)));
                if v41 ~= 0 then
                    v33 = v24(v41);
                    v34 = l_DefaultLanePriority_0;
                elseif l_pingedLanes_0 ~= 0 then
                    v33 = v24(l_pingedLanes_0);
                    v34 = l_DefaultLanePriority_0;
                end;
            end;
        end;
        if v33 == 0 then
            return 0;
        else
            v33 = bit32.band(l_pendingLanes_0, bit32.lshift(v28(v33), 1) - 1);
            if v31 ~= 0 and v31 ~= v33 and bit32.band(v31, l_suspendedLanes_0) == 0 then
                v24(v31);
                if v34 <= l_DefaultLanePriority_0 then
                    return v31;
                else
                    l_DefaultLanePriority_0 = v34;
                end;
            end;
            local l_entangledLanes_0 = v30.entangledLanes;
            if l_entangledLanes_0 ~= 0 then
                local l_entanglements_0 = v30.entanglements;
                local v44 = bit32.band(v33, l_entangledLanes_0);
                while v44 > 0 do
                    local v45 = v27(v44);
                    local v46 = bit32.lshift(1, v45);
                    v33 = bit32.bor(v33, l_entanglements_0[v45]);
                    v44 = bit32.band(v44, (bit32.bnot(v46)));
                end;
            end;
            return v33;
        end;
    end;
end;
v13.getMostRecentEventTime = function(v47, v48) --[[ Line: 418 ]] --[[ Name: getMostRecentEventTime ]]
    -- upvalues: v27 (ref)
    local l_eventTimes_0 = v47.eventTimes;
    local v50 = -1;
    while v48 > 0 do
        local v51 = v27(v48);
        local v52 = bit32.lshift(1, v51);
        local v53 = l_eventTimes_0[v51];
        if v50 < v53 then
            v50 = v53;
        end;
        v48 = bit32.band(v48, (bit32.bnot(v52)));
    end;
    return v50;
end;
v13.computeExpirationTime = function(v54, v55) --[[ Line: 438 ]] --[[ Name: computeExpirationTime ]]
    -- upvalues: v24 (copy), l_DefaultLanePriority_0 (ref)
    v24(v54);
    local l_l_DefaultLanePriority_0_0 = l_DefaultLanePriority_0;
    if l_l_DefaultLanePriority_0_0 >= 10 then
        return v55 + 250;
    elseif l_l_DefaultLanePriority_0_0 >= 6 then
        return v55 + 5000;
    else
        return -1;
    end;
end;
v13.markStarvedLanesAsExpired = function(v57, v58) --[[ Line: 468 ]] --[[ Name: markStarvedLanesAsExpired ]]
    -- upvalues: v27 (ref), v24 (copy), l_DefaultLanePriority_0 (ref)
    local l_pendingLanes_1 = v57.pendingLanes;
    local l_suspendedLanes_1 = v57.suspendedLanes;
    local l_pingedLanes_1 = v57.pingedLanes;
    local l_expirationTimes_0 = v57.expirationTimes;
    local l_l_pendingLanes_1_0 = l_pendingLanes_1;
    while l_l_pendingLanes_1_0 > 0 do
        local v64 = v27(l_l_pendingLanes_1_0);
        local v65 = bit32.lshift(1, v64);
        local v66 = l_expirationTimes_0[v64];
        if v66 == -1 then
            if bit32.band(v65, l_suspendedLanes_1) == 0 or bit32.band(v65, l_pingedLanes_1) ~= 0 then
                v24(v65);
                local l_l_DefaultLanePriority_0_1 = l_DefaultLanePriority_0;
                l_expirationTimes_0[v64] = if l_l_DefaultLanePriority_0_1 >= 10 then v58 + 250 else if l_l_DefaultLanePriority_0_1 >= 6 then v58 + 5000 else -1;
            end;
        elseif v66 <= v58 then
            v57.expiredLanes = bit32.bor(v57.expiredLanes, v65);
        end;
        l_l_pendingLanes_1_0 = bit32.band(l_l_pendingLanes_1_0, (bit32.bnot(v65)));
    end;
end;
v13.getHighestPriorityPendingLanes = function(v68) --[[ Line: 510 ]] --[[ Name: getHighestPriorityPendingLanes ]]
    -- upvalues: v24 (copy)
    return (v24(v68.pendingLanes));
end;
v13.getLanesToRetrySynchronouslyOnError = function(v69) --[[ Line: 515 ]] --[[ Name: getLanesToRetrySynchronouslyOnError ]]
    local v70 = bit32.band(v69.pendingLanes, 3221225471);
    if v70 ~= 0 then
        return v70;
    elseif bit32.band(v70, 1073741824) ~= 0 then
        return 1073741824;
    else
        return 0;
    end;
end;
v13.returnNextLanesPriority = function() --[[ Line: 528 ]] --[[ Name: returnNextLanesPriority ]]
    -- upvalues: l_DefaultLanePriority_0 (ref)
    return l_DefaultLanePriority_0;
end;
v13.includesNonIdleWork = function(v71) --[[ Line: 533 ]] --[[ Name: includesNonIdleWork ]]
    return bit32.band(v71, 134217727) ~= 0;
end;
v13.includesOnlyRetries = function(v72) --[[ Line: 538 ]] --[[ Name: includesOnlyRetries ]]
    return bit32.band(v72, 62914560) == v72;
end;
v13.includesOnlyTransitions = function(v73) --[[ Line: 543 ]] --[[ Name: includesOnlyTransitions ]]
    return bit32.band(v73, 4186112) == v73;
end;
local v74 = nil;
local function v75(v76, v77) --[[ Line: 553 ]] --[[ Name: findUpdateLane ]]
    -- upvalues: v74 (ref), v75 (copy), l_invariant_0 (copy)
    if v76 ~= 0 then
        if v76 == 15 then
            return 1;
        elseif v76 == 14 then
            return 2;
        elseif v76 == 12 then
            local v78 = v74((bit32.band(24, (bit32.bnot(v77)))));
            if v78 == 0 then
                return v75(10, v77);
            else
                return v78;
            end;
        elseif v76 == 10 then
            local v79 = v74((bit32.band(192, (bit32.bnot(v77)))));
            if v79 == 0 then
                return v75(8, v77);
            else
                return v79;
            end;
        elseif v76 == 8 then
            local v80 = v74((bit32.band(3584, (bit32.bnot(v77)))));
            if v80 == 0 then
                v80 = v74((bit32.band(4186112, (bit32.bnot(v77)))));
                if v80 == 0 then
                    v80 = v74(3584);
                end;
            end;
            return v80;
        elseif v76 ~= 6 and v76 ~= 5 and v76 == 2 then
            local v81 = v74((bit32.band(805306368, (bit32.bnot(v77)))));
            if v81 == 0 then
                v81 = v74(805306368);
            end;
            return v81;
        end;
    end;
    l_invariant_0(false, "Invalid update priority: %s. This is a bug in React.", v76);
    error("unreachable");
end;
v13.findUpdateLane = v75;
v13.findTransitionLane = function(v82, v83) --[[ Line: 612 ]] --[[ Name: findTransitionLane ]]
    -- upvalues: v74 (ref)
    local v84 = v74((bit32.band(4186112, (bit32.bnot(v83)))));
    if v84 == 0 then
        v84 = v74((bit32.band(4186112, (bit32.bnot(v82)))));
        if v84 == 0 then
            v84 = v74(4186112);
        end;
    end;
    return v84;
end;
v13.findRetryLane = function(v85) --[[ Line: 632 ]] --[[ Name: findRetryLane ]]
    -- upvalues: v74 (ref)
    local v86 = v74((bit32.band(62914560, (bit32.bnot(v85)))));
    if v86 == 0 then
        v86 = v74(62914560);
    end;
    return v86;
end;
local function _(v87) --[[ Line: 644 ]] --[[ Name: getHighestPriorityLane ]]
    return (bit32.band(v87, -v87));
end;
v28 = function(v89) --[[ Line: 648 ]] --[[ Name: getLowestPriorityLane ]]
    local v90 = 31 - bit32.countlz(v89);
    if v90 < 0 then
        return 0;
    else
        return (bit32.lshift(1, v90));
    end;
end;
v29 = function(v91) --[[ Line: 658 ]] --[[ Name: getEqualOrHigherPriorityLanes ]]
    -- upvalues: v28 (ref)
    return bit32.lshift(v28(v91), 1) - 1;
end;
v74 = function(v92) --[[ Line: 662 ]] --[[ Name: pickArbitraryLane ]]
    return (bit32.band(v92, -v92));
end;
v13.pickArbitraryLane = v74;
v27 = function(v93) --[[ Line: 671 ]] --[[ Name: pickArbitraryLaneIndex ]]
    return 31 - bit32.countlz(v93);
end;
v13.includesSomeLane = function(v94, v95) --[[ Line: 680 ]] --[[ Name: includesSomeLane ]]
    return bit32.band(v94, v95) ~= 0;
end;
v13.isSubsetOfLanes = function(v96, v97) --[[ Line: 685 ]] --[[ Name: isSubsetOfLanes ]]
    return bit32.band(v96, v97) == v97;
end;
local function v100(v98, v99) --[[ Line: 690 ]] --[[ Name: mergeLanes ]]
    return (bit32.bor(v98, v99));
end;
v13.mergeLanes = if v5 then bit32.bor else v100;
v13.removeLanes = function(v101, v102) --[[ Line: 698 ]] --[[ Name: removeLanes ]]
    return (bit32.band(v101, (bit32.bnot(v102))));
end;
v13.laneToLanes = function(v103) --[[ Line: 705 ]] --[[ Name: laneToLanes ]]
    return v103;
end;
v13.higherPriorityLane = function(v104, v105) --[[ Line: 710 ]] --[[ Name: higherPriorityLane ]]
    if v104 ~= 0 and v105 ~= 0 then
        if v104 < v105 then
            return v104;
        else
            return v105;
        end;
    elseif v104 ~= 0 then
        return v104;
    else
        return v105;
    end;
end;
v13.higherLanePriority = function(v106, v107) --[[ Line: 726 ]] --[[ Name: higherLanePriority ]]
    if v106 ~= 0 and v107 < v106 then
        return v106;
    else
        return v107;
    end;
end;
v13.createLaneMap = function(v108) --[[ Line: 737 ]] --[[ Name: createLaneMap ]]
    return {
        [0] = v108, 
        [1] = v108, 
        [2] = v108, 
        [3] = v108, 
        [4] = v108, 
        [5] = v108, 
        [6] = v108, 
        [7] = v108, 
        [8] = v108, 
        [9] = v108, 
        [10] = v108, 
        [11] = v108, 
        [12] = v108, 
        [13] = v108, 
        [14] = v108, 
        [15] = v108, 
        [16] = v108, 
        [17] = v108, 
        [18] = v108, 
        [19] = v108, 
        [20] = v108, 
        [21] = v108, 
        [22] = v108, 
        [23] = v108, 
        [24] = v108, 
        [25] = v108, 
        [26] = v108, 
        [27] = v108, 
        [28] = v108, 
        [29] = v108, 
        [30] = v108, 
        [31] = v108
    };
end;
v13.markRootUpdated = function(v109, v110, v111) --[[ Line: 781 ]] --[[ Name: markRootUpdated ]]
    v109.pendingLanes = bit32.bor(v109.pendingLanes, v110);
    local v112 = v110 - 1;
    v109.suspendedLanes = bit32.band(v109.suspendedLanes, v112);
    v109.pingedLanes = bit32.band(v109.pingedLanes, v112);
    v109.eventTimes[31 - bit32.countlz(v110)] = v111;
end;
v13.markRootSuspended = function(v113, v114) --[[ Line: 810 ]] --[[ Name: markRootSuspended ]]
    -- upvalues: v27 (ref)
    v113.suspendedLanes = bit32.bor(v113.suspendedLanes, v114);
    v113.pingedLanes = bit32.band(v113.pingedLanes, (bit32.bnot(v114)));
    local l_expirationTimes_1 = v113.expirationTimes;
    local l_v114_0 = v114;
    while l_v114_0 > 0 do
        local v117 = v27(l_v114_0);
        local v118 = bit32.lshift(1, v117);
        l_expirationTimes_1[v117] = -1;
        l_v114_0 = bit32.band(l_v114_0, (bit32.bnot(v118)));
    end;
end;
v13.markRootPinged = function(v119, v120, _) --[[ Line: 828 ]] --[[ Name: markRootPinged ]]
    v119.pingedLanes = bit32.bor(v119.pingedLanes, (bit32.band(v119.suspendedLanes, v120)));
end;
v13.markRootExpired = function(v122, v123) --[[ Line: 834 ]] --[[ Name: markRootExpired ]]
    v122.expiredLanes = bit32.bor(v122.expiredLanes, (bit32.band(v123, v122.pendingLanes)));
end;
v13.markDiscreteUpdatesExpired = function(v124) --[[ Line: 840 ]] --[[ Name: markDiscreteUpdatesExpired ]]
    v124.expiredLanes = bit32.bor(v124.expiredLanes, (bit32.band(24, v124.pendingLanes)));
end;
v13.hasDiscreteLanes = function(v125) --[[ Line: 846 ]] --[[ Name: hasDiscreteLanes ]]
    return bit32.band(v125, 24) ~= 0;
end;
v13.markRootMutableRead = function(v126, v127) --[[ Line: 851 ]] --[[ Name: markRootMutableRead ]]
    v126.mutableReadLanes = bit32.bor(v126.mutableReadLanes, (bit32.band(v127, v126.pendingLanes)));
end;
v13.markRootFinished = function(v128, v129) --[[ Line: 857 ]] --[[ Name: markRootFinished ]]
    -- upvalues: v27 (ref)
    local v130 = bit32.band(v128.pendingLanes, (bit32.bnot(v129)));
    v128.pendingLanes = v129;
    v128.suspendedLanes = 0;
    v128.pingedLanes = 0;
    v128.expiredLanes = bit32.band(v128.expiredLanes, v129);
    v128.mutableReadLanes = bit32.band(v128.mutableReadLanes, v129);
    v128.entangledLanes = bit32.band(v128.entangledLanes, v129);
    local l_entanglements_1 = v128.entanglements;
    local l_eventTimes_1 = v128.eventTimes;
    local l_expirationTimes_2 = v128.expirationTimes;
    local l_v130_0 = v130;
    while l_v130_0 > 0 do
        local v135 = v27(l_v130_0);
        local v136 = bit32.lshift(1, v135);
        l_entanglements_1[v135] = 0;
        l_eventTimes_1[v135] = -1;
        l_expirationTimes_2[v135] = -1;
        l_v130_0 = bit32.band(l_v130_0, (bit32.bnot(v136)));
    end;
end;
v13.markRootEntangled = function(v137, v138) --[[ Line: 890 ]] --[[ Name: markRootEntangled ]]
    -- upvalues: v27 (ref)
    v137.entangledLanes = bit32.bor(v137.entangledLanes, v138);
    local l_entanglements_2 = v137.entanglements;
    local l_v138_0 = v138;
    while l_v138_0 > 0 do
        local v141 = v27(l_v138_0);
        local v142 = bit32.lshift(1, v141);
        l_entanglements_2[v141] = bit32.bor(l_entanglements_2[v141], v138);
        l_v138_0 = bit32.band(l_v138_0, (bit32.bnot(v142)));
    end;
end;
v13.getBumpedLaneForHydration = function(v143, v144) --[[ Line: 906 ]] --[[ Name: getBumpedLaneForHydration ]]
    -- upvalues: v24 (copy), l_DefaultLanePriority_0 (ref), l_invariant_0 (copy)
    v24(v144);
    local l_l_DefaultLanePriority_0_2 = l_DefaultLanePriority_0;
    local v146 = nil;
    if l_l_DefaultLanePriority_0_2 == 15 or l_l_DefaultLanePriority_0_2 == 14 then
        v146 = 0;
    elseif l_l_DefaultLanePriority_0_2 == 13 or l_l_DefaultLanePriority_0_2 == 12 then
        v146 = 4;
    elseif l_l_DefaultLanePriority_0_2 == 11 or l_l_DefaultLanePriority_0_2 == 10 then
        v146 = 32;
    elseif l_l_DefaultLanePriority_0_2 == 9 or l_l_DefaultLanePriority_0_2 == 8 then
        v146 = 256;
    elseif l_l_DefaultLanePriority_0_2 == 7 or l_l_DefaultLanePriority_0_2 == 6 then
        v146 = 4096;
    elseif l_l_DefaultLanePriority_0_2 == 5 then
        v146 = 4096;
    elseif l_l_DefaultLanePriority_0_2 == 4 then
        v146 = 67108864;
    elseif l_l_DefaultLanePriority_0_2 == 3 or l_l_DefaultLanePriority_0_2 == 2 then
        v146 = 134217728;
    elseif l_l_DefaultLanePriority_0_2 == 1 or l_l_DefaultLanePriority_0_2 == 0 then
        v146 = 0;
    else
        l_invariant_0(false, "Invalid lane: %s. This is a bug in React.", (tostring(v146)));
    end;
    if bit32.band(v146, (bit32.bor(v143.suspendedLanes, v144))) ~= 0 then
        return 0;
    else
        return v146;
    end;
end;
return v13;