local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.AvatarExperienceCommon);
local _ = require(l_Parent_0.AvatarExperienceRodux);
local l_DynamicHead_0 = v2.Constants.ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead;
return function(v5, v6) --[[ Line: 28 ]] --[[ Name: updateDynamicHeadPropsInTryOn ]]
    -- upvalues: l_DynamicHead_0 (copy), v1 (copy)
    local v7 = {};
    for v8, v9 in v5 do
        if v9.bundleInfo then
            local v10 = {};
            for v11, v12 in v9.bundleInfo do
                if v12.assetType == l_DynamicHead_0 then
                    local v13 = v6(v12);
                    v10[v11] = if v13 then v1.Dictionary.join(v12, v13) else v12;
                else
                    v10[v11] = v12;
                end;
            end;
            v7[v8] = v1.Dictionary.join(v9, {
                bundleInfo = v10
            });
        else
            v7[v8] = v9;
        end;
    end;
    return v7;
end;