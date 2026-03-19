local l_Parent_0 = script:FindFirstAncestor("PlayerContextualMenu").Parent;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local _ = require(script.Parent.Types);
return function(v3, v4) --[[ Line: 9 ]] --[[ Name: getPresenceIcon ]]
    -- upvalues: l_Images_0 (copy)
    if v3 then
        if v3.status == "InGame" then
            return l_Images_0["icons/menu/games_small"], v4.iconEmphasis;
        elseif v3.status == "Online" or v3.status == "InStudio" then
            return l_Images_0["component_assets/circle_16"], v4.onlinePresence;
        end;
    end;
    return nil, nil;
end;