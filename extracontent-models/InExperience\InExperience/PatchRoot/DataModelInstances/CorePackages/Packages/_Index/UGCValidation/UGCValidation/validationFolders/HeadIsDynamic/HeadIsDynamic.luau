local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v4 = require(l_Parent_0.flags.getFIntUGCValidationDynamicHeadMinimumQualityPercent);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationUpdateHeadIsDynamic);
local v6 = {
    categories = {
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    fflag = require(l_Parent_0.flags.getFFlagUGCValidateIsDynamicHead), 
    shadowFlag = require(l_Parent_0.flags.getFFlagUGCValidationShadowIsDynamicHead), 
    expectedAqsData = {
        Measure_Dynamic_Head = {
            Head = {
                "left_eye_close", 
                "right_eye_close", 
                "mouth_open", 
                "is_happy", 
                "is_sad"
            }
        }
    }, 
    knownAqsUserErrors = {}
};
if v5() then
    v6.knownAqsUserErrors = {
        INVALID_LANDMARKS = v3.Keys.DynamicHeadCageMisaligned, 
        NO_FACS = v3.Keys.DynamicHeadNOFACS, 
        MISSING_CAGE_INFO = v3.Keys.DynamicHeadMISSINGCAGE
    };
else
    v6.knownAqsUserErrors = {
        INVALID_LANDMARKS = v3.Keys.DynamicHeadCageMisaligned
    };
end;
local v7 = {
    left_eye_close = v3.Keys.DynamicHeadLeftEyeNotClose, 
    right_eye_close = v3.Keys.DynamicHeadRightEyeNotClose, 
    mouth_open = v3.Keys.DynamicHeadMouthNotOpen, 
    is_happy = v3.Keys.DynamicHeadHappyNotShown, 
    is_sad = v3.Keys.DynamicHeadSadNotShown
};
v6.run = function(v8, v9) --[[ Line: 48 ]]
    -- upvalues: v5 (copy), v3 (copy), v7 (copy), v4 (copy)
    local l_Head_0 = v9.aqsSummaryData.Measure_Dynamic_Head.Head;
    if v5() then
        if l_Head_0 == nil then
            v8:fail(v3.Keys.AQSInputDataError);
            return;
        else
            for v11, v12 in v7 do
                if l_Head_0[v11] ~= nil and tonumber(l_Head_0[v11]) <= v4() / 100 then
                    v8:fail(v12);
                end;
            end;
            return;
        end;
    else
        for _, v14 in l_Head_0 do
            if tonumber(v14) < v4() / 100 then
                v8:fail(v3.Keys.HeadNotDynamic);
                return;
            end;
        end;
        return;
    end;
end;
return v6;