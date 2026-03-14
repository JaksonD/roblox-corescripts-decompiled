local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Signals);
local l_createSignal_0 = v1.createSignal;
return function() --[[ Line: 38 ]]
    -- upvalues: l_createSignal_0 (copy), v1 (copy)
    local v3, v4 = l_createSignal_0(0);
    local v5, v6 = l_createSignal_0(0);
    local v7, v8 = l_createSignal_0(0);
    local v9, v10 = l_createSignal_0(0);
    local v11, v12 = l_createSignal_0(0);
    local v13, v14 = l_createSignal_0("unknown");
    local v15, v16 = l_createSignal_0("unknown");
    local v17 = 0;
    local v18 = 0;
    local v19 = 0;
    local v20 = 0;
    local v21, v22 = l_createSignal_0({
        openDuration = 0, 
        closedDuration = 0, 
        textIdleDuration = 0, 
        backgroundIdleDuration = 0
    });
    local v28 = v1.createEffect(function(v23) --[[ Line: 63 ]]
        -- upvalues: v3 (copy), v5 (copy), v7 (copy), v9 (copy), v16 (copy), v13 (copy), v14 (copy), v12 (copy)
        local v24 = v3(v23);
        local v25 = v5(v23);
        local v26 = v7(v23);
        local v27 = v9(v23);
        v16(v13(false));
        if v27 < v26 and v25 < v26 and v24 < v26 then
            v14("open");
            v12(v26);
            return;
        elseif v25 < v27 and v24 < v27 then
            v14("closed");
            v12(v27);
            return;
        elseif v24 < v25 then
            v14("textIdle");
            v12(v25);
            return;
        elseif v24 > 0 then
            v14("backgroundIdle");
            v12(v24);
            return;
        else
            v14("unknown");
            return;
        end;
    end);
    local v33 = v1.createEffect(function(v29) --[[ Line: 93 ]]
        -- upvalues: v15 (copy), v11 (copy), v17 (ref), v7 (copy), v18 (ref), v9 (copy), v19 (ref), v5 (copy), v20 (ref), v3 (copy), v22 (copy)
        local v30 = v15(v29);
        local v31 = v11(v29);
        if v30 == "open" then
            v17 = v31 - v7(v29);
        elseif v30 == "closed" then
            v18 = v31 - v9(v29);
        elseif v30 == "textIdle" then
            v19 = v31 - v5(v29);
        elseif v30 == "backgroundIdle" then
            v20 = v31 - v3(v29);
        end;
        v22(function(v32) --[[ Line: 105 ]]
            -- upvalues: v17 (ref), v18 (ref), v19 (ref), v20 (ref)
            return {
                openDuration = v32.openDuration + v17, 
                closedDuration = v32.closedDuration + v18, 
                textIdleDuration = v32.textIdleDuration + v19, 
                backgroundIdleDuration = v32.backgroundIdleDuration + v20
            };
        end);
    end);
    return {
        getBackgroundTimerStarted = v3, 
        getTextTimerStarted = v5, 
        getOpenTimerStarted = v7, 
        getClosedTimerStarted = v9, 
        getPreviousChatWindowStateTimerExpired = v11, 
        getCurrentChatWindowState = v13, 
        getPreviousChatWindowState = v15, 
        getDurationUpdates = v21, 
        setBackgroundTimerStarted = v4, 
        setTextTimerStarted = v6, 
        setOpenTimerStarted = v8, 
        setClosedTimerStarted = v10, 
        setPreviousChatWindowStateTimerExpired = v12, 
        setCurrentChatWindowState = v14, 
        setPreviousChatWindowState = v16, 
        setDurationUpdates = v22, 
        newStateEffect = v28, 
        changingWindowStateEffect = v33
    };
end;