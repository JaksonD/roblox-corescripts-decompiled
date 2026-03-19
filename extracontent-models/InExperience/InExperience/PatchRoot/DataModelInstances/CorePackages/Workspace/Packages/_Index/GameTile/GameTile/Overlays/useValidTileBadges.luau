local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local v6 = require(l_script_FirstAncestor_0.Overlays.getValidTileBadges);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
return function(v9, v10, v11) --[[ Line: 16 ]] --[[ Name: useValidTileBadges ]]
    -- upvalues: l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), v5 (copy), v3 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), v6 (copy)
    local v13 = l_useSelector_0(function(v12) --[[ Line: 21 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), v9 (copy)
        return v12.Personalization[l_GameInfosReducer_0.key][v9];
    end);
    local v14 = v5(v13, v10);
    return (v3.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), v11 (copy), v14 (copy), v6 (ref)
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            local v15 = nil;
            if v11 then
                v15 = v11;
            elseif v14 and v14.tileBadgesByPosition then
                v15 = v14.tileBadgesByPosition;
            end;
            if v15 then
                return v6(v15);
            else
                return nil;
            end;
        elseif v14 and v14.tileBadgesByPosition then
            return v6(v14.tileBadgesByPosition);
        else
            return nil;
        end;
    end, {
        v14, 
        if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v11 else nil
    }));
end;