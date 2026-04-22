local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceFlags").Parent;
local l_FFlagAXMigrateAXFocusBehaviorRoot_0 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot;
return game:DefineFastFlag("AXMigrateWearTimePopoverToFocusNavigation", false) and l_FFlagAXMigrateAXFocusBehaviorRoot_0;