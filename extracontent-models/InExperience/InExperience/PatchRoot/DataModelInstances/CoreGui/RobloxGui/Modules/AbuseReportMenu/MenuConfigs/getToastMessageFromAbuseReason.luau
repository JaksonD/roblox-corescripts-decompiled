local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v1 = require(l_script_FirstAncestor_0.Components.Constants);
local l_ReportSuccessToast_0 = v1.ReportSuccessToast;
local l_PlayerAbuseTypes_0 = v1.PlayerAbuseTypes;
return function(v4, v5) --[[ Line: 6 ]] --[[ Name: getToastMessageFromAbuseReason ]]
    -- upvalues: l_ReportSuccessToast_0 (copy), l_PlayerAbuseTypes_0 (copy), v1 (copy)
    local l_ChatGeneric_0 = l_ReportSuccessToast_0.ChatGeneric;
    if v4 == l_PlayerAbuseTypes_0.Cheating then
        l_ChatGeneric_0 = l_ReportSuccessToast_0.Cheating;
    elseif v4 == l_PlayerAbuseTypes_0.Username then
        l_ChatGeneric_0 = l_ReportSuccessToast_0.BadUserName;
    elseif v4 == l_PlayerAbuseTypes_0.Links or v4 == v1.InappropriateContentAbuseReason then
        l_ChatGeneric_0 = l_ReportSuccessToast_0.Place;
    end;
    if v5 then
        l_ChatGeneric_0 = l_ReportSuccessToast_0.ReportAnythingGeneric;
    end;
    return l_ChatGeneric_0;
end;