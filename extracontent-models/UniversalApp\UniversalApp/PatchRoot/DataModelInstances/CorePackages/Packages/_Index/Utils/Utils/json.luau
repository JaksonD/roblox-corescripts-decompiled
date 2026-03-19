local l_HttpService_0 = game:GetService("HttpService");
return {
    stringify = function(v1, ...) --[[ Line: 20 ]] --[[ Name: stringify ]]
        -- upvalues: l_HttpService_0 (copy)
        if select("#", ...) > 0 then
            warn("JSON.stringify doesn't currently support more than 1 argument. All additional arguments will be ignored.");
        end;
        return l_HttpService_0:JSONEncode(v1);
    end, 
    parse = function(v2, ...) --[[ Line: 28 ]] --[[ Name: parse ]]
        -- upvalues: l_HttpService_0 (copy)
        if select("#", ...) > 0 then
            warn("JSON.parse doesn't currently support more than 1 argument. All additional arguments will be ignored.");
        end;
        return l_HttpService_0:JSONDecode(v2);
    end
};