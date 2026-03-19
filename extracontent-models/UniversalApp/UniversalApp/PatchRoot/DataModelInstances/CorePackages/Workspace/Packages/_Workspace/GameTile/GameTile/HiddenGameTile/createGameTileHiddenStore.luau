local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRemoveSponsoredReportHiddenState;
return function() --[[ Line: 25 ]] --[[ Name: createGameTileHiddenStore ]]
    -- upvalues: v2 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (copy)
    local v6, v7 = v2.createSignal({});
    return {
        setGameHidden = function(v8, v9, v10) --[[ Line: 28 ]]
            -- upvalues: v6 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), v7 (copy)
            local v11 = table.clone(v6(false));
            v11[v8] = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then v9 else {
                isHidden = v9, 
                hiddenTileType = v10
            };
            v7(v11);
        end, 
        getHiddenGames = v6
    };
end;