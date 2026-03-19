local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_VIOLATION_TYPE_TO_PLURAL_MAP_0 = require(l_script_FirstAncestor_0.Parent.NotApprovedPageState).Constants.VIOLATION_TYPE_TO_PLURAL_MAP;
local v3 = require(l_script_FirstAncestor_0.Utils.platformEvidence);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagNapPublicEvidenceTranslationKeys);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: setViolationEvidenceTranslationKeys ]]
    -- upvalues: v3 (copy), v4 (copy), l_VIOLATION_TYPE_TO_PLURAL_MAP_0 (copy)
    local l_violation_0 = v5.violation;
    if not l_violation_0 or not v3.isVisibleInView(l_violation_0) then
        return;
    else
        local l_evidence_0 = l_violation_0.evidence;
        local v9 = l_evidence_0.elements or {};
        for _, v11 in v9 do
            if v11.labelKey then
                v6[v11.labelKey] = "Feature.AppealsPortal." .. v11.labelKey;
            end;
            if v11.altLabelKey then
                v6[v11.altLabelKey] = "Feature.AppealsPortal." .. v11.altLabelKey;
            end;
            if v4 and v11.textKey then
                local v12 = v11.textKey .. "_" .. v11.labelKey;
                if v11.textKeyParameters then
                    local v13 = {
                        "Feature.NotApproved." .. v11.textKey
                    };
                    for v14, v15 in v11.textKeyParameters do
                        v13[v14] = v15;
                    end;
                    v6[v12] = v13;
                else
                    v6[v12] = "Feature.NotApproved." .. v11.textKey;
                end;
            end;
        end;
        for _, v17 in l_violation_0.abuseTypeTranslationKeys do
            v6[v17] = "Feature.NotApproved." .. v17;
        end;
        if l_evidence_0.displayMeta then
            local l_capitalizedKey_0 = l_evidence_0.displayMeta.capitalizedKey;
            if l_capitalizedKey_0 and l_capitalizedKey_0 ~= "" then
                v6.violationType = l_VIOLATION_TYPE_TO_PLURAL_MAP_0[l_capitalizedKey_0];
            end;
        end;
        return;
    end;
end;