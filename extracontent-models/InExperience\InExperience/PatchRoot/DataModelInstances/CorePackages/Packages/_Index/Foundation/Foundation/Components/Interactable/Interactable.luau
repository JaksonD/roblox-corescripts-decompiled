local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactIs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Utility.blendColors);
local v7 = require(script.Parent.getOriginalBackgroundStyle);
local v8 = require(script.Parent.getStateLayerStyle);
local v9 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v10 = require(l_script_FirstAncestor_0.Utility.Control.useGuiControlState);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v12 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v13 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local _ = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local v15 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v16 = {
    component = "ImageButton", 
    isDisabled = false
};
local v17 = Color3.fromRGB(163, 162, 165);
return v3.memo(v3.forwardRef(function(v18, v19) --[[ Line: 44 ]] --[[ Name: Interactable ]]
    -- upvalues: v12 (copy), v16 (copy), v3 (copy), v11 (copy), v9 (copy), v15 (copy), v17 (copy), v7 (copy), v13 (copy), v8 (copy), v6 (copy), v4 (copy), v10 (copy), v2 (copy)
    local v20 = v12(v18, v16);
    local v21 = v3.useRef(nil);
    local v22 = v11();
    local v23 = v9(v20.cursor);
    local v24, v25 = v3.useBinding(v15.Initialize);
    local v26 = v3.useRef(nil);
    local v30 = v3.useCallback(function(v27) --[[ Line: 52 ]]
        -- upvalues: v24 (copy), v15 (ref), v21 (copy), v17 (ref), v26 (copy), v25 (copy), v20 (copy)
        if v24:getValue() == v15.Default and v21.current ~= nil then
            local l_Styled_0 = v21.current:GetStyled("BackgroundColor3");
            local l_Styled_1 = v21.current:GetStyled("BackgroundTransparency");
            if l_Styled_0 ~= v17 or l_Styled_1 ~= 0 then
                v26.current = {
                    Color3 = l_Styled_0, 
                    Transparency = l_Styled_1
                };
            end;
        end;
        v25(v27);
        if v20.onStateChanged ~= nil then
            v20.onStateChanged(v27);
        end;
    end, {
        v20.onStateChanged
    });
    local v31 = v3.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: v7 (ref), v20 (copy)
        return v7(v20.BackgroundColor3, v20.BackgroundTransparency);
    end, {
        v20.BackgroundColor3, 
        v20.BackgroundTransparency
    });
    local v36 = v3.useCallback(function(v32, v33) --[[ Line: 74 ]]
        -- upvalues: v15 (ref), v20 (copy), v13 (ref), v26 (copy), v8 (ref), v22 (copy), v6 (ref)
        if v32 == v15.Initialize or v32 == v15.Default or v32 == v15.Disabled or v20.stateLayer and v20.stateLayer.affordance == v13.None then
            return v33;
        else
            local v34 = {
                Color3 = v33.Color3, 
                Transparency = v33.Transparency
            };
            if v33.Color3 == nil then
                v34.Color3 = if v26.current then v26.current.Color3 else nil;
            end;
            if v33.Transparency == nil then
                v34.Transparency = if v26.current then v26.current.Transparency else nil;
            end;
            local v35 = v8(v22, v20.stateLayer, v32);
            return v6(v34, v35);
        end;
    end, {
        v22, 
        v20.BackgroundColor3, 
        v20.BackgroundTransparency, 
        v20.stateLayer
    });
    local v39 = v3.useMemo(function() --[[ Line: 112 ]]
        -- upvalues: v4 (ref), v31 (copy), v3 (ref), v24 (copy), v36 (copy)
        if v4.isBinding(v31) then
            return v3.joinBindings({
                controlState = v24, 
                backgroundStyle = v31
            }):map(function(v37) --[[ Line: 117 ]]
                -- upvalues: v36 (ref)
                return v36(v37.controlState, v37.backgroundStyle);
            end);
        else
            return v24:map(function(v38) --[[ Line: 122 ]]
                -- upvalues: v36 (ref), v31 (ref)
                return v36(v38, v31);
            end);
        end;
    end, {
        v31, 
        v24, 
        v36
    });
    local v40 = v10(v21, v30);
    v3.useImperativeHandle(v19, function() --[[ Line: 129 ]]
        -- upvalues: v21 (copy)
        return v21.current;
    end, {});
    local v43 = {
        BackgroundColor3 = v39:map(function(v41) --[[ Line: 134 ]]
            return v41.Color3;
        end), 
        BackgroundTransparency = v39:map(function(v42) --[[ Line: 137 ]]
            return v42.Transparency;
        end), 
        Active = not v20.isDisabled, 
        Interactable = not v20.isDisabled, 
        [v3.Event.Activated] = if not v20.isDisabled then v20.onActivated else nil, 
        [v3.Event.MouseButton2Click] = if not v20.isDisabled then v20.onSecondaryActivated else nil, 
        ref = v40, 
        SelectionImageObject = v20.SelectionImageObject or v23
    };
    local v44 = v2.union(v20, v43);
    v44.component = nil;
    v44.isDisabled = nil;
    v44.onActivated = nil;
    v44.onSecondaryActivated = nil;
    v44.onStateChanged = nil;
    v44.stateLayer = nil;
    v44.cursor = nil;
    return v3.createElement(v20.component, v44);
end));