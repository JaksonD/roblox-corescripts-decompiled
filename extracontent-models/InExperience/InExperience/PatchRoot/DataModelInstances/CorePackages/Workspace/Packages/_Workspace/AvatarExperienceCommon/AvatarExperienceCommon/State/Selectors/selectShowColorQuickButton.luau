local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(script.Parent.selectTryOnBodyIds);
local l_FFlagAXMISEnableMultiShopping_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
return function(v3) --[[ Line: 9 ]] --[[ Name: selectShowColorQuickButton ]]
    -- upvalues: v1 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy)
    local v4 = v1(v3);
    local v5 = if l_FFlagAXMISEnableMultiShopping_0 then v3.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem else nil;
    for _, v7 in v4 do
        local v8 = v3.AvatarExperience.Common.BundleInfos[v7];
        if l_FFlagAXMISEnableMultiShopping_0 and v8 and v8.isRecolorable and v5 and v5.itemId == v7 then
            return true;
        elseif not l_FFlagAXMISEnableMultiShopping_0 and v8 and v8.isRecolorable then
            return true;
        end;
    end;
    return false;
end;