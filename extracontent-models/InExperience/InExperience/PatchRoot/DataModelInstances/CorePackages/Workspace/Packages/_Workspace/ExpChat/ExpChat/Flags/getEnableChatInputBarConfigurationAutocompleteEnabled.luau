return function() --[[ Line: 1 ]]
    return game:GetEngineFeature("EnableChatInputBarConfigurationAutocompleteEnabled") and not game:GetService("UserInputService").TouchEnabled;
end;