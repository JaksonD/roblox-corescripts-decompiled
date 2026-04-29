local Parent = script:FindFirstAncestor("AppChat").Parent

return require(Parent.SharedFlags).FFlagAppChatEnableGroupOSA and game:DefineFastFlag("AppChatLoadInNewOSAInfo", false)
