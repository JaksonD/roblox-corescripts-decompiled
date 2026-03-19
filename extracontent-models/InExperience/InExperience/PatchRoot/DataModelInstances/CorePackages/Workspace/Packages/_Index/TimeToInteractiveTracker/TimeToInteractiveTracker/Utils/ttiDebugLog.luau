local l_HttpService_0 = game:GetService("HttpService");
local _ = require(script.Parent.Parent.Stores.types);
local v2 = game:DefineFastFlag("DebugTimeToInteractiveTracker", false);
local function _(v3) --[[ Line: 10 ]] --[[ Name: formatPayload ]]
    -- upvalues: l_HttpService_0 (copy)
    if v3 == nil then
        return "";
    elseif type(v3) ~= "table" then
        return (tostring(v3));
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 20 ]]
            -- upvalues: l_HttpService_0 (ref), v3 (copy)
            return l_HttpService_0:JSONEncode(v3);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return (tostring(v3));
        end;
    end;
end;
return function(v7, v8, v9, v10) --[[ Line: 34 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    if not v2 then
        return;
    else
        local v11 = ("[TimeToInteractiveTracker][%s]"):format(v7);
        local v12;
        if v10 == nil then
            v12 = "";
        elseif type(v10) ~= "table" then
            v12 = tostring(v10);
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 20 ]]
                -- upvalues: l_HttpService_0 (ref), v10 (copy)
                return l_HttpService_0:JSONEncode(v10);
            end);
            v12 = if l_status_1 then l_result_1 else tostring(v10);
        end;
        local v15 = {
            v11, 
            v8
        };
        if v9 ~= nil then
            table.insert(v15, (tostring(v9)));
        end;
        if v12 ~= "" then
            table.insert(v15, v12);
        end;
        print(table.unpack(v15));
        return;
    end;
end;