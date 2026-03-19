local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.EventPropagation);
local v2 = require(l_Parent_0.FocusNavigationUtils);
local l_createSignal_0 = v2.createSignal;
local l_shallowEqual_0 = v2.shallowEqual;
local l_getAncestors_0 = v2.getAncestors;
local l_mockableWarn_0 = v2.mockableWarn;
local v7 = require(script.Parent.isValidFocusTarget);
local _ = require(script.Parent.types);
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 104 ]] --[[ Name: new ]]
    -- upvalues: l_createSignal_0 (copy), v1 (copy), v9 (copy)
    local v11, v12 = l_createSignal_0({});
    local v13, v14 = l_createSignal_0(v10.getSelection());
    local v15 = setmetatable({
        _eventPropagationService = v1.new(), 
        _engineInterface = v10, 
        _eventMapByInstance = setmetatable({}, {
            __mode = "k"
        }), 
        _focusBehaviorByInstance = setmetatable({}, {
            __mode = "k"
        }), 
        _engineEventConnections = {}, 
        _silentFocusTarget = nil, 
        _silentBlurTarget = nil, 
        _fireActiveEventMapSignal = v12, 
        _fireFocusedGuiObjectSignal = v14, 
        activeEventMap = v11, 
        focusedGuiObject = v13
    }, v9);
    v15:_connectToInputEvents();
    return v15;
end;
v9._fireInputEvent = function(v16, v17, v18, v19) --[[ Line: 131 ]] --[[ Name: _fireInputEvent ]]
    local v20 = v16.activeEventMap:getValue()[v18.KeyCode];
    if v20 then
        v16._eventPropagationService:propagateEvent(v17, v20, {
            Delta = v18.Delta, 
            KeyCode = v18.KeyCode, 
            Position = v18.Position, 
            UserInputState = v18.UserInputState, 
            UserInputType = v18.UserInputType, 
            wasProcessed = v19
        }, {
            synthetic = false, 
            silent = false
        });
    end;
end;
v9._connectToInputEvents = function(v21) --[[ Line: 149 ]] --[[ Name: _connectToInputEvents ]]
    local function v25(v22, v23) --[[ Line: 151 ]] --[[ Name: forwardInputEvent ]]
        -- upvalues: v21 (copy)
        local v24 = v21._engineInterface.getSelection();
        if v24 then
            v21:_fireInputEvent(v24, v22, v23);
        end;
    end;
    table.insert(v21._engineEventConnections, v21._engineInterface.InputBegan:Connect(v25));
    table.insert(v21._engineEventConnections, v21._engineInterface.InputChanged:Connect(v25));
    table.insert(v21._engineEventConnections, v21._engineInterface.InputEnded:Connect(v25));
    table.insert(v21._engineEventConnections, v21._engineInterface.SelectionChanged:Connect(function() --[[ Line: 162 ]] --[[ Name: onFocusChanged ]]
        -- upvalues: v21 (copy)
        local v26 = v21.focusedGuiObject:getValue();
        local v27 = v21._engineInterface.getSelection();
        if v26 then
            local v28 = v21._silentBlurTarget == v26;
            v21._eventPropagationService:propagateEvent(v26, "blur", nil, {
                synthetic = false, 
                silent = v28
            });
            v21._silentBlurTarget = nil;
        end;
        v21._fireFocusedGuiObjectSignal(v27);
        if v27 then
            local v29 = v27 == v21._silentFocusTarget;
            v21._eventPropagationService:propagateEvent(v27, "focus", nil, {
                synthetic = false, 
                silent = v29
            });
            v21._silentFocusTarget = nil;
        end;
        v21:_updateActiveEventMap(v26);
    end));
end;
v9._cancelHandler = function(v30, v31, v32) --[[ Line: 189 ]] --[[ Name: _cancelHandler ]]
    if v32 ~= "blur" and v32 ~= "focus" then
        v30._eventPropagationService:propagateEvent(v31, v32, {
            KeyCode = Enum.KeyCode.Unknown, 
            UserInputType = Enum.UserInputType.None, 
            UserInputState = Enum.UserInputState.Cancel
        }, {
            synthetic = false, 
            silent = false
        });
    end;
end;
v9._updateActiveEventMap = function(v33, v34) --[[ Line: 202 ]] --[[ Name: _updateActiveEventMap ]]
    -- upvalues: l_getAncestors_0 (copy), l_shallowEqual_0 (copy)
    local v35 = {};
    local v36 = v33._engineInterface.getSelection();
    if v36 then
        local v37 = l_getAncestors_0(v36);
        local v38 = {};
        for v39 = #v37, 1, -1 do
            local v40 = v37[v39];
            local v41 = v33._eventMapByInstance[v40];
            if v41 then
                for v42, v43 in v41 do
                    v38[v42] = v43;
                    v35[v42] = nil;
                end;
            end;
            local v44 = v33._eventPropagationService:getRegisteredEventHandlers(v40);
            if v44 then
                for v45, v46 in v38 do
                    if v44[v46] then
                        v35[v45] = v46;
                    end;
                end;
            end;
        end;
    end;
    local v47 = v33.activeEventMap:getValue();
    if not l_shallowEqual_0(v47, v35) then
        if v34 then
            for v48, v49 in v47 do
                if not v35[v48] then
                    v33:_cancelHandler(v34, v49);
                end;
            end;
        end;
        v33._fireActiveEventMapSignal(v35);
    end;
end;
v9.registerEventMap = function(v50, v51, v52) --[[ Line: 246 ]] --[[ Name: registerEventMap ]]
    -- upvalues: l_mockableWarn_0 (copy)
    local v53 = v50._eventMapByInstance[v51] or {};
    for v54, v55 in v52 do
        if v53[v54] and v53[v54] ~= v55 and _G.__DEV__ then
            l_mockableWarn_0(string.format("New event will replace existing registered event mapped to %s:\n\t     new event: %s\n\texisting event: %s", tostring(v54), v55, v53[v54]));
        end;
        v53[v54] = v55;
    end;
    v50._eventMapByInstance[v51] = v53;
    v50:_updateActiveEventMap();
end;
v9.deregisterEventMap = function(v56, v57, v58) --[[ Line: 268 ]] --[[ Name: deregisterEventMap ]]
    -- upvalues: l_mockableWarn_0 (copy)
    local v59 = v56._eventMapByInstance[v57] or {};
    for v60, v61 in v58 do
        if v59[v60] == v61 then
            v59[v60] = nil;
        elseif _G.__DEV__ then
            l_mockableWarn_0(string.format("Cannot deregister non-matching event input %s:\n\t  provided event: %s\n\tregistered event: %s", tostring(v60), v61, v59[v60]));
        end;
    end;
    v56._eventMapByInstance[v57] = v59;
    v56:_updateActiveEventMap(v56.focusedGuiObject:getValue());
end;
v9.registerEventHandler = function(v62, v63, v64, v65, v66) --[[ Line: 291 ]] --[[ Name: registerEventHandler ]]
    v62._eventPropagationService:registerEventHandler(v63, v64, v65, v66);
    v62:_updateActiveEventMap();
end;
v9.deregisterEventHandler = function(v67, v68, v69, v70, v71) --[[ Line: 301 ]] --[[ Name: deregisterEventHandler ]]
    v67:_cancelHandler(v68, v69);
    v67._eventPropagationService:deregisterEventHandler(v68, v69, v70, v71);
    v67:_updateActiveEventMap(v67.focusedGuiObject:getValue());
end;
v9.registerEventHandlers = function(v72, v73, v74) --[[ Line: 314 ]] --[[ Name: registerEventHandlers ]]
    v72._eventPropagationService:registerEventHandlers(v73, v74);
    v72:_updateActiveEventMap();
end;
v9.deregisterEventHandlers = function(v75, v76, v77) --[[ Line: 319 ]] --[[ Name: deregisterEventHandlers ]]
    for v78, _ in v77 do
        v75:_cancelHandler(v76, v78);
    end;
    v75._eventPropagationService:deregisterEventHandlers(v76, v77);
    v75:_updateActiveEventMap(v75.focusedGuiObject:getValue());
end;
v9.registerFocusBehavior = function(v80, v81, v82) --[[ Line: 330 ]] --[[ Name: registerFocusBehavior ]]
    -- upvalues: l_mockableWarn_0 (copy), v7 (copy)
    if _G.__DEV__ then
        local v83 = v80._focusBehaviorByInstance[v81];
        if v83 ~= nil then
            l_mockableWarn_0(string.format("New focus behavior will replace existing registered focus behavior:\n\t     new behavior: %s\n\texisting behavior: %s", tostring(v82), (tostring(v83.behavior))));
        end;
    end;
    local v90 = {
        behavior = v82, 
        connection = v81.SelectionChanged:Connect(function(v84, v85, v86) --[[ Line: 346 ]]
            -- upvalues: v81 (copy), v82 (copy), v7 (ref), v80 (copy)
            if v86 and (v84 or v86:IsDescendantOf(v81)) then
                if not v85 or not v85:IsDescendantOf(v81) then
                    local v87 = false;
                    for _, v89 in v82.getTargets() do
                        if v7(v89) then
                            v80:focusGuiObject(v89, false);
                            v87 = true;
                            break;
                        end;
                    end;
                    if not v87 and v82.onDescendantFocusChanged then
                        v82.onDescendantFocusChanged(v86);
                        return;
                    end;
                elseif v82.onDescendantFocusChanged then
                    v82.onDescendantFocusChanged(v86);
                end;
            end;
        end)
    };
    v80._focusBehaviorByInstance[v81] = v90;
end;
v9.deregisterFocusBehavior = function(v91, v92, v93) --[[ Line: 384 ]] --[[ Name: deregisterFocusBehavior ]]
    -- upvalues: l_mockableWarn_0 (copy)
    local v94 = v91._focusBehaviorByInstance[v92];
    if _G.__DEV__ then
        if not v94 then
            l_mockableWarn_0(string.format("Cannot deregister an unregistered focus behavior:\n\t  provided behavior: %s", (tostring(v93))));
        end;
        if v94 and v94.behavior ~= v93 then
            l_mockableWarn_0(string.format("Cannot deregister non-matching focus behavior:\n\t  provided behavior: %s\n\tregistered behavior: %s", tostring(v93), (tostring(v94.behavior))));
        end;
    end;
    if v94 then
        v94.connection:Disconnect();
        v91._focusBehaviorByInstance[v92] = nil;
    end;
end;
v9.focusGuiObject = function(v95, v96, v97) --[[ Line: 413 ]] --[[ Name: focusGuiObject ]]
    if v97 then
        v95._silentBlurTarget = v95._engineInterface.getSelection();
        v95._silentFocusTarget = v96;
    else
        v95._silentBlurTarget = nil;
        v95._silentFocusTarget = nil;
    end;
    v95._engineInterface.setSelection(v96);
end;
v9.teardown = function(v98) --[[ Line: 428 ]] --[[ Name: teardown ]]
    for _, v100 in v98._engineEventConnections do
        v100:Disconnect();
    end;
    for _, v102 in v98._focusBehaviorByInstance do
        v102.connection:Disconnect();
    end;
end;
v9.canDispatchEvent = function(v103, v104, v105) --[[ Line: 437 ]] --[[ Name: canDispatchEvent ]]
    -- upvalues: l_getAncestors_0 (copy)
    if not v105 then
        return false;
    else
        for _, v107 in (l_getAncestors_0(v105)) do
            local v108 = v103._eventMapByInstance[v107];
            if v108 then
                for _, v110 in v108 do
                    if v110 == v104 then
                        local v111 = v103._eventPropagationService:getRegisteredEventHandlers(v107);
                        if v111 and v111[v104] then
                            return true;
                        end;
                    end;
                end;
            end;
        end;
        return false;
    end;
end;
v9.dispatchSyntheticEvent = function(v112, v113, v114, v115) --[[ Line: 462 ]] --[[ Name: dispatchSyntheticEvent ]]
    -- upvalues: l_mockableWarn_0 (copy)
    if not v114 then
        if _G.__DEV__ then
            l_mockableWarn_0("dispatchSyntheticEvent: No target object");
        end;
        return false;
    elseif not v112:canDispatchEvent(v113, v114) then
        if _G.__DEV__ then
            l_mockableWarn_0("dispatchSyntheticEvent: Cannot dispatch event \"" .. v113 .. "\" on target");
        end;
        return false;
    else
        v112._eventPropagationService:propagateEvent(v114, v113, v115, {
            synthetic = true, 
            silent = false
        });
        return true;
    end;
end;
return v9;