local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v5 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiContext);
local l_AbuseReportBeduiContextStatus_0 = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes).AbuseReportBeduiContextStatus;
local v7 = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v8 = require(l_script_FirstAncestor_0.Bedui.Provider.fetchBeduiData);
local v9 = require(l_script_FirstAncestor_0.Bedui.Provider.validateBeduiData);
local v10 = game:DefineFastFlag("FallbackGenericAbuseReporting", false);
return function(v11) --[[ Line: 35 ]] --[[ Name: AbuseReportBeduiProvider ]]
    -- upvalues: v2 (copy), l_AbuseReportBeduiContextStatus_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v8 (copy), v9 (copy), v10 (copy), v7 (copy), v5 (copy)
    local v12, v13 = v2.useState({
        status = l_AbuseReportBeduiContextStatus_0.Loading
    });
    local v14 = l_useRoactService_0(l_RoactNetworking_0);
    v2.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v8 (ref), v14 (copy), v11 (copy), v9 (ref), v10 (ref), v7 (ref), v13 (copy), l_AbuseReportBeduiContextStatus_0 (ref)
        v8(v14, v11.abuseVector):andThen(function(v15) --[[ Line: 43 ]]
            -- upvalues: v9 (ref), v10 (ref), v8 (ref), v14 (ref), v7 (ref), v13 (ref), l_AbuseReportBeduiContextStatus_0 (ref)
            local v16, v17 = v9(v15.responseBody);
            if not v16 then
                warn("Invalid Bedui data:", v17);
                if v10 then
                    v8(v14, v7.Common):andThen(function(v18) --[[ Line: 51 ]]
                        -- upvalues: v9 (ref), v13 (ref), l_AbuseReportBeduiContextStatus_0 (ref)
                        local v19, v20 = v9(v18.responseBody);
                        if not v19 then
                            warn("Invalid Bedui common data:", v20);
                            v13({
                                status = l_AbuseReportBeduiContextStatus_0.Error, 
                                error = v20
                            });
                            return;
                        else
                            v13({
                                status = l_AbuseReportBeduiContextStatus_0.Success, 
                                beduiData = v18.responseBody
                            });
                            return;
                        end;
                    end):catch(function(v21) --[[ Line: 67 ]]
                        -- upvalues: v13 (ref), l_AbuseReportBeduiContextStatus_0 (ref)
                        warn("Failed to get Bedui common data");
                        v13({
                            status = l_AbuseReportBeduiContextStatus_0.Error, 
                            error = v21
                        });
                    end);
                    return;
                else
                    v13({
                        status = l_AbuseReportBeduiContextStatus_0.Error, 
                        error = v17
                    });
                    return;
                end;
            else
                v13({
                    status = l_AbuseReportBeduiContextStatus_0.Success, 
                    beduiData = v15.responseBody
                });
                return;
            end;
        end):catch(function(v22) --[[ Line: 87 ]]
            -- upvalues: v13 (ref), l_AbuseReportBeduiContextStatus_0 (ref)
            warn("Failed to get Bedui data");
            v13({
                status = l_AbuseReportBeduiContextStatus_0.Error, 
                error = v22
            });
        end);
    end, {
        v11.abuseVector
    });
    return v2.createElement(v5.Provider, {
        value = v12
    }, v11.children);
end;