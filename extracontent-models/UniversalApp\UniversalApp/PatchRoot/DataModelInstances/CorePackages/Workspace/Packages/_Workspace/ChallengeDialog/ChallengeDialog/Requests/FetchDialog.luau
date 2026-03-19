local l_Parent_0 = script:FindFirstAncestor("ChallengeDialog").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%schallenge-dialog-service/v1/dialogs", l_Url_0.APIS_URL), "GET");
end;