local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Icon_0 = v2.Icon;
local l_IconSize_0 = v2.Enums.IconSize;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_ItemCardThumbnail_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local v7 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXCustomizeMakeupSupport_0 = v7.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXMigrateBuilderIcons_0 = v7.FFlagAXMigrateBuilderIcons;
return function(v10) --[[ Line: 37 ]] --[[ Name: SlotItemCardThumbnail ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), v2 (copy), v1 (copy), l_ItemCardThumbnail_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v11 = l_useTokens_0();
    local v12 = if l_FFlagAXCustomizeMakeupSupport_0 then if v10.icon then if l_FFlagAXMigrateBuilderIcons_0 then v10.icon.name else v10.icon else v2.Enums.IconName.PlusLarge else nil;
    local v13 = if l_FFlagAXCustomizeMakeupSupport_0 and l_FFlagAXMigrateBuilderIcons_0 then if v10.icon then v10.icon.variant else v2.Enums.IconVariant.Regular else nil;
    if v10.url then
        return v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ZIndex = 3
        }, {
            Thumbnail = v1.createElement(l_ItemCardThumbnail_0, {
                url = v10.url
            }), 
            Overlay = v10.enableThumbnailOverlay and v1.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v11.Color.Surface.Surface_200.Color3, 
                BackgroundTransparency = v11.Color.Common.Shadow.Transparency, 
                ZIndex = 2
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v11.Semantic.Radius.Medium)
                })
            })
        });
    else
        return v1.createElement(v1.Fragment, nil, {
            AddIconFrame = if not v10.icon or v10.ignoredUrl then nil else v1.createElement("Frame", {
                Size = v10.iconFrameStyles and v10.iconFrameStyles.Size or UDim2.fromOffset(30, 30), 
                Position = if l_FFlagAXMigrateBuilderIcons_0 then UDim2.new(0.5, 4, 0.5, 4) else UDim2.new(0.5, 3, 0.5, 3), 
                BackgroundColor3 = v11.Color.Surface.Surface_200.Color3, 
                BackgroundTransparency = v11.Color.Surface.Surface_200.Transparency, 
                ZIndex = 2
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                AddIcon = v1.createElement(l_Icon_0, {
                    name = if l_FFlagAXMigrateBuilderIcons_0 then v2.Enums.IconName.PlusLarge else "icons/common/plus_heavy_small", 
                    size = v10.iconFrameStyles and v10.iconFrameStyles.iconSize or l_IconSize_0.Small, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            }), 
            SlotIcon = (not not l_FFlagAXCustomizeMakeupSupport_0 or v10.icon) and v1.createElement(l_Icon_0, {
                name = if l_FFlagAXCustomizeMakeupSupport_0 then v12 else if l_FFlagAXMigrateBuilderIcons_0 then v10.icon.name else v10.icon, 
                variant = if l_FFlagAXCustomizeMakeupSupport_0 then v13 else if l_FFlagAXMigrateBuilderIcons_0 then v10.icon.variant else nil, 
                size = if l_FFlagAXMigrateBuilderIcons_0 then v11.Size.Size_800 else l_IconSize_0.Large, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                style = v11.Color.Shift.Shift_400
            })
        });
    end;
end;