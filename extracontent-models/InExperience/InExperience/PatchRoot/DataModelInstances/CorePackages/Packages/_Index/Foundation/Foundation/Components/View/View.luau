local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Utility.Flags);
local v5 = require(l_script_FirstAncestor_0.Utility.Logger);
local v6 = require(l_script_FirstAncestor_0.Components.Interactable);
local v7 = require(l_script_FirstAncestor_0.Utility.GuiObjectChildren);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Utility.useDefaultTags);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v11 = require(l_script_FirstAncestor_0.Utility.withGuiObjectProps);
local v12 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v14 = {
    layout = {
        SortOrder = Enum.SortOrder.LayoutOrder
    }, 
    AutoLocalize = false, 
    BorderSizePixel = 0, 
    isDisabled = false
};
return v3.memo(v3.forwardRef(function(v15, v16) --[[ Line: 44 ]] --[[ Name: View ]]
    -- upvalues: v10 (copy), v14 (copy), v9 (copy), v12 (copy), v3 (copy), v5 (copy), v11 (copy), v4 (copy), v6 (copy), v7 (copy), v2 (copy)
    local v17 = v10(v15, v14);
    local v18 = v17.backgroundStyle ~= nil and "gui-object-defaults x-default-transparency" or "gui-object-defaults";
    local v19 = v9(v17.tag, v18);
    local v20 = v12(v19);
    local v21 = true;
    if v17.onStateChanged == nil then
        v21 = true;
        if v17.onActivated == nil then
            v21 = v17.onSecondaryActivated ~= nil;
        end;
    end;
    local v22 = v3.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v17 (copy)
        if v17.GroupTransparency ~= nil then
            if type(v17.GroupTransparency) == "table" then
                return true;
            else
                return v17.GroupTransparency > 0;
            end;
        else
            return false;
        end;
    end, {
        v17.GroupTransparency
    });
    local v23 = v3.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: v22 (copy), v21 (copy), v17 (copy), v5 (ref)
        if v22 then
            if v21 and not v17.isDisabled then
                v5:warning("Some state changes are not supported with GroupTransparency");
            end;
            return "CanvasGroup";
        elseif v21 then
            return "ImageButton";
        else
            return "Frame";
        end;
    end, {
        v22, 
        v21
    });
    local v24 = v11(v17, {
        AutoButtonColor = v23 ~= "ImageButton" and nil, 
        GroupTransparency = if v22 then v17.GroupTransparency else nil, 
        ref = v16, 
        [v3.Tag] = v20
    });
    if v4.FoundationBuildingBlocksRemoveDashUnion then
        local l_v23_0 = v23;
        if v21 then
            l_v23_0 = v6;
            v24.component = v23;
            v24.onActivated = v17.onActivated;
            v24.onSecondaryActivated = v17.onSecondaryActivated;
            v24.onStateChanged = v17.onStateChanged;
            v24.stateLayer = v17.stateLayer;
            v24.isDisabled = v17.isDisabled;
            v24.cursor = v17.cursor;
        end;
        return v3.createElement(l_v23_0, v24, v7(v17));
    else
        local v26 = if v21 then v6 else v23;
        local v27 = {
            component = v23, 
            onActivated = v17.onActivated, 
            onSecondaryActivated = v17.onSecondaryActivated, 
            onStateChanged = v17.onStateChanged, 
            stateLayer = v17.stateLayer, 
            isDisabled = v17.isDisabled, 
            cursor = v17.cursor
        };
        local v28 = if v21 then v2.union(v24, v27) else v24;
        return v3.createElement(v26, v28, v7(v17));
    end;
end));