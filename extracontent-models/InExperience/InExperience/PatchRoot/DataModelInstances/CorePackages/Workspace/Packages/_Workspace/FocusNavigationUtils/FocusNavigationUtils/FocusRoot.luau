local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(script.Parent.useFocusRoot);
local v6 = require(l_script_FirstAncestor_0.BaseFocusRoot);
local v7 = require(script.Parent.FFlagFocusRootUseHooks);
local v8 = require(l_Parent_0.ReactFocusNavigation);
local _ = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v10 = require(l_script_FirstAncestor_0.useFocusNavigableSurfaceRegistryConnection);
local v11 = require(l_script_FirstAncestor_0.useAutoFocus);
local v12 = require(l_script_FirstAncestor_0.useDescendantHasFocus);
local v13 = require(l_script_FirstAncestor_0.useLastInputMode);
local v14 = {
    Size = UDim2.fromScale(1, 1), 
    BackgroundTransparency = 1, 
    SelectionGroup = true
};
local v15 = {};
local v16 = {
    SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
    SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
    SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
    SelectionBehaviorUp = Enum.SelectionBehavior.Stop
};
local function _(v17, v18, v19) --[[ Line: 43 ]] --[[ Name: useWrappedFrameProps ]]
    -- upvalues: v3 (copy), v15 (copy), v4 (copy), v16 (copy), v14 (copy)
    return v3.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v18 (copy), v15 (ref), v17 (copy), v4 (ref), v16 (ref), v14 (ref), v19 (copy)
        local v20 = v18 or v15;
        if v17 then
            v20 = v4.Dictionary.join(v16, v20);
        end;
        return v4.Dictionary.join(v14, v20, {
            ref = v19
        });
    end, {
        v17, 
        v18, 
        v19
    });
end;
return function(v22) --[[ Line: 74 ]] --[[ Name: FocusRoot ]]
    -- upvalues: v7 (copy), v5 (copy), v3 (copy), v6 (copy), v15 (copy), v8 (copy), v10 (copy), v12 (copy), v11 (copy), v13 (copy), l_GuiService_0 (copy), v4 (copy), v16 (copy), v14 (copy)
    if v7 then
        local v23 = v5(v22);
        return v3.createElement(v6, {
            ref = v23, 
            isIsolated = v22.isIsolated, 
            frameProps = v22.frameProps
        }, v22.children);
    else
        local v24 = if v22.frameProps and v22.frameProps.ref then v22.frameProps.ref.current else nil;
        local v25 = nil;
        local _ = nil;
        local v27 = nil;
        local v28, v29 = v3.useState(v24);
        v25 = v28;
        v27 = v29;
        v28 = v22.eventMap or v15;
        v29 = v8.useEventMap(v28, v27);
        local v30 = v22.eventHandlers or v15;
        local v31 = v8.useEventHandlerMap(v30, v29);
        local v32 = v22.isFocusable == nil or v22.isFocusable;
        local v33 = v22.shouldRestoreFocus == nil or v22.shouldRestoreFocus;
        local v34 = v8.useMostRecentFocusBehavior(v31);
        local v35 = if v33 then v34 else v31;
        v10(v25, v22.surfaceIdentifier, v32);
        local v36 = v12(v25);
        local v37 = v11({
            v25
        }, 0.1);
        local v38 = v13() == "Focus";
        local v39 = v22.isAutoFocusRoot and v32 and v38 and v25 and not v36;
        v3.useEffect(function() --[[ Line: 113 ]]
            -- upvalues: v39 (copy), v37 (copy)
            local v40 = nil;
            if v39 then
                v40 = v37();
            end;
            return function() --[[ Line: 118 ]]
                -- upvalues: v40 (ref)
                if v40 then
                    v40.cancel();
                end;
            end;
        end, {
            v39, 
            v37
        });
        local v41 = v3.useRef(v25);
        v3.useEffect(function() --[[ Line: 126 ]]
            -- upvalues: v25 (ref), v41 (copy)
            if v25 then
                v41.current = v25;
            end;
        end, {
            v25
        });
        v3.useEffect(function() --[[ Line: 132 ]]
            -- upvalues: v41 (copy), l_GuiService_0 (ref)
            return function() --[[ Line: 133 ]]
                -- upvalues: v41 (ref), l_GuiService_0 (ref)
                if not v41.current then
                    return;
                else
                    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
                    if not l_SelectedCoreObject_0 then
                        return;
                    else
                        if l_SelectedCoreObject_0:IsDescendantOf(v41.current) or not l_SelectedCoreObject_0:IsDescendantOf(game) then
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                        return;
                    end;
                end;
            end;
        end, {});
        local l_isIsolated_0 = v22.isIsolated;
        local l_frameProps_0 = v22.frameProps;
        local v46 = v3.useMemo(function() --[[ Line: 45 ]]
            -- upvalues: l_frameProps_0 (copy), v15 (ref), l_isIsolated_0 (copy), v4 (ref), v16 (ref), v14 (ref), v35 (copy)
            local v45 = l_frameProps_0 or v15;
            if l_isIsolated_0 then
                v45 = v4.Dictionary.join(v16, v45);
            end;
            return v4.Dictionary.join(v14, v45, {
                ref = v35
            });
        end, {
            l_isIsolated_0, 
            l_frameProps_0, 
            v35
        });
        return v3.createElement("Frame", v46, v22.children);
    end;
end;