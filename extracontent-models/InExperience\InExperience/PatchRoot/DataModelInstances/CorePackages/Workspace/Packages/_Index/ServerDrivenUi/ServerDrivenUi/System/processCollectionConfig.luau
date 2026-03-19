local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.SduiCoreSystem);
local l_SduiBuilder_0 = v1.SduiBuilder;
local l_SduiErrors_0 = v1.SduiErrors;
local v4 = game:DefineFastString("SduiEagerProcessCollectionIds", "400000000");
local v5 = {};
for v6 in v4:gmatch("(%w+)") do
    v5[v6] = true;
end;
return function(v7, v8, v9) --[[ Line: 17 ]] --[[ Name: processCollectionConfig ]]
    -- upvalues: v5 (copy), l_SduiBuilder_0 (copy), l_SduiErrors_0 (copy)
    if not v8 or not v5[tostring(v8)] then
        return v7;
    else
        local v10 = ("%*-%*"):format(v9.appPage, v8);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
            -- upvalues: l_SduiBuilder_0 (ref), v7 (copy), v9 (copy), v10 (copy)
            local v11, v12 = l_SduiBuilder_0.tryCreateEagerProcessedComponentConfig(v7, v9, v10, {}, true);
            if v11 then
                return v12;
            else
                error(v12);
                return;
            end;
        end);
        if not l_status_0 or not l_result_0 then
            local v15 = if typeof(l_result_0) == "string" then l_result_0 else "";
            v9.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToEagerlyProcess, {
                name = v10, 
                message = ("Failed to process collection config %*"):format(v15)
            }, v9.appPage);
            return v7;
        else
            return l_result_0;
        end;
    end;
end;