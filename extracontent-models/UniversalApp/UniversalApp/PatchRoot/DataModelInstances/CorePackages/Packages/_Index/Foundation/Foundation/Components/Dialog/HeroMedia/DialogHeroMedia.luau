local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_script_FirstAncestor_0.Components.Image);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local _ = require(l_script_FirstAncestor_0.Enums.DialogSize);
local v8 = require(l_script_FirstAncestor_0.Components.Gradient);
local v9 = require(script.Parent.Parent.useDialog);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local l_useDialogVariants_0 = require(script.Parent.Parent.useDialogVariants).useDialogVariants;
local v12 = {
    height = UDim.new(1, 0)
};
return function(v13) --[[ Line: 35 ]] --[[ Name: DialogHeroMedia ]]
    -- upvalues: v10 (copy), v12 (copy), v9 (copy), l_useDialogVariants_0 (copy), v2 (copy), v6 (copy), v3 (copy), v4 (copy), v8 (copy)
    local v14 = v10(v13, v12);
    local v15 = v9();
    local v16 = l_useDialogVariants_0();
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v15 (copy)
        v15.setHasHeroMedia(true);
        return function() --[[ Line: 43 ]]
            -- upvalues: v15 (ref)
            v15.setHasHeroMedia(false);
        end;
    end, {});
    local l_offsetX_0 = v16.heroMedia.offsetX;
    return v2.createElement(v6, {
        tag = v16.heroMediaWrapper.tag, 
        LayoutOrder = v3.MIN_LAYOUT_ORDER, 
        testId = ("%*--hero-media"):format(v15.testId)
    }, {
        RoundedCorners = v2.createElement(v4, {
            Image = v14.media, 
            imageStyle = v14.mediaStyle, 
            backgroundStyle = v14.backgroundStyle, 
            aspectRatio = v14.aspectRatio, 
            Position = UDim2.fromOffset(-l_offsetX_0, 0), 
            Size = UDim2.new(1, l_offsetX_0 * 2, v14.height.Scale, v14.height.Offset), 
            ZIndex = 0
        }, {
            TransparencyGradient = v2.createElement(v8, {
                fillDirection = Enum.FillDirection.Vertical, 
                top = false
            })
        }), 
        Image = v2.createElement(v4, {
            Image = v14.media, 
            imageStyle = v14.mediaStyle, 
            backgroundStyle = v14.backgroundStyle, 
            tag = v16.heroMedia.tag, 
            aspectRatio = v14.aspectRatio, 
            Position = UDim2.fromOffset(-l_offsetX_0, 0), 
            Size = UDim2.new(1, l_offsetX_0 * 2, v14.height.Scale, v14.height.Offset)
        }, {
            TransparencyGradient = v2.createElement(v8, {
                fillDirection = Enum.FillDirection.Vertical, 
                top = true
            })
        })
    });
end;