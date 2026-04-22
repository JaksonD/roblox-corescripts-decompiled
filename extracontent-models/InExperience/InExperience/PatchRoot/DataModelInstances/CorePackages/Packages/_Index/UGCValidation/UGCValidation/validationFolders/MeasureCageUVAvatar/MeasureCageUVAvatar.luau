local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.Constants);
local v5 = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThresholdBodyPart", 7);
return {
    categories = {
        v2.UploadCategory.FULL_BODY
    }, 
    fflag = require(l_Parent_0.flags.getFFlagUGCValidateAQCageQualityAvatar), 
    expectedAqsData = {
        Measure_Cage_UV_Avatar = {}
    }, 
    run = function(v6, v7) --[[ Line: 16 ]]
        -- upvalues: v4 (copy), v3 (copy), v5 (copy)
        local l_Measure_Cage_UV_Avatar_0 = v7.aqsSummaryData.Measure_Cage_UV_Avatar;
        for _, v10 in v4.R15_CAGE_PARTS do
            if l_Measure_Cage_UV_Avatar_0[v10] == nil or l_Measure_Cage_UV_Avatar_0[v10].incorrect_uv_count == nil then
                v6:fail(v3.Keys.AQSInputDataError);
            elseif tonumber(l_Measure_Cage_UV_Avatar_0[v10].incorrect_uv_count) > v5 then
                v6:fail(v3.Keys.MeasureCageUV, {
                    cage_name = v10, 
                    incorrect_uv_count = tonumber(l_Measure_Cage_UV_Avatar_0[v10].incorrect_uv_count)
                });
            end;
        end;
    end
};