local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineUGCValidateTexturePackCPlusPlus);
game:DefineFastFlag("UGCValidateCheckTexturePackOwner", false);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return game:GetFastFlag("UGCValidateCheckTexturePackOwner") and v1();
end;