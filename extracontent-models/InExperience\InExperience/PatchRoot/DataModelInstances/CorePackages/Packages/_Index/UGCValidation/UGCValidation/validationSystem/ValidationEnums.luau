local v0 = {};
local function v7(v1) --[[ Line: 8 ]] --[[ Name: createEnumMetatable ]]
    return {
        __index = function(_, v3) --[[ Line: 10 ]] --[[ Name: __index ]]
            -- upvalues: v1 (copy)
            error("Invalid ValidationEnums." .. v1 .. " enum value: " .. tostring(v3));
        end, 
        __newindex = function(_, _, _) --[[ Line: 13 ]] --[[ Name: __newindex ]]
            error("Cannot add new keys to ValidationEnums");
        end, 
        __metatable = "This metatable is protected"
    };
end;
local function v11(v8) --[[ Line: 20 ]] --[[ Name: finalizeEnumTable ]]
    -- upvalues: v0 (copy), v7 (copy)
    if v0[v8] == nil then
        error(v8 .. " enum table is not found");
    end;
    for v9, v10 in v0[v8] do
        if typeof(v9) ~= "string" then
            error(v8 .. " enum table has non string key " .. tostring(v9));
        elseif v9 ~= v10 then
            error(v8 .. " enum table has non-matching key and value for key " .. tostring(v9));
        end;
    end;
    setmetatable(v0[v8], (v7(v8)));
end;
v0.ValidationModule = {
    ExpectedRootSchema = "ExpectedRootSchema", 
    SingleInstanceSelected = "SingleInstanceSelected", 
    NoExtraTags = "NoExtraTags", 
    HeadIsDynamic = "HeadIsDynamic", 
    NoFACSOverrideData = "NoFACSOverrideData"
};
v11("ValidationModule");
v0.SharedDataMember = {
    jobId = "jobId", 
    entrypointInput = "entrypointInput", 
    rootInstance = "rootInstance", 
    uploadCategory = "uploadCategory", 
    uploadEnum = "uploadEnum", 
    consumerConfig = "consumerConfig", 
    aqsFetchMetrics = "aqsFetchMetrics", 
    aqsSummaryData = "aqsSummaryData", 
    renderMeshesData = "renderMeshesData", 
    innerCagesData = "innerCagesData", 
    outerCagesData = "outerCagesData", 
    meshTextures = "meshTextures"
};
v11("SharedDataMember");
v0.ValidationConfig = {
    categories = "categories", 
    fflag = "fflag", 
    shadowFlag = "shadowFlag", 
    prereqTests = "prereqTests", 
    requiredData = "requiredData", 
    conditionalData = "conditionalData", 
    expectedAqsData = "expectedAqsData", 
    knownAqsUserErrors = "knownAqsUserErrors", 
    expectedFailures = "expectedFailures", 
    run = "run"
};
v11("ValidationConfig");
v0.Status = {
    CANNOT_START = "CANNOT_START", 
    TIMEOUT = "TIMEOUT", 
    ERROR = "ERROR", 
    FAIL = "FAIL", 
    PASS = "PASS"
};
v11("Status");
v0.UploadCategory = {
    TORSO_AND_LIMBS = "TORSO_AND_LIMBS", 
    DYNAMIC_HEAD = "DYNAMIC_HEAD", 
    LAYERED_CLOTHING = "LAYERED_CLOTHING", 
    RIGID_ACCESSORY = "RIGID_ACCESSORY", 
    EMOTE_ANIMATION = "EMOTE_ANIMATION", 
    MAKEUP = "MAKEUP", 
    FULL_BODY = "FULL_BODY", 
    BOTH_SHOES = "BOTH_SHOES"
};
v11("UploadCategory");
return v0;