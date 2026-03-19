local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = require(l_script_FirstAncestor_0.Constants).ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local v2 = require(l_script_FirstAncestor_0.Utils.Humanoid.destroyMakeupDescriptions);
return function(v3, v4) --[[ Line: 17 ]] --[[ Name: setMakeupDescriptions ]]
    -- upvalues: v2 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy)
    v2(v3);
    for v5, v6 in v4 do
        if l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v5] then
            for v7, v8 in v6 do
                local l_MakeupDescription_0 = Instance.new("MakeupDescription");
                l_MakeupDescription_0.MakeupType = l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v5];
                l_MakeupDescription_0.AssetId = tonumber(v7) or 0;
                l_MakeupDescription_0.Parent = v3;
                if v8.order then
                    l_MakeupDescription_0.Order = v8.order;
                end;
            end;
        end;
    end;
end;