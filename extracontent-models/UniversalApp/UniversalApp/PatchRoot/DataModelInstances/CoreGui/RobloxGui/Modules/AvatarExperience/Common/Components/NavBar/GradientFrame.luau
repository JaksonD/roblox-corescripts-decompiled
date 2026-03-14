local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useStyle_0 = v2.Core.Style.useStyle;
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableAutomaticSizeGradientFrame);
return function(v6) --[[ Line: 28 ]] --[[ Name: GradientFrame ]]
    -- upvalues: v5 (copy), l_useStyle_0 (copy), v1 (copy)
    local l_frameRef_0 = v6.frameRef;
    local l_gradientStyle_0 = v6.gradientStyle;
    local v9 = if not v5() then v6.height else nil;
    local l_ZIndex_0 = v6.ZIndex;
    local l_Theme_0 = l_useStyle_0().Theme;
    local v12 = l_gradientStyle_0 and l_gradientStyle_0.Color or l_Theme_0.BackgroundDefault.Color;
    local v13 = l_gradientStyle_0 and l_gradientStyle_0.Transparency or l_Theme_0.BackgroundDefault.Transparency;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = l_ZIndex_0, 
        ref = l_frameRef_0
    }, {
        Left = v1.createElement("Frame", {
            BackgroundTransparency = v13, 
            BackgroundColor3 = v12, 
            Size = UDim2.new(0, 50, v5() and 1 or 0, v5() and 0 or v9)
        }, {
            Gradient = v1.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                })
            })
        }), 
        Right = v1.createElement("Frame", {
            BackgroundTransparency = v13, 
            BackgroundColor3 = v12, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.fromScale(1, 0), 
            Size = UDim2.new(0, 50, v5() and 1 or 0, v5() and 0 or v9)
        }, {
            Gradient = v1.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        })
    });
end;