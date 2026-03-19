local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXCategoryPillColorAnimation_0 = v6.FFlagAXCategoryPillColorAnimation;
local l_FFlagAXCategoryPillPositionAnimation_0 = v6.FFlagAXCategoryPillPositionAnimation;
local l_FFlagAXDisableHiddenCatalogCategoryPills_0 = v6.FFlagAXDisableHiddenCatalogCategoryPills;
local l_FFlagAXCatalogCategoriesSDUI_0 = v6.FFlagAXCatalogCategoriesSDUI;
local v11 = require(l_script_FirstAncestor_0.Hooks.useCategoryPillColorAnimation);
return function(v12) --[[ Line: 43 ]] --[[ Name: CategoryPill ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v2 (copy), l_FFlagAXCategoryPillColorAnimation_0 (copy), v11 (copy), v3 (copy), l_FFlagAXCategoryPillPositionAnimation_0 (copy), l_FFlagAXDisableHiddenCatalogCategoryPills_0 (copy)
    local v13 = l_useTokens_0();
    local v14 = l_useLocalization_0({
        title = if l_FFlagAXCatalogCategoriesSDUI_0 and v12.localizedTitle then nil else v12.title
    });
    local l_pillIndex_0 = v12.pillIndex;
    local l_navButtonRefs_0 = v12.navButtonRefs;
    local l_categories_0 = v12.categories;
    local v18 = v2.useRef(nil);
    if v12.pillRef then
        v18 = v12.pillRef;
    end;
    local v19 = if l_FFlagAXCategoryPillColorAnimation_0 then v11(v12.isChecked) else nil;
    v2.useEffect(function() --[[ Line: 64 ]]
        -- upvalues: v18 (ref), v12 (copy), l_pillIndex_0 (copy)
        if v18.current then
            v12.categoryButtonRefs[v12.id] = v18;
            v12.navButtonRefs[l_pillIndex_0] = v18;
        end;
    end, {});
    local l_ActionStandard_0 = v13.Color.ActionStandard;
    if v12.isChecked and not v12.isSubcategory then
        l_ActionStandard_0 = v13.Color.ActionSubEmphasis;
    end;
    return v2.createElement(v3.View, {
        tag = "auto-xy radius-circle padding-small align-x-center align-y-center", 
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        Size = UDim2.new(0, 0, 0, v13.Size.Size_800), 
        backgroundStyle = if not (not l_FFlagAXCategoryPillColorAnimation_0 or v12.isSubcategory) and v19 ~= nil then v19.animatedBackgroundStyle else l_ActionStandard_0.Background, 
        onActivated = v12.onActivated, 
        LayoutOrder = v12.layoutOrder or nil, 
        ref = v18, 
        NextSelectionLeft = if l_FFlagAXCategoryPillPositionAnimation_0 then nil else l_pillIndex_0 > 1 and l_navButtonRefs_0[l_pillIndex_0 - 1] or nil, 
        NextSelectionRight = if l_FFlagAXCategoryPillPositionAnimation_0 then nil else l_pillIndex_0 < #l_categories_0 and l_navButtonRefs_0[l_pillIndex_0 + 1] or nil, 
        isDisabled = if l_FFlagAXDisableHiddenCatalogCategoryPills_0 then not v12.isSelectable else nil, 
        selection = if l_FFlagAXCategoryPillPositionAnimation_0 then {
            Selectable = v12.isSelectable
        } else nil, 
        stroke = if v12.isSubcategory and v12.isChecked then {
            Color = v13.Color.System.Contrast.Color3, 
            Transparency = v13.Color.System.Contrast.Transparency, 
            Thickness = 1
        } else nil
    }, {
        PillText = v2.createElement(v3.Text, {
            Text = if l_FFlagAXCatalogCategoriesSDUI_0 and v12.localizedTitle then v12.localizedTitle else v14.title, 
            textStyle = if not (not l_FFlagAXCategoryPillColorAnimation_0 or v12.isSubcategory) and v19 ~= nil then v19.animatedTextStyle else l_ActionStandard_0.Foreground, 
            fontStyle = v13.Typography.CaptionLarge, 
            tag = "auto-xy text-align-x-center text-align-y-center text-no-wrap padding-x-xsmall text-truncate-end"
        })
    });
end;