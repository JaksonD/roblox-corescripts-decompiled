local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_SetOutfitTryOns_0 = require(l_Parent_0.AvatarExperienceCommon).State.Actions.SetOutfitTryOns;
local v3 = require(script.Parent.Parent.Actions.SetEquippedStaticFacialAnimation);
local v4 = require(script.Parent.Parent.Utils.updateDynamicHeadPropsInTryOn);
local _ = require(l_Parent_0.AvatarExperienceRodux);
return function(v6, _) --[[ Line: 17 ]] --[[ Name: SetStaticFacialAnimation ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), l_SetOutfitTryOns_0 (copy)
    return function(v8) --[[ Line: 18 ]]
        -- upvalues: v1 (ref), v3 (ref), v6 (copy), v4 (ref), l_SetOutfitTryOns_0 (ref)
        local l_OutfitTryOn_0 = v8:getState().AvatarExperience.AvatarScene.OutfitTryOn;
        local v10 = l_OutfitTryOn_0.TryOnItems or {};
        if v1.isEmpty(v10) then
            v8:dispatch(v3(v6));
            return;
        else
            local v11 = v4(v10, function() --[[ Line: 29 ]]
                -- upvalues: v6 (ref)
                return {
                    staticFacialAnimation = v6
                };
            end);
            local v12 = v1.Dictionary.join(l_OutfitTryOn_0, {
                TryOnItems = v11
            });
            v8:dispatch(l_SetOutfitTryOns_0(v12));
            return;
        end;
    end;
end;