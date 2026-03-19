local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.ArgCheck);
local l_GetDisplayStore_0 = require(l_Parent_0.Display).GetDisplayStore;
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local l_SduiConditionKey_0 = require(l_script_FirstAncestor_0.ConditionalProps.SduiConditionalPropTypes).SduiConditionKey;
local v8 = require(l_script_FirstAncestor_0.SduiErrors);
local v9 = game:DefineFastString("SduiForcePerfLevel", "");
local v10 = game:DefineFastString("SduiForceImageQualityLevel", "");
local v11 = {
    low = 1, 
    Low = 1, 
    medium = 2, 
    Medium = 2, 
    high = 3, 
    High = 3
};
local v12 = {
    [Enum.DeviceLevel.Low] = 1, 
    [Enum.DeviceLevel.Medium] = 2, 
    [Enum.DeviceLevel.High] = 3
};
local v13 = nil;
local v14 = nil;
local function _() --[[ Line: 44 ]] --[[ Name: getDevicePerformanceValue ]]
    -- upvalues: v13 (ref), v9 (copy), v11 (copy), l_UserInputService_0 (copy), v12 (copy)
    if v13 == nil then
        if v9 ~= "" then
            v13 = v11[v9] or v11.High;
        else
            v13 = v12[l_UserInputService_0:GetDeviceLevel()] or v11.High;
        end;
    end;
    return v13;
end;
local function v17() --[[ Line: 56 ]] --[[ Name: getImageQualityValue ]]
    -- upvalues: v10 (copy), v11 (copy), v13 (ref), v9 (copy), l_UserInputService_0 (copy), v12 (copy), v14 (ref), l_GuiService_0 (copy), v4 (copy)
    if v10 ~= "" then
        return v11[v10] or v11.High;
    else
        if v13 == nil then
            if v9 ~= "" then
                v13 = v11[v9] or v11.High;
            else
                v13 = v12[l_UserInputService_0:GetDeviceLevel()] or v11.High;
            end;
        end;
        local l_v13_0 = v13;
        if l_v13_0 == v11.Low then
            return v11.Low;
        elseif l_v13_0 == v11.Medium then
            return v11.Medium;
        elseif l_v13_0 == v11.High then
            if v14 == nil then
                v14 = l_GuiService_0:GetResolutionScale();
            end;
            if v14 >= 2 then
                return v11.High;
            else
                return v11.Medium;
            end;
        else
            v4.assert(true, (("Unexpected performanceLevel %*"):format(l_v13_0)));
            return v11.High;
        end;
    end;
end;
local function v25(v18, v19, v20) --[[ Line: 83 ]] --[[ Name: shouldFailConditionEarly ]]
    -- upvalues: v13 (ref), v9 (copy), v11 (copy), l_UserInputService_0 (copy), v12 (copy), v8 (copy), v17 (copy)
    if v18 == "performanceLevel" then
        if v13 == nil then
            if v9 ~= "" then
                v13 = v11[v9] or v11.High;
            else
                v13 = v12[l_UserInputService_0:GetDeviceLevel()] or v11.High;
            end;
        end;
        local l_v13_1 = v13;
        local v22 = v11[v19];
        if not v22 then
            v20.dependencies.logger.reportError(v8.SduiErrorType.InvalidResponsiveCondition, {
                name = v18, 
                value = v19
            }, v20.appPage);
            return false;
        else
            return l_v13_1 ~= v22;
        end;
    elseif v18 == "imageQualityLevel" then
        local v23 = v17();
        local v24 = v11[v19];
        if not v24 then
            v20.dependencies.logger.reportError(v8.SduiErrorType.InvalidResponsiveCondition, {
                name = v18, 
                value = v19
            }, v20.appPage);
            return false;
        else
            return v23 ~= v24;
        end;
    else
        return false;
    end;
end;
local function v27(v26) --[[ Line: 113 ]] --[[ Name: shouldIncludeKey ]]
    if v26 == "imageQualityLevel" or v26 == "performanceLevel" then
        return false;
    else
        return true;
    end;
end;
local function v34(v28, v29, v30, v31, v32) --[[ Line: 121 ]] --[[ Name: adaptThumbnailDimensions ]]
    -- upvalues: v17 (copy), v11 (copy), v4 (copy)
    local v33 = v17();
    if v33 == v11.High then
        return v28, v29;
    elseif v33 == v11.Low then
        return v30, v31;
    else
        if v33 == v11.Medium then
            if v28 == 1320 and v29 == 440 then
                if v30 <= 660 and v31 <= 220 then
                    return 660, 220;
                end;
            elseif v28 == 384 and v29 == 216 then
                if (v32 == "GameThumbnail" or v32 == "Asset") and v30 <= 256 and v31 <= 144 then
                    return 256, 144;
                end;
            elseif v28 == 768 and v29 == 432 or v28 == 576 and v29 == 324 then
                if (v32 == "GameThumbnail" or v32 == "Asset") and v30 <= 384 and v31 <= 216 then
                    return 384, 216;
                end;
            elseif v28 == 512 and v29 == 512 then
                if v32 == "GameIcon" and v30 <= 256 and v31 <= 256 then
                    return 256, 256;
                end;
            elseif v28 == 700 and v29 == 700 and v32 == "Asset" and v30 <= 420 and v31 <= 420 then
                return 420, 420;
            end;
        else
            v4.assert(true, (("Unexpected imageQualityLevel %*"):format(v33)));
        end;
        return v28, v29;
    end;
end;
local function v51(v35, v36, v37, v38, v39, v40) --[[ Line: 170 ]] --[[ Name: checkResponsiveConditions ]]
    -- upvalues: l_SduiConditionKey_0 (copy), v17 (copy), v11 (copy), v8 (copy), v13 (ref), v9 (copy), l_UserInputService_0 (copy), v12 (copy)
    local v41 = {};
    if not v35 then
        return v41;
    else
        assert(v35, "allConditionalProps must exist");
        for v42, v43 in v35 do
            local v44 = nil;
            if v43.conditions then
                for v45, v46 in v43.conditions do
                    if v45 == l_SduiConditionKey_0.minScreenWidth then
                        if v36.X < v46 then
                            v44 = true;
                            break;
                        end;
                    elseif v45 == l_SduiConditionKey_0.maxScreenWidth then
                        if v46 < v36.X then
                            v44 = true;
                            break;
                        end;
                    elseif v45 == l_SduiConditionKey_0.isPortrait then
                        if v46 and v36.X > v36.Y then
                            v44 = true;
                            break;
                        elseif not v46 and v36.X < v36.Y then
                            v44 = true;
                            break;
                        end;
                    elseif v45 == l_SduiConditionKey_0.lastInput then
                        if v46 ~= v37 then
                            v44 = true;
                            break;
                        end;
                    elseif v45 == l_SduiConditionKey_0.preferredInput then
                        if v46 ~= v38 then
                            v44 = true;
                            break;
                        end;
                    elseif v45 == l_SduiConditionKey_0.isSpatial then
                        if not v39 and v46 or v39 and not v46 then
                            v44 = true;
                            break;
                        end;
                    elseif v45 == l_SduiConditionKey_0.imageQualityLevel then
                        local v47 = v17();
                        local v48 = v11[v46];
                        if not v48 then
                            v40.dependencies.logger.reportError(v8.SduiErrorType.InvalidResponsiveCondition, {
                                name = v45, 
                                value = v46
                            }, v40.appPage);
                            v44 = true;
                            break;
                        elseif v47 ~= v48 then
                            v44 = true;
                            break;
                        end;
                    elseif v45 == l_SduiConditionKey_0.performanceLevel then
                        if v13 == nil then
                            if v9 ~= "" then
                                v13 = v11[v9] or v11.High;
                            else
                                v13 = v12[l_UserInputService_0:GetDeviceLevel()] or v11.High;
                            end;
                        end;
                        local l_v13_2 = v13;
                        local v50 = v11[v46];
                        if not v50 then
                            v40.dependencies.logger.reportError(v8.SduiErrorType.InvalidResponsiveCondition, {
                                name = v45, 
                                value = v46
                            }, v40.appPage);
                            v44 = true;
                            break;
                        elseif l_v13_2 ~= v50 then
                            v44 = true;
                            break;
                        end;
                    end;
                end;
            end;
            v41[v42] = v44;
        end;
        return v41;
    end;
end;
return {
    shouldIncludeKey = v27, 
    shouldFailConditionEarly = v25, 
    PERF_KEY = "performanceLevel", 
    IMAGE_QUALITY_KEY = "imageQualityLevel", 
    setDeviceLevelValueForTests = function(v52) --[[ Line: 282 ]] --[[ Name: setDeviceLevelValueForTests ]]
        -- upvalues: v13 (ref)
        v13 = v52;
    end, 
    setResolutionScaleForTests = function(v53) --[[ Line: 287 ]] --[[ Name: setResolutionScaleForTests ]]
        -- upvalues: v14 (ref)
        v14 = v53;
    end, 
    adaptThumbnailDimensions = v34, 
    checkResponsiveConditions = v51, 
    isPortraitOrientation = function() --[[ Line: 269 ]] --[[ Name: isPortraitOrientation ]]
        -- upvalues: l_GetDisplayStore_0 (copy)
        local v54 = l_GetDisplayStore_0(false).getViewportSize(false);
        return v54.X < v54.Y;
    end
};