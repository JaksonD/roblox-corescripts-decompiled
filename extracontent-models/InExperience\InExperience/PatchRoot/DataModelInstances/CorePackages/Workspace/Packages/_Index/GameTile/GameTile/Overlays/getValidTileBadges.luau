local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local v5 = require(l_script_FirstAncestor_0.GameTileConstants);
local l_TileBadgePositionCalculators_0 = v5.TileBadgePositionCalculators;
local l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableUpdatedGameTileBadgeContract;
local function _(v8) --[[ Line: 16 ]] --[[ Name: isValidTileBadgePosition ]]
    -- upvalues: l_TileBadgePositionCalculators_0 (copy), l_flaggedMutedError_0 (copy)
    local v9 = l_TileBadgePositionCalculators_0[v8] ~= nil;
    if not v9 then
        l_flaggedMutedError_0("GameTileOverlayBadgeInvalidPositionError", (("Unsupported game tile badge position: %*"):format(v8)));
    end;
    return v9;
end;
return function(v11) --[[ Line: 29 ]] --[[ Name: getValidTileBadges ]]
    -- upvalues: l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 (copy), l_TileBadgePositionCalculators_0 (copy), l_flaggedMutedError_0 (copy), v5 (copy), l_mutedError_0 (copy)
    local v12 = false;
    local v13 = {};
    for v14, v15 in v11 do
        if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 then
            local v16 = l_TileBadgePositionCalculators_0[v14] ~= nil;
            if not v16 then
                l_flaggedMutedError_0("GameTileOverlayBadgeInvalidPositionError", (("Unsupported game tile badge position: %*"):format(v14)));
            end;
            v12 = v16;
        end;
        if not v12 then
            if l_FFlagLuaAppEnableUpdatedGameTileBadgeContract_0 or v14 ~= v5.TileBadgePositionValues.ImageTopLeft then
                continue;
            end;
        end;
        v12 = false;
        if #v15 > 0 then
            local v17 = v15[1];
            if v17.tileBadgeType and v17.analyticsId then
                v13[v14] = {
                    v15[1]
                };
            else
                l_mutedError_0("Invalid tile badge metadata.");
            end;
        end;
    end;
    return v13;
end;