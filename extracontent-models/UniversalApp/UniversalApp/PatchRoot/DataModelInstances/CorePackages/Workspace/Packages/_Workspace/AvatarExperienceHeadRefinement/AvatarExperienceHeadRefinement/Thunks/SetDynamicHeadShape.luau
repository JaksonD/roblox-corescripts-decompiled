local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.AvatarExperienceCommon);
local _ = require(l_Parent_0.AvatarExperienceRodux);
local l_SetOutfitTryOns_0 = v2.State.Actions.SetOutfitTryOns;
local v5 = require(script.Parent.Parent.Actions.SetEquippedDynamicHeadShape);
local v6 = require(script.Parent.Parent.Utils.updateDynamicHeadPropsInTryOn);
return function(v7, _) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), l_SetOutfitTryOns_0 (copy)
    return function(v9) --[[ Line: 20 ]]
        -- upvalues: v1 (ref), v5 (ref), v7 (copy), v6 (ref), l_SetOutfitTryOns_0 (ref)
        local l_OutfitTryOn_0 = v9:getState().AvatarExperience.AvatarScene.OutfitTryOn;
        local v11 = l_OutfitTryOn_0.TryOnItems or {};
        if v1.isEmpty(v11) then
            v9:dispatch(v5(v7));
            return;
        else
            local v12 = v6(v11, function() --[[ Line: 31 ]]
                -- upvalues: v7 (ref)
                return {
                    headShape = v7
                };
            end);
            local v13 = v1.Dictionary.join(l_OutfitTryOn_0, {
                TryOnItems = v12
            });
            v9:dispatch(l_SetOutfitTryOns_0(v13));
            return;
        end;
    end;
end;