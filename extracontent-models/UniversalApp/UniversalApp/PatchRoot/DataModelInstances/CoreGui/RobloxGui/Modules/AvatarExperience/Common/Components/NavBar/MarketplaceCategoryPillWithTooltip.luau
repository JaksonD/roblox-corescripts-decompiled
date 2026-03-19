local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.useCategoryButtonTooltip);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_CategoryPill_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.CategoryPill;
local l_AXTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.AXTooltip;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCategoryPillPositionAnimation_0 = v9.FFlagAXCategoryPillPositionAnimation;
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v9.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXCatalogCategoryTooltip_0 = v9.FFlagAXCatalogCategoryTooltip;
local l_FFlagAXMigrateCategoryTooltip_0 = v9.FFlagAXMigrateCategoryTooltip;
local l_FFlagAXCatalogCategoriesSDUI_0 = v9.FFlagAXCatalogCategoriesSDUI;
return function(v15) --[[ Line: 50 ]] --[[ Name: MarketplaceCategoryPillWithTooltip ]]
    -- upvalues: l_FFlagAXMigrateCategoryTooltip_0 (copy), v3 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), v2 (copy), l_FFlagAXCategoryPillPositionAnimation_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), l_CategoryPill_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_AXTooltip_0 (copy), v4 (copy)
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    if not l_FFlagAXMigrateCategoryTooltip_0 then
        local v19, v20, v21 = v3(if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v15.id else v15.navigationKey, v15.avatarScreenOfOrigin, if l_FFlagAXCatalogCategoryTooltip_0 then v15.categoryTooltipKey else nil);
        v16 = v19;
        v17 = v20;
        v18 = v21;
    end;
    local v22 = nil;
    local v23 = nil;
    if l_FFlagAXMigrateCategoryTooltip_0 then
        v22 = v2.createRef();
        local v24 = false;
        if v15.categoryTooltipKey ~= nil then
            v24 = false;
            if v15.categoryTooltipLocalizationKey ~= nil then
                v24 = not l_FFlagAXCategoryPillPositionAnimation_0 or v15.isSelectable;
            end;
        end;
        v23 = v24;
    end;
    local v25 = l_useTokens_0();
    local l_frameRef_0 = v15.frameRef;
    local v27 = l_useLocalization_0({
        tooltipTitle = v18
    });
    local v28 = if l_FFlagAXCategoryPillPositionAnimation_0 then v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v15 (copy), l_FFlagAXMigrateCategoryTooltip_0 (ref), v22 (ref), v17 (ref)
        v15.onActivated();
        if l_FFlagAXMigrateCategoryTooltip_0 then
            if v22.current then
                v22.current();
                return;
            end;
        else
            v17();
        end;
    end, {
        v15.onActivated, 
        v17
    }) else nil;
    local v29 = v2.useRef(nil);
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(0, 0, 0, v25.Size.Size_800), 
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        BackgroundTransparency = 1, 
        ref = l_frameRef_0, 
        LayoutOrder = v15.layoutOrder
    }, {
        Pill = v2.createElement(l_CategoryPill_0, {
            id = v15.id, 
            title = v15.title, 
            localizedTitle = if l_FFlagAXCatalogCategoriesSDUI_0 then v15.localizedTitle else nil, 
            isChecked = v15.isChecked, 
            onActivated = if l_FFlagAXCategoryPillPositionAnimation_0 then v28 else function() --[[ Line: 107 ]]
                -- upvalues: v15 (copy), l_FFlagAXMigrateCategoryTooltip_0 (ref), v22 (ref), v17 (ref)
                v15.onActivated();
                if l_FFlagAXMigrateCategoryTooltip_0 then
                    if v22.current then
                        v22.current();
                        return;
                    end;
                else
                    v17();
                end;
            end, 
            pillIndex = v15.pillIndex, 
            isSubcategory = v15.isSubcategory, 
            categoryButtonRefs = v15.categoryButtonRefs, 
            navButtonRefs = v15.navButtonRefs, 
            categories = v15.categories, 
            isSelectable = if l_FFlagAXCategoryPillPositionAnimation_0 then v15.isSelectable else nil, 
            pillRef = v29
        }), 
        AXTooltip = l_FFlagAXMigrateCategoryTooltip_0 and v2.createElement(l_AXTooltip_0, {
            popoverSide = "Top", 
            tooltipLocalizationKey = v15.categoryTooltipLocalizationKey, 
            tooltipStorageKey = v15.categoryTooltipKey or "", 
            dismissTooltipRef = v22, 
            showTooltip = v23, 
            localizedText = if l_FFlagAXCatalogCategoriesSDUI_0 then v15.categoryLocalizedTooltipBody else nil
        }), 
        ActionButtonPopover = not l_FFlagAXMigrateCategoryTooltip_0 and v2.createElement(v4.Popover.Root, {
            isOpen = v16 and v15.isSelectable
        }, {
            Anchor = v2.createElement(v4.Popover.Anchor, {
                anchorRef = v29
            }), 
            Content = v2.createElement(v4.Popover.Content, {
                align = v4.Enums.PopoverAlign.Center, 
                side = v4.Enums.PopoverSide.Top, 
                radius = v4.Enums.Radius.Medium, 
                backgroundStyle = v25.Color.System.Contrast
            }, {
                v2.createElement(v4.View, {
                    tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
                }, {
                    CategoryButtonTooltipTitle = v2.createElement(v4.Text, {
                        Text = v27.tooltipTitle, 
                        tag = "auto-xy text-title-medium content-inverse-emphasis"
                    }, {
                        TooltipOverlayButton = v2.createElement("TextButton", {
                            Transparency = 1, 
                            [v2.Event.Activated] = v15.tooltipActivated, 
                            Size = UDim2.fromScale(1, 1)
                        })
                    })
                })
            })
        })
    });
end;