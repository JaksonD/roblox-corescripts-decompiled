local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(script.Parent.Input);
local v3 = require(script.Parent.createSignal);
local v4 = require(script.Parent.debugPrint);
local v5 = require(script.Parent.FocusControllerInternalApi);
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v6 (copy)
    return (setmetatable({
        selectionChangedSignal = v3(), 
        boundInputsChangedSignal = v3(), 
        focusNodeTree = {}, 
        allNodes = {}, 
        rootRef = nil, 
        engineInterface = nil, 
        captureFocusOnInitialize = false, 
        moveFocusToOnInitialize = nil, 
        inputDisconnectors = {}, 
        boundInputs = {}, 
        focusedLeaf = nil, 
        inProgressFocus = nil
    }, v6));
end;
v6.isInitialized = function(v7) --[[ Line: 37 ]] --[[ Name: isInitialized ]]
    return v7.engineInterface ~= nil;
end;
v6.moveFocusTo = function(v8, v9) --[[ Line: 41 ]] --[[ Name: moveFocusTo ]]
    -- upvalues: v4 (copy)
    if v8.engineInterface == nil then
        v8.moveFocusToOnInitialize = v9;
        return;
    else
        v4("[FOCUS] Move focus to", v9);
        local v10 = v8.allNodes[v9];
        if v10 ~= nil and not v8:isNodeFocused(v10) then
            v10:focus();
        end;
        v8:debugPrintTree();
        return;
    end;
end;
v6.moveFocusToNeighbor = function(v11, v12) --[[ Line: 56 ]] --[[ Name: moveFocusToNeighbor ]]
    -- upvalues: v4 (copy)
    if v11.engineInterface == nil then
        error("FocusController is not connected to a component hierarchy!", 2);
    end;
    if v11.focusedLeaf ~= nil then
        v4("[FOCUS] Move focus to", v12, "from", v11.focusedLeaf.ref);
        local v13 = v11.focusedLeaf.ref:getValue();
        if v13 ~= nil and v13[v12] ~= nil then
            v11:setSelection(v13[v12]);
        end;
    end;
end;
v6.getSelection = function(v14) --[[ Line: 70 ]] --[[ Name: getSelection ]]
    return v14.engineInterface.getSelection();
end;
v6.setSelection = function(v15, v16) --[[ Line: 74 ]] --[[ Name: setSelection ]]
    v15.engineInterface.setSelection(v16);
end;
v6.registerNode = function(v17, v18, v19, v20) --[[ Line: 78 ]] --[[ Name: registerNode ]]
    -- upvalues: v4 (copy)
    if v18 ~= nil then
        v4("[TREE ] Registering child node", v19);
        local v21 = v17.focusNodeTree[v18] or {};
        v21[v19] = v20;
        v17.focusNodeTree[v18] = v21;
        v17.allNodes[v19] = v20;
        v17:descendantAddedRefocus();
        return;
    else
        v4("[TREE ] Registering root node", v19);
        v17.rootRef = v19;
        v17.allNodes[v19] = v20;
        if v17.captureFocusOnRootRegistered then
            v17.captureFocusOnRootRegistered = false;
            v17:captureFocus();
        end;
        return;
    end;
end;
v6.deregisterNode = function(v22, v23, v24) --[[ Line: 103 ]] --[[ Name: deregisterNode ]]
    -- upvalues: v4 (copy)
    if v23 ~= nil then
        v4("[TREE ] Deregistering child node", v24);
        v22.focusNodeTree[v23][v24] = nil;
        v22.allNodes[v24] = nil;
        v22:descendantRemovedRefocus();
        return;
    else
        v4("[TREE ] Deregistering root node", v24);
        v22.allNodes[v24] = nil;
        return;
    end;
end;
v6.needsDescendantRemovedRefocus = function(v25) --[[ Line: 119 ]] --[[ Name: needsDescendantRemovedRefocus ]]
    if v25.focusedLeaf == nil then
        return;
    else
        return v25.focusedLeaf.ref:getValue() == nil;
    end;
end;
v6.descendantRemovedRefocus = function(v26) --[[ Line: 132 ]] --[[ Name: descendantRemovedRefocus ]]
    -- upvalues: v4 (copy)
    if v26:needsDescendantRemovedRefocus() then
        v4("[FOCUS] Focused node was removed; refocusing from nearest existing ancestor");
        local l_parent_0 = v26.focusedLeaf.parent;
        while l_parent_0 ~= nil and v26.allNodes[l_parent_0.ref] == nil do
            l_parent_0 = l_parent_0.parent;
        end;
        if l_parent_0 ~= nil then
            l_parent_0:focus();
        end;
    end;
end;
v6.needsDescendantAddedRefocus = function(v28) --[[ Line: 149 ]] --[[ Name: needsDescendantAddedRefocus ]]
    -- upvalues: v1 (copy)
    if v28.focusedLeaf == nil then
        return nil;
    else
        return not v1.isEmpty(v28:getChildren(v28.focusedLeaf));
    end;
end;
v6.descendantAddedRefocus = function(v29) --[[ Line: 162 ]] --[[ Name: descendantAddedRefocus ]]
    -- upvalues: v4 (copy)
    if v29:needsDescendantAddedRefocus() then
        v4("[FOCUS] Currently-focused node is no longer a leaf; refocusing", v29.focusedLeaf.ref);
        v29.focusedLeaf:focus();
    end;
end;
v6.getChildren = function(v30, v31) --[[ Line: 171 ]] --[[ Name: getChildren ]]
    return v30.focusNodeTree[v31] or {};
end;
v6.isNodeFocused = function(v32, v33) --[[ Line: 175 ]] --[[ Name: isNodeFocused ]]
    if v32.focusedLeaf == nil then
        return false;
    elseif v32.focusedLeaf == v33 then
        return true;
    else
        local l_parent_1 = v32.focusedLeaf.parent;
        while true do
            if l_parent_1 ~= nil then
                if l_parent_1 == v33 then
                    return true;
                else
                    l_parent_1 = l_parent_1.parent;
                end;
            else
                return false;
            end;
        end;
    end;
end;
v6.setFocusedLeaf = function(v35, v36) --[[ Line: 198 ]] --[[ Name: setFocusedLeaf ]]
    v35.focusedLeaf = v36;
end;
v6.setInProgressFocus = function(v37, v38) --[[ Line: 202 ]] --[[ Name: setInProgressFocus ]]
    v37.inProgressFocus = v38;
end;
v6.isInProgressFocus = function(v39, v40) --[[ Line: 206 ]] --[[ Name: isInProgressFocus ]]
    return v39.inProgressFocus == v40;
end;
v6.debugPrintTree = function(v41) --[[ Line: 211 ]] --[[ Name: debugPrintTree ]]
    -- upvalues: v4 (copy)
    if not v4.isEnabled then
        return;
    else
        local function v42(v43, v44) --[[ Line: 216 ]] --[[ Name: recursePrintTree ]]
            -- upvalues: v41 (copy), v4 (ref), v42 (copy)
            local v45 = tostring(v43.ref);
            if v41:isNodeFocused(v43) then
                v45 = v45 .. "*";
            end;
            v4(v44, v45);
            local v46 = v41:getChildren(v43);
            for _, v48 in pairs(v46) do
                v42(v48, v44 .. "  ");
            end;
        end;
        v4("Focus Node Tree:");
        v42(v41.allNodes[v41.rootRef], "  ");
        return;
    end;
end;
v6.updateInputBindings = function(v49) --[[ Line: 236 ]] --[[ Name: updateInputBindings ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v50 = {};
    local l_focusedLeaf_0 = v49.focusedLeaf;
    while l_focusedLeaf_0 ~= nil do
        for _, v53 in pairs(l_focusedLeaf_0.inputBindings) do
            local v54 = v2.getUniqueKey(v53);
            if v50[v54] == nil then
                v4("[INPUT] Bind input", v54);
                v50[v54] = v53;
            end;
        end;
        l_focusedLeaf_0 = l_focusedLeaf_0.parent;
    end;
    for _, v56 in pairs(v49.inputDisconnectors) do
        v56();
    end;
    v49.inputDisconnectors = {};
    v49.boundInputs = {};
    for v57, v58 in pairs(v50) do
        v49.inputDisconnectors[v57] = v2.connectToEvent(v58, v49.engineInterface);
        if v58.keyCode then
            v49.boundInputs[v58.keyCode] = v58.meta or {};
        end;
    end;
    v49.boundInputsChangedSignal:fire(v49.boundInputs);
end;
v6.initialize = function(v59, v60) --[[ Line: 271 ]] --[[ Name: initialize ]]
    -- upvalues: v4 (copy)
    if v59.engineInterface ~= nil then
        error("FocusController cannot be initialized more than once; make sure you are not passing it to multiple components");
    end;
    v59.engineInterface = v60;
    v59.guiServiceConnection = v60.subscribeToSelectionChanged(function() --[[ Line: 284 ]]
        -- upvalues: v59 (copy), v60 (copy), v4 (ref)
        if v59.rootRef == nil then
            return;
        else
            local v61 = v59.focusedLeaf ~= nil;
            v59.focusedLeaf = nil;
            local v62 = v60.getSelection();
            local v63 = v59.rootRef:getValue();
            if v62 ~= nil and (v63 == v62 or v62:IsDescendantOf(v63)) then
                v4("[EVENT] Selection changed to", v62, "in focus hierarchy beginning at", v63);
                for v64, v65 in pairs(v59.allNodes) do
                    if v62 == v64:getValue() then
                        v59.focusedLeaf = v65;
                        break;
                    end;
                end;
            end;
            if v59.focusedLeaf ~= nil or v61 then
                v59.selectionChangedSignal:fire();
                v59:updateInputBindings();
            end;
            return;
        end;
    end);
    if v59.captureFocusOnInitialize then
        v59:captureFocus();
    end;
    if v59.moveFocusToOnInitialize then
        v59:moveFocusTo(v59.moveFocusToOnInitialize);
    end;
end;
v6.captureFocus = function(v66) --[[ Line: 344 ]] --[[ Name: captureFocus ]]
    if v66.engineInterface == nil then
        v66.captureFocusOnInitialize = true;
        return;
    elseif v66.rootRef == nil then
        v66.captureFocusOnRootRegistered = true;
        return;
    else
        v66.allNodes[v66.rootRef]:focus();
        v66:debugPrintTree();
        return;
    end;
end;
v6.releaseFocus = function(v67) --[[ Line: 355 ]] --[[ Name: releaseFocus ]]
    if v67.engineInterface ~= nil then
        v67.engineInterface.setSelection(nil);
    end;
    v67.captureFocusOnInitialize = false;
    v67.captureFocusOnRootRegistered = false;
end;
v6.teardown = function(v68) --[[ Line: 363 ]] --[[ Name: teardown ]]
    if v68.guiServiceConnection ~= nil then
        v68.guiServiceConnection:Disconnect();
    end;
    for _, v70 in pairs(v68.inputDisconnectors) do
        v70();
    end;
    v68.rootRef = nil;
    v68.engineInterface = nil;
    v68.captureFocusOnInitialize = false;
    v68.captureFocusOnRootRegistered = false;
    v68.focusedLeaf = nil;
end;
v6.subscribeToSelectionChange = function(v71, v72) --[[ Line: 382 ]] --[[ Name: subscribeToSelectionChange ]]
    -- upvalues: v4 (copy)
    v4("[TREE ] New subscription to selection change event");
    return v71.selectionChangedSignal:subscribe(v72);
end;
v6.createPublicApiWrapper = function() --[[ Line: 389 ]] --[[ Name: createPublicApiWrapper ]]
    -- upvalues: v6 (copy), v5 (copy)
    local v73 = v6.new();
    return {
        [v5] = v73, 
        moveFocusTo = function(...) --[[ Line: 394 ]] --[[ Name: moveFocusTo ]]
            -- upvalues: v73 (copy)
            v73:moveFocusTo(...);
        end, 
        moveFocusLeft = function() --[[ Line: 397 ]] --[[ Name: moveFocusLeft ]]
            -- upvalues: v73 (copy)
            v73:moveFocusToNeighbor("NextSelectionLeft");
        end, 
        moveFocusRight = function() --[[ Line: 400 ]] --[[ Name: moveFocusRight ]]
            -- upvalues: v73 (copy)
            v73:moveFocusToNeighbor("NextSelectionRight");
        end, 
        moveFocusUp = function() --[[ Line: 403 ]] --[[ Name: moveFocusUp ]]
            -- upvalues: v73 (copy)
            v73:moveFocusToNeighbor("NextSelectionUp");
        end, 
        moveFocusDown = function() --[[ Line: 406 ]] --[[ Name: moveFocusDown ]]
            -- upvalues: v73 (copy)
            v73:moveFocusToNeighbor("NextSelectionDown");
        end, 
        captureFocus = function() --[[ Line: 409 ]] --[[ Name: captureFocus ]]
            -- upvalues: v73 (copy)
            v73:captureFocus();
        end, 
        releaseFocus = function() --[[ Line: 412 ]] --[[ Name: releaseFocus ]]
            -- upvalues: v73 (copy)
            v73:releaseFocus();
        end, 
        getCurrentFocus = function() --[[ Line: 415 ]] --[[ Name: getCurrentFocus ]]
            -- upvalues: v73 (copy)
            local l_focusedLeaf_1 = v73.focusedLeaf;
            return l_focusedLeaf_1 and l_focusedLeaf_1.ref or nil;
        end, 
        getBoundInputs = function() --[[ Line: 419 ]] --[[ Name: getBoundInputs ]]
            -- upvalues: v73 (copy)
            return v73.boundInputs;
        end, 
        subscribeToBoundInputsChanged = function(v75) --[[ Line: 422 ]] --[[ Name: subscribeToBoundInputsChanged ]]
            -- upvalues: v73 (copy)
            return v73.boundInputsChangedSignal:subscribe(v75);
        end
    };
end;
return v6;