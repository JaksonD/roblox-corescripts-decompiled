local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.Responsive);
local l_IconSize_0 = v1.Enums.IconSize;
local l_useTokens_0 = v1.Hooks.useTokens;
local v5 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXMigrateBuilderIcons_0 = v5.FFlagAXMigrateBuilderIcons;
local l_FFlagAXCustomizeMakeupSupport_0 = v5.FFlagAXCustomizeMakeupSupport;
local function _(v8, v9, v10) --[[ Line: 24 ]] --[[ Name: getItemWidth ]]
    return (math.floor((v8 - (v9 - 1) * v10) / v9));
end;
local function _(v12, v13, v14) --[[ Line: 30 ]] --[[ Name: getItemCardWidthParameters ]]
    -- upvalues: v2 (copy)
    if v13 == v2.BreakpointConfig.Enum.Medium or v14 == v2.BreakpointConfig.Enum.Portrait then
        return {
            visibleItemCount = 6, 
            itemGap = v12
        };
    else
        return nil;
    end;
end;
return function(v16) --[[ Line: 51 ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_IconSize_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy)
    local v17 = l_useTokens_0();
    local v18 = v2.useResponsive();
    local v19 = v2.useOrientation();
    local l_Small_0 = v17.Gap.Small;
    local l_Size_1600_0 = v17.Size.Size_1600;
    local l_Size_2100_0 = v17.Size.Size_2100;
    local l_Medium_0 = v17.Padding.Medium;
    local l_Size_1000_0 = v17.Size.Size_1000;
    local v25 = v19 == v2.BreakpointConfig.Enum.Portrait;
    local v26 = (if not l_FFlagAXCustomizeMakeupSupport_0 or v25 then v17.Typography.CaptionSmall else v17.Typography.CaptionMedium).FontSize + v17.Gap.Small;
    local v27 = if v19 == v2.BreakpointConfig.Enum.Portrait then l_Size_1600_0 else l_Size_2100_0;
    local v28 = v27 + v26 + l_Medium_0 * 2;
    local v29 = v28 + l_Size_1000_0;
    local v30 = {
        text = {
            Size = UDim2.fromScale(1, 0), 
            fontStyle = v17.Typography.CaptionMedium
        }
    };
    local v31 = {
        iconFrameStyles = if v25 then {
            Size = UDim2.fromOffset(v17.Size.Size_500, v17.Size.Size_500), 
            iconSize = l_IconSize_0.XSmall
        } else {
            Size = UDim2.fromOffset(if l_FFlagAXMigrateBuilderIcons_0 then v17.Size.Size_600 else v17.Size.Size_800, if l_FFlagAXMigrateBuilderIcons_0 then v17.Size.Size_600 else v17.Size.Size_800), 
            iconSize = l_IconSize_0.Small
        }
    };
    local v32 = {
        buttonPadding = v17.Padding.Medium, 
        contentPadding = UDim.new(0, v17.Padding.Medium)
    };
    if v16 ~= nil then
        local l_X_0 = v16.X;
        local v34 = if not (v18 ~= v2.BreakpointConfig.Enum.Medium) or v19 == v2.BreakpointConfig.Enum.Portrait then {
            visibleItemCount = 6, 
            itemGap = l_Small_0
        } else nil;
        if v34 then
            local l_visibleItemCount_0 = v34.visibleItemCount;
            local l_itemGap_0 = v34.itemGap;
            v27 = math.min(math.max(math.floor((l_X_0 - (l_visibleItemCount_0 - 1) * l_itemGap_0) / l_visibleItemCount_0), l_Size_1600_0), l_Size_2100_0);
            if l_Size_1600_0 <= v27 and v27 < l_Size_2100_0 then
                v31.iconFrameStyles = if v25 then {
                    Size = UDim2.fromOffset(v17.Size.Size_500, v17.Size.Size_500), 
                    iconSize = l_IconSize_0.XSmall
                } else {
                    Size = UDim2.fromOffset(if l_FFlagAXMigrateBuilderIcons_0 then v17.Size.Size_600 else v17.Size.Size_800, if l_FFlagAXMigrateBuilderIcons_0 then v17.Size.Size_600 else v17.Size.Size_800), 
                    iconSize = l_IconSize_0.Small
                };
                v32 = {
                    buttonPadding = v17.Padding.Small, 
                    contentPadding = UDim.new(0, v17.Padding.Small)
                };
                v30.text.Size = UDim2.fromScale(0.8, 0);
                v30.text.fontStyle = v17.Typography.CaptionSmall;
            end;
            v28 = v27 + v26 + l_Medium_0 * 2;
            v29 = v28 + l_Size_1000_0;
        end;
    end;
    return {
        navHeight = l_Size_1000_0, 
        itemCardSize = UDim2.fromOffset(v27, v27), 
        clearAllButtonStyles = v30, 
        navigationFrameHeight = v29, 
        slotItemCardThumbnailStyles = v31, 
        scrollingFramePadding = v32, 
        enableSnapToSelectedSlot = v19 == v2.BreakpointConfig.Enum.Landscape, 
        slotCardTotalHeight = v28
    };
end;