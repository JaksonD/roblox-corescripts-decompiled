local v0 = require(script.Parent.GetFFlagIsSquadEnabled);
game:DefineFastFlag("AppChatAddConnectUnibarForActiveSquad", false);
return function() --[[ Line: 6 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("AppChatAddConnectUnibarForActiveSquad") and v0();
end;