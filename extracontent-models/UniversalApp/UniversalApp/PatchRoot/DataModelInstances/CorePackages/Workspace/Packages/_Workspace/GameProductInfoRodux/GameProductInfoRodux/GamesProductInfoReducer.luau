local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameProductInfoRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = require(l_script_FirstAncestor_0.SetGamesProductInfo);
local _ = require(l_script_FirstAncestor_0.GameProductInfo);
return {
    key = "GamesProductInfoKey", 
    reducer = function(v5, v6) --[[ Line: 13 ]]
        -- upvalues: v3 (copy), l_Immutable_0 (copy)
        v5 = v5 or {};
        assert(v5, "");
        if v6.type == v3.name then
            v5 = l_Immutable_0.JoinDictionaries(v5, v6.gamesProductInfo);
        end;
        return v5;
    end
};