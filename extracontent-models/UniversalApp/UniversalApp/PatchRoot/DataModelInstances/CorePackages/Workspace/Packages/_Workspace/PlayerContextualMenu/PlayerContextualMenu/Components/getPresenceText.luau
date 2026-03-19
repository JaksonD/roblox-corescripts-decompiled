local _ = require(script.Parent.Types);
return function(v1) --[[ Line: 3 ]] --[[ Name: getPresenceText ]]
    if v1 then
        if v1.status == "InGame" or v1.status == "InStudio" then
            return v1.locationString;
        elseif v1.status == "Online" then
            return "Online";
        else
            return "Offline";
        end;
    else
        return "";
    end;
end;