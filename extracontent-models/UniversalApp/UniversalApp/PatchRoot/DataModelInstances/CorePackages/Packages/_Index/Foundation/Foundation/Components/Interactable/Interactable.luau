local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactIs);
local v5 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Utility.blendColors);
local v8 = require(script.Parent.getOriginalBackgroundStyle);
local v9 = require(script.Parent.getStateLayerStyle);
local v10 = require(l_script_FirstAncestor_0.Utility.joinBindables);
local v11 = require(l_script_FirstAncestor_0.Utility.mapBindable);
local v12 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v13 = require(l_script_FirstAncestor_0.Utility.Control.useGuiControlState);
local v14 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v15 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v16 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local _ = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local v18 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v19 = {
    component = "ImageButton", 
    isDisabled = false
};
local v20 = Color3.fromRGB(163, 162, 165);
return v3.memo(v3.forwardRef(function(v21, v22) --[[ Line: 50 ]] --[[ Name: Interactable ]]
    -- upvalues: v15 (copy), v19 (copy), v3 (copy), v14 (copy), v12 (copy), v18 (copy), v20 (copy), v8 (copy), v5 (copy), v16 (copy), v9 (copy), v7 (copy), v10 (copy), v4 (copy), v13 (copy), v11 (copy), v2 (copy)
    local v23 = v15(v21, v19);
    local v24 = v3.useRef(nil);
    local v25 = v14();
    local v26 = v12(v23.cursor);
    local v27, v28 = v3.useBinding(v18.Initialize);
    local v29 = v3.useRef(nil);
    local v33 = v3.useCallback(function(v30) --[[ Line: 58 ]]
        -- upvalues: v27 (copy), v18 (ref), v24 (copy), v20 (ref), v29 (copy), v28 (copy), v23 (copy)
        if v27:getValue() == v18.Default and v24.current ~= nil then
            local l_Styled_0 = v24.current:GetStyled("BackgroundColor3");
            local l_Styled_1 = v24.current:GetStyled("BackgroundTransparency");
            if l_Styled_0 ~= v20 or l_Styled_1 ~= 0 then
                v29.current = {
                    Color3 = l_Styled_0, 
                    Transparency = l_Styled_1
                };
            end;
        end;
        v28(v30);
        if v23.onStateChanged ~= nil then
            v23.onStateChanged(v30);
        end;
    end, {
        v23.onStateChanged
    });
    local v34 = v3.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: v8 (ref), v23 (copy)
        return v8(v23.BackgroundColor3, v23.BackgroundTransparency);
    end, {
        v23.BackgroundColor3, 
        v23.BackgroundTransparency
    });
    local v41 = v3.useCallback(function(v35, v36, v37, v38) --[[ Line: 80 ]]
        -- upvalues: v18 (ref), v5 (ref), v16 (ref), v23 (copy), v29 (copy), v9 (ref), v25 (copy), v7 (ref)
        if v35 == v18.Initialize or v35 == v18.Default or v35 == v18.Disabled or if v5.FoundationBindableStateLayer then v38 == v16.None else v23.stateLayer and v23.stateLayer.affordance == v16.None then
            return v36;
        else
            local v39 = {
                Color3 = v36.Color3, 
                Transparency = v36.Transparency
            };
            if v36.Color3 == nil then
                v39.Color3 = if v29.current then v29.current.Color3 else nil;
            end;
            if v36.Transparency == nil then
                v39.Transparency = if v29.current then v29.current.Transparency else nil;
            end;
            local v40 = if v5.FoundationBindableStateLayer then v9(v25, v37, v35) else v9(v25, v23.stateLayer, v35);
            return v7(v39, v40);
        end;
    end, {
        v25, 
        v23.BackgroundColor3, 
        v23.BackgroundTransparency, 
        if v5.FoundationBindableStateLayer then nil else v23.stateLayer
    });
    local v45 = v3.useMemo(function() --[[ Line: 130 ]]
        -- upvalues: v5 (ref), v10 (ref), v27 (copy), v34 (copy), v23 (copy), v41 (copy), v4 (ref), v3 (ref)
        if v5.FoundationBindableStateLayer then
            return v10({
                controlState = v27, 
                backgroundStyle = v34, 
                mode = if v23.stateLayer then v23.stateLayer.mode else nil, 
                affordance = if v23.stateLayer then v23.stateLayer.affordance else nil
            }, function(v42) --[[ Line: 137 ]]
                -- upvalues: v41 (ref)
                return v41(v42.controlState, v42.backgroundStyle, v42.mode, v42.affordance);
            end);
        elseif v4.isBinding(v34) then
            return v3.joinBindings({
                controlState = v27, 
                backgroundStyle = v34
            }):map(function(v43) --[[ Line: 150 ]]
                -- upvalues: v41 (ref)
                return v41(v43.controlState, v43.backgroundStyle);
            end);
        else
            return v27:map(function(v44) --[[ Line: 155 ]]
                -- upvalues: v41 (ref), v34 (ref)
                return v41(v44, v34);
            end);
        end;
    end, {
        v34, 
        v27, 
        v41, 
        if v5.FoundationBindableStateLayer and v23.stateLayer then v23.stateLayer.mode else nil, 
        if v5.FoundationBindableStateLayer and v23.stateLayer then v23.stateLayer.affordance else nil
    });
    local v46 = v13(v24, v33);
    v3.useImperativeHandle(v22, function() --[[ Line: 171 ]]
        -- upvalues: v24 (copy)
        return v24.current;
    end, {});
    local v51 = {
        BackgroundColor3 = if v5.FoundationBindableStateLayer then v11(v45, function(v47) --[[ Line: 177 ]]
            return v47.Color3;
        end) else v45:map(function(v48) --[[ Line: 180 ]]
            return v48.Color3;
        end), 
        BackgroundTransparency = if v5.FoundationBindableStateLayer then v11(v45, function(v49) --[[ Line: 184 ]]
            return v49.Transparency;
        end) else v45:map(function(v50) --[[ Line: 187 ]]
            return v50.Transparency;
        end), 
        Active = not v23.isDisabled, 
        Interactable = not v23.isDisabled, 
        [v3.Event.Activated] = if not v23.isDisabled then v23.onActivated else nil, 
        [v3.Event.MouseButton2Click] = if not v23.isDisabled then v23.onSecondaryActivated else nil, 
        ref = v46, 
        SelectionImageObject = v23.SelectionImageObject or v26
    };
    local v52 = v2.union(v23, v51);
    v52.component = nil;
    v52.isDisabled = nil;
    v52.onActivated = nil;
    v52.onSecondaryActivated = nil;
    v52.onStateChanged = nil;
    v52.stateLayer = nil;
    v52.cursor = nil;
    return v3.createElement(v23.component, v52);
end));