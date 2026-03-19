local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_l_RunService_0_RobloxClientChannel_0 = l_RunService_0:GetRobloxClientChannel();
local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
local l_l_RunService_0_CoreScriptVersion_0 = l_RunService_0:GetCoreScriptVersion();
local l_ClientGitHash_0 = l_RunService_0.ClientGitHash;
l_l_RunService_0_RobloxVersion_0 = string.format("%s (%.6s)", l_l_RunService_0_RobloxVersion_0, l_ClientGitHash_0);
return function(_) --[[ Line: 17 ]] --[[ Name: VersionSection ]]
    -- upvalues: l_useLocalization_0 (copy), l_l_RunService_0_RobloxVersion_0 (ref), l_l_RunService_0_RobloxClientChannel_0 (copy), l_l_RunService_0_CoreScriptVersion_0 (copy), l_useDesignTokens_0 (copy), v2 (copy), l_StyledTextLabel_0 (copy)
    local v12 = l_useLocalization_0({
        buildVersionText = {
            "CommonUI.Features.Label.VersionWithNumber"; 
            versionNumber = l_l_RunService_0_RobloxVersion_0
        }, 
        clientChannelText = {
            "CommonUI.Features.Label.ChannelWithChannelName"; 
            channelName = l_l_RunService_0_RobloxClientChannel_0
        }, 
        coreScriptVersionText = {
            "CommonUI.Features.Label.ClientCoreScriptVersion"; 
            clientCoreScriptVersion = l_l_RunService_0_CoreScriptVersion_0
        }
    });
    local v14 = l_useDesignTokens_0(function(v13) --[[ Line: 27 ]]
        return {
            bodyTextFont = v13.Semantic.Typography.Body, 
            bodyTextColor = v13.Semantic.Color.Text.Default
        };
    end);
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        BuildVersionText = v2.createElement(l_StyledTextLabel_0, {
            layoutOrder = 1, 
            text = v12.buildVersionText, 
            fontStyle = v14.bodyTextFont, 
            colorStyle = v14.bodyTextColor
        }), 
        ClientCSVersionText = v2.createElement(l_StyledTextLabel_0, {
            layoutOrder = 2, 
            text = v12.coreScriptVersionText, 
            fontStyle = v14.bodyTextFont, 
            colorStyle = v14.bodyTextColor
        }), 
        ClientChannelText = v2.createElement(l_StyledTextLabel_0, {
            layoutOrder = 3, 
            text = v12.clientChannelText, 
            fontStyle = v14.bodyTextFont, 
            colorStyle = v14.bodyTextColor
        })
    });
end;