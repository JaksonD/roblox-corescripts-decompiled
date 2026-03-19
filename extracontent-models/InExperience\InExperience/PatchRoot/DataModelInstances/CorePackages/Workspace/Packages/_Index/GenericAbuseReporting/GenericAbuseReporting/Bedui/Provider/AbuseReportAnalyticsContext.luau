local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.AbuseVector);
return v2.createContext({
    abuseVector = v3.Invalid, 
    isReportSubmitted = false, 
    setIsReportSubmitted = function(_) --[[ Line: 11 ]] --[[ Name: setIsReportSubmitted ]]

    end
});