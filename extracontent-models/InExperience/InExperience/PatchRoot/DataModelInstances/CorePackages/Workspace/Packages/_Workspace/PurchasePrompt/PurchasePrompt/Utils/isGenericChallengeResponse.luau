local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Flags.GetFFlagEnablePerformPurchaseGCSHandling);
isGenericChallengeResponse = function(v2) --[[ Line: 5 ]] --[[ Name: isGenericChallengeResponse ]]
    -- upvalues: v1 (copy)
    if type(v2) ~= "string" then
        return false;
    else
        return v1() and v2:match("rblx%-challenge%-response") ~= nil and v2:match("rblx%-challenge%-id") ~= nil and v2:match("rblx%-challenge%-metadata") ~= nil and v2:match("rblx%-challenge%-type") ~= nil;
    end;
end;
return isGenericChallengeResponse;