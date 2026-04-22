local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.flags.getFIntUGCValidationDynamicHeadMinimumQualityPercent);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationUpdateHeadIsDynamic);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationAddGeometryToExports);
local v7 = {
    categories = {
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    fflag = require(l_Parent_0.flags.getFFlagUGCValidateIsDynamicHead), 
    shadowFlag = require(l_Parent_0.flags.getFFlagUGCValidationShadowIsDynamicHead), 
    expectedAqsData = {
        Measure_Dynamic_Head = {}
    }, 
    knownAqsUserErrors = {}
};
if v5() then
    v7.knownAqsUserErrors = {
        INVALID_LANDMARKS = v3.Keys.DynamicHeadCageMisaligned, 
        NO_FACS = v3.Keys.DynamicHeadNOFACS, 
        MISSING_CAGE_INFO = v3.Keys.DynamicHeadMISSINGCAGE
    };
else
    v7.knownAqsUserErrors = {
        INVALID_LANDMARKS = v3.Keys.DynamicHeadCageMisaligned
    };
end;
local v8 = {
    left_eye_close = v3.Keys.DynamicHeadLeftEyeNotClose, 
    right_eye_close = v3.Keys.DynamicHeadRightEyeNotClose, 
    mouth_open = v3.Keys.DynamicHeadMouthNotOpen, 
    is_happy = v3.Keys.DynamicHeadHappyNotShown, 
    is_sad = v3.Keys.DynamicHeadSadNotShown
};
v7.run = function(v9, v10) --[[ Line: 41 ]]
    -- upvalues: v6 (copy), v5 (copy), v3 (copy), v8 (copy), v4 (copy)
    local v11 = nil;
    v11 = if v6() then v10.aqsSummaryData.Measure_Dynamic_Head.Head or v10.aqsSummaryData.Measure_Dynamic_Head.Head_Geo else v10.aqsSummaryData.Measure_Dynamic_Head.Head;
    if v5() then
        if v11 == nil then
            v9:fail(v3.Keys.AQSInputDataError);
            return;
        else
            for v12, v13 in v8 do
                if v11[v12] ~= nil and tonumber(v11[v12]) <= v4() / 100 then
                    v9:fail(v13);
                end;
            end;
            return;
        end;
    else
        for _, v15 in v11 do
            if tonumber(v15) < v4() / 100 then
                v9:fail(v3.Keys.HeadNotDynamic);
                return;
            end;
        end;
        return;
    end;
end;
return v7;