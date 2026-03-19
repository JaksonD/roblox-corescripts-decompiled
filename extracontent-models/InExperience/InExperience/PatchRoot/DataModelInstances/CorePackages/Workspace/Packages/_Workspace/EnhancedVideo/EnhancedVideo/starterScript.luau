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
return function() --[[ Line: 24 ]] --[[ Name: starterScript ]]
    -- upvalues: v15 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v16 (copy), l_flaggedMutedError_0 (copy), l_ReplicatedStorage_0 (copy), l_CoreGui_0 (copy), v7 (copy), v6 (copy), l_LocalizationProvider_0 (copy), l_FoundationProvider_0 (copy), l_Enums_0 (copy), v11 (copy)
    if not v15 then
        return;
    else
        local v17 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
        local v18 = string.split(v16, ",");
        local v19 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 34 ]]
            -- upvalues: v18 (copy), l_flaggedMutedError_0 (ref)
            for _, v21 in v18 do
                local v22 = string.split(v21, ":");
                if #v22 ~= 2 then
                    l_flaggedMutedError_0("EnhancedVideo_InvalidUniverseIdToBrandNameMapping", string.format("String split by colon is not length 2: %s", v21));
                    break;
                else
                    local v23 = tonumber(v22[1]);
                    if not v23 then
                        l_flaggedMutedError_0("EnhancedVideo_InvalidUniverseIdToBrandNameMapping", string.format("String cannot be converted to number: %s", v22[1]));
                        break;
                    else
                        local v24 = v22[2]:match("^%s*(.-)%s*$");
                        if not v24 or v24 == "" then
                            l_flaggedMutedError_0("EnhancedVideo_InvalidUniverseIdToBrandNameMapping", string.format("Brand name is empty after trimming whitespace: %s", v22[2]));
                            break;
                        elseif v23 == game.GameId then
                            return v24;
                        end;
                    end;
                end;
            end;
            return nil;
        end);
        if l_status_0 then
            v19 = l_result_0;
        end;
        local l_AdDisclosurePauseEvent_0 = l_ReplicatedStorage_0:WaitForChild("AdDisclosurePauseEvent");
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "EnhancedVideoInteractivityControls";
        l_Folder_0.Parent = l_CoreGui_0;
        v7.createRoot(l_Folder_0):render(v6.createElement("ScreenGui", {
            DisplayOrder = -5
        }, {
            LocalizationProvider = v6.createElement(l_LocalizationProvider_0, {
                localization = v17
            }, {
                FoundationProvider = v6.createElement(l_FoundationProvider_0, {
                    theme = l_Enums_0.Theme.Dark
                }, {
                    AdLabel = v6.createElement(v11, {
                        sendPauseEvent = function() --[[ Line: 90 ]] --[[ Name: sendPauseEvent ]]
                            -- upvalues: l_AdDisclosurePauseEvent_0 (copy)
                            l_AdDisclosurePauseEvent_0:Fire();
                        end, 
                        associatedBrandName = v19
                    })
                })
            })
        }));
        return;
    end;
end;