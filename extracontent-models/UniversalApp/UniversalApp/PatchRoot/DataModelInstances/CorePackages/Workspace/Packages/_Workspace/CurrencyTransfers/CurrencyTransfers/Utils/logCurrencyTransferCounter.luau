local l_script_FirstAncestor_0 = script:FindFirstAncestor("CurrencyTransfers");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LoggingProtocol);
local _ = require(l_script_FirstAncestor_0.Stores.createTransferStore);
return function(v4, v5, v6) --[[ Line: 9 ]] --[[ Name: logCurrencyTransferCounter ]]
    -- upvalues: v2 (copy)
    local v7 = v4.getDirection(false);
    local v8 = v4.getTransferOrigination(false);
    local v9 = {
        direction = if v7 then tostring(v7) else "unknown", 
        transferOrigination = if v8 then tostring(v8) else "unknown"
    };
    if v6 then
        for v10, v11 in v6 do
            v9[v10] = v11;
        end;
    end;
    v2.default:logRobloxTelemetryCounter(v5, 1, v9);
end;