local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_script_FirstAncestor_0.Components.Constants);
local v6 = require(l_script_FirstAncestor_0.Components.ModalBaseSelectorDialog);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagHideShortcutsOnReportDropdown);
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v9 = nil;
local v10 = nil;
local v11 = nil;
if l_isInExperienceUIVREnabled_0 then
    v9 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
    local v12 = require(l_CorePackages_0.Workspace.Packages.VrSpatialUi);
    v10 = v12.UIManager;
    v11 = v12.Constants.PanelType;
end;
local v13 = {
    modalSelectorHandle = nil, 
    modalSelectorFrame = nil, 
    modalSelectorScreenGui = nil
};
return {
    mountModalSelector = function(v14, v15, v16, v17, v18, v19) --[[ Line: 58 ]] --[[ Name: mountModalSelector ]]
        -- upvalues: l_GuiService_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v9 (ref), v10 (ref), v11 (ref), v13 (copy), l_CoreGui_0 (copy), v5 (copy), v7 (copy), v4 (copy), v6 (copy)
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        if l_isInExperienceUIVREnabled_0 and v9() then
            local v22 = v10.getInstance():getPanelObject(v11.MoreMenu);
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
            l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
            l_Frame_0.ZIndex = 10;
            l_Frame_0.Parent = v22;
            v13.modalSelectorFrame = l_Frame_0;
        elseif not v13.modalSelectorScreenGui then
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "ModalSelectorDialogGui";
            l_ScreenGui_0.DisplayOrder = 7;
            l_ScreenGui_0.Enabled = true;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            l_ScreenGui_0.Parent = l_CoreGui_0:FindFirstChild(v5.AbuseReportMenuPlaceholderFrame, true);
            v13.modalSelectorScreenGui = l_ScreenGui_0;
            local l_Frame_1 = Instance.new("Frame");
            l_Frame_1.BackgroundTransparency = 1;
            l_Frame_1.Position = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_1.Size = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_1.Parent = v13.modalSelectorScreenGui;
            v13.modalSelectorFrame = l_Frame_1;
        end;
        if v7 and v19 ~= nil then
            v19();
        end;
        local v26 = v4.createElement(v6, {
            isShown = true, 
            cellData = v16, 
            viewportHeight = v14, 
            viewportWidth = v15, 
            onSelect = v17, 
            onClose = v18
        });
        v13.modalSelectorHandle = v4.mount(v26, v13.modalSelectorFrame, "ModalSelectorDialog");
    end, 
    unmountModalSelector = function() --[[ Line: 34 ]] --[[ Name: unmountModalSelector ]]
        -- upvalues: v13 (copy), v4 (copy), l_isInExperienceUIVREnabled_0 (copy)
        if v13.modalSelectorHandle ~= nil then
            v4.unmount(v13.modalSelectorHandle);
            v13.modalSelectorHandle = nil;
        end;
        if l_isInExperienceUIVREnabled_0 then
            if v13.modalSelectorFrame ~= nil then
                v13.modalSelectorFrame.Parent = nil;
                v13.modalSelectorFrame = nil;
            end;
            if v13.modalSelectorScreenGui ~= nil then
                v13.modalSelectorScreenGui = nil;
                return;
            end;
        elseif v13.modalSelectorScreenGui ~= nil then
            v13.modalSelectorFrame.Parent = nil;
            v13.modalSelectorFrame = nil;
            v13.modalSelectorScreenGui = nil;
        end;
    end
};