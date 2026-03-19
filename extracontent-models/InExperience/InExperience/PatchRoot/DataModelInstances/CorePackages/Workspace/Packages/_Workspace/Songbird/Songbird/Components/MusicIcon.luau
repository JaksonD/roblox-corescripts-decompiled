local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local l_createNextOrder_0 = require(l_script_FirstAncestor_0.Parent.ReactUtils).createNextOrder;
return function() --[[ Line: 10 ]] --[[ Name: MusicIcon ]]
    -- upvalues: l_createNextOrder_0 (copy), v1 (copy), v2 (copy)
    local v4 = l_createNextOrder_0();
    local v5 = v1.Hooks.useTokens();
    local v6 = v5.Semantic.Icon.Size[v1.Enums.IconSize.Medium];
    return v2.createElement(v1.View, {
        Size = UDim2.fromOffset(v6, v6), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        backgroundStyle = {
            Color3 = Color3.fromRGB(43, 45, 50), 
            Transparency = 0
        }, 
        cornerRadius = UDim.new(0, v5.Radius.Medium), 
        ZIndex = v4()
    }, {
        Icon = v2.createElement(v1.Icon, {
            name = "icons/common/music", 
            size = v1.Enums.IconSize.Medium, 
            Position = UDim2.new(0.5, -1, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = v4()
        })
    });
end;