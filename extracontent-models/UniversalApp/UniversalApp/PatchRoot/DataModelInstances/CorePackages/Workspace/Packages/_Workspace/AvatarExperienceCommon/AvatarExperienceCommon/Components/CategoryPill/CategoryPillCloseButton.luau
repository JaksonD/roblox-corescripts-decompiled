local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Icon_0 = v2.Icon;
local l_Enums_0 = v2.Enums;
local l_FFlagAXCategoryPillPositionAnimation_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXCategoryPillPositionAnimation;
return function(v7) --[[ Line: 28 ]] --[[ Name: CategoryPillCloseButton ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v2 (copy), l_FFlagAXCategoryPillPositionAnimation_0 (copy), l_Icon_0 (copy), l_Enums_0 (copy)
    local l_ActionStandard_0 = l_useTokens_0().Color.ActionStandard;
    local v9 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v9 (copy), v7 (copy)
        if v9.current then
            v7.categoryButtonRefs["X-Button"] = v9;
            v7.navButtonRefs[v7.pillIndex] = v9;
        end;
    end, {});
    return v1.createElement(v2.View, {
        tag = "auto-xy radius-circle padding-small align-x-center align-y-center", 
        backgroundStyle = l_ActionStandard_0.Background, 
        onActivated = v7.onActivated, 
        LayoutOrder = if l_FFlagAXCategoryPillPositionAnimation_0 then nil else v7.layoutOrder, 
        ref = v9
    }, {
        CloseIcon = v1.createElement(l_Icon_0, {
            name = "x-small", 
            size = l_Enums_0.IconSize.Medium, 
            style = l_ActionStandard_0.Foreground
        })
    });
end;