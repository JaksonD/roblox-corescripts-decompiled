local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagAXFixDeselectOutfitInManage_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixDeselectOutfitInManage;
return game:DefineFastFlag("AEGetEditableOutfitsType2", false) and l_FFlagAXFixDeselectOutfitInManage_0;