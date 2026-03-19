local v0 = require(script.Parent.GetFFlagIsSquadEnabled);
if game:DefineFastFlag("SquadAppChatRTNFixWithSquadMainFlag", false) then
    return (v0());
else
    return (game:DefineFastFlag("SquadAppChatRTNFix", false));
end;