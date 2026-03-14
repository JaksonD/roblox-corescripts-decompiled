local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new("AppChatPerf");
local l_TimeToInteractiveTracker_0 = require(l_Parent_0.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v4 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.SocialCommon);
local v6 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfEventInfo);
local _ = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local v8 = {
    started = false, 
    interactive = false, 
    interactiveTimestamp = nil, 
    eventName = nil
};
local v9 = {};
local function _(v10) --[[ Line: 55 ]] --[[ Name: getTTIState ]]
    -- upvalues: v9 (copy), v8 (copy)
    if not v9[v10] then
        v9[v10] = table.clone(v8);
    end;
    return v9[v10];
end;
local v12 = nil;
local v13 = {};
local v14 = {
    category = v6.TTI_CATEGORY
};
local v15 = nil;
local function v17(_) --[[ Line: 90 ]] --[[ Name: alwaysMatch ]]
    return true, nil;
end;
local function v19(v18) --[[ Line: 94 ]] --[[ Name: matchConversation ]]
    -- upvalues: v12 (ref)
    if v18.conversationId and v12 and v18.conversationId ~= v12 then
        return false, "conversation_id_mismatch";
    else
        return true, nil;
    end;
end;
local function v22(v20) --[[ Line: 101 ]] --[[ Name: onStartConversation ]]
    -- upvalues: v12 (ref), v15 (ref)
    local l_conversationId_0 = v20.conversationId;
    if l_conversationId_0 ~= nil and l_conversationId_0 ~= v12 then
        v12 = l_conversationId_0;
        if v15 then
            v15("ChatConversationTTI");
        end;
    end;
end;
local v27 = {
    ChatLandingTTI = {
        getColdStart = function(v23) --[[ Line: 114 ]] --[[ Name: getColdStart ]]
            return v23.coldStart == true;
        end, 
        isContextMatching = v17
    }, 
    ChatConversationTTI = {
        getColdStart = function(v24) --[[ Line: 120 ]] --[[ Name: getColdStart ]]
            -- upvalues: v13 (copy)
            local l_conversationId_1 = v24.conversationId;
            local v26 = false;
            if l_conversationId_1 ~= nil then
                v26 = not v13[l_conversationId_1];
            end;
            if l_conversationId_1 then
                v13[l_conversationId_1] = true;
            end;
            return v26;
        end, 
        isContextMatching = v19, 
        onStart = v22
    }
};
local function v31(v28, v29) --[[ Line: 138 ]] --[[ Name: buildTTIMetadata ]]
    -- upvalues: v6 (copy), v4 (copy), v14 (ref)
    local v30 = v6.getTTIPage(v28);
    return v4.Dictionary.join(v14, {
        subcategory = v30, 
        page = v30
    }, v29 or {});
end;
return {
    setSharedContext = function(v32) --[[ Line: 152 ]] --[[ Name: setSharedContext ]]
        -- upvalues: v14 (ref), v4 (copy), v2 (copy)
        v14 = v4.Dictionary.join(v14, v32);
        v2:debug("Shared context updated: placement={}, entryPoint={}, hasActiveParty={}", v32.placement or "nil", v32.entryPoint or "nil", v32.hasActiveParty or false);
    end, 
    getSharedContext = function() --[[ Line: 162 ]] --[[ Name: getSharedContext ]]
        -- upvalues: v14 (ref)
        return v14;
    end, 
    setOnConversationSwitch = function(v33) --[[ Line: 168 ]] --[[ Name: setOnConversationSwitch ]]
        -- upvalues: v15 (ref)
        v15 = v33;
    end, 
    start = function(v34, v35) --[[ Line: 172 ]] --[[ Name: start ]]
        -- upvalues: v27 (copy), v6 (copy), v14 (ref), v9 (copy), v2 (copy), l_TimeToInteractiveTracker_0 (copy), v31 (copy), v4 (copy)
        local v36 = v27[v34];
        if v36.onStart then
            v36.onStart(v35);
        end;
        local v37 = v36.getColdStart(v35);
        local v38 = v6.buildTTIEventName(v34, v14.placement, v37);
        v9[v34] = {
            started = true, 
            interactive = false, 
            interactiveTimestamp = nil, 
            eventName = v38
        };
        v2:debug("TTI Start: {} (coldStart={}, conversationId={}, entryPoint={})", v38, v37, v35.conversationId, v35.entryPoint);
        l_TimeToInteractiveTracker_0.trackStart(v38);
        l_TimeToInteractiveTracker_0.updateMetadata(v38, v31(v34, v4.Dictionary.join(v35, {
            coldStart = v37
        })));
        return true;
    end, 
    finish = function(v39, v40) --[[ Line: 205 ]] --[[ Name: finish ]]
        -- upvalues: v27 (copy), v9 (copy), v8 (copy), v2 (copy), l_TimeToInteractiveTracker_0 (copy), v31 (copy)
        local v41 = v27[v39];
        if not v9[v39] then
            v9[v39] = table.clone(v8);
        end;
        local v42 = v9[v39];
        if not v42.started then
            v2:debug("TTI End ignored: {} (reason=not_started)", v39);
            return false;
        else
            local v43, v44 = v41.isContextMatching(v40);
            if not v43 then
                v2:debug("TTI End ignored: {} (reason={})", v39, v44 or "unknown");
                return false;
            else
                local l_eventName_0 = v42.eventName;
                if l_eventName_0 == nil then
                    v2:debug("TTI End ignored: {} (reason=missing_event_name)", v39);
                    return false;
                else
                    v2:debug("TTI End: {} (numElementsRendered={})", l_eventName_0, v40.numElementsRendered);
                    l_TimeToInteractiveTracker_0.updateMetadata(l_eventName_0, v31(v39, v40));
                    l_TimeToInteractiveTracker_0.trackEnd(l_eventName_0);
                    v42.started = false;
                    v42.interactive = true;
                    v42.interactiveTimestamp = os.clock();
                    v42.eventName = nil;
                    return true;
                end;
            end;
        end;
    end, 
    cancel = function(v46, _) --[[ Line: 237 ]] --[[ Name: cancel ]]
        -- upvalues: v9 (copy), v8 (copy), v2 (copy), l_TimeToInteractiveTracker_0 (copy)
        if not v9[v46] then
            v9[v46] = table.clone(v8);
        end;
        local v48 = v9[v46];
        if not v48.started then
            v2:debug("TTI Cancel ignored: {} (reason=not_started)", v46);
            return false;
        else
            local l_eventName_1 = v48.eventName;
            if l_eventName_1 == nil then
                v2:debug("TTI Cancel ignored: {} (reason=missing_event_name)", v46);
                return false;
            else
                v2:debug("TTI Cancel: {}", l_eventName_1);
                l_TimeToInteractiveTracker_0.resetEvent(l_eventName_1);
                v48.started = false;
                v48.interactive = false;
                v48.interactiveTimestamp = nil;
                v48.eventName = nil;
                return true;
            end;
        end;
    end, 
    isActive = function(v50, v51) --[[ Line: 261 ]] --[[ Name: isActive ]]
        -- upvalues: v27 (copy), v9 (copy), v8 (copy)
        local v52 = v27[v50];
        if not v9[v50] then
            v9[v50] = table.clone(v8);
        end;
        if not v9[v50].started then
            return false;
        else
            return (v52.isContextMatching(v51));
        end;
    end, 
    isInteractive = function(v53) --[[ Line: 274 ]] --[[ Name: isInteractive ]]
        -- upvalues: v9 (copy), v8 (copy)
        if not v9[v53] then
            v9[v53] = table.clone(v8);
        end;
        return v9[v53].interactive;
    end, 
    getInteractiveTimestamp = function(v54) --[[ Line: 278 ]] --[[ Name: getInteractiveTimestamp ]]
        -- upvalues: v9 (copy), v8 (copy)
        if not v9[v54] then
            v9[v54] = table.clone(v8);
        end;
        return v9[v54].interactiveTimestamp;
    end
};