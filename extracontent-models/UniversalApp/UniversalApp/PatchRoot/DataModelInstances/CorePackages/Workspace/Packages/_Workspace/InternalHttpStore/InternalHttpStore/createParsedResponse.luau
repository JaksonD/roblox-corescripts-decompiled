local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local _ = require(l_Parent_1.HttpSignals);
local _ = require(l_Parent_0.HttpStoreTypes);
return function(v5, v6) --[[ Line: 13 ]] --[[ Name: createParsedResponse ]]
    -- upvalues: v2 (copy)
    return v2.createComputed(function(v7) --[[ Line: 17 ]]
        -- upvalues: v5 (copy), v6 (copy)
        local v8 = v5(v7);
        if v8.status == "success" then
            local l_data_0 = v8.data;
            return {
                status = "Success", 
                config = v6, 
                response = l_data_0
            };
        elseif v8.status == "error" then
            local l_error_0 = v8.error;
            return {
                status = "Failed", 
                config = v6, 
                response = l_error_0
            };
        else
            return {
                status = "Fetching", 
                config = v6
            };
        end;
    end);
end;