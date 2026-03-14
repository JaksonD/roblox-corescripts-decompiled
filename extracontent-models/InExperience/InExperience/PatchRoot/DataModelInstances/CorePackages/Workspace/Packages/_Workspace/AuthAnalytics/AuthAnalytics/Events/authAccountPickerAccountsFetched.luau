local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.checkAndSendEvent);
return function(v2, v3, v4, v5) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v6 = {
        validSessionUserIds = ("[%*]"):format((table.concat(v3, ","))), 
        shownUserIds = ("[%*]"):format((table.concat(v4, ","))), 
        appStoragePreviousUserIds = ("[%*]"):format((table.concat(v5, ",")))
    };
    v1(v2, "authAccountPickerAccountsFetched", v6);
end;