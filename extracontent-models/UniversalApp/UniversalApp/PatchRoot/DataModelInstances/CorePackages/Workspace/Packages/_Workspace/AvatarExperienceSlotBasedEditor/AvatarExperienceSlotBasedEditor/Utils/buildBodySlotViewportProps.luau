local l_BodyAssetTypes_0 = require(script.Parent.Parent.Constants).BodyAssetTypes;
return function(v1, v2) --[[ Line: 18 ]] --[[ Name: buildBodySlotViewportProps ]]
    -- upvalues: l_BodyAssetTypes_0 (copy)
    local v3 = {};
    local v4 = v1:ToHex();
    for _, v6 in l_BodyAssetTypes_0 do
        local v7 = tostring(v6.Value);
        local v8 = v2[v7];
        if v8 then
            for v9, _ in v8 do
                v3[v9] = {
                    id = v9, 
                    assetType = tonumber(v7), 
                    quantityOwned = 1
                };
            end;
        end;
    end;
    return {
        lookDetails = {
            lookAssetInfos = v3, 
            lookBundleInfos = {}, 
            avatarProperties = {
                bodyColor3s = {
                    headColor3 = v4, 
                    leftArmColor3 = v4, 
                    leftLegColor3 = v4, 
                    rightArmColor3 = v4, 
                    rightLegColor3 = v4, 
                    torsoColor3 = v4
                }, 
                playerAvatarType = "R15"
            }
        }
    };
end;