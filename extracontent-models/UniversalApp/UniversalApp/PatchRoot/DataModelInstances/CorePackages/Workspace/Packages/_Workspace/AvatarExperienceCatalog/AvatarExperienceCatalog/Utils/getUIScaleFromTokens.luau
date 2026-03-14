return function(v0) --[[ Line: 6 ]] --[[ Name: getUIScaleFromTokens ]]
    if v0 and v0.Config and v0.Config.UI and v0.Config.UI.Scale then
        return v0.Config.UI.Scale;
    else
        return 1;
    end;
end;