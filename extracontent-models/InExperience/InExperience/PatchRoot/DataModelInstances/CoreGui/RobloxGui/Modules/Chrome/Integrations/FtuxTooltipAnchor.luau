local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_withTooltip_0 = v3.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v3.App.Dialog.Enum.TooltipOrientation;
return (v2.forwardRef(function(v6, v7) --[[ Line: 9 ]]
    -- upvalues: l_withTooltip_0 (copy), l_CoreGui_0 (copy), l_TooltipOrientation_0 (copy), v2 (copy)
    return l_withTooltip_0({
        ref = v7, 
        headerText = v6.headerText, 
        bodyText = v6.bodyText
    }, {
        DisplayOrder = 10, 
        active = v6.shouldShowTooltip, 
        guiTarget = l_CoreGui_0, 
        preferredOrientation = l_TooltipOrientation_0.Bottom
    }, function(v8) --[[ Line: 20 ]]
        -- upvalues: v2 (ref)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v2.Change.AbsoluteSize] = v8, 
            [v2.Change.AbsolutePosition] = v8
        });
    end);
end));