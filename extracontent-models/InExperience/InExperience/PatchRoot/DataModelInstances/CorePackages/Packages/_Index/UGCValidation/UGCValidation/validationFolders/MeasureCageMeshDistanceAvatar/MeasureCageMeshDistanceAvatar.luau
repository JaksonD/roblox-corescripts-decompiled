local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = game:DefineFastInt("UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar", 60);
local v5 = game:DefineFastInt("UGCValidationCageMeshDistanceMaxNegativeSDFThresholdAvatar", 30);
return {
    categories = {
        v2.UploadCategory.FULL_BODY
    }, 
    fflag = require(l_Parent_0.flags.getFFlagUGCValidateAQCageQualityAvatar), 
    expectedAqsData = {
        Measure_Cage_Mesh_Distance_Avatar = {}
    }, 
    run = function(v6, v7) --[[ Line: 17 ]]
        -- upvalues: v3 (copy), v4 (copy), v5 (copy)
        local l_full_body_cage_0 = v7.aqsSummaryData.Measure_Cage_Mesh_Distance_Avatar.full_body_cage;
        if l_full_body_cage_0 == nil or l_full_body_cage_0.max_distance == nil or l_full_body_cage_0.negative_sdf_percent == nil then
            v6:fail(v3.Keys.AQSInputDataError);
            return;
        else
            if tonumber(l_full_body_cage_0.max_distance) > v4 / 100 then
                v6:fail(v3.Keys.MeasureCageMeshDistanceAvatar_CageTooFar, {
                    max_sdf = tonumber(l_full_body_cage_0.max_distance), 
                    max_sdf_threshold = v4 / 100
                });
            end;
            if tonumber(l_full_body_cage_0.negative_sdf_percent) * 100 > v5 then
                v6:fail(v3.Keys.MeasureCageMeshDistanceAvatar_CageInsideMesh, {
                    negtiveSDFPercent = tonumber(l_full_body_cage_0.negative_sdf_percent) * 100
                });
            end;
            return;
        end;
    end
};