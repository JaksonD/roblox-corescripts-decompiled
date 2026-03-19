local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
return function() --[[ Line: 8 ]] --[[ Name: useNavigateToGameDetails ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v1 (copy), l_OpenGameDetails_0 (copy)
    local v5 = l_useDispatch_0();
    local v6 = l_useNavigation_0();
    return (v1.useCallback(function(v7, v8) --[[ Line: 12 ]]
        -- upvalues: v5 (copy), l_OpenGameDetails_0 (ref), v6 (copy)
        v5(l_OpenGameDetails_0(v7, v6, v8));
    end, {
        v5, 
        v6
    }));
end;