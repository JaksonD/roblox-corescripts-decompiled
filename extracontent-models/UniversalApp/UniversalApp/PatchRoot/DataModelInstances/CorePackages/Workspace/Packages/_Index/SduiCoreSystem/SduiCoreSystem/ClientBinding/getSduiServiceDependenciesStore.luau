local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local v1 = require(l_script_FirstAncestor_0.SduiErrors);
local v2 = require(l_script_FirstAncestor_0.SduiLogger);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local function v8() --[[ Line: 20 ]] --[[ Name: createSduiServiceDependenciesStore ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = nil;
    local function v6(v5) --[[ Line: 23 ]] --[[ Name: setDependencies ]]
        -- upvalues: v4 (ref)
        v4 = v5;
    end;
    return {
        getDependencies = function(v7) --[[ Line: 27 ]] --[[ Name: getDependencies ]]
            -- upvalues: v4 (ref), v2 (ref), v1 (ref)
            if v4 == nil then
                v2.reportError(v1.SduiErrorType.GetNilDependencies, {
                    message = "Getting dependencies before they were set"
                }, v7);
            end;
            return v4;
        end, 
        setDependencies = v6
    };
end;
local v9 = nil;
return function() --[[ Line: 44 ]] --[[ Name: getSduiServiceDependenciesStore ]]
    -- upvalues: v9 (ref), v8 (copy)
    if v9 == nil then
        v9 = v8();
    end;
    return v9;
end;