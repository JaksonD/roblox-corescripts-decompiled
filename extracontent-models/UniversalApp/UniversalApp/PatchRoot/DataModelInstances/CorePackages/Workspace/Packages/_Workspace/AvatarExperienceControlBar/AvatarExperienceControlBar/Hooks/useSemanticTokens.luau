local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceControlBar").Parent;
local v1 = require(l_Parent_0.Foundation);
return function() --[[ Line: 6 ]] --[[ Name: useSemanticTokens ]]
    -- upvalues: v1 (copy)
    local v2 = v1.Hooks.useTokens();
    return {
        defaultIconContainerSize = v2.Size.Size_900, 
        defaultIconSize = v2.Size.Size_900, 
        defaultLegacyIconSize = v2.Size.Size_600, 
        closeIconSize = v2.Size.Size_600, 
        activeIconBackgroundStyle = v2.Color.Shift.Shift_400, 
        hoverIconBackgroundStyle = v2.Color.Shift.Shift_200, 
        thumbnailBackgroundStyle = v2.Color.Surface.Surface_200, 
        tooltipBackgroundStyle = v2.Color.Surface.Surface_300, 
        hoverThumbnailBackgroundStyle = v2.Color.Shift.Shift_400, 
        imageBorderFocusStyle = v2.Color.ActionEmphasis.Background.Color3, 
        borderStrokeThickness = v2.Stroke.Standard, 
        borderStrokeTransparency = 0.5, 
        defaultIconTextButtonRadius = v2.Size.Size_200, 
        iconTextButtonIconContainerSize = v2.Size.Size_900, 
        textButtonPaddingLeft = v2.Size.Size_200, 
        textButtonPaddingRight = v2.Size.Size_400, 
        textButtonPaddingY = v2.Size.Size_150, 
        contentForegroundStyle = v2.Color.Content.Emphasis, 
        contentDisabledTransparency = 0.68, 
        menuBackgroundStyle = v2.Color.OverMedia.OverMedia_0, 
        defaultIconTextMenuRadius = v2.Size.Size_200, 
        iconOnlyMenuItemGap = v2.Size.Size_150
    };
end;