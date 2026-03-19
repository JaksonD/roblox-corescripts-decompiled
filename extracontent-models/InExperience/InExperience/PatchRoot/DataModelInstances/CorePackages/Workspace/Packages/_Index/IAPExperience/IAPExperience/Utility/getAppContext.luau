return function() --[[ Line: 5 ]] --[[ Name: getAppContext ]]
    if game.GameId == 0 then
        return "UA";
    else
        return "IN_EXPERIENCE";
    end;
end;