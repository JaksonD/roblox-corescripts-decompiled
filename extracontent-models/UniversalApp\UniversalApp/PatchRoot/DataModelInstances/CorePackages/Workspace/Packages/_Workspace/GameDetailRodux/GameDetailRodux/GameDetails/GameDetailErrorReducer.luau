local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetailRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local v3 = require(l_script_FirstAncestor_0.GameDetails.AddGameDetails);
local v4 = require(l_script_FirstAncestor_0.GameDetails.SetGameDetailError);
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), l_Immutable_0 (copy), v3 (copy)
    v5 = v5 or {};
    if v6.type == v4.name then
        return (l_Immutable_0.Set(v5, v6.universeId, {
            errorType = v6.errorType
        }));
    else
        if v6.type == v3.name then
            if not next(v5) then
                return v5;
            else
                for v7, _ in pairs(v6.gameDetails) do
                    if v5[v7] then
                        v5 = l_Immutable_0.RemoveFromDictionary(v5, v7);
                    end;
                end;
            end;
        end;
        return v5;
    end;
end;