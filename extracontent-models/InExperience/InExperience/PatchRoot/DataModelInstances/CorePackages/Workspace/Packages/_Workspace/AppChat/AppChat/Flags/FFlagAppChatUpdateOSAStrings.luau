local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
return require(l_Parent_0.SharedFlags).FFlagAppChatEnableGroupOSA and game:DefineFastFlag("AppChatUpdateOSAStrings", false);