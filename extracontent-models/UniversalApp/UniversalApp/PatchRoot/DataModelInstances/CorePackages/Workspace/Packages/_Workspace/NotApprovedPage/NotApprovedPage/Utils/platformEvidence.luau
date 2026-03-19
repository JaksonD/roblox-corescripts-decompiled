local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagNapPublicEvidenceTranslationKeys);
local v4 = {
    validateViolation = v2.interface({
        evidence = v2.interface({
            type = v2.literal("platform"), 
            elements = v2.table, 
            displayMeta = v2.optional(v2.interface({
                lowercaseKey = v2.match(".+"), 
                capitalizedKey = v2.match(".+"), 
                icon = v2.match(".+")
            }))
        }), 
        abuseTypeTranslationKeys = v2.table, 
        uid = v2.match(".+")
    })
};
local v5 = v2.interface({
    type = v2.literal("image"), 
    labelKey = v2.match(".+"), 
    url = v2.match(".+"), 
    altLabelKey = v2.optional(v2.match(".+"))
});
local v6 = v2.interface({
    type = v2.literal("timestamp"), 
    labelKey = v2.match(".+"), 
    unix = v2.numberMin(1)
});
local v8 = if v3 then v2.intersection(v2.interface({
    type = v2.literal("text"), 
    labelKey = v2.match(".+"), 
    text = v2.optional(v2.match(".+")), 
    textKey = v2.optional(v2.match(".+")), 
    textKeyParameters = v2.optional(v2.table)
}), function(v7) --[[ Line: 53 ]]
    if not v7.text and not v7.textKey then
        return false, "textElement must have at least one of 'text' or 'textKey'";
    elseif v7.textKeyParameters and not v7.textKey then
        return false, "textKeyParameters requires textKey to be present";
    else
        return true, "";
    end;
end) else v2.interface({
    type = v2.literal("text"), 
    text = v2.match(".+"), 
    labelKey = v2.match(".+")
});
v4.checkElementIsVisible = v2.union(v8);
v4.checkElementIsValid = v2.union(v8, v6, v5);
v4.filterForVisibleElements = function(v9) --[[ Line: 78 ]]
    -- upvalues: v4 (copy)
    local v10 = {};
    for _, v12 in v9 do
        if v4.checkElementIsValid(v12) and v4.checkElementIsVisible(v12) then
            table.insert(v10, v12);
        end;
    end;
    return v10;
end;
v4.isVisibleInView = function(v13) --[[ Line: 90 ]]
    -- upvalues: v4 (copy)
    if not v4.validateViolation(v13) or #v13.evidence.elements == 0 then
        return false;
    else
        return #v4.filterForVisibleElements(v13.evidence.elements) > 0;
    end;
end;
return v4;