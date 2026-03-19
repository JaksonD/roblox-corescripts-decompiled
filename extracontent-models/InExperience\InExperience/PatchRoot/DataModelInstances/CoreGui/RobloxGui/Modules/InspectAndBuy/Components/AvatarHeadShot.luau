local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Colors);
local v6 = v3.PureComponent:extend("AvatarHeadShot");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules");
local l_Headshot_0 = require(l_Modules_0.Common.LegacyThumbnailUrls).Headshot;
v6.render = function(v9) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: l_Headshot_0 (copy), v3 (copy), v5 (copy)
    local l_playerId_0 = v9.props.playerId;
    local v11 = nil;
    if l_playerId_0 and l_playerId_0 ~= "" then
        v11 = l_Headshot_0:format(l_playerId_0, 48, 48);
    end;
    if not v11 then
        return nil;
    else
        return v3.createElement("ImageLabel", {
            Size = UDim2.new(0, 48, 0, 48), 
            BackgroundColor3 = v5.GrayBackground, 
            BorderSizePixel = 0, 
            Image = v11, 
            LayoutOrder = 1
        }, {
            MaskFrame = v3.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = "rbxasset://textures/ui/LuaApp/graphic/gr-avatar mask-90x90.png", 
                ImageColor3 = v5.Carbon
            })
        });
    end;
end;
return v4.UNSTABLE_connect2(function(v12, _) --[[ Line: 50 ]]
    return {
        playerId = v12.playerId
    };
end)(v6);