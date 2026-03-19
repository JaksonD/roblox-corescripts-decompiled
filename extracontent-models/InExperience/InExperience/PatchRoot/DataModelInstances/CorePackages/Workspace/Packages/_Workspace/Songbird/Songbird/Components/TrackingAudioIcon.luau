local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local l_createNextOrder_0 = require(l_script_FirstAncestor_0.Parent.ReactUtils).createNextOrder;
local v5 = require(l_script_FirstAncestor_0.Components.MusicPlayingIcon);
local v6 = {
    isMoving = true
};
return function(v7) --[[ Line: 23 ]] --[[ Name: TrackingAudioIcon ]]
    -- upvalues: v1 (copy), v6 (copy), l_createNextOrder_0 (copy), v2 (copy), v3 (copy), v5 (copy)
    local v8 = v1.Dictionary.join(v6, v7);
    local v9 = l_createNextOrder_0();
    local v10 = v2.Hooks.useTokens().Semantic.Icon.Size[v2.Enums.IconSize.Medium];
    return v3.createElement(v2.View, {
        Size = UDim2.fromOffset(v10, v10)
    }, {
        BaseIcon = v3.createElement(v2.Image, {
            Image = "icons/common/musicTrackingBorder_medium", 
            Size = UDim2.fromOffset(v10, v10), 
            ZIndex = v9()
        }), 
        CenterCover = v3.createElement(v2.View, {
            Size = UDim2.fromOffset(v10 / 2, v10 / 2), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Transparency = 1, 
            ZIndex = v9()
        }, {
            Bars = v3.createElement(v5, {
                heightRange = NumberRange.new(0.25, 0.9), 
                numAnimatedBars = 4, 
                zIndex = v9(), 
                isMoving = v8.isMoving
            })
        })
    });
end;