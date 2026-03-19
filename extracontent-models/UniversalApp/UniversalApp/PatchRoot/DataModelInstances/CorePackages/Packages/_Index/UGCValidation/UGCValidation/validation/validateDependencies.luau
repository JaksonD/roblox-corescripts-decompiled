local l_Parent_0 = script.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = game:DefineFastFlag("NoStudioOwnershipCheck", false);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.util.ParseContentIds);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.util.getAssetCreationDetailsRCC);
local _ = require(l_Parent_0.util.Types);
local v9 = require(l_Parent_0.validation.validateCanLoad);
local v10 = require(l_Parent_0.validation.validateAssetCreator);
local function v15(v11, v12) --[[ Line: 23 ]] --[[ Name: validateExistance ]]
    -- upvalues: v9 (copy)
    for _, v14 in pairs(v11) do
        if not v9(v14.instance[v14.fieldName], v12) then
            error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v14.instance.Name));
        end;
    end;
end;
local v16 = {
    MODERATION_STATE_REVIEWING = {
        MODERATION_STATE_REVIEWING = true, 
        Reviewing = true
    }, 
    MODERATION_STATE_APPROVED = {
        MODERATION_STATE_APPROVED = true, 
        Approved = true
    }
};
local function v23(v17, v18, v19, v20, v21, v22) --[[ Line: 44 ]] --[[ Name: validateCreatorId ]]
    -- upvalues: v3 (copy)
    if not v17[tonumber(v18)] then
        v3.reportFailure(v3.ErrorType.validateDependencies_IsRestrictedUserId, nil, v22);
        return false, {
            (("%*.%* ( %* ) is not owned by the current user. You can only validate assets that you or a group you belong to owns."):format(v19:GetFullName(), v20, v21))
        };
    else
        return true;
    end;
end;
local function v29(v24, v25, v26, v27, v28) --[[ Line: 62 ]] --[[ Name: validateModerationState ]]
    -- upvalues: v16 (copy), v3 (copy)
    if v16.MODERATION_STATE_REVIEWING[v24] then
        v3.reportFailure(v3.ErrorType.validateDependencies_IsReviewing, nil, v28);
        error("Failed to load asset {instance:GetFullName()}.{fieldName} ( {id} ) that is still going through the review process. Please, wait for a notification of completion from the review process and try again.");
    end;
    if not v16.MODERATION_STATE_APPROVED[v24] then
        v3.reportFailure(v3.ErrorType.validateDependencies_IsNotApproved, nil, v28);
        return false, {
            (("%*.%* ( %* ) is not owned by the current user. You can only validate assets that you or a group you belong to owns."):format(v25:GetFullName(), v26, v27))
        };
    else
        return true;
    end;
end;
local function v43(v30, v31, v32) --[[ Line: 91 ]] --[[ Name: validateModerationRCC ]]
    -- upvalues: v6 (copy), v7 (copy), v23 (copy), v29 (copy)
    if not v30 or #v30 == 0 then
        return true;
    else
        local v33 = {};
        for _, v35 in ipairs(v30) do
            v33[tonumber(v35.id)] = true;
        end;
        local v36 = v6.new();
        for v37, v38 in pairs(v31) do
            local v39, v40 = v7(v37);
            if not v39 then
                error("Failed to load asset");
            end;
            local l_creator_0 = v40.creationContext.creator;
            local v42 = if l_creator_0.userId then l_creator_0.userId else l_creator_0.groupId;
            v36:updateReasons(v23(v33, v42, v38.instance, v38.fieldName, v37, v32));
            v36:updateReasons(v29(v40.moderationResult.moderationState, v38.instance, v38.fieldName, v37, v32));
        end;
        return v36:getFinalResults();
    end;
end;
local function v46(v44, v45) --[[ Line: 136 ]] --[[ Name: validateAssetCreatorsRCC ]]
    -- upvalues: v10 (copy)
    assert(v45.isServer, "isServer must be true for validateAssetCreatorsRCC");
    return v10(v44, v45);
end;
return function(v47, v48) --[[ Line: 141 ]] --[[ Name: validateDependencies ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v15 (copy), v6 (copy), v2 (copy), l_RunService_0 (copy), v46 (copy), v43 (copy)
    local v49 = tick();
    local v50 = if v48 then v48.isServer else nil;
    local l_allowEditableInstances_0 = v48.allowEditableInstances;
    local v52 = if v48 then v48.restrictedUserIds else nil;
    local v53 = if v48 then v48.universeId else nil;
    local v54 = {};
    local v55, v56 = v5.parseWithErrorCheck({}, v54, v47, nil, v4.CONTENT_ID_REQUIRED_FIELDS, v48);
    if not v55 then
        v3.reportFailure(v3.ErrorType.validateDependencies_ParseFailure, nil, v48);
        return false, v56;
    else
        if v50 and not l_allowEditableInstances_0 then
            v15(v54, v48);
        end;
        local v57 = v6.new();
        if (not v2 or v2 and not l_RunService_0:IsStudio()) and v50 then
            if v53 then
                v57:updateReasons(v46(v54, v48));
            else
                v57:updateReasons(v43(v52, v54, v48));
            end;
        end;
        if v48 then
            v3.recordScriptTime(script.Name, v49, v48);
        end;
        return v57:getFinalResults();
    end;
end;