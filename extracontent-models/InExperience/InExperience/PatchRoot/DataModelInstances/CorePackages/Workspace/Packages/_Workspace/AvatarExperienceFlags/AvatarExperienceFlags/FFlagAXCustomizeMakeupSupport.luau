local v0 = pcall(function() --[[ Line: 1 ]]
    return Enum.AvatarAssetType.EyeMakeup, Enum.MakeupType.Eye;
end);
local v1 = require(script.Parent.FFlagAXMigrateSlotsSignals);
return v0 and game:DefineFastFlag("AXCustomizeMakeupSupport4", false) and v1;