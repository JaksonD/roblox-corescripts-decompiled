local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInfosRodux");
local v1 = require(l_script_FirstAncestor_0.GameInfosReducer);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v4) --[[ Line: 6 ]] --[[ Name: useGameInfosSelector ]]
    -- upvalues: l_useSelector_0 (copy), v1 (copy)
    return (l_useSelector_0(function(v5) --[[ Line: 7 ]]
        -- upvalues: v1 (ref), v4 (copy)
        return v5.Personalization[v1.key][v4];
    end));
end;