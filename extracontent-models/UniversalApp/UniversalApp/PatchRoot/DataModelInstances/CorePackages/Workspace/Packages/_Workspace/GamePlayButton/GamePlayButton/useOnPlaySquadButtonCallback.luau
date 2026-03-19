local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local v1 = require(l_script_FirstAncestor_0.OpenCentralOverlayForGameDetailsSquad);
local v2 = require(l_script_FirstAncestor_0.PlayButtonStates);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
return function(v7, v8, v9, v10) --[[ Line: 12 ]]
    -- upvalues: l_useDispatch_0 (copy), v4 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v2 (copy), v1 (copy)
    local v11 = l_useDispatch_0();
    return v4.useCallback(function(v12) --[[ Line: 15 ]]
        -- upvalues: l_GetFFlagIsSquadEnabled_0 (ref), v8 (copy), v2 (ref), v11 (copy), v1 (ref), v7 (copy), v9 (copy), v10 (copy)
        if l_GetFFlagIsSquadEnabled_0() and v8 == v2.PlayableWithParty then
            v11(v1(v7, v12.AbsolutePosition, v12.AbsoluteSize, v9, v10));
        end;
    end, {
        v11, 
        v7, 
        v9, 
        v8, 
        v10
    });
end;