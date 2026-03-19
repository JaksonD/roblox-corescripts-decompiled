local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.UIBlox);
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Images_0 = v2.App.ImageSet.Images;
local v8 = require(l_Parent_0.NotificationModalsManager);
local v9 = require(l_Parent_0.Roact);
local v10 = require(l_Parent_0.Foundation);
local l_AppStyleProvider_0 = require(l_Parent_0.UIBlox).App.Style.AppStyleProvider;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v13 = require(script.InExperienceInterventionContainer);
local l_FoundationProvider_0 = v10.FoundationProvider;
local l_InterventionPlacement_0 = require(l_Parent_0.InterventionShared).Contexts.InterventionPlacement;
local l_Constants_0 = require(l_Parent_0.InterventionShared).Utils.Constants;
local v17 = {};
local v18 = game:DefineFastFlag("FFlagTimeoutRemoteEvent", false);
local l_getFFlagAppChatEnableIntervention_0 = require(l_Parent_0.InterventionShared).Flags.getFFlagAppChatEnableIntervention;
local v20 = game:DefineFastInt("InExperienceInterventionDisplayOrder", 6);
if v18 then
    l_RobloxReplicatedStorage_0:WaitForChild("TimeoutChatAttempt", 1e999).OnClientEvent:Connect(function(v21, v22) --[[ Line: 32 ]]
        -- upvalues: v8 (copy), l_Images_0 (copy)
        v8.SetUIBloxToast({
            iconImage = l_Images_0["icons/status/error_large"], 
            toastTitle = "Test Chat Timeout RemoteEvent", 
            toastSubtitle = ("startTime: %*, duration: %*"):format(v21, v22), 
            sequenceNumber = DateTime.now().UnixTimestamp, 
            iconSize = Vector2.new(36, 36)
        });
    end);
end;
v17.new = function() --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), v9 (copy), l_getFFlagAppChatEnableIntervention_0 (copy), v20 (copy), l_LayerCollectorProvider_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_InterventionPlacement_0 (copy), l_Constants_0 (copy), l_FoundationProvider_0 (copy), l_AppStyleProvider_0 (copy), v13 (copy), l_CoreGui_0 (copy)
    local v23 = setmetatable({}, v17);
    v23.root = v9.createElement("ScreenGui", {
        DisplayOrder = if l_getFFlagAppChatEnableIntervention_0() then v20 else nil
    }, {
        LayerCollectorProvider = v9.createElement(l_LayerCollectorProvider_0, {}, {
            LocalizationProvider = v9.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                InterventionPlacementProvider = v9.createElement(l_InterventionPlacement_0.Provider, {
                    value = l_Constants_0.InterventionPlacementType.InExperience
                }, {
                    FoundationProvider = v9.createElement(l_FoundationProvider_0, {
                        theme = "Dark"
                    }, {
                        StyleProvider = v9.createElement(l_AppStyleProvider_0, {
                            style = {
                                themeName = "dark", 
                                fontName = "gotham"
                            }
                        }, {
                            Container = v9.createElement(v13, {})
                        })
                    })
                })
            })
        })
    });
    v23.element = v9.mount(v23.root, l_CoreGui_0, "InExperienceInterventionApp");
    return v23;
end;
return v17.new();