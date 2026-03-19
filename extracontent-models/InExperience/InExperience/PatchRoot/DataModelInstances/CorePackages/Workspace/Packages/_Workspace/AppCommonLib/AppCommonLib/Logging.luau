game:DefineFastFlag("LoggingRethrowUsingError", false);
local function _() --[[ Line: 8 ]] --[[ Name: GetFFlagLoggingRethrowUsingError ]]
    return game:GetFastFlag("LoggingRethrowUsingError");
end;
local v1 = true;
local v2 = {};
local function v5() --[[ Line: 15 ]] --[[ Name: createLogInfo ]]
    local v3 = {
        warnings = {}
    };
    setmetatable(v3, {
        __tostring = function(v4) --[[ Line: 21 ]] --[[ Name: __tostring ]]
            return ("LogInfo\n\tWarnings (%d):\n\t\t%s"):format(#v4.warnings, table.concat(v4.warnings, "\n\t\t"));
        end
    });
    return v3;
end;
return {
    capture = function(v6) --[[ Line: 31 ]] --[[ Name: capture ]]
        -- upvalues: v5 (copy), v1 (ref), v2 (copy)
        local v7 = v5();
        local l_v1_0 = v1;
        v1 = false;
        v2[v7] = true;
        local l_status_0, l_result_0 = pcall(v6);
        v2[v7] = nil;
        v1 = l_v1_0;
        if game:GetFastFlag("LoggingRethrowUsingError") then
            if not l_status_0 then
                error(l_result_0);
                return v7;
            end;
        else
            assert(l_status_0, l_result_0);
        end;
        return v7;
    end, 
    warn = function(v11) --[[ Line: 54 ]] --[[ Name: warn ]]
        -- upvalues: v2 (copy), v1 (ref)
        for v12 in pairs(v2) do
            table.insert(v12.warnings, v11);
        end;
        if v1 then
            warn(v11);
        end;
    end
};