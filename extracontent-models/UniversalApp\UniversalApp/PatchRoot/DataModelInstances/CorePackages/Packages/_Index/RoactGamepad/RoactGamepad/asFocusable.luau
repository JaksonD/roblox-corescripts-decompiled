local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.FocusContext);
local v5 = require(script.Parent.FocusNode);
local v6 = require(script.Parent.getEngineInterface);
local v7 = require(script.Parent.FocusControllerInternalApi);
local v8 = {
    parentFocusNode = v2.None, 
    parentNeighbors = v2.None, 
    focusController = v2.None, 
    onFocusGained = v2.None, 
    onFocusLost = v2.None, 
    onFocusChanged = v2.None, 
    inputBindings = v2.None, 
    innerRef = v2.None, 
    restorePreviousChildFocus = v2.None, 
    defaultChild = v2.None
};
local v9 = {};
local v11 = v3.intersection(v3.interface({
    parentFocusNode = v3.optional(v3.table), 
    focusController = v3.optional(v3.table), 
    innerRef = v3.optional(v3.table), 
    restorePreviousChildFocus = v3.boolean, 
    inputBindings = v3.table, 
    defaultChild = v3.optional(v3.table), 
    onFocusGained = v3.optional(v3.callback), 
    onFocusLost = v3.optional(v3.callback), 
    onFocusChanged = v3.optional(v3.callback)
}), function(v10) --[[ Line: 34 ]] --[[ Name: checkFocusManager ]]
    if v10.focusController ~= nil and v10.parentFocusNode ~= nil then
        return false, "Cannot attach a new focusController beneath an existing one";
    else
        return true;
    end;
end);
local v12 = {
    restorePreviousChildFocus = false, 
    inputBindings = {}
};
return function(v13) --[[ Line: 69 ]] --[[ Name: asFocusable ]]
    -- upvalues: v1 (copy), v11 (copy), v12 (copy), v9 (copy), v5 (copy), v6 (copy), v7 (copy), v2 (copy), v8 (copy), v4 (copy)
    local v14 = ("Focusable(%s)"):format((tostring(v13)));
    local v15 = v1.Component:extend(v14);
    v15.validateProps = v11;
    v15.defaultProps = v12;
    v15.init = function(v16) --[[ Line: 79 ]] --[[ Name: init ]]
        -- upvalues: v1 (ref), v9 (ref), v5 (ref), v6 (ref)
        v16.focused = false;
        v16.defaultRef = v1.createRef();
        local v17 = v16.props.parentNeighbors or v9;
        v16:setState({
            focusNode = v5.new(v16.props, v16:getRef()), 
            parentNeighbors = v17, 
            neighbors = {
                NextSelectionLeft = v16.props.NextSelectionLeft or v17.NextSelectionLeft, 
                NextSelectionRight = v16.props.NextSelectionRight or v17.NextSelectionRight, 
                NextSelectionUp = v16.props.NextSelectionUp or v17.NextSelectionUp, 
                NextSelectionDown = v16.props.NextSelectionDown or v17.NextSelectionDown
            }, 
            needsDescendantAddedRefocusCounter = 0, 
            needsDescendantRemovedRefocusCounter = 0
        });
        v16.updateFocusedState = function(v18) --[[ Line: 97 ]]
            -- upvalues: v16 (copy)
            if not v16.focused and v18 then
                v16:gainFocus();
                return;
            else
                if v16.focused and not v18 then
                    v16:loseFocus();
                end;
                return;
            end;
        end;
        if v16:isRoot() then
            local v19 = false;
            do
                local l_v19_0 = v19;
                v16.ancestryChanged = function(v21) --[[ Line: 111 ]]
                    -- upvalues: l_v19_0 (ref), v16 (copy), v6 (ref)
                    if not l_v19_0 and v21:IsDescendantOf(game) then
                        l_v19_0 = true;
                        v16:getFocusControllerInternal():initialize(v6(v21));
                    end;
                end;
                v16.ancestryChangedListener = function(v22) --[[ Line: 121 ]]
                    -- upvalues: v16 (copy), v1 (ref)
                    v16.ancestryChanged(v22);
                    local v23 = v16.props[v1.Event.AncestryChanged];
                    if v23 ~= nil then
                        v23(v22);
                    end;
                end;
                v16.refreshFocusOnDescendantAdded = function(v24) --[[ Line: 130 ]]
                    -- upvalues: v16 (copy), v1 (ref)
                    if v16:getFocusControllerInternal():needsDescendantAddedRefocus() then
                        v16:setState(function(v25) --[[ Line: 132 ]]
                            return {
                                needsDescendantAddedRefocusCounter = v25.needsDescendantAddedRefocusCounter + 1
                            };
                        end);
                    end;
                    local v26 = v16.props[v1.Event.DescendantAdded];
                    if v26 ~= nil then
                        v26(v24);
                    end;
                end;
                v16.refreshFocusOnDescendantRemoved = function(v27) --[[ Line: 145 ]]
                    -- upvalues: v16 (copy), v1 (ref)
                    if v16:getFocusControllerInternal():needsDescendantRemovedRefocus() then
                        v16:setState(function(v28) --[[ Line: 147 ]]
                            return {
                                needsDescendantRemovedRefocusCounter = v28.needsDescendantRemovedRefocusCounter + 1
                            };
                        end);
                    end;
                    local v29 = v16.props[v1.Event.DescendantRemoving];
                    if v29 ~= nil then
                        v29(v27);
                    end;
                end;
            end;
        end;
    end;
    v15.getDerivedStateFromProps = function(v30, v31) --[[ Line: 162 ]] --[[ Name: getDerivedStateFromProps ]]
        -- upvalues: v9 (ref)
        local v32 = v31.neighbors or v9;
        local v33 = v30.parentNeighbors or v9;
        local v34 = v30.NextSelectionLeft or v33.NextSelectionLeft;
        local v35 = v30.NextSelectionRight or v33.NextSelectionRight;
        local v36 = v30.NextSelectionUp or v33.NextSelectionUp;
        local v37 = v30.NextSelectionDown or v33.NextSelectionDown;
        if v34 ~= v32.NextSelectionLeft or v35 ~= v32.NextSelectionRight or v37 ~= v32.NextSelectionDown or v36 ~= v32.NextSelectionUp then
            return {
                parentNeighbors = v33, 
                neighbors = {
                    NextSelectionLeft = v34, 
                    NextSelectionRight = v35, 
                    NextSelectionUp = v36, 
                    NextSelectionDown = v37
                }
            };
        else
            return nil;
        end;
    end;
    v15.gainFocus = function(v38) --[[ Line: 195 ]] --[[ Name: gainFocus ]]
        v38.focused = true;
        if v38.props.onFocusGained ~= nil then
            v38.props.onFocusGained();
        end;
        if v38.props.onFocusChanged ~= nil then
            v38.props.onFocusChanged(true);
        end;
    end;
    v15.loseFocus = function(v39) --[[ Line: 207 ]] --[[ Name: loseFocus ]]
        v39.focused = false;
        if v39.props.onFocusLost ~= nil then
            v39.props.onFocusLost();
        end;
        if v39.props.onFocusChanged ~= nil then
            v39.props.onFocusChanged(false);
        end;
    end;
    v15.isRoot = function(v40) --[[ Line: 222 ]] --[[ Name: isRoot ]]
        local v41 = false;
        if v40.props.focusController ~= nil then
            v41 = v40.props.parentFocusNode == nil;
        end;
        return v41;
    end;
    v15.getFocusControllerInternal = function(v42) --[[ Line: 226 ]] --[[ Name: getFocusControllerInternal ]]
        -- upvalues: v7 (ref)
        return v42.state.focusNode.focusController[v7];
    end;
    v15.getRef = function(v43) --[[ Line: 230 ]] --[[ Name: getRef ]]
        return v43.props.innerRef or v43.defaultRef;
    end;
    v15.render = function(v44) --[[ Line: 234 ]] --[[ Name: render ]]
        -- upvalues: v1 (ref), v2 (ref), v8 (ref), v9 (ref), v4 (ref), v13 (copy)
        local v45 = v44:getRef();
        local v46 = {
            NextSelectionLeft = v45, 
            NextSelectionRight = v45, 
            NextSelectionDown = v45, 
            NextSelectionUp = v45, 
            [v1.Ref] = v45
        };
        local v47 = nil;
        if v44:isRoot() then
            local v48 = {
                [v1.Event.AncestryChanged] = v44.ancestryChangedListener, 
                [v1.Event.DescendantAdded] = v44.refreshFocusOnDescendantAdded, 
                [v1.Event.DescendantRemoving] = v44.refreshFocusOnDescendantRemoved
            };
            v47 = v2.Dictionary.join(v46, v44.props, v48, v8);
        else
            v47 = v2.Dictionary.join(v46, v44.props.parentNeighbors or v9, v44.props, v8);
        end;
        return v1.createElement(v4.Provider, {
            value = v44.state
        }, v1.createElement(v13, v47));
    end;
    v15.didMount = function(v49) --[[ Line: 272 ]] --[[ Name: didMount ]]
        v49.state.focusNode:attachToTree(v49.props.parentFocusNode, v49.updateFocusedState);
        if v49:isRoot() then
            v49.ancestryChanged(v49:getRef():getValue());
        end;
    end;
    v15.didUpdate = function(v50, _, v52) --[[ Line: 283 ]] --[[ Name: didUpdate ]]
        v50.state.focusNode:updateNavProps(v50.props);
        if (v50.props.innerRef or v50.defaultRef) ~= v50.state.focusNode.ref then
            error("Cannot change the ref passed to a Focusable component", 0);
        end;
        if v50.state.needsDescendantAddedRefocusCounter ~= v52.needsDescendantAddedRefocusCounter then
            v50:getFocusControllerInternal():descendantAddedRefocus();
        end;
        if v50.state.needsDescendantRemovedRefocusCounter ~= v52.needsDescendantRemovedRefocusCounter then
            v50:getFocusControllerInternal():descendantRemovedRefocus();
        end;
    end;
    v15.willUnmount = function(v53) --[[ Line: 305 ]] --[[ Name: willUnmount ]]
        v53.state.focusNode:detachFromTree();
        if v53:isRoot() then
            v53:getFocusControllerInternal():teardown();
        end;
    end;
    return v1.forwardRef(function(v54, v55) --[[ Line: 313 ]]
        -- upvalues: v1 (ref), v4 (ref), v2 (ref), v8 (ref), v13 (copy), v15 (copy)
        return v1.createElement(v4.Consumer, {
            render = function(v56) --[[ Line: 315 ]] --[[ Name: render ]]
                -- upvalues: v54 (copy), v2 (ref), v8 (ref), v1 (ref), v55 (copy), v13 (ref), v15 (ref)
                if v56 == nil and v54.focusController == nil then
                    local v57 = v2.Dictionary.join(v54, v8, {
                        [v1.Ref] = v55
                    });
                    return v1.createElement(v13, v57);
                else
                    local v58 = v2.Dictionary.join(v54, {
                        parentFocusNode = v56 and v56.focusNode or nil, 
                        parentNeighbors = v56 and v56.neighbors or nil, 
                        innerRef = v55
                    });
                    return v1.createElement(v15, v58);
                end;
            end
        });
    end);
end;