local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_ColorGradientCircle_0 = require(l_Parent_0.AvatarExperienceCommon).Components.ColorGradientCircle;
local v5 = require(l_script_FirstAncestor_0.Hooks.useSemanticTokens);
local v6 = require(l_script_FirstAncestor_0.Hooks.useHoverBinding);
local v7 = {
    affordance = v3.Enums.StateLayerAffordance.None
};
local function v9(v8) --[[ Line: 17 ]] --[[ Name: getHoverTransparency ]]
    if v8 then
        return 0;
    else
        return 0.2;
    end;
end;
return v2.forwardRef(function(v10, v11) --[[ Line: 32 ]] --[[ Name: ColorItem ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), v3 (copy), v7 (copy), v9 (copy), l_ColorGradientCircle_0 (copy)
    local v12 = v5();
    local v13, v14 = v6();
    local v15 = if v10.size then v10.size else v12.defaultIconContainerSize;
    local v16 = if v10.colorSize then v10.colorSize else v15;
    return v2.createElement(v3.View, {
        ref = v11, 
        LayoutOrder = v10.LayoutOrder, 
        stateLayer = v7, 
        onStateChanged = if v10.disabled then nil else v14, 
        onActivated = v10.onActivated, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        disabled = v10.disabled, 
        selection = {
            Selectable = v10.Selectable or false
        }
    }, {
        HoverHandler = v2.createElement(v3.View, {
            Size = UDim2.fromOffset(v15, v15), 
            GroupTransparency = v13:map(v9), 
            backgroundStyle = v13:map(function(v17) --[[ Line: 51 ]]
                -- upvalues: v12 (copy), v10 (copy)
                if v17 then
                    return v12.hoverIconBackgroundStyle;
                elseif v10.isActive then
                    return v12.activeIconBackgroundStyle;
                else
                    return {
                        Color3 = v12.hoverIconBackgroundStyle.Color3, 
                        Transparency = 1
                    };
                end;
            end), 
            tag = "padding-small radius-circle clip auto-xy"
        }, {
            ColorGradientCircle = v2.createElement(l_ColorGradientCircle_0, {
                Colors = v10.colors, 
                Size = UDim2.fromOffset(v16, v16), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            })
        })
    });
end);