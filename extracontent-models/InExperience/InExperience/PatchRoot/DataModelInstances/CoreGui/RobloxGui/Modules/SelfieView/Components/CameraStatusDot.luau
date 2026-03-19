local l_Packages_0 = game:GetService("CorePackages").Packages;
local v1 = require(l_Packages_0.React);
local l_useStyle_0 = require(l_Packages_0.UIBlox).Core.Style.useStyle;
local v3 = UDim2.fromOffset(4, 4);
local v4 = Vector2.new(0.5, 0.5);
local v5 = UDim2.fromScale(0.8, 0.8);
return function(v6) --[[ Line: 18 ]] --[[ Name: CameraStatusDot ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v7 = l_useStyle_0();
    return v1.createElement("Frame", {
        AnchorPoint = v6.AnchorPoint or v4, 
        Size = if v6.Size then v6.Size else v3, 
        BackgroundColor3 = v7.Theme.OnlineStatus.Color, 
        Position = v6.Position or v5, 
        ZIndex = v6.ZIndex
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        })
    });
end;