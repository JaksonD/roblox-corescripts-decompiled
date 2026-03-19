local v0 = require(script.Parent.mutedError);
game:DefineFastString("SuppressMutedErrorKeys", "");
local function _() --[[ Line: 32 ]] --[[ Name: getFStringSuppressMutedErrorKeys ]]
    return game:GetFastString("SuppressMutedErrorKeys");
end;
local v2 = "";
local v3 = {};
local function v8(v4) --[[ Line: 39 ]] --[[ Name: shouldSuppressMutedError ]]
    -- upvalues: v2 (ref), v3 (ref)
    local l_game_FastString_0 = game:GetFastString("SuppressMutedErrorKeys");
    if l_game_FastString_0 ~= v2 then
        v2 = l_game_FastString_0;
        v3 = {};
        for _, v7 in (l_game_FastString_0:split(",")) do
            v3[v7] = true;
        end;
    end;
    return v3[v4] or false;
end;
return function(v9, v10, v11) --[[ Line: 53 ]] --[[ Name: flaggedMutedError ]]
    -- upvalues: v8 (copy), v0 (copy)
    if not v8(v9) then
        v0(v10, v11);
    end;
end;