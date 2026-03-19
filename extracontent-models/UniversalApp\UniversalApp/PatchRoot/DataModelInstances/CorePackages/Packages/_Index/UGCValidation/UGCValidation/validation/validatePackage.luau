local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.validation.validateSingleInstance);
local v4 = require(l_Parent_0.validation.validateAssetCreator);
local v5 = require(l_Parent_0.util.ParseContentIds);
local _ = require(l_Parent_0.util.Types);
return function(v7) --[[ Line: 12 ]] --[[ Name: validatePackage ]]
    -- upvalues: v3 (copy), v5 (copy), v2 (copy), v1 (copy), v4 (copy)
    assert(v7.instances ~= nil, "instances required in validationContext for validatePackage");
    local l_instances_0 = v7.instances;
    local l_restrictedUserIds_0 = v7.restrictedUserIds;
    local v10, v11 = v3(l_instances_0, v7);
    if not v10 then
        return v10, v11;
    else
        local v12 = l_instances_0[1];
        local v13 = {};
        local v14 = {};
        if not l_restrictedUserIds_0 or #l_restrictedUserIds_0 == 0 then
            return true;
        elseif not v5.parseWithErrorCheck(v13, v14, v12, v2.PACKAGE_CONTENT_ID_FIELDS, nil, v7) then
            v1.reportFailure(v1.ErrorType.validatePackage_FailedToParse, nil, v7);
            return false, {
                string.format("Failed to parse package data for model '%s'. Make sure the packageId is valid and try again.", v12:GetFullName())
            };
        else
            return v4(v14, v7);
        end;
    end;
end;