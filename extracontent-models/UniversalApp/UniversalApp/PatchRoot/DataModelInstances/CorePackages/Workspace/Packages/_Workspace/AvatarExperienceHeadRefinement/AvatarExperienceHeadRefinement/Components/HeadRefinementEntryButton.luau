local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v2.App.Button.IconButton;
local l_Images_0 = v2.App.ImageSet.Images;
local l_useStyle_0 = v2.Core.Style.useStyle;
local v6 = l_Images_0["icons/menu/clothing/classicHead_on"];
local v7 = l_Images_0["icons/menu/clothing/classicHead_off"];
return function(v8) --[[ Line: 25 ]] --[[ Name: HeadRefinementEntryButton ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_IconButton_0 (copy), v6 (copy), v7 (copy), v2 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    return v1.createElement(l_IconButton_0, {
        icon = if v8.isSelected then v6 else v7, 
        iconSize = v2.App.Constant.IconSize.Medium, 
        iconColor3 = if v8.isSelected then l_Theme_0.IconEmphasis.Color else l_Theme_0.IconDefault.Color, 
        iconTransparency = if v8.isSelected then l_Theme_0.IconEmphasis.Transparency else l_Theme_0.IconDefault.Transparency, 
        showBackground = true, 
        onActivated = function() --[[ Line: 35 ]] --[[ Name: onActivated ]]
            -- upvalues: v8 (copy)
            if v8.onActivated then
                v8.onActivated();
            end;
        end, 
        buttonRef = v8.buttonRef, 
        NextSelectionUp = v8.nextSelectionUp, 
        NextSelectionDown = v8.nextSelectionDown
    });
end;