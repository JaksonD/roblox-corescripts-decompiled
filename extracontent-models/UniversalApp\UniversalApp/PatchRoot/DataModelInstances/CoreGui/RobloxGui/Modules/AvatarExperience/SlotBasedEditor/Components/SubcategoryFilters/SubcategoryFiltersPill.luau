local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_FFlagAXBodyPartsPillLabel_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXBodyPartsPillLabel;
local function v11(v10) --[[ Line: 17 ]] --[[ Name: selectSubcategoryFilterIndex ]]
    return v10.AvatarExperience.AvatarEditor.Categories.subcategoryFilter;
end;
return function(v12) --[[ Line: 21 ]] --[[ Name: SubcategoryFiltersPill ]]
    -- upvalues: l_useNavigation_0 (copy), v1 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), v11 (copy), l_useLocalization_0 (copy), l_AvatarScreen_0 (copy), v3 (copy), l_FFlagAXBodyPartsPillLabel_0 (copy)
    local v13 = l_useNavigation_0();
    local v14 = v1.useRef(nil);
    local v15 = l_useTokens_0();
    local v16 = l_useSelector_0(v11);
    local v17 = if v12.categoryInfo.SubcategoryFilters then v12.categoryInfo.SubcategoryFilters[v16] else nil;
    local v18 = l_useLocalization_0({
        pillText = if v17 then v17.Title else nil
    });
    local v21 = v1.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v14 (copy), v15 (copy), v13 (copy), l_AvatarScreen_0 (ref)
        local l_current_0 = v14.current;
        local v20 = if l_current_0 then Vector2.new(l_current_0.AbsolutePosition.X, l_current_0.AbsolutePosition.Y + l_current_0.AbsoluteSize.Y + v15.Gap.Small) else nil;
        v13.navigate(l_AvatarScreen_0.SubcategoryFiltersDropdown, {
            dropdownPosition = v20
        });
    end, {
        v13, 
        v15
    });
    return v1.createElement(v3.Pill, {
        icon = {
            name = "icons/actions/truncationExpand_small", 
            position = v3.Enums.IconPosition.Right
        }, 
        text = v18.pillText, 
        isChecked = false, 
        ref = v14, 
        onActivated = v21, 
        LayoutOrder = if l_FFlagAXBodyPartsPillLabel_0 then v12.LayoutOrder else nil
    });
end;