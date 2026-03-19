local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_script_FirstAncestor_0.AnimationConstants);
local function v15(v6, v7, v8) --[[ Line: 21 ]] --[[ Name: useCategoryPillAnimation ]]
    -- upvalues: v4 (copy), v2 (copy), v5 (copy)
    local v9 = v8 and not v7;
    local v10 = v9 and 1 or 0;
    local v11, v12 = v4.useAnimatedBinding(v6);
    local v13, v14 = v4.useAnimatedBinding(v10);
    v2.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v12 (copy), v4 (ref), v6 (copy), v5 (ref)
        v12(v4.spring(v6, {
            frequency = v5.FIntAXCategoryPillPositionAnimationFrequency, 
            dampingRatio = v5.FIntAXCategoryPillPositionAnimationDampingRatio
        }));
    end, {
        v6, 
        v12
    });
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v10 (copy), v14 (copy), v4 (ref), v5 (ref)
        if v10 == 1 then
            v14(v4.instant(v10));
            return;
        else
            v14((v4.spring(v10, {
                frequency = v5.FIntAXCategoryPillTransparencyAnimationFrequency, 
                dampingRatio = v5.FIntAXCategoryPillTransparencyAnimationDampingRatio
            })));
            return;
        end;
    end, {
        v10
    });
    return v11, v13, v9;
end;
return function(v16) --[[ Line: 52 ]] --[[ Name: AnimatedCategoryPill ]]
    -- upvalues: v15 (copy), v2 (copy), v3 (copy)
    local l_catInfo_0 = v16.catInfo;
    local l_pillIndex_0 = v16.pillIndex;
    local l_isSelected_0 = v16.isSelected;
    local l_shouldShowSubcategories_0 = v16.shouldShowSubcategories;
    local l_targetX_0 = v16.targetX;
    local l_renderCategoryPill_0 = v16.renderCategoryPill;
    local l_onRef_0 = v16.onRef;
    local v24, v25, v26 = v15(l_targetX_0, l_isSelected_0, l_shouldShowSubcategories_0);
    local v27 = l_renderCategoryPill_0(l_catInfo_0, l_pillIndex_0, not v26);
    local v29 = v24:map(function(v28) --[[ Line: 68 ]]
        return UDim2.new(0, v28, 0.5, 0);
    end);
    return v2.createElement(v3.View, {
        tag = "auto-xy anchor-center-left padding-x-xxsmall", 
        Position = v29, 
        BackgroundTransparency = 1, 
        GroupTransparency = v25, 
        Size = UDim2.new(0, 0, 1, 0), 
        ref = l_onRef_0
    }, {
        Pill = v27
    });
end;