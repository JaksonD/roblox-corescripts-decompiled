local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local l_TooltipOrientation_0 = v1.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = v1.App.Dialog.TooltipV2.withTooltip;
local v4 = require(l_CorePackages_0.Packages.React);
return function(v5) --[[ Line: 11 ]] --[[ Name: Tooltip ]]
    -- upvalues: l_withTooltip_0 (copy), l_TooltipOrientation_0 (copy), v4 (copy)
    local l_controllerPart_0 = v5.controllerPart;
    local l_BillboardGui_0 = l_controllerPart_0:WaitForChild("BillboardGui");
    return l_withTooltip_0({
        bodyText = v5.tooltipText
    }, {
        preferredOrientation = l_TooltipOrientation_0.Bottom, 
        guiTarget = l_BillboardGui_0, 
        DisplayOrder = 0, 
        triggerPointName = "TriggerPart", 
        active = true, 
        DEBUG_useTargetDirectly = true
    }, function(v8) --[[ Line: 24 ]]
        -- upvalues: v4 (ref), l_controllerPart_0 (copy)
        return v4.createElement("BillboardGui", {
            Parent = l_controllerPart_0, 
            Adornee = l_controllerPart_0, 
            AlwaysOnTop = true, 
            Active = false, 
            Size = UDim2.new(0.5, 0, 0.5, 0)
        }, {
            TriggerBody = v4.createElement("Frame", {
                Transparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.49, 0, 1.02, 0), 
                [v4.Change.AbsoluteSize] = v8, 
                [v4.Change.AbsolutePosition] = v8
            })
        });
    end);
end;