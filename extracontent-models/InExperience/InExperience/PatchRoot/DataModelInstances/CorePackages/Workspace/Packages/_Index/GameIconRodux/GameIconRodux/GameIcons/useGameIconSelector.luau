local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameIconRodux");
local v1 = require(l_script_FirstAncestor_0.GameIcons.GameIconReducer);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v4) --[[ Line: 7 ]] --[[ Name: useGameIconSelector ]]
    -- upvalues: l_useSelector_0 (copy), v1 (copy)
    return (l_useSelector_0(function(v5) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v4 (copy)
        return v5[v1.key][v4];
    end));
end;