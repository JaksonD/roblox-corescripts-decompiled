local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_SlotItemCard_0 = v4.Components.SlotItemCard;
local v6 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.ScrollingArrowsAndGradient);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_ItemCard_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCard;
local l_SlotItemCardFooter_0 = v4.Components.SlotItemCardFooter;
local l_SlotType_0 = v4.Enums.SlotType;
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXSlotsScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsScrollAway;
local l_FFlagAXSlotBasedEditorCategoryTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotBasedEditorCategoryTooltip;
local l_FFlagAXCustomizeMakeupSupport_0 = v13.FFlagAXCustomizeMakeupSupport;
local v21 = if not l_FFlagAXCustomizeMakeupSupport_0 then nil else function(v18, v19, v20) --[[ Line: 81 ]]
    -- upvalues: v2 (copy), l_ItemCard_0 (copy), v3 (copy), l_SlotItemCardFooter_0 (copy)
    return v2.createElement(l_ItemCard_0, {
        Size = UDim2.fromOffset(1, if v18.Size then v18.Size.Y.Offset else v20.Size.Size_2500), 
        LayoutOrder = v19, 
        headerSlot = v2.createElement(v3.Divider, {
            orientation = v3.Enums.Orientation.Vertical
        }), 
        footerSlot = v2.createElement(l_SlotItemCardFooter_0, {
            title = nil, 
            TextXAlignment = Enum.TextXAlignment.Center
        })
    });
end;
local function _(v22, v23) --[[ Line: 99 ]]
    return v22 .. "_" .. v23;
end;
return function(v25) --[[ Line: 103 ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_useSelector_0 (copy), v2 (copy), l_Signal_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_SlotType_0 (copy), v21 (copy), l_SlotItemCard_0 (copy), l_FFlagAXSlotBasedEditorCategoryTooltip_0 (copy), l_FFlagAXSlotsScrollAway_0 (copy), v3 (copy), v6 (copy)
    local v26 = l_useTokens_0();
    local v27 = nil;
    if l_FFlagAXRootSlotBasedEditorFlag_0 then
        local v29 = l_useSelector_0(function(v28) --[[ Line: 108 ]]
            return v28.AvatarExperience.AvatarEditor.Character.EquippedAssets or {};
        end);
        v27 = v2.useMemo(function() --[[ Line: 112 ]]
            -- upvalues: l_Signal_0 (ref)
            return l_Signal_0.new();
        end, {});
        v2.useEffect(function() --[[ Line: 116 ]]
            -- upvalues: v27 (ref)
            if v27 then
                v27:fire();
            end;
        end, {
            v29, 
            v27
        });
    end;
    local v38 = v2.useCallback(function(v30) --[[ Line: 124 ]]
        -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (ref), v25 (copy), l_SlotType_0 (ref), v21 (ref), v26 (copy), v2 (ref), l_SlotItemCard_0 (ref), l_FFlagAXSlotBasedEditorCategoryTooltip_0 (ref), l_FFlagAXSlotsScrollAway_0 (ref), v3 (ref)
        local v31 = {};
        local l_getScrollingFrameItemRef_0 = v30.getScrollingFrameItemRef;
        local v33 = not l_FFlagAXCustomizeMakeupSupport_0 and nil;
        local v34 = l_FFlagAXCustomizeMakeupSupport_0 and 0 or nil;
        for v35, v36 in v25.slots do
            if not l_FFlagAXCustomizeMakeupSupport_0 or not v36.hide then
                if l_FFlagAXCustomizeMakeupSupport_0 then
                    v34 = v34 + 1;
                    if v36.slotType == l_SlotType_0.LayeredSlot and v33 and v25.slots[v35 - 1].slotType ~= l_SlotType_0.LayeredSlot then
                        table.insert(v31, v21(v36, v34, v26));
                        v34 = v34 + 1;
                    end;
                    v33 = true;
                end;
                table.insert(v31, (v2.createElement(l_SlotItemCard_0, {
                    Size = v36.Size, 
                    renderHeaderSlot = v36.renderHeaderSlot, 
                    BackgroundTransparency = v36.BackgroundTransparency, 
                    onActivated = v36.onActivated, 
                    title = v36.title, 
                    LayoutOrder = if l_FFlagAXCustomizeMakeupSupport_0 then v34 else v35, 
                    ref = l_getScrollingFrameItemRef_0(v35 .. "_" .. v25.slotCategory), 
                    isActive = v36.isActive, 
                    showSecondCategoryTooltip = if l_FFlagAXSlotBasedEditorCategoryTooltip_0 then v25.canShowTooltip and v35 == 2 or false else nil
                })));
                if l_FFlagAXCustomizeMakeupSupport_0 and v36.slotType == l_SlotType_0.LayeredSlot and v35 < #v25.slots and v25.slots[v35 + 1].slotType ~= l_SlotType_0.LayeredSlot then
                    v34 = v34 + 1;
                    table.insert(v31, v21(v36, v34, v26));
                end;
            end;
        end;
        if v25.clearAllButton then
            table.insert(v31, (v2.createElement(l_SlotItemCard_0, {
                renderHeaderSlot = v25.clearAllButton.renderHeaderSlot, 
                BackgroundTransparency = 1, 
                onActivated = v25.clearAllButton.onActivated, 
                LayoutOrder = if l_FFlagAXCustomizeMakeupSupport_0 then v34 + 1 else #v25.slots + 1, 
                ref = l_getScrollingFrameItemRef_0(#v25.slots + 1), 
                Size = v25.clearAllButton.Size, 
                title = v25.clearAllButton.text
            })));
        end;
        table.insert(v31, {
            v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v26.Padding.Large), 
                PaddingTop = if l_FFlagAXSlotsScrollAway_0 then UDim.new(0, v26.Padding.Medium) else UDim.new(0, v26.Padding.Large), 
                PaddingBottom = UDim.new(0, v26.Padding.Medium), 
                PaddingLeft = UDim.new(0, v26.Padding.Large)
            })
        });
        return v2.createElement(v3.View, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v26.Gap.Small)
            }, 
            BackgroundTransparency = 1, 
            onAbsoluteSizeChanged = function(v37) --[[ Line: 213 ]] --[[ Name: onAbsoluteSizeChanged ]]
                -- upvalues: v30 (copy)
                v30.onNavFrameSizeChanged(v37);
            end
        }, v31);
    end, {
        v25.slots, 
        v25.clearAllButton, 
        v25.contentPadding, 
        v25.margin
    });
    return v2.createElement(v6, {
        LayoutOrder = v25.LayoutOrder, 
        AutomaticSize = if l_FFlagAXSlotsScrollAway_0 then nil else v25.AutomaticSize, 
        ZIndex = v25.ZIndex, 
        buttonPadding = v25.buttonPadding, 
        enableIntroScroll = v25.enableIntroScroll, 
        selectedItemKey = v25.slotIndex .. "_" .. v25.slotCategory, 
        enableSnapToSelectedItem = v25.enableSnapToSelectedItem, 
        index = v25.index, 
        resetPositionSignal = v27, 
        navHeight = if l_FFlagAXSlotsScrollAway_0 then v25.slotSubNavigationFrameHeight else nil, 
        renderScrollingListContent = v38
    });
end;