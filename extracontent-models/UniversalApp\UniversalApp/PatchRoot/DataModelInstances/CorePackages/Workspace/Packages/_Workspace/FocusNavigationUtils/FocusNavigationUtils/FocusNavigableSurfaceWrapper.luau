local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
if require(l_Parent_0.SharedFlags).FFlagAppFocusWrapperRefactor then
    return (require(l_script_FirstAncestor_0.AppFocusRoot));
else
    local v2 = require(l_Parent_0.React);
    local v3 = require(l_Parent_0.ReactFocusNavigation);
    local v4 = require(l_Parent_0.Cryo);
    local v5 = require(l_Parent_0.Navigation);
    local _ = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
    local v7 = require(l_script_FirstAncestor_0.useFocusNavigableSurfaceRegistryConnection);
    local v8 = require(l_script_FirstAncestor_0.useDefaultFocusNavigationBindings);
    local v9 = {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        SelectionGroup = true
    };
    local v10 = {};
    local v11 = {
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop
    };
    local function _(v12, v13, v14) --[[ Line: 48 ]] --[[ Name: useWrappedFrameProps ]]
        -- upvalues: v2 (copy), v4 (copy), v11 (copy), v9 (copy)
        return v2.useMemo(function() --[[ Line: 50 ]]
            -- upvalues: v13 (copy), v12 (copy), v4 (ref), v11 (ref), v9 (ref), v14 (copy)
            local v15 = v13 or {};
            if v12 then
                v15 = v4.Dictionary.join(v11, v15);
            end;
            return v4.Dictionary.join(v9, v15, {
                ref = v14
            });
        end, {
            v12, 
            v13, 
            v14
        });
    end;
    return function(v17) --[[ Line: 72 ]] --[[ Name: FocusNavigableSurfaceWrapper ]]
        -- upvalues: v10 (copy), v2 (copy), v3 (copy), v8 (copy), v5 (copy), v7 (copy), v4 (copy), v11 (copy), v9 (copy)
        local v18 = v17.customEventHandlers or v10;
        local v19 = if v17.frameProps and v17.frameProps.ref then v17.frameProps.ref.current else nil;
        local v20 = nil;
        local _ = nil;
        local _ = nil;
        local v23, v24 = v2.useState(v19);
        v20 = v23;
        v23 = v3.useEventHandlerMap(v18, v24);
        v23 = v8(v23);
        v24 = v17.isFocusable;
        local v25 = v5.useNavigationFocus();
        v24 = (v24 == nil or v24) and (v25 == nil or v25);
        local l_v23_0 = v23;
        local v27 = v17.shouldRestoreFocus == nil or v17.shouldRestoreFocus;
        local v28 = v3.useMostRecentFocusBehavior(v23);
        if v27 then
            l_v23_0 = v28;
        end;
        v7(v20, v17.surfaceIdentifier, v24);
        local l_isIsolated_0 = v17.isIsolated;
        local l_frameProps_0 = v17.frameProps;
        local l_l_v23_0_0 = l_v23_0;
        local v33 = v2.useMemo(function() --[[ Line: 50 ]]
            -- upvalues: l_frameProps_0 (copy), l_isIsolated_0 (copy), v4 (ref), v11 (ref), v9 (ref), l_l_v23_0_0 (copy)
            local v32 = l_frameProps_0 or {};
            if l_isIsolated_0 then
                v32 = v4.Dictionary.join(v11, v32);
            end;
            return v4.Dictionary.join(v9, v32, {
                ref = l_l_v23_0_0
            });
        end, {
            l_isIsolated_0, 
            l_frameProps_0, 
            l_l_v23_0_0
        });
        return v2.createElement("Frame", v33, v17.children);
    end;
end;