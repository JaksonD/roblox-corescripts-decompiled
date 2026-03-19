local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(script.AvatarOneToOne);
local v4 = require(script.AvatarGroup);
local v5 = {
    presenceIndicatorSize = 14
};
return function(v6) --[[ Line: 32 ]] --[[ Name: AvatarCircle ]]
    -- upvalues: v1 (copy), v5 (copy), v2 (copy), v3 (copy), v4 (copy)
    local v7 = v1.Dictionary.union(v6, v5);
    if #v7.thumbnails == 1 then
        return v2.createElement(v3, {
            circleColor3 = v7.circleColor3, 
            circleDividerColor3 = v7.circleDividerColor3, 
            circleDividerTransparency = v7.circleDividerTransparency, 
            circleInteriorBackgroundColor3 = v7.circleInteriorBackgroundColor3, 
            circleInteriorBackgroundTransparency = v7.circleInteriorBackgroundTransparency, 
            circleTransparency = v7.circleTransparency, 
            onActivated = v7.onActivated, 
            overlaySize = v7.overlaySize, 
            presenceImage = v7.presenceImage, 
            presenceImageColor3 = v7.presenceImageColor3, 
            presenceImageTransparency = v7.presenceImageTransparency, 
            presenceIndicatorSize = v7.presenceIndicatorSize, 
            selectable = v7.selectable, 
            showNewPresenceImage = v7.showNewPresenceImage, 
            thumbnail = v7.thumbnails[1]
        });
    else
        return v2.createElement(v4, {
            circleColor3 = v7.circleColor3, 
            circleDividerColor3 = v7.circleDividerColor3, 
            circleDividerTransparency = v7.circleDividerTransparency, 
            circleInteriorBackgroundColor3 = v7.circleInteriorBackgroundColor3, 
            circleInteriorBackgroundTransparency = v7.circleInteriorBackgroundTransparency, 
            circleTransparency = v7.circleTransparency, 
            onActivated = v7.onActivated, 
            overlaySize = v7.overlaySize, 
            selectable = v7.selectable, 
            thumbnails = v7.thumbnails
        });
    end;
end;