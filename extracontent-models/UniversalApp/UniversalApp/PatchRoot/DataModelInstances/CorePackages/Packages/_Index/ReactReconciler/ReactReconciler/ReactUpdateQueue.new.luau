local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l___DEV___0 = v1.__DEV__;
local l___YOLO___0 = v1.__YOLO__;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v7 = require(script.Parent.ReactFiberLane);
local l_NoLane_0 = v7.NoLane;
local l_NoLanes_0 = v7.NoLanes;
local l_isSubsetOfLanes_0 = v7.isSubsetOfLanes;
local l_mergeLanes_0 = v7.mergeLanes;
local v12 = nil;
local function _() --[[ Line: 115 ]] --[[ Name: enterDisallowedContextReadInDEV ]]
    -- upvalues: v12 (ref)
    if not v12 then
        v12 = require(script.Parent["ReactFiberNewContext.new"]);
    end;
    v12.enterDisallowedContextReadInDEV();
end;
local function _() --[[ Line: 121 ]] --[[ Name: exitDisallowedContextReadInDEV ]]
    -- upvalues: v12 (ref)
    if not v12 then
        v12 = require(script.Parent["ReactFiberNewContext.new"]);
    end;
    v12.exitDisallowedContextReadInDEV();
end;
local v15 = require(script.Parent.ReactFiberFlags);
local l_Callback_0 = v15.Callback;
local l_ShouldCapture_0 = v15.ShouldCapture;
local l_DidCapture_0 = v15.DidCapture;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = require(l_Parent_0.Shared).ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode;
local l_StrictMode_0 = require(script.Parent.ReactTypeOfMode).StrictMode;
local l_markSkippedUpdateLanes_0 = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local v26 = {
    UpdateState = 0, 
    ReplaceState = 1, 
    ForceUpdate = 2, 
    CaptureUpdate = 3
};
local v27 = false;
local v28 = nil;
local v29 = nil;
if l___DEV___0 then
    v28 = false;
    v29 = nil;
    v26.resetCurrentlyProcessingQueue = function() --[[ Line: 181 ]]
        -- upvalues: v29 (ref)
        v29 = nil;
    end;
end;
local v30 = table.create(210);
local v31 = 210;
for v32 = 1, 210 do
    v30[v32] = {
        eventTime = -1, 
        lane = -1, 
        tag = -1, 
        payload = nil, 
        callback = nil, 
        next = nil
    };
end;
v26.initializeUpdateQueue = function(v33) --[[ Line: 202 ]] --[[ Name: initializeUpdateQueue ]]
    v33.updateQueue = {
        baseState = v33.memoizedState, 
        firstBaseUpdate = nil, 
        lastBaseUpdate = nil, 
        shared = {
            pending = nil
        }, 
        effects = nil
    };
end;
v26.cloneUpdateQueue = function(v34, v35) --[[ Line: 216 ]] --[[ Name: cloneUpdateQueue ]]
    local l_updateQueue_0 = v35.updateQueue;
    local l_updateQueue_1 = v34.updateQueue;
    if l_updateQueue_0 == l_updateQueue_1 then
        v35.updateQueue = table.clone(l_updateQueue_1);
    end;
end;
v26.createUpdate = function(v38, v39, v40, v41) --[[ Line: 230 ]] --[[ Name: createUpdate ]]
    -- upvalues: v31 (ref), v30 (copy)
    if v31 > 0 then
        local v42 = v30[v31];
        v30[v31] = nil;
        v31 = v31 - 1;
        v42.eventTime = v38;
        v42.lane = v39;
        v42.tag = 0;
        v42.payload = v40;
        v42.callback = v41;
        return v42;
    else
        return {
            eventTime = v38, 
            lane = v39, 
            tag = 0, 
            payload = v40, 
            callback = v41, 
            next = nil
        };
    end;
end;
v26.enqueueUpdate = function(v43, v44) --[[ Line: 280 ]] --[[ Name: enqueueUpdate ]]
    -- upvalues: l___DEV___0 (copy), v29 (ref), v28 (ref), l_console_0 (copy)
    local l_updateQueue_2 = v43.updateQueue;
    if l_updateQueue_2 == nil then
        return;
    else
        local l_shared_0 = l_updateQueue_2.shared;
        local l_pending_0 = l_shared_0.pending;
        if l_pending_0 == nil then
            v44.next = v44;
        else
            v44.next = l_pending_0.next;
            l_pending_0.next = v44;
        end;
        l_shared_0.pending = v44;
        if l___DEV___0 and v29 == l_shared_0 and not v28 then
            l_console_0.error("An update (setState, replaceState, or forceUpdate) was scheduled from inside an update function. Update functions should be pure, with zero side-effects. Consider using componentDidUpdate or a callback.");
            v28 = true;
        end;
        return;
    end;
end;
v26.enqueueCapturedUpdate = function(v48, v49) --[[ Line: 312 ]] --[[ Name: enqueueCapturedUpdate ]]
    local l_updateQueue_3 = v48.updateQueue;
    local l_alternate_0 = v48.alternate;
    if l_alternate_0 ~= nil then
        local l_updateQueue_4 = l_alternate_0.updateQueue;
        if l_updateQueue_3 == l_updateQueue_4 then
            local v53 = nil;
            local v54 = nil;
            local l_firstBaseUpdate_0 = l_updateQueue_3.firstBaseUpdate;
            if l_firstBaseUpdate_0 ~= nil then
                local l_l_firstBaseUpdate_0_0 = l_firstBaseUpdate_0;
                repeat
                    local v57 = {
                        eventTime = l_l_firstBaseUpdate_0_0.eventTime, 
                        lane = l_l_firstBaseUpdate_0_0.lane, 
                        tag = l_l_firstBaseUpdate_0_0.tag, 
                        payload = l_l_firstBaseUpdate_0_0.payload, 
                        callback = l_l_firstBaseUpdate_0_0.callback, 
                        next = nil
                    };
                    if v54 == nil then
                        v54 = v57;
                        v53 = v57;
                    else
                        v54.next = v57;
                        v54 = v57;
                    end;
                    l_l_firstBaseUpdate_0_0 = l_l_firstBaseUpdate_0_0.next;
                until l_l_firstBaseUpdate_0_0 == nil;
                if v54 == nil then
                    v54 = v49;
                    v53 = v49;
                else
                    v54.next = v49;
                    v54 = v49;
                end;
            else
                v54 = v49;
                v53 = v49;
            end;
            v48.updateQueue = {
                baseState = l_updateQueue_4.baseState, 
                firstBaseUpdate = v53, 
                lastBaseUpdate = v54, 
                shared = l_updateQueue_4.shared, 
                effects = l_updateQueue_4.effects
            };
            return;
        end;
    end;
    local l_lastBaseUpdate_0 = l_updateQueue_3.lastBaseUpdate;
    if l_lastBaseUpdate_0 == nil then
        l_updateQueue_3.firstBaseUpdate = v49;
    else
        l_lastBaseUpdate_0.next = v49;
    end;
    l_updateQueue_3.lastBaseUpdate = v49;
end;
local function v78(v59, _, v61, v62, v63, _) --[[ Line: 393 ]] --[[ Name: getStateFromUpdate ]]
    -- upvalues: l___DEV___0 (copy), v12 (ref), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), l_ShouldCapture_0 (copy), l_DidCapture_0 (copy), l_Object_0 (copy), v27 (ref)
    local l_tag_0 = v61.tag;
    if l_tag_0 == 1 then
        local l_payload_0 = v61.payload;
        if type(l_payload_0) == "function" then
            if l___DEV___0 then
                if not v12 then
                    v12 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v12.enterDisallowedContextReadInDEV();
            end;
            local v67 = l_payload_0(v62, v63);
            if l___DEV___0 then
                if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v59.mode, l_StrictMode_0) ~= 0 then
                    l_disableLogs_0();
                    local v68 = nil;
                    local v69 = nil;
                    if not l___YOLO___0 then
                        local v70, v71 = xpcall(l_payload_0, l_describeError_0, v62, v63);
                        v68 = v70;
                        v69 = v71;
                    else
                        v68 = true;
                        l_payload_0(v62, v63);
                    end;
                    l_reenableLogs_0();
                    if not v68 then
                        error(v69);
                    end;
                end;
                if not v12 then
                    v12 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v12.exitDisallowedContextReadInDEV();
            end;
            return v67;
        else
            return l_payload_0;
        end;
    elseif l_tag_0 == 3 or l_tag_0 == 0 then
        if l_tag_0 == 3 then
            v59.flags = bit32.bor(bit32.band(v59.flags, (bit32.bnot(l_ShouldCapture_0))), l_DidCapture_0);
        end;
        local l_payload_1 = v61.payload;
        local v73 = nil;
        if type(l_payload_1) == "function" then
            if l___DEV___0 then
                if not v12 then
                    v12 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v12.enterDisallowedContextReadInDEV();
            end;
            v73 = l_payload_1(v62, v63);
            if l___DEV___0 then
                if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v59.mode, l_StrictMode_0) ~= 0 then
                    l_disableLogs_0();
                    local v74 = nil;
                    local v75 = nil;
                    if not l___YOLO___0 then
                        local v76, v77 = xpcall(l_payload_1, l_describeError_0, v62, v63);
                        v74 = v76;
                        v75 = v77;
                    else
                        v74 = true;
                        l_payload_1(v62, v63);
                    end;
                    l_reenableLogs_0();
                    if not v74 then
                        error(v75);
                    end;
                end;
                if not v12 then
                    v12 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v12.exitDisallowedContextReadInDEV();
            end;
        else
            v73 = l_payload_1;
        end;
        if v73 == nil then
            return v62;
        else
            return l_Object_0.assign({}, v62, v73);
        end;
    elseif l_tag_0 == 2 then
        v27 = true;
        return v62;
    else
        return v62;
    end;
end;
v26.getStateFromUpdate = v78;
v26.processUpdateQueue = function(v79, v80, v81, v82) --[[ Line: 502 ]] --[[ Name: processUpdateQueue ]]
    -- upvalues: v27 (ref), l___DEV___0 (copy), v29 (ref), l_NoLanes_0 (copy), l_isSubsetOfLanes_0 (copy), l_mergeLanes_0 (copy), l_NoLane_0 (copy), v78 (copy), l_Callback_0 (copy), l_markSkippedUpdateLanes_0 (copy)
    local l_updateQueue_5 = v79.updateQueue;
    v27 = false;
    if l___DEV___0 then
        v29 = l_updateQueue_5.shared;
    end;
    local l_firstBaseUpdate_1 = l_updateQueue_5.firstBaseUpdate;
    local l_lastBaseUpdate_1 = l_updateQueue_5.lastBaseUpdate;
    local l_pending_1 = l_updateQueue_5.shared.pending;
    if l_pending_1 ~= nil then
        l_updateQueue_5.shared.pending = nil;
        local l_l_pending_1_0 = l_pending_1;
        local l_next_0 = l_l_pending_1_0.next;
        l_l_pending_1_0.next = nil;
        if l_lastBaseUpdate_1 == nil then
            l_firstBaseUpdate_1 = l_next_0;
        else
            l_lastBaseUpdate_1.next = l_next_0;
        end;
        l_lastBaseUpdate_1 = l_l_pending_1_0;
        local l_alternate_1 = v79.alternate;
        if l_alternate_1 ~= nil then
            local l_updateQueue_6 = l_alternate_1.updateQueue;
            local l_lastBaseUpdate_2 = l_updateQueue_6.lastBaseUpdate;
            if l_lastBaseUpdate_2 ~= l_lastBaseUpdate_1 then
                if l_lastBaseUpdate_2 == nil then
                    l_updateQueue_6.firstBaseUpdate = l_next_0;
                else
                    l_lastBaseUpdate_2.next = l_next_0;
                end;
                l_updateQueue_6.lastBaseUpdate = l_l_pending_1_0;
            end;
        end;
    end;
    if l_firstBaseUpdate_1 ~= nil then
        local l_baseState_0 = l_updateQueue_5.baseState;
        local l_l_NoLanes_0_0 = l_NoLanes_0;
        local v94 = nil;
        local v95 = nil;
        local v96 = nil;
        local l_l_firstBaseUpdate_1_0 = l_firstBaseUpdate_1;
        while true do
            local l_lane_0 = l_l_firstBaseUpdate_1_0.lane;
            local l_eventTime_0 = l_l_firstBaseUpdate_1_0.eventTime;
            if not l_isSubsetOfLanes_0(v82, l_lane_0) then
                local v100 = {
                    eventTime = l_eventTime_0, 
                    lane = l_lane_0, 
                    tag = l_l_firstBaseUpdate_1_0.tag, 
                    payload = l_l_firstBaseUpdate_1_0.payload, 
                    callback = l_l_firstBaseUpdate_1_0.callback, 
                    next = nil
                };
                if v96 == nil then
                    v95 = v100;
                    v96 = v100;
                    v94 = l_baseState_0;
                else
                    v96.next = v100;
                    v96 = v100;
                end;
                l_l_NoLanes_0_0 = l_mergeLanes_0(l_l_NoLanes_0_0, l_lane_0);
            else
                if v96 ~= nil then
                    local v101 = {
                        eventTime = l_eventTime_0, 
                        lane = l_NoLane_0, 
                        tag = l_l_firstBaseUpdate_1_0.tag, 
                        payload = l_l_firstBaseUpdate_1_0.payload, 
                        callback = l_l_firstBaseUpdate_1_0.callback, 
                        next = nil
                    };
                    v96.next = v101;
                    v96 = v101;
                end;
                l_baseState_0 = v78(v79, l_updateQueue_5, l_l_firstBaseUpdate_1_0, l_baseState_0, v80, v81);
                if l_l_firstBaseUpdate_1_0.callback ~= nil and l_l_firstBaseUpdate_1_0.lane ~= l_NoLane_0 then
                    v79.flags = bit32.bor(v79.flags, l_Callback_0);
                    local l_effects_0 = l_updateQueue_5.effects;
                    if l_effects_0 == nil then
                        l_updateQueue_5.effects = {
                            l_l_firstBaseUpdate_1_0
                        };
                    else
                        table.insert(l_effects_0, l_l_firstBaseUpdate_1_0);
                    end;
                end;
            end;
            l_l_firstBaseUpdate_1_0 = l_l_firstBaseUpdate_1_0.next;
            if l_l_firstBaseUpdate_1_0 ~= nil then
                continue;
            end;
            l_pending_1 = l_updateQueue_5.shared.pending;
            if l_pending_1 ~= nil then
                local l_l_pending_1_1 = l_pending_1;
                local l_next_1 = l_l_pending_1_1.next;
                l_l_pending_1_1.next = nil;
                l_l_firstBaseUpdate_1_0 = l_next_1;
                l_updateQueue_5.lastBaseUpdate = l_l_pending_1_1;
                l_updateQueue_5.shared.pending = nil;
            else
                break;
            end;
        end;
        if v96 == nil then
            v94 = l_baseState_0;
        end;
        l_updateQueue_5.baseState = v94;
        l_updateQueue_5.firstBaseUpdate = v95;
        l_updateQueue_5.lastBaseUpdate = v96;
        l_markSkippedUpdateLanes_0(l_l_NoLanes_0_0);
        v79.lanes = l_l_NoLanes_0_0;
        v79.memoizedState = l_baseState_0;
    end;
    if l___DEV___0 then
        v29 = nil;
    end;
end;
local function _(v105, v106) --[[ Line: 694 ]] --[[ Name: callCallback ]]
    if type(v105) ~= "function" then
        error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", (tostring(v105))));
    end;
    v105(v106);
end;
v26.resetHasForceUpdateBeforeProcessing = function() --[[ Line: 709 ]]
    -- upvalues: v27 (ref)
    v27 = false;
end;
v26.checkHasForceUpdateAfterProcessing = function() --[[ Line: 713 ]]
    -- upvalues: v27 (ref)
    return v27;
end;
v26.commitUpdateQueue = function(_, v109, v110) --[[ Line: 717 ]] --[[ Name: commitUpdateQueue ]]
    -- upvalues: v30 (copy), v31 (ref)
    local l_effects_1 = v109.effects;
    v109.effects = nil;
    if l_effects_1 ~= nil then
        for _, v113 in l_effects_1 do
            local l_callback_0 = v113.callback;
            if l_callback_0 ~= nil then
                if type(l_callback_0) ~= "function" then
                    error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", (tostring(l_callback_0))));
                end;
                l_callback_0(v110);
            end;
            table.clear(v113);
            table.insert(v30, v113);
            v31 = v31 + 1;
        end;
    end;
end;
return v26;