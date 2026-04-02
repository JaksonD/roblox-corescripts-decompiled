local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v5 = require(l_Parent_1.Loggers);
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.ReactRoblox);
local v8 = require(l_Parent_1.Foundation);
local l_FoundationProvider_0 = v8.FoundationProvider;
local l_Enums_0 = v8.Enums;
local v11 = require(l_Parent_0.interactivity.AdLabel);
local l_Localization_0 = require(l_Parent_1.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local l_flaggedMutedError_0 = v5.flaggedMutedError;
local v15 = game:DefineFastFlag("LuaAppIsEnhancedVideoUniverse", false);
local v16 = game:DefineFastString("LuaAppUniverseIdToBrandNameMapping", "");
local v17 = require(l_Parent_0.FFlagLuaAppEnableEnhancedVideoDisclosureUpdate);
local v18 = if v17 then require(l_Parent_0.EnhancedVideoStore) else nil;
local v19 = if v17 then require(l_Parent_1.Http).NetworkLayers.requestInternalWrapper else nil;
local v20 = if v17 then v19(nil) else nil;
return function() --[[ Line: 34 ]] --[[ Name: starterScript ]]
    -- upvalues: v15 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v17 (copy), v16 (copy), l_flaggedMutedError_0 (copy), v18 (copy), v20 (copy), l_ReplicatedStorage_0 (copy), l_CoreGui_0 (copy), v7 (copy), v6 (copy), l_LocalizationProvider_0 (copy), l_FoundationProvider_0 (copy), l_Enums_0 (copy), v11 (copy)
    if not v15 then
        return;
    else
        local v21 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
        local v22 = if v17 then nil else string.split(v16, ",");
        local v23 = nil;
        if not v17 then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 47 ]]
                -- upvalues: v22 (copy), l_flaggedMutedError_0 (ref)
                for _, v25 in v22 do
                    local v26 = string.split(v25, ":");
                    if #v26 ~= 2 then
                        l_flaggedMutedError_0("EnhancedVideo_InvalidUniverseIdToBrandNameMapping", string.format("String split by colon is not length 2: %s", v25));
                        break;
                    else
                        local v27 = tonumber(v26[1]);
                        if not v27 then
                            l_flaggedMutedError_0("EnhancedVideo_InvalidUniverseIdToBrandNameMapping", string.format("String cannot be converted to number: %s", v26[1]));
                            break;
                        else
                            local v28 = v26[2]:match("^%s*(.-)%s*$");
                            if not v28 or v28 == "" then
                                l_flaggedMutedError_0("EnhancedVideo_InvalidUniverseIdToBrandNameMapping", string.format("Brand name is empty after trimming whitespace: %s", v26[2]));
                                break;
                            elseif v27 == game.GameId then
                                return v28;
                            end;
                        end;
                    end;
                end;
                return nil;
            end);
            if l_status_0 then
                v23 = l_result_0;
            end;
        end;
        if v17 then
            v18(false).fetchInitialData(v20, game.GameId);
        end;
        local l_AdDisclosurePauseEvent_0 = l_ReplicatedStorage_0:WaitForChild("AdDisclosurePauseEvent");
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "EnhancedVideoInteractivityControls";
        l_Folder_0.Parent = l_CoreGui_0;
        v7.createRoot(l_Folder_0):render(v6.createElement("ScreenGui", {
            DisplayOrder = -5
        }, {
            LocalizationProvider = v6.createElement(l_LocalizationProvider_0, {
                localization = v21
            }, {
                FoundationProvider = v6.createElement(l_FoundationProvider_0, {
                    theme = l_Enums_0.Theme.Dark
                }, {
                    AdLabel = v6.createElement(v11, {
                        sendPauseEvent = function() --[[ Line: 108 ]] --[[ Name: sendPauseEvent ]]
                            -- upvalues: l_AdDisclosurePauseEvent_0 (copy)
                            l_AdDisclosurePauseEvent_0:Fire();
                        end, 
                        associatedBrandName = if not v17 then v23 else nil
                    })
                })
            })
        }));
        return;
    end;
end;