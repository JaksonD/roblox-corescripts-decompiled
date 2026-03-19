local v0 = {};
local _ = script.Parent;
local v2 = {};
v2.__index = v2;
v2.SendMessage = function(v3, v4, v5) --[[ Line: 15 ]] --[[ Name: SendMessage ]]
    v3.SayMessageRequest:FireServer(v4, v5);
end;
v2.RegisterSayMessageFunction = function(v6, v7) --[[ Line: 19 ]] --[[ Name: RegisterSayMessageFunction ]]
    v6.SayMessageRequest = v7;
end;
v0.new = function() --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v8 = setmetatable({}, v2);
    v8.SayMessageRequest = nil;
    return v8;
end;
return v0.new();