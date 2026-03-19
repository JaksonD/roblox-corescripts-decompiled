local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Roact);
local l_withHoverTooltip_0 = v2.App.Dialog.TooltipV2.withHoverTooltip;
local l_TooltipOrientation_0 = v2.App.Dialog.Enum.TooltipOrientation;
local l_Images_0 = v2.App.ImageSet.Images;
local l_Interactable_0 = v2.Core.Control.Interactable;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local v9 = l_Images_0["icons/actions/info"];
InfoIconWithTooltip = function(v10) --[[ Line: 22 ]] --[[ Name: InfoIconWithTooltip ]]
    -- upvalues: l_withHoverTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v9 (copy), l_Interactable_0 (copy)
    local v11 = UDim2.new(0, 18, 0, 18);
    return l_withHoverTooltip_0({
        bodyText = v10.text
    }, {
        preferredOrientation = l_TooltipOrientation_0.Bottom, 
        guiTarget = l_CoreGui_0, 
        DisplayOrder = 10, 
        delayTime = 0.2, 
        triggerPointName = "BonusBannerInfoIcon"
    }, function(v12, v13) --[[ Line: 32 ]]
        -- upvalues: v3 (ref), v11 (copy), v10 (copy), l_ImageSetLabel_0 (ref), v9 (ref), l_Interactable_0 (ref)
        return v3.createElement("Frame", {
            Size = v11, 
            BackgroundTransparency = 1, 
            LayoutOrder = v10.layoutOrder, 
            AnchorPoint = Vector2.new(1, 0), 
            [v3.Change.AbsolutePosition] = v12, 
            [v3.Change.AbsoluteSize] = v12
        }, {
            TooltipIcon = v3.createElement(l_ImageSetLabel_0, {
                Size = v11, 
                BackgroundTransparency = 1, 
                Image = v9, 
                ImageColor3 = v10.color, 
                ZIndex = 1
            }), 
            Hitbox = v3.createElement(l_Interactable_0, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                onStateChanged = v13, 
                [v3.Event.Activated] = v10.eventActivated, 
                ZIndex = 2
            })
        });
    end);
end;
return InfoIconWithTooltip;