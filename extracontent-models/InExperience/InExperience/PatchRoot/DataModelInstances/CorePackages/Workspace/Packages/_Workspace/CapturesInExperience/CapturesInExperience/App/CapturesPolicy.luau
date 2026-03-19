local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.PolicyProvider);
local v2 = v1.GetPolicyImplementations.MemStorageService("app-policy");
local v3 = v1.withGetPolicyImplementation(v2);
v3.Mapper = function(v4) --[[ Line: 9 ]]
    return {
        eligibleForCapturesFeature = function() --[[ Line: 11 ]] --[[ Name: eligibleForCapturesFeature ]]
            -- upvalues: v4 (copy)
            return v4.EligibleForCapturesFeature or false;
        end, 
        eligibleForVideoCapture = function() --[[ Line: 14 ]] --[[ Name: eligibleForVideoCapture ]]
            -- upvalues: v4 (copy)
            return v4.EligibleForVideoCapture or false;
        end, 
        enableCapturesBulkManagement = function() --[[ Line: 17 ]] --[[ Name: enableCapturesBulkManagement ]]
            -- upvalues: v4 (copy)
            return v4.EnableCapturesBulkManagement or false;
        end, 
        enableShareCaptureCTA = function() --[[ Line: 20 ]] --[[ Name: enableShareCaptureCTA ]]
            -- upvalues: v4 (copy)
            return v4.EnableShareCaptureCTA or false;
        end, 
        hasVideoCaptureCapability = function() --[[ Line: 23 ]] --[[ Name: hasVideoCaptureCapability ]]
            -- upvalues: v4 (copy)
            return v4.HasVideoCaptureCapability or false;
        end
    };
end;
v3.PolicyImplementation = v2;
return v3;