local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabsPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_GetPresencesFromUserIds_0 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence).GetPresencesFromUserIds;
return function(v6) --[[ Line: 12 ]] --[[ Name: useFetchPresences ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v2 (copy), l_GetPresencesFromUserIds_0 (copy)
    local v7 = l_useDispatch_0();
    local v8 = v3.useRef({});
    v3.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: v2 (ref), v8 (copy), v6 (copy), v7 (copy), l_GetPresencesFromUserIds_0 (ref)
        local v9 = v2.List.toSet(v8.current);
        local v11 = v2.List.filter(v6, function(v10) --[[ Line: 18 ]]
            -- upvalues: v9 (copy)
            return not v9[v10];
        end);
        if #v11 > 0 then
            v7(l_GetPresencesFromUserIds_0.API(v11));
            v8.current = v2.List.join(v8.current, v11);
        end;
    end, {
        v6, 
        v7
    });
end;