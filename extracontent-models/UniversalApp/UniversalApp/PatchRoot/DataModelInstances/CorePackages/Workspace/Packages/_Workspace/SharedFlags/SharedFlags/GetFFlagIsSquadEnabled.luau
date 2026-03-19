local v0 = game:DefineFastFlag("LuaAppEnableSquadPage4", false);
local v1 = game:DefineFastFlag("ForceEnableSquad", false);
local v2 = game:DefineFastFlag("SquadEnabled", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    return v2 or v0 and v1;
end;