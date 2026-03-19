local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local v4 = require(script.Parent.Utils.generateColorSequence);
local v5 = game:DefineFastFlag("AXColorGradientRenderFlatWithJustOneColor", false);
return function(v6) --[[ Line: 28 ]] --[[ Name: ColorGradientCircle ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v5 (copy), v2 (copy), v4 (copy)
    local v7 = l_useTokens_0();
    return v1.createElement("Frame", {
        Size = v6.Size, 
        Position = v6.Position, 
        AnchorPoint = v6.AnchorPoint, 
        BackgroundTransparency = 0
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        UIGradient = if v5 and #v6.Colors == 1 then v1.createElement(v2.View, {
            tag = "size-full-full radius-circle", 
            backgroundStyle = {
                Color3 = v6.Colors[1], 
                Transparency = 0
            }
        }) else v1.createElement("UIGradient", {
            Rotation = v6.Rotation or 45, 
            Color = v4(v6.Colors), 
            Transparency = v6.Transparency or NumberSequence.new(0), 
            Offset = v6.Offset or Vector2.new(0, 0)
        }), 
        UIStroke = if v6.hasBorder then v1.createElement("UIStroke", {
            Thickness = 2, 
            Color = v7.Color.System.Contrast.Color3
        }) else nil
    });
end;