local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_usePulseAnimationBinding_0 = require(l_Parent_0.AvatarExperienceCommon).Hooks.usePulseAnimationBinding;
local v5 = require(l_script_FirstAncestor_0.Hooks.useSemanticTokens);
local v6 = require(l_script_FirstAncestor_0.Hooks.useHoverBinding);
return v2.forwardRef(function(v7, v8) --[[ Line: 25 ]] --[[ Name: ImageItem ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), l_usePulseAnimationBinding_0 (copy), v3 (copy)
    local v9 = v5();
    local v10, v11 = v6();
    local v12 = v2.useRef(nil);
    local v13 = if v7.size then v7.size else v9.defaultIconContainerSize;
    local v14 = l_usePulseAnimationBinding_0(v7.enableFocusAnimation);
    return v2.createElement(v3.View, {
        tag = "auto-xy radius-circle", 
        ref = v8, 
        LayoutOrder = v7.LayoutOrder, 
        stateLayer = {
            affordance = v3.Enums.StateLayerAffordance.None
        }, 
        onStateChanged = v11, 
        onActivated = v7.onActivated, 
        disabled = v7.disabled, 
        Visible = v7.Visible
    }, {
        Thumbnail = v2.createElement(v3.Image, {
            Image = v7.thumbnailUrl, 
            Size = UDim2.fromOffset(v13, v13), 
            tag = "radius-circle", 
            backgroundStyle = v10:map(function(v15) --[[ Line: 49 ]]
                -- upvalues: v9 (copy)
                if v15 then
                    return v9.hoverThumbnailBackgroundStyle;
                else
                    return v9.thumbnailBackgroundStyle;
                end;
            end)
        }), 
        Indicator = if not v7.hideIndicator then v2.createElement(v3.View, {
            tag = "auto-xy position-bottom-right anchor-bottom-right bg-surface-300 radius-circle size-400-400", 
            ZIndex = 2
        }, {
            IndicatorImage = v2.createElement(v3.Image, {
                Image = "icons/actions/truncationExpand_small", 
                imageStyle = v9.contentForegroundStyle, 
                tag = "radius-circle position-center-center anchor-center-center size-250-250"
            })
        }) else nil, 
        UIStroke = if v7.enableFocusAnimation then v2.createElement("UIStroke", {
            Color = v9.imageBorderFocusStyle, 
            Thickness = v14:map(function(v16) --[[ Line: 71 ]]
                return v16.thickness;
            end), 
            Transparency = v14:map(function(v17) --[[ Line: 74 ]]
                return v17.transparency;
            end), 
            ref = v12
        }) else nil
    });
end);