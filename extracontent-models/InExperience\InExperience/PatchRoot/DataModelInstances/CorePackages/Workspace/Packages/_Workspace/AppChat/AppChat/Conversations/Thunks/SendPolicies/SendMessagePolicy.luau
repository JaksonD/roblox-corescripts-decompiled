local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = {};
v2.__index = v2;
v2.onBeforeSendingMessage = function(_, _) --[[ Line: 9 ]] --[[ Name: onBeforeSendingMessage ]]

end;
v2.sendMessage = function(_, _) --[[ Line: 11 ]] --[[ Name: sendMessage ]]
    -- upvalues: v1 (copy)
    return v1.reject("Not implemented");
end;
v2.onSuccess = function(_, _, v9) --[[ Line: 15 ]] --[[ Name: onSuccess ]]
    return v9;
end;
v2.onFailure = function(_, _, v12) --[[ Line: 19 ]] --[[ Name: onFailure ]]
    return v12;
end;
return v2;