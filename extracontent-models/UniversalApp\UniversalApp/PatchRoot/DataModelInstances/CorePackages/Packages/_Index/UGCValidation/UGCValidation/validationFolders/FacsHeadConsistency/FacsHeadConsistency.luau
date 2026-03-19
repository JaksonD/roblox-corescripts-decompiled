local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v5 = game:DefineFastInt("UGCValidationMinimumHeadSizePercentAcrossFacs", 95);
local v6 = game:DefineFastInt("UGCValidationMaximumHeadSizePercentAcrossFacs", 120);
return {
    fflag = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs), 
    categories = {
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v2.SharedDataMember.renderMeshesData
    }, 
    expectedFailures = {
        "Asset_EF_HeadWithExpandingFacs", 
        "Asset_EF_HeadWithShrinkingFacs"
    }, 
    run = function(v7, v8) --[[ Line: 16 ]]
        -- upvalues: l_UGCValidationService_0 (copy), v5 (copy), v3 (copy), v6 (copy)
        local l_Head_0 = v8.renderMeshesData.Head;
        local v10, v11 = unpack(l_UGCValidationService_0:GetMinAndMaxMeshSizeAcrossAllFacs(l_Head_0.editable));
        local v12 = 100 * v10 / l_Head_0.originalSize;
        local v13 = math.floor((math.min(v12.X, v12.Y, v12.Z)));
        if v13 < v5 then
            v7:fail(v3.Keys.FacsShrinksHead, {
                modPercent = v13
            });
        end;
        local v14 = 100 * v11 / l_Head_0.originalSize;
        local v15 = math.ceil((math.max(v14.X, v14.Y, v14.Z)));
        if v6 < v15 then
            v7:fail(v3.Keys.FacsExpandsHead, {
                modPercent = v15
            });
        end;
    end
};