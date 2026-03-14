local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineUGCValidateAssetTextureLimits);
game:DefineFastFlag("UGCValidateBodyAssetTextureLimits", false);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return v1() and game:GetFastFlag("UGCValidateBodyAssetTextureLimits");
end;