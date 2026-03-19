local l_Parent_0 = script:FindFirstAncestor("SocialUpsell").Parent;
return require(l_Parent_0.SharedFlags).FFlagEnableCommsFAEUpsell and game:DefineFastFlag("AddAEGIS2Analytics", false);