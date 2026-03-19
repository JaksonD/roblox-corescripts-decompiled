game:DefineFastFlag("WebViewServiceHasBackButtonVisibility", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("WebViewServiceHasBackButtonVisibility") and game:GetEngineFeature("WebViewHasBackButtonVisible");
end;