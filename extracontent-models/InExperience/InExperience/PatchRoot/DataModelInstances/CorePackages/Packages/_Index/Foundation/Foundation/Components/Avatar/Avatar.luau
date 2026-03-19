local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.Image);
local v5 = require(script.Parent.Indicator);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local v8 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v10 = require(l_script_FirstAncestor_0.Enums.ThumbnailSize);
local v11 = require(l_script_FirstAncestor_0.Enums.ThumbnailType);
local v12 = require(l_script_FirstAncestor_0.Utility.getRbxThumb);
local v13 = require(script.Parent.useAvatarVariants);
local v14 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_usePresentationContext_0 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext).usePresentationContext;
local v16 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v17 = require(l_script_FirstAncestor_0.Enums.UserPresence);
local v18 = require(script.Parent.getAvatarSize);
local v19 = {
    size = v16.Medium, 
    userPresence = v17.None, 
    testId = "--foundation-avatar"
};
return v2.memo(v2.forwardRef(function(v20, v21) --[[ Line: 45 ]] --[[ Name: Avatar ]]
    -- upvalues: v9 (copy), v19 (copy), v14 (copy), l_usePresentationContext_0 (copy), v13 (copy), v18 (copy), v2 (copy), v7 (copy), v8 (copy), v4 (copy), v12 (copy), v11 (copy), v10 (copy), v3 (copy), v5 (copy)
    local v22 = v9(v20, v19);
    local v23 = v14();
    local v24 = l_usePresentationContext_0();
    local v25 = v13(v23, v22.size, v22.userPresence, v22.backplateStyle, v24.isIconSize);
    local v26 = v18(v23, v22.size, v24.isIconSize);
    return v2.createElement(v7, v8(v22, {
        tag = v25.container.tag, 
        ref = v21, 
        backgroundStyle = v25.container.backgroundStyle, 
        stroke = v25.container.stroke, 
        Size = UDim2.fromOffset(v26, v26)
    }), {
        Image = v2.createElement(v4, {
            Image = v12(v11.AvatarHeadShot, v22.userId, v10.Medium), 
            tag = v25.avatar.tag, 
            backgroundStyle = v22.backgroundStyle
        }), 
        Indicator = if v25.indicator.isVisible then v2.createElement(v7, v3.join(v25.indicatorBackplate, {
            testId = ("%*--indicator"):format(v22.testId)
        }), v2.createElement(v5, v25.indicator)) else nil
    });
end));