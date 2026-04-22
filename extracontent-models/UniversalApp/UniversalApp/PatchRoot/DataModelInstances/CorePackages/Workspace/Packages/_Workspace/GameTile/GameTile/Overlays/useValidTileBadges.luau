local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local v6 = require(l_script_FirstAncestor_0.Overlays.getValidTileBadges);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
return function(v8, v9, v10) --[[ Line: 13 ]] --[[ Name: useValidTileBadges ]]
    -- upvalues: l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), v5 (copy), v3 (copy), v6 (copy)
    local v12 = l_useSelector_0(function(v11) --[[ Line: 18 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), v8 (copy)
        return v11.Personalization[l_GameInfosReducer_0.key][v8];
    end);
    local v13 = v5(v12, v9);
    return (v3.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: v10 (copy), v13 (copy), v6 (ref)
        local v14 = nil;
        if v10 then
            v14 = v10;
        elseif v13 and v13.tileBadgesByPosition then
            v14 = v13.tileBadgesByPosition;
        end;
        if v14 then
            return v6(v14);
        else
            return nil;
        end;
    end, {
        v13, 
        v10
    }));
end;