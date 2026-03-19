local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.BackgroundGradient);
local v3 = require(script.Parent.BackgroundImage);
return function(v4) --[[ Line: 35 ]] --[[ Name: BackgroundLayers ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v5 = {};
    for v6, v7 in v4.backgroundLayers do
        local v8 = (v4.ZIndex or 0) - (#v4.backgroundLayers - v6);
        if v7.type == "GradientBackground" then
            v5[("GradientBackground_%*"):format(v6)] = v1.createElement(v2, {
                colorSequence = v7.colorSequence, 
                cornerRadius = v4.cornerRadius, 
                offset = v7.offset, 
                rotation = v7.rotation, 
                transparency = v7.transparency, 
                ZIndex = v8, 
                tag = v7.tag
            });
        elseif v7.type == "ImageBackground" then
            v5[("ImageBackground_%*"):format(v6)] = v1.createElement(v3, {
                anchorPoint = v7.anchorPoint, 
                color = v7.color, 
                cornerRadius = v4.cornerRadius, 
                position = v7.position, 
                resourceIdentifier = v7.resourceIdentifier, 
                transparency = v7.transparency, 
                ZIndex = v8, 
                tag = v7.tag
            });
        end;
    end;
    return v1.createElement(v1.Fragment, nil, v5);
end;