local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
return {
    categories = {
        v2.UploadCategory.DYNAMIC_HEAD
    }, 
    requiredData = {
        v2.SharedDataMember.rootInstance
    }, 
    fflag = require(l_Parent_0.flags.getEngineFeatureUGCValidateCheckFacsDisableOverride), 
    run = function(v4, v5) --[[ Line: 12 ]]
        -- upvalues: v3 (copy)
        local l_FaceControls_0 = v5.rootInstance:FindFirstChildOfClass("FaceControls");
        if l_FaceControls_0 and l_FaceControls_0:HasOverrideFACSData() then
            v4:fail(v3.Keys.FaceControlsOverrideFACSNotEmpty);
        end;
    end
};