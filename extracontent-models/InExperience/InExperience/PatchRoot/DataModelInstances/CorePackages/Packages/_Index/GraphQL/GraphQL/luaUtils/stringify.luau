local l_HttpService_0 = game:GetService("HttpService");
local v1 = l_HttpService_0:JSONEncode((require(script.Parent.null)));
return function(v2) --[[ Line: 5 ]] --[[ Name: stringify ]]
    -- upvalues: l_HttpService_0 (copy), v1 (copy)
    return (l_HttpService_0:JSONEncode(v2):gsub(v1, "null"));
end;