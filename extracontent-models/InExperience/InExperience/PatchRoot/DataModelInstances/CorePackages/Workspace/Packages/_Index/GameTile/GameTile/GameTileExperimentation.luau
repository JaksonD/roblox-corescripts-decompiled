local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("LuaAppGameTileMigrationExpLayer", "PlayerApp.HomePage.UX.TileLayer");
local l_FFlagLuaAppUnifyPlayButtonTileIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp;
local function _(v4) --[[ Line: 9 ]] --[[ Name: getIsUserInTreatmentAndSendExposureLog ]]
    -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v2_0 = v2;
    local v6 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_0, true);
    if v6 and v6[v4] ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_0);
        return v6[v4];
    else
        return false;
    end;
end;
local function v10() --[[ Line: 21 ]] --[[ Name: getIsTileMigrationEnabled ]]
    -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v2_1 = v2;
    local v9 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_1, true);
    if v9 and v9.IsTileMigrationEnabled ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_1);
        return v9.IsTileMigrationEnabled;
    else
        return false;
    end;
end;
local v13 = l_FFlagLuaAppUnifyPlayButtonTileIxp_0 and function() --[[ Line: 26 ]]
    -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v2_2 = v2;
    local v12 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_2, true);
    if v12 and v12.IsPlayButtonMigrationEnabled ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v2_2);
        return v12.IsPlayButtonMigrationEnabled;
    else
        return false;
    end;
end or nil;
return {
    getIsTileMigrationEnabled = v10, 
    getIsPlayButtonMigrationEnabled = if l_FFlagLuaAppUnifyPlayButtonTileIxp_0 then v13 else nil
};