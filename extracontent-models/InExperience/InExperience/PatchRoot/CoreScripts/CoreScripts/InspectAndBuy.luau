local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local l_Modules_0 = l_RobloxGui_0.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon);
local l_InspectAndBuy_0 = l_Modules_0.InspectAndBuy;
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_InspectAndBuy_0.Components.InspectAndBuy);
local v8 = nil;
local v9 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v10 = require(l_InspectAndBuy_0.Flags.FFlagAXEnableNewInspectAndBuyContainer);
local v11 = require(l_RobloxGui_0.Modules.TopBar);
local l_FFlagTopBarSignalizeMenuOpen_0 = v4.Flags.FFlagTopBarSignalizeMenuOpen;
local v13 = game:DefineFastFlag("InspectAndBuyFixStyleLink", false);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v15 = nil;
local v16 = nil;
local v17 = nil;
if l_isInExperienceUIVREnabled_0 then
    v15 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
    local v18 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v16 = v18.UIManager;
    v17 = v18.Constants.PanelType;
end;
local function v25(v19, v20, v21, v22) --[[ Line: 38 ]] --[[ Name: mount ]]
    -- upvalues: v8 (ref), v6 (copy), v9 (copy), v7 (copy), v10 (copy), v13 (copy), l_isInExperienceUIVREnabled_0 (copy), v15 (ref), v16 (ref), v17 (ref), l_RobloxGui_0 (copy), l_GuiService_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v4 (copy), v11 (copy)
    if v8 then
        v6.unmount(v8);
        v8 = nil;
    end;
    local v23 = v9({
        inspectAndBuy = v6.createElement(v7, {
            humanoidDescription = v19, 
            playerName = v20, 
            playerId = v21, 
            ctx = v22
        })
    });
    if v10 then
        v23 = v6.createElement(v7, {
            humanoidDescription = v19, 
            playerName = v20, 
            playerId = v21, 
            ctx = v22
        });
    end;
    if v13 then
        v23 = v6.createElement("Folder", nil, v23);
    end;
    if l_isInExperienceUIVREnabled_0 and v15() then
        local v24 = v16.getInstance():getPanelObject(v17.MoreMenu);
        v8 = v6.mount(v23, v24, "InspectAndBuy");
    else
        v8 = v6.mount(v23, l_RobloxGui_0, "InspectAndBuy");
    end;
    l_GuiService_0:SetMenuIsOpen(true, "InspectMenu");
    if l_FFlagTopBarSignalizeMenuOpen_0 then
        v4.Stores.GetInspectAndBuyStore(false).setInspectAndBuyOpen(true);
        return;
    else
        v11:setInspectMenuOpen(true);
        return;
    end;
end;
local function v26() --[[ Line: 82 ]] --[[ Name: unmountInspectAndBuy ]]
    -- upvalues: v8 (ref), v6 (copy), l_GuiService_0 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v4 (copy), v11 (copy)
    if v8 then
        v6.unmount(v8);
        v8 = nil;
        l_GuiService_0:SetMenuIsOpen(false, "InspectMenu");
        if l_FFlagTopBarSignalizeMenuOpen_0 then
            v4.Stores.GetInspectAndBuyStore(false).setInspectAndBuyOpen(false);
            return;
        else
            v11:setInspectMenuOpen(false);
        end;
    end;
end;
local function _(v27, v28, v29) --[[ Line: 97 ]] --[[ Name: mountInspectAndBuyFromHumanoidDescription ]]
    -- upvalues: v25 (copy)
    v25(v27, v28, nil, v29);
end;
local function _(v31, v32) --[[ Line: 101 ]] --[[ Name: mountInspectAndBuyFromUserId ]]
    -- upvalues: v25 (copy)
    v25(nil, nil, v31, v32);
end;
l_GuiService_0.InspectPlayerFromHumanoidDescriptionRequest:Connect(function(v34, v35) --[[ Line: 105 ]]
    -- upvalues: v25 (copy)
    v25(v34, v35, nil, "developerThroughHumanoidDescription");
end);
l_GuiService_0.InspectPlayerFromUserIdWithCtxRequest:Connect(function(v36, v37) --[[ Line: 109 ]]
    -- upvalues: v25 (copy)
    v25(nil, nil, v36, v37);
end);
l_GuiService_0.CloseInspectMenuRequest:Connect(function() --[[ Line: 113 ]]
    -- upvalues: v8 (ref), v26 (copy)
    if v8 then
        v26();
    end;
end);
l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v38) --[[ Line: 119 ]]
    -- upvalues: v8 (ref), v26 (copy)
    if not v38 and v8 then
        v26();
    end;
end);