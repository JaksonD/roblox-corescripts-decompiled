return {
    Enum = {
        IN_APP = "IN_APP", 
        IN_EXPERIENCE = "IN_EXPERIENCE"
    }, 
    get = function() --[[ Line: 14 ]] --[[ Name: get ]]
        if game.GameId == 0 then
            return "IN_APP";
        else
            return "IN_EXPERIENCE";
        end;
    end
};