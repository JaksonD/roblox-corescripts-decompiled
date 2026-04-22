local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThreshold", 100);
local v5 = {
    categories = {
        v2.UploadCategory.LAYERED_CLOTHING
    }, 
    fflag = require(l_Parent_0.flags.getFFlagUGCValidateAQCageQualityLC), 
    expectedAqsData = {
        Measure_Cage_UV = {}
    }
};
local v6 = {
    "Handle_InnerCage", 
    "Handle_OuterCage"
};
v5.run = function(v7, v8) --[[ Line: 20 ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy)
    local l_Measure_Cage_UV_0 = v8.aqsSummaryData.Measure_Cage_UV;
    for _, v11 in v6 do
        if l_Measure_Cage_UV_0[v11] == nil or l_Measure_Cage_UV_0[v11].incorrect_uv_count == nil then
            v7:fail(v3.Keys.AQSInputDataError);
        elseif tonumber(l_Measure_Cage_UV_0[v11].incorrect_uv_count) > v4 then
            v7:fail(v3.Keys.MeasureCageUV, {
                cage_name = v11, 
                incorrect_uv_count = tonumber(l_Measure_Cage_UV_0[v11].incorrect_uv_count)
            });
        end;
    end;
end;
return v5;