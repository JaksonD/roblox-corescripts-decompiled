local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.enumerate);
local l_FFlagAXAvatarTimeoutFlowIE_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE;
local v3 = {
    "AllowInventoryReadAccess", 
    "SaveAvatar", 
    "CreateOutfit", 
    "EnterOutfitName", 
    "SetFavorite", 
    "DeleteOutfit", 
    "RenameOutfit", 
    "UpdateOutfit"
};
if l_FFlagAXAvatarTimeoutFlowIE_0 then
    table.insert(v3, "SaveAvatarTimeout");
end;
return v1("PromptType", v3);