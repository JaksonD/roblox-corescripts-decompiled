local l_GameSettings_0 = UserSettings().GameSettings;
local v1 = game:DefineFastFlag("IGMResetGfxQuality", false);
local v2 = game:DefineFastFlag("IGMRevertGfxQuality", false);
local v3 = game:DefineFastFlag("IGMRevertGfxLv5Only", false);
local v4 = game:DefineFastFlag("IGMResetGfxLv5Only", false);
local v5 = game:DefineFastFlag("IGMAlwaysResetGfxLv5", false);
local v6 = game:DefineFastInt("IGMTempOverrideGfxLv5", 0);
local _ = function(v7) --[[ Line: 16 ]] --[[ Name: SavedQualitySettingEnumFromValue ]]
    for _, v9 in (Enum.SavedQualitySetting:GetEnumItems()) do
        if v9.Value == v7 then
            return v9;
        end;
    end;
    return Enum.SavedQualitySetting.Automatic;
end;
local function v21() --[[ Line: 26 ]] --[[ Name: RunGfxReset ]]
    -- upvalues: v5 (copy), l_GameSettings_0 (copy), v2 (copy), v3 (copy), v1 (copy), v4 (copy)
    local v11 = false;
    local l_v5_0 = v5;
    local v13 = l_GameSettings_0.SavedQualityLevel == Enum.SavedQualitySetting.QualityLevel5;
    if l_v5_0 and v13 then
        l_GameSettings_0.SavedQualityLevel = Enum.SavedQualitySetting.Automatic;
    end;
    if game:GetEngineFeature("QualityLevelReset") then
        if v2 then
            if l_GameSettings_0.QualityResetLevel >= 0 then
                local l_QualityResetLevel_0 = l_GameSettings_0.QualityResetLevel;
                local v15;
                for _, v17 in (Enum.SavedQualitySetting:GetEnumItems()) do
                    if v17.Value == l_QualityResetLevel_0 then
                        v15 = v17;
                        v11 = true;
                    end;
                    if v11 then
                        break;
                    end;
                end;
                if not v11 then
                    v15 = Enum.SavedQualitySetting.Automatic;
                end;
                v11 = false;
                if v3 and v15 == Enum.SavedQualitySetting.QualityLevel5 or v3 == false then
                    l_GameSettings_0.SavedQualityLevel = v15;
                    l_GameSettings_0.QualityResetLevel = -1;
                    return;
                end;
            end;
        elseif v1 then
            local l_v4_0 = v4;
            local l_QualityResetLevel_1 = l_GameSettings_0.QualityResetLevel;
            if l_QualityResetLevel_1 < 0 or l_QualityResetLevel_1 == nil then
                local l_Value_0 = l_GameSettings_0.SavedQualityLevel.Value;
                if v13 and l_v4_0 or l_v4_0 == false then
                    l_GameSettings_0.SavedQualityLevel = Enum.SavedQualitySetting.Automatic;
                end;
                l_GameSettings_0.QualityResetLevel = l_Value_0;
            end;
        end;
    end;
end;
applicationId = function() --[[ Line: 67 ]] --[[ Name: applicationId ]]
    local l_AppStorageService_0 = game:GetService("AppStorageService");
    if not l_AppStorageService_0 then
        return nil;
    else
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("AppInstallationId");
        local v24 = typeof(l_l_AppStorageService_0_Item_0);
        if v24 == "number" then
            return tonumber(l_l_AppStorageService_0_Item_0) or nil;
        elseif v24 == "string" then
            if string.len(l_l_AppStorageService_0_Item_0) <= 0 then
                return nil;
            else
                return (tonumber((string.sub(l_l_AppStorageService_0_Item_0, -string.len((tostring(1000)))))));
            end;
        else
            return nil;
        end;
    end;
end;
return {
    RunGfxReset = v21, 
    TemporaryOverride = function(v25) --[[ Line: 93 ]] --[[ Name: TemporaryOverride ]]
        -- upvalues: v6 (copy)
        if ((applicationId() or 0) + 329) % 1000 < v6 and (v25 == Enum.SavedQualitySetting.QualityLevel5 or v25 == Enum.SavedQualitySetting.QualityLevel5.Value) then
            return true, Enum.SavedQualitySetting.Automatic.Value;
        else
            return false, Enum.SavedQualitySetting.Automatic.Value;
        end;
    end
};