local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = game:DefineFastInt("UGCMinCageRelevancyThreshold", 40);
return {
    categories = {
        v2.UploadCategory.LAYERED_CLOTHING
    }, 
    fflag = require(l_Parent_0.flags.getFFlagUGCValidateAQCageQualityLC), 
    expectedAqsData = {
        Measure_Cage_Relevancy = {}
    }, 
    run = function(v5, v6) --[[ Line: 16 ]]
        -- upvalues: v3 (copy), v4 (copy)
        local l_Handle_OuterCage_0 = v6.aqsSummaryData.Measure_Cage_Relevancy.Handle_OuterCage;
        local v8 = l_Handle_OuterCage_0 and tonumber(l_Handle_OuterCage_0.outer_cage_face_relevant_percent);
        if v8 == nil then
            v5:fail(v3.Keys.AQSInputDataError);
            return;
        else
            if v8 * 100 < v4 then
                v5:fail(v3.Keys.MeasureCageRelevancy, {
                    outer_cage_face_irrelevant_percent = 100 - v8 * 100
                });
            end;
            return;
        end;
    end
};