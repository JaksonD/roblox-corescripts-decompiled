local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Common.Frame);
local v4 = require(script.Parent.AvatarThumbnail);
local v5 = require(script.Parent.CircleMask);
local l_ImageSetLabel_0 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
return function(v7) --[[ Line: 30 ]] --[[ Name: AvatarOneToOne ]]
    -- upvalues: v2 (copy), l_ImageSetLabel_0 (copy), v5 (copy), v3 (copy), v4 (copy)
    local v8 = nil;
    v8 = if v7.showNewPresenceImage then v2.createElement(l_ImageSetLabel_0, {
        Size = UDim2.fromOffset(v7.presenceIndicatorSize, v7.presenceIndicatorSize), 
        BackgroundTransparency = 1, 
        Image = v7.presenceImage, 
        ImageColor3 = v7.presenceImageColor3, 
        ImageTransparency = v7.presenceImageTransparency
    }) else v2.createElement("ImageLabel", {
        Size = UDim2.new(0, v7.presenceIndicatorSize, 0, v7.presenceIndicatorSize), 
        BackgroundTransparency = 1, 
        Image = v7.presenceImage
    });
    return v2.createElement(v5, {
        circleColor3 = v7.circleColor3, 
        circleTransparency = v7.circleTransparency, 
        circleInteriorBackgroundColor3 = v7.circleInteriorBackgroundColor3, 
        circleInteriorBackgroundTransparency = v7.circleInteriorBackgroundTransparency, 
        circleDividerColor3 = v7.circleDividerColor3, 
        circleDividerTransparency = v7.circleDividerTransparency, 
        overlaySize = v7.overlaySize, 
        renderAboveMask = v2.createElement(v3, {}, {
            layout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            presenceIndicator = v8
        }), 
        onActivated = v7.onActivated, 
        selectable = v7.selectable
    }, {
        uiCorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }), 
        avatar = v2.createElement(v4, {
            thumbnail = v7.thumbnail, 
            cornerRadius = UDim.new(1, 0)
        })
    });
end;