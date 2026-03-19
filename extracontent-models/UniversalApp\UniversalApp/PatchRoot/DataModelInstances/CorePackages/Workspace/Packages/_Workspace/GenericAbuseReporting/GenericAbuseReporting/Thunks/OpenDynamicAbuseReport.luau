local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
return function(v6) --[[ Line: 22 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v7) --[[ Line: 23 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v6 (copy)
        v7:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.DynamicAbuseReport, v6));
    end;
end;