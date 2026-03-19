local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(script.Parent.FocusControllerInternalApi);
local v3 = require(script.Parent.inputBindingsEqual);
local v4 = require(script.Parent.debugPrint);
local v5 = require(script.Parent.Config);
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v9 = nil;
    if v7.parentFocusNode ~= nil then
        v9 = v7.parentFocusNode.focusController;
    elseif v7.focusController ~= nil then
        v9 = v7.focusController;
    else
        error("Cannot create node without focus manager");
    end;
    local v10 = setmetatable({
        focusController = v9, 
        ref = v8, 
        lastFocused = nil
    }, v6);
    v10:updateNavProps(v7);
    return v10;
end;
v6.__getFocusControllerInternal = function(v11) --[[ Line: 40 ]] --[[ Name: __getFocusControllerInternal ]]
    -- upvalues: v2 (copy)
    return v11.focusController[v2];
end;
v6.__findDefaultChildNode = function(v12) --[[ Line: 44 ]] --[[ Name: __findDefaultChildNode ]]
    local v13 = 1e999;
    local v14 = nil;
    local v15 = v12:__getFocusControllerInternal():getChildren(v12);
    local v16 = v12.ref:getValue();
    for v17, v18 in pairs(v15) do
        local v19 = v17:getValue();
        while v19 ~= v16 and v19 ~= nil do
            if v19:isA("GuiObject") then
                local l_LayoutOrder_0 = v19.LayoutOrder;
                if l_LayoutOrder_0 ~= 0 then
                    if l_LayoutOrder_0 < v13 then
                        v13 = l_LayoutOrder_0;
                        v14 = v18;
                        break;
                    else
                        break;
                    end;
                end;
            end;
            v19 = v19.Parent;
        end;
    end;
    if v14 ~= nil then
        return v14;
    else
        for v21, v22 in pairs(v15) do
            if v21:getValue() ~= nil then
                return v22;
            end;
        end;
        return nil;
    end;
end;
v6.updateNavProps = function(v23, v24) --[[ Line: 98 ]] --[[ Name: updateNavProps ]]
    -- upvalues: v3 (copy)
    local v25 = false;
    if v24.restorePreviousChildFocus ~= nil then
        v25 = v24.restorePreviousChildFocus;
    end;
    local l_inputBindings_0 = v23.inputBindings;
    v23.defaultChildRef = v24.defaultChild;
    v23.restorePreviousChildFocus = v25;
    v23.inputBindings = v24.inputBindings or {};
    local v27 = v23:__getFocusControllerInternal();
    if v27:isNodeFocused(v23) and not v3(l_inputBindings_0, v23.inputBindings) then
        v27:updateInputBindings();
    end;
end;
v6.focus = function(v28) --[[ Line: 116 ]] --[[ Name: focus ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (copy)
    if not v5.Enabled then
        return;
    else
        local v29 = v28:__getFocusControllerInternal();
        if not v29:isInitialized() then
            return;
        else
            v29:setInProgressFocus(v28);
            local v30 = v29:getChildren(v28);
            if v1.isEmpty(v30) then
                v29:setSelection(v28.ref:getValue());
                return;
            else
                local v31 = os.clock();
                local v32 = false;
                if v28.defaultChildRef ~= nil then
                    v32 = false;
                    if v29.allNodes[v28.defaultChildRef] ~= nil then
                        v32 = v28.defaultChildRef:getValue() ~= nil;
                    end;
                end;
                local v33 = true;
                if v28.timeout ~= nil then
                    v33 = v31 < v28.timeout;
                end;
                if v28.restorePreviousChildFocus and v28.lastFocused ~= nil and v28.lastFocused:getValue() then
                    v4("[FOCUS] Restore previous focus:", v28.lastFocused);
                    v29:moveFocusTo(v28.lastFocused);
                    return;
                elseif v28.defaultChildRef and (v33 or v32) then
                    if v32 then
                        v4("[FOCUS] Found valid default child", v28.defaultChildRef, "for", v28.ref);
                        v28.timeout = nil;
                        v29:moveFocusTo(v28.defaultChildRef);
                        return;
                    else
                        if v28.timeout == nil then
                            v4("[FOCUS] Default child specified is not valid. Wait for it to be assigned...");
                            v28.timeout = v31 + 0.5;
                        end;
                        task.delay(0, function() --[[ Line: 155 ]]
                            -- upvalues: v29 (copy), v28 (copy)
                            if v29:isInProgressFocus(v28) then
                                v28:focus();
                            end;
                        end);
                        return;
                    end;
                else
                    if v28.timeout ~= nil then
                        v4("[FOCUS] Timeout for default child of", v28.ref);
                        v28.timeout = nil;
                    end;
                    local v34 = v28:__findDefaultChildNode();
                    if v34 ~= nil then
                        v4("[FOCUS] No default, use fallback logic to focus", v34.ref);
                        v34:focus();
                        return;
                    else
                        v29:setFocusedLeaf(v28);
                        v29:setInProgressFocus(nil);
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
v6.attachToTree = function(v35, v36, v37) --[[ Line: 180 ]] --[[ Name: attachToTree ]]
    -- upvalues: v1 (copy)
    local v38 = v35:__getFocusControllerInternal();
    v38:registerNode(v36, v35.ref, v35);
    v35.parent = v36;
    v35.disconnectSelectionListener = v38:subscribeToSelectionChange(function() --[[ Line: 185 ]]
        -- upvalues: v38 (copy), v35 (copy), v37 (copy), v1 (ref)
        local v39 = v38:isNodeFocused(v35);
        v37(v39);
        if v35.parent ~= nil and v39 then
            v35.parent.lastFocused = v35.ref;
        end;
        local v40 = v38:getChildren(v35);
        if not v1.isEmpty(v40) and v39 and v38:getSelection() == v35.ref:getValue() then
            v35:focus();
        end;
    end);
end;
v6.detachFromTree = function(v41) --[[ Line: 209 ]] --[[ Name: detachFromTree ]]
    v41:__getFocusControllerInternal():deregisterNode(v41.parent, v41.ref);
    if v41.disconnectSelectionListener ~= nil then
        v41.disconnectSelectionListener();
        v41.disconnectSelectionListener = nil;
    end;
end;
return v6;