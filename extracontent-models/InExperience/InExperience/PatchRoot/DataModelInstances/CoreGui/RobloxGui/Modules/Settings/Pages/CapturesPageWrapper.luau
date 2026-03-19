local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v4 = require(l_Modules_0.Settings.SettingsPageFactory);
local v5 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v6 = require(l_CorePackages_0.Packages.BuilderIcons);
local l_uiblox_0 = v6.Migration.uiblox;
local v8 = require(script.Parent.Parent.Flags.GetFFlagFixIGMTabTransitions);
local l_v4_NewPage_0 = v4:CreateNewPage();
l_v4_NewPage_0.TabHeader.Name = "CapturesTab";
local v10 = if v5 then l_uiblox_0["icons/controls/cameraOff"] else l_uiblox_0["icons/controls/screenshot"];
l_v4_NewPage_0.TabHeader.TabLabel.Icon.Text = v10.name;
l_v4_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v6.Font[v10.variant];
l_v4_NewPage_0.TabHeader.TabLabel.Title.AutoLocalize = false;
l_v4_NewPage_0.TabHeader.TabLabel.Title.Text = v3:FormatByKey("Feature.SettingsHub.Label.Captures");
l_v4_NewPage_0.PageListLayout.Parent = nil;
l_v4_NewPage_0.ShouldShowBottomBar = true;
l_v4_NewPage_0.ShouldShowHubBar = true;
l_v4_NewPage_0.Page.Name = "Captures";
l_v4_NewPage_0.Page.Size = UDim2.fromScale(1, 0);
local l_UIPadding_0 = l_v4_NewPage_0.Page:FindFirstChildWhichIsA("UIPadding");
if l_UIPadding_0 then
    l_UIPadding_0:Destroy();
end;
l_v4_NewPage_0.ConnectHubToApp = function(_, v13, v14, v15) --[[ Line: 49 ]] --[[ Name: ConnectHubToApp ]]
    -- upvalues: l_v4_NewPage_0 (copy), v8 (copy)
    l_v4_NewPage_0:SetHub(v13);
    local v16 = v14.AbsoluteSize.Y - 20;
    l_v4_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v16);
    v14:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 54 ]]
        -- upvalues: v16 (ref), v14 (copy), l_v4_NewPage_0 (ref)
        v16 = v14.AbsoluteSize.Y - 20;
        l_v4_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v16);
    end);
    local l_Display_0 = l_v4_NewPage_0.Display;
    l_v4_NewPage_0.Display = function(_, ...) --[[ Line: 60 ]] --[[ Name: Display ]]
        -- upvalues: v15 (copy), l_Display_0 (copy), l_v4_NewPage_0 (ref)
        v15.openMenu();
        l_Display_0(l_v4_NewPage_0, ...);
    end;
    l_v4_NewPage_0.Hidden.Event:Connect(function() --[[ Line: 65 ]]
        -- upvalues: v8 (ref), v15 (copy)
        if not v8() then
            v15.closeMenu();
        end;
    end);
    local l_Hide_0 = l_v4_NewPage_0.Hide;
    l_v4_NewPage_0.Hide = function(_, ...) --[[ Line: 74 ]] --[[ Name: Hide ]]
        -- upvalues: v8 (ref), v15 (copy), l_Hide_0 (copy), l_v4_NewPage_0 (ref)
        if v8() then
            v15.closeMenu();
        end;
        l_Hide_0(l_v4_NewPage_0, ...);
    end;
end;
return l_v4_NewPage_0;