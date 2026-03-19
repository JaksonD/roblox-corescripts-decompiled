local l_Parent_0 = script.Parent.Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
local _ = require(script.Parent.types);
local l_HttpService_0 = game:GetService("HttpService");
return function(v4) --[[ Line: 16 ]] --[[ Name: fetch ]]
    -- upvalues: l_createSignal_0 (copy), l_HttpService_0 (copy)
    local v5, v6 = l_createSignal_0(function() --[[ Line: 17 ]]
        return {
            status = "pending"
        };
    end);
    local v7 = l_HttpService_0:RequestInternal(v4);
    v7:Start(function(v8, v9) --[[ Line: 23 ]]
        -- upvalues: v6 (copy)
        if v8 then
            v6({
                status = "success", 
                data = v9
            });
            return;
        else
            v6({
                status = "error", 
                error = v9
            });
            return;
        end;
    end);
    return v5, function() --[[ Line: 31 ]] --[[ Name: cancelRequest ]]
        -- upvalues: v7 (copy)
        v7:Cancel();
    end;
end;