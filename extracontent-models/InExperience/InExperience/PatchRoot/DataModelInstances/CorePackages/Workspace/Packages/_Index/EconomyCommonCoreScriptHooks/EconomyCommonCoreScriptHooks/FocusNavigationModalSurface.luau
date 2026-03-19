local l_Parent_0 = script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent;
local v1 = require(l_Parent_0.React);
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v3 = require(script.Parent.useFocusNavigationSurface);
return function(v4) --[[ Line: 16 ]] --[[ Name: FocusNavigationModalSurface ]]
    -- upvalues: v3 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v1 (copy)
    local v5 = v3({
        selectionGroupName = v4.selectionGroupName, 
        focusNavigableSurfaceIdentifier = if v4.surfaceIdentifier then v4.surfaceIdentifier else l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
    });
    return v1.createElement("Frame", {
        ref = v5, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = Enum.SelectionBehavior.Stop
    }, v4.children);
end;