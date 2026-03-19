local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_script_FirstAncestor_0.AnimationConstants);
local l_FFlagAXDisableHiddenCatalogCategoryPills_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXDisableHiddenCatalogCategoryPills;
return function(v7) --[[ Line: 22 ]] --[[ Name: AnimatedSubcategoryPill ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy), l_FFlagAXDisableHiddenCatalogCategoryPills_0 (copy), v3 (copy)
    local l_subcategory_0 = v7.subcategory;
    local l_pillIndex_0 = v7.pillIndex;
    local l_renderCategoryPill_0 = v7.renderCategoryPill;
    local l_isFadingOut_0 = v7.isFadingOut;
    local v12, v13 = v4.useAnimatedBinding(0);
    v2.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v13 (copy), v4 (ref), v5 (ref)
        v13(v4.spring(1, {
            frequency = v5.FIntAXSubcategoryPillFadeAnimationFrequency, 
            dampingRatio = v5.FIntAXSubcategoryPillFadeAnimationDampingRatio
        }));
    end, {});
    v2.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: l_isFadingOut_0 (copy), v13 (copy), v4 (ref)
        if l_isFadingOut_0 then
            v13((v4.instant(0)));
        end;
    end, {
        l_isFadingOut_0
    });
    local v14 = nil;
    if l_FFlagAXDisableHiddenCatalogCategoryPills_0 then
        v14 = not l_isFadingOut_0;
    end;
    local v15 = l_renderCategoryPill_0(l_subcategory_0, l_pillIndex_0, v14);
    local v17 = v12:map(function(v16) --[[ Line: 56 ]]
        return 1 - v16;
    end);
    return v2.createElement(v3.View, {
        tag = "auto-xy anchor-center-left padding-x-xxsmall", 
        Size = UDim2.new(0, 0, 1, 0), 
        BackgroundTransparency = 1, 
        GroupTransparency = v17, 
        LayoutOrder = l_pillIndex_0
    }, {
        Pill = v15
    });
end;