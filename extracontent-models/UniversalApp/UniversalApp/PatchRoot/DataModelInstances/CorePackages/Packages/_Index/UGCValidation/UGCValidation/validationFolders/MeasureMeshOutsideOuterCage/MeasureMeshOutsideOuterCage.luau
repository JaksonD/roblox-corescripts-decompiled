local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = game:DefineFastInt("UGCValidateRenderMeshOutsideOuterCageMeshThreshold", 65);
return {
    categories = {
        v2.UploadCategory.LAYERED_CLOTHING
    }, 
    fflag = require(l_Parent_0.flags.getFFlagUGCValidateAQCageQualityLC), 
    expectedAqsData = {
        Measure_Mesh_Outside_OuterCage = {}
    }, 
    run = function(v5, v6) --[[ Line: 16 ]]
        -- upvalues: v3 (copy), v4 (copy)
        local l_Handle_0 = v6.aqsSummaryData.Measure_Mesh_Outside_OuterCage.Handle;
        local v8 = l_Handle_0 and tonumber(l_Handle_0.mesh_outside_outer_cage_percent);
        if v8 == nil then
            v5:fail(v3.Keys.AQSInputDataError);
            return;
        else
            if v8 * 100 > v4 then
                v5:fail(v3.Keys.MeasureMeshOutsideOuterCage, {
                    mesh_outside_outer_cage_percent = v8 * 100
                });
            end;
            return;
        end;
    end
};