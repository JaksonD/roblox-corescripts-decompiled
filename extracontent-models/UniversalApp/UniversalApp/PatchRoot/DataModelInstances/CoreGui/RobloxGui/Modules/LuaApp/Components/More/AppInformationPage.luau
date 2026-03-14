local l_CorePackages_0 = game:GetService("CorePackages");
local l_InsertService_0 = game:GetService("InsertService");
local l_RunService_0 = game:GetService("RunService");
local l_DataModelPatchService_0 = game:GetService("DataModelPatchService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.React);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local v9 = require(l_CorePackages_0.Packages.Foundation);
local l_Text_0 = v9.Text;
local l_useTokens_0 = v9.Hooks.useTokens;
local l_OtaPatchName_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).OtaPatchName;
local l_OtaPackagesStatus_0 = require(l_CorePackages_0.Workspace.Packages.OtaPatchPackagesStatus).OtaPackagesStatus;
local v14 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v15 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local v16 = require(l_Modules_0.LuaApp.Components.More.withMorePagePaddings);
local l_l_RunService_0_RobloxClientChannel_0 = l_RunService_0:GetRobloxClientChannel();
local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
local l_l_RunService_0_CoreScriptVersion_0 = l_RunService_0:GetCoreScriptVersion();
local l_ClientGitHash_0 = l_RunService_0.ClientGitHash;
l_l_RunService_0_RobloxVersion_0 = string.format("%s (%.6s)", l_l_RunService_0_RobloxVersion_0, l_ClientGitHash_0);
local function v23(v21) --[[ Line: 45 ]] --[[ Name: VersionLabel ]]
    -- upvalues: l_useTokens_0 (copy), v6 (copy), l_Text_0 (copy)
    local v22 = l_useTokens_0();
    if not v21.headerText or not v21.contentText then
        return nil;
    else
        return v6.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            Layout = v6.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Wraps = true
            }), 
            HeaderText = v6.createElement(l_Text_0, {
                Size = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v21.headerText, 
                fontStyle = v22.Typography.BodyMedium, 
                textStyle = v22.Color.Content.Emphasis, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }), 
            ContentText = v6.createElement(l_Text_0, {
                Size = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v21.contentText, 
                fontStyle = v22.Typography.BodyMedium, 
                textStyle = v22.Color.Content.Muted, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2
            })
        });
    end;
end;
local function v26(v24) --[[ Line: 85 ]] --[[ Name: LicenseLabel ]]
    -- upvalues: l_useTokens_0 (copy), v6 (copy), l_Text_0 (copy)
    local v25 = l_useTokens_0();
    if not v24.headerText or not v24.contentText then
        return nil;
    else
        return v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v24.layoutOrder
        }, {
            Layout = v6.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            HeaderText = v6.createElement(l_Text_0, {
                Size = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v24.headerText, 
                fontStyle = v25.Typography.BodySmall, 
                textStyle = v25.Color.Content.Emphasis, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }), 
            ContentText = v6.createElement(l_Text_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v24.contentText, 
                fontStyle = v25.Typography.BodySmall, 
                textStyle = v25.Color.Content.Muted, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2
            })
        });
    end;
end;
local _ = function() --[[ Line: 127 ]] --[[ Name: getLicenseList ]]
    -- upvalues: l_InsertService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 130 ]]
        -- upvalues: l_InsertService_0 (ref)
        local v27 = {};
        local l_CoreScripts_0 = l_InsertService_0:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts");
        for _, v30 in pairs(l_CoreScripts_0:GetChildren()) do
            assert(string.match(v30.Name, "^(%d*)-(.*)") ~= nil, "Invalid license name");
            local v31 = string.split(v30.Name, "-");
            local v32 = table.remove(v31, 1);
            local v33 = table.concat(v31, "-");
            local v34 = string.gsub(v30.Value, "\n*$", "");
            v27[v32 + 1] = {
                name = v33, 
                text = v34
            };
        end;
        return v27;
    end);
    return l_status_0 and l_result_0 or {};
end;
local function v58(v38) --[[ Line: 161 ]] --[[ Name: AppInformationPage ]]
    -- upvalues: l_useTokens_0 (copy), v6 (copy), l_Text_0 (copy), l_InsertService_0 (copy), v26 (copy), v15 (copy), v23 (copy), v14 (copy)
    local v39 = l_useTokens_0();
    local v40 = nil;
    local v41 = nil;
    local v42 = nil;
    local l_paddings_0 = v38.paddings;
    assert(l_paddings_0, "paddings must not be nil");
    v40 = l_paddings_0.paddingHorizontal;
    v41 = l_paddings_0.paddingVertical;
    v42 = l_paddings_0.contentMaxWidth;
    local v44 = {
        Layout = v6.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v39.Gap.Medium)
        }), 
        SectionHeader = v6.createElement(l_Text_0, {
            Size = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = v38.text.licenseHeader, 
            Font = v39.Typography.BodyMedium.Font, 
            TextSize = v39.Typography.BodyMedium.FontSize, 
            LineHeight = v39.Typography.BodyMedium.LineHeight, 
            TextColor3 = v39.Color.Content.Emphasis.Color3, 
            TextTransparency = v39.Color.Content.Emphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1
        })
    };
    for v55, v56 in (v6.useMemo(function() --[[ Line: 192 ]]
        -- upvalues: l_InsertService_0 (ref)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 130 ]]
            -- upvalues: l_InsertService_0 (ref)
            local v45 = {};
            local l_CoreScripts_1 = l_InsertService_0:LoadLocalAsset("rbxasset://models/Licenses/Licenses.rbxm"):FindFirstChild("CoreScripts");
            for _, v48 in pairs(l_CoreScripts_1:GetChildren()) do
                assert(string.match(v48.Name, "^(%d*)-(.*)") ~= nil, "Invalid license name");
                local v49 = string.split(v48.Name, "-");
                local v50 = table.remove(v49, 1);
                local v51 = table.concat(v49, "-");
                local v52 = string.gsub(v48.Value, "\n*$", "");
                v45[v50 + 1] = {
                    name = v51, 
                    text = v52
                };
            end;
            return v45;
        end);
        return l_status_1 and l_result_1 or {};
    end, {})) do
        table.insert(v44, v6.createElement(v26, {
            headerText = v56.name, 
            contentText = v56.text, 
            layoutOrder = v55 + 1
        }));
    end;
    local v57 = v6.createElement(v15, {
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        maxWidth = v42
    }, {
        UIPadding = v6.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v40), 
            PaddingRight = UDim.new(0, v40), 
            PaddingTop = UDim.new(0, v41), 
            PaddingBottom = UDim.new(0, v41)
        }), 
        Layout = v6.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        VersionInfo = v6.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Layout = v6.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v39.Padding.Medium)
            }), 
            ClientCSVersionText = v6.createElement(v23, {
                headerText = v38.text.coreScriptVersionHeader, 
                contentText = v38.text.coreScriptVersion
            }), 
            BuildVersionText = v6.createElement(v23, {
                headerText = v38.text.buildVersionHeader, 
                contentText = v38.text.buildVersion
            }), 
            ClientChannelText = v6.createElement(v23, {
                headerText = v38.text.channelNameHeader, 
                contentText = v38.text.channelName
            }), 
            DiscoveryVersionText = v6.createElement(v23, {
                headerText = v38.text.discoveryScriptVersionHeader, 
                contentText = v38.text.discoveryScriptVersion
            })
        }), 
        DividerContainer = v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            Divider = v6.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = v38.dividerStyle.Color, 
                BackgroundTransparency = v38.dividerStyle.Transparency, 
                BorderSizePixel = 0
            }), 
            UIPadding = v6.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v39.Gap.Large), 
                PaddingBottom = UDim.new(0, v39.Gap.Medium)
            })
        }), 
        LicenseInfo = v6.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, v44)
    });
    return v6.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v38.backgroundStyle.Color, 
        BackgroundTransparency = v38.backgroundStyle.Transparency
    }, {
        TopBar = v6.createElement(v14.Container, {
            leftItem = v14.BackButton
        }), 
        PageContent = v6.createElement(v14.PageContent, {}, {
            PageContent = v57
        })
    });
end;
return v16(function(v59) --[[ Line: 288 ]] --[[ Name: AppInformation ]]
    -- upvalues: l_OtaPatchName_0 (copy), l_DataModelPatchService_0 (copy), l_OtaPackagesStatus_0 (copy), v8 (copy), v5 (copy), l_l_RunService_0_RobloxVersion_0 (ref), l_l_RunService_0_RobloxClientChannel_0 (copy), l_l_RunService_0_CoreScriptVersion_0 (copy), l_withStyle_0 (copy), v6 (copy), v58 (copy)
    local l_DiscoveryOta_0 = l_OtaPatchName_0.DiscoveryOta;
    local l_l_DataModelPatchService_0_LuaVersion_0 = l_DataModelPatchService_0:GetLuaVersion(l_DiscoveryOta_0);
    if l_l_DataModelPatchService_0_LuaVersion_0 == "Undefined" then
        l_l_DataModelPatchService_0_LuaVersion_0 = nil;
    else
        local v62 = l_OtaPackagesStatus_0.AllPatchPackagesLoaded(l_DiscoveryOta_0);
        if v62 ~= nil then
            l_l_DataModelPatchService_0_LuaVersion_0 = l_l_DataModelPatchService_0_LuaVersion_0 .. " (" .. v62 .. ")";
        end;
    end;
    return v8({
        licenseHeader = "CommonUI.Features.Label.Licensing", 
        buildVersionHeader = {
            "CommonUI.Features.Label.VersionWithNumber"; 
            versionNumber = ""
        }, 
        channelNameHeader = {
            "CommonUI.Features.Label.ChannelWithChannelName"; 
            channelName = ""
        }, 
        coreScriptVersionHeader = {
            "CommonUI.Features.Label.ClientCoreScriptVersion"; 
            clientCoreScriptVersion = ""
        }, 
        discoveryScriptVersionHeader = {
            "CommonUI.Features.Label.DiscoveryScriptVersion"; 
            discoveryScriptVersion = ""
        }
    })(function(v63) --[[ Line: 308 ]]
        -- upvalues: v5 (ref), l_l_RunService_0_RobloxVersion_0 (ref), l_l_RunService_0_RobloxClientChannel_0 (ref), l_l_RunService_0_CoreScriptVersion_0 (ref), l_l_DataModelPatchService_0_LuaVersion_0 (ref), l_withStyle_0 (ref), v6 (ref), v58 (ref), v59 (copy)
        local v64 = v5.Dictionary.join(v63, {
            buildVersion = l_l_RunService_0_RobloxVersion_0, 
            channelName = l_l_RunService_0_RobloxClientChannel_0, 
            coreScriptVersion = l_l_RunService_0_CoreScriptVersion_0, 
            discoveryScriptVersion = l_l_DataModelPatchService_0_LuaVersion_0
        });
        return l_withStyle_0(function(v65) --[[ Line: 315 ]]
            -- upvalues: v6 (ref), v58 (ref), v59 (ref), v64 (copy)
            return v6.createElement(v58, {
                paddings = v59.paddings, 
                backgroundStyle = v65.Theme.BackgroundDefault, 
                dividerStyle = v65.Theme.Divider, 
                text = v64
            });
        end);
    end);
end);