local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local l_validationFolders_0 = l_Parent_0.validationFolders;
local v4 = {};
local v5 = {
    v2.SharedDataMember.aqsSummaryData, 
    v2.SharedDataMember.renderMeshesData, 
    v2.SharedDataMember.innerCagesData, 
    v2.SharedDataMember.outerCagesData, 
    v2.SharedDataMember.meshTextures
};
local v6 = {};
for v7, v8 in v2 do
    v6[v7] = {};
    if typeof(v8) == "table" then
        for v9, _ in v8 do
            v6[v7][v9] = true;
        end;
    end;
end;
local function v16(v11, v12, v13) --[[ Line: 32 ]] --[[ Name: tableOnlyHasExistingEnums ]]
    -- upvalues: v6 (copy)
    if typeof(v12) ~= "table" then
        error((("Invalid config option %* inside of %* - expected to be table"):format(v13, v11)));
    end;
    for _, v15 in v12 do
        if not v6[v13][v15] then
            error((("Invalid config option %* in %* inside of %*"):format(v15, v13, v11)));
        end;
    end;
end;
local function v17() --[[ Line: 44 ]] --[[ Name: defaultFlagCheck ]]
    return true;
end;
local function v18() --[[ Line: 48 ]] --[[ Name: defaultShadowCheck ]]
    return false;
end;
local v19 = {};
for _, v21 in v2.ValidationModule do
    local l_l_validationFolders_0_FirstChild_0 = l_validationFolders_0:FindFirstChild(v21);
    if l_l_validationFolders_0_FirstChild_0 == nil then
        error((("%* validation folder is missing from validationFolders"):format(v21)));
    end;
    local l_l_l_validationFolders_0_FirstChild_0_FirstChild_0 = l_l_validationFolders_0_FirstChild_0:FindFirstChild(v21);
    if l_l_l_validationFolders_0_FirstChild_0_FirstChild_0 == nil or not l_l_l_validationFolders_0_FirstChild_0_FirstChild_0:IsA("ModuleScript") then
        error((("%*.lua validation file is missing from validationFolders/%*"):format(v21, v21)));
    end;
    local v24 = require(l_l_l_validationFolders_0_FirstChild_0_FirstChild_0);
    for v25, _ in v24 do
        if typeof(v25) ~= "string" then
            error((("%*.lua contains non-string key %*"):format(v21, (tostring(v25)))));
        elseif not v6.ValidationConfig[v25] then
            error((("%*.lua contains unexpected member %*. Check for typos or add an extra ValidationEnums.ValidationConfig"):format(v21, v25)));
        end;
    end;
    v24.fflag = v24.fflag or v17;
    v24.shadowFlag = v24.shadowFlag or v18;
    v24.categories = v24.categories or {};
    v24.requiredData = v24.requiredData or {};
    v24.conditionalData = v24.conditionalData or {};
    v24.prereqTests = v24.prereqTests or {};
    v24.expectedFailures = v24.expectedFailures or {};
    v24.expectedAqsData = v24.expectedAqsData or {};
    v24.knownAqsUserErrors = v24.knownAqsUserErrors or {};
    if next(v24.expectedAqsData) ~= nil then
        for _, v28 in v5 do
            if not table.find(v24.requiredData, v28) then
                table.insert(v24.requiredData, v28);
            end;
        end;
    end;
    if v24.run == nil or typeof(v24.run) ~= "function" then
        error((("Missing module run function in %*"):format(v21)));
    end;
    setmetatable(v24, {
        __index = function(_, v30) --[[ Line: 102 ]] --[[ Name: __index ]]
            -- upvalues: v21 (copy)
            error((("Invalid ValidationConfig %* used on the module %*"):format(v30, v21)));
        end
    });
    if typeof(v24.fflag) ~= "function" or typeof(v24.fflag()) ~= "boolean" then
        error((("Invalid FFlag config in %*"):format(v21)));
    end;
    if typeof(v24.shadowFlag) ~= "function" or typeof(v24.shadowFlag()) ~= "boolean" then
        error((("Invalid shadowFlag config in %*"):format(v21)));
    end;
    v16(v21, v24.categories, "UploadCategory");
    v16(v21, v24.requiredData, "SharedDataMember");
    v16(v21, v24.conditionalData, "SharedDataMember");
    v16(v21, v24.prereqTests, "ValidationModule");
    v19[v21] = v24;
end;
v4.getValidationModule = function(v31) --[[ Line: 123 ]] --[[ Name: getValidationModule ]]
    -- upvalues: v19 (copy)
    if v19[v31] == nil then
        error((("%* does not exist in the preload table."):format(v31)));
    end;
    return v19[v31];
end;
return v4;