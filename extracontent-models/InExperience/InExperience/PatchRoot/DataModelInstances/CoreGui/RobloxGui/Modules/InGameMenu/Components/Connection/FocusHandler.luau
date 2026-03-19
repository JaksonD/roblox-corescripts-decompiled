local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_Cryo_0 = v1.Cryo;
local v5 = require(script.Parent.Parent.Parent.Flags.GetFFlagIGMGamepadSelectionHistory);
local v6 = require(script.Parent.FocusHandlerUtils.FocusHandlerContext);
local v7 = 1;
local v8 = l_Roact_0.PureComponent:extend("FocusHandler");
v8.validateProps = l_t_0.strictInterface({
    isFocused = l_t_0.boolean, 
    didFocus = l_t_0.optional(l_t_0.callback), 
    didBlur = l_t_0.optional(l_t_0.callback), 
    shouldForgetPreviousSelection = v5() and l_t_0.optional(l_t_0.boolean) or nil, 
    currentHandlerId = v5() and l_t_0.optional(l_t_0.number) or nil, 
    candidateHandlerId = v5() and l_t_0.optional(l_t_0.number) or nil, 
    previousSelections = v5() and l_t_0.table or nil, 
    requestFocusForHandlerId = v5() and l_t_0.callback or nil, 
    forgetLastSelectionForHandlerId = v5() and l_t_0.callback or nil, 
    blurCurrentFocusHandler = v5() and l_t_0.callback or nil, 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table)
});
if v5() then
    v8.init = function(v9) --[[ Line: 50 ]] --[[ Name: init ]]
        -- upvalues: v7 (ref)
        v9.id = v7;
        v7 = v7 + 1;
    end;
end;
v8.render = function(v10) --[[ Line: 56 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createFragment(v10.props[l_Roact_0.Children]);
end;
if v5() then
    v8.didMount = function(v11) --[[ Line: 61 ]] --[[ Name: didMount ]]
        if v11.props.isFocused then
            v11.props.requestFocusForHandlerId(v11.id);
        end;
    end;
else
    v8.didMount = function(v12) --[[ Line: 67 ]] --[[ Name: didMount ]]
        if v12.props.isFocused then
            v12.props.didFocus();
        end;
    end;
end;
if v5() then
    v8.didUpdate = function(v13, v14) --[[ Line: 75 ]] --[[ Name: didUpdate ]]
        local v15 = v13.props.shouldForgetPreviousSelection and not v14.shouldForgetPreviousSelection;
        local v16 = v13.props.previousSelections[v13.id];
        if v15 or v16 ~= nil and not v16:IsDescendantOf(game) then
            v13.props.forgetLastSelectionForHandlerId(v13.id);
            v16 = nil;
        end;
        local v17 = false;
        if v13.props.candidateHandlerId ~= v13.id then
            v17 = v13.props.candidateHandlerId ~= nil;
        end;
        local v18 = false;
        if v14.candidateHandlerId ~= v13.id then
            v18 = v14.candidateHandlerId ~= nil;
        end;
        local v19 = false;
        if v13.props.currentHandlerId == v13.id then
            v19 = v14.currentHandlerId ~= v13.id;
        end;
        local v20 = false;
        if v13.props.currentHandlerId == nil then
            v20 = false;
            if v14.currentHandlerId ~= nil then
                v20 = v14.currentHandlerId ~= v13.id;
            end;
        end;
        local v21 = v20 and not v17 and v13.props.isFocused;
        local v22 = not v14.isFocused and v13.props.isFocused;
        local v23 = v14.isFocused and not v13.props.isFocused or v17 and not v18;
        local v24 = false;
        if v14.currentHandlerId == v13.id then
            v24 = v13.props.currentHandlerId ~= v13.id;
        end;
        if v22 or v21 then
            v13.props.requestFocusForHandlerId(v13.id);
        elseif v19 and v13.props.didFocus then
            v13.props.didFocus(v16);
        end;
        if v23 and v13.props.currentHandlerId == v13.id then
            v13.props.blurCurrentFocusHandler(v13.id, v13.props.shouldForgetPreviousSelection);
        end;
        if v24 and v13.props.didBlur then
            v13.props.didBlur();
        end;
    end;
else
    v8.didUpdate = function(v25, v26) --[[ Line: 135 ]] --[[ Name: didUpdate ]]
        if v25.props.isFocused and not v26.isFocused and v25.props.didFocus then
            v25.props.didFocus();
            return;
        else
            if not v25.props.isFocused and v26.isFocused and v25.props.didBlur then
                v25.props.didBlur();
            end;
            return;
        end;
    end;
end;
if v5() then
    v8.willUnmount = function(v27) --[[ Line: 145 ]] --[[ Name: willUnmount ]]
        if v27.props.isFocused then
            v27.props.blurCurrentFocusHandler(v27.id, true);
            if v27.props.didBlur then
                v27.props.didBlur();
                return;
            end;
        else
            v27.props.forgetLastSelectionForHandlerId(v27.id);
        end;
    end;
else
    v8.willUnmount = function(v28) --[[ Line: 156 ]] --[[ Name: willUnmount ]]
        if v28.props.isFocused and v28.props.didBlur then
            v28.props.didBlur();
        end;
    end;
end;
if v5() then
    return function(v29) --[[ Line: 164 ]] --[[ Name: FocusHandlerWithContext ]]
        -- upvalues: l_Roact_0 (copy), v6 (copy), v8 (copy), l_Cryo_0 (copy)
        return l_Roact_0.createElement(v6.Consumer, {
            render = function(v30) --[[ Line: 166 ]] --[[ Name: render ]]
                -- upvalues: l_Roact_0 (ref), v8 (ref), l_Cryo_0 (ref), v29 (copy)
                return l_Roact_0.createElement(v8, l_Cryo_0.Dictionary.join(v29, {
                    currentHandlerId = v30.currentHandlerId, 
                    previousSelections = v30.previousSelections, 
                    requestFocusForHandlerId = v30.requestFocusForHandlerId, 
                    forgetLastSelectionForHandlerId = v30.forgetLastSelectionForHandlerId, 
                    blurCurrentFocusHandler = v30.blurCurrentFocusHandler, 
                    candidateHandlerId = v30.candidateHandlerId
                }));
            end
        });
    end;
else
    return v8;
end;