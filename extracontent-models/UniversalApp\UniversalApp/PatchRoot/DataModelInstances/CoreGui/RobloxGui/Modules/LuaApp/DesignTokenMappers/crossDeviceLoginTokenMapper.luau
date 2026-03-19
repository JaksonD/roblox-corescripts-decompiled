local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v5 = game:DefineFastFlag("UseRedAlertTextColorQuickLoginError", false);
return function(v6, v7) --[[ Line: 13 ]]
    -- upvalues: l_AppFonts_0 (copy), v5 (copy), l_UiMode_0 (copy)
    local l_Space_200_0 = v7.Global.Space_200;
    local l_Space_1000_0 = v7.Global.Space_1000;
    local l_Space_250_0 = v7.Global.Space_250;
    local l_Size_1200_0 = v7.Global.Size_1200;
    local v12 = {
        Font = l_AppFonts_0.default:getMedium(), 
        FontSize = 24
    };
    local v13 = {
        Font = l_AppFonts_0.default:getMedium(), 
        FontSize = 24
    };
    local v14 = {
        Font = l_AppFonts_0.default:getDefault(), 
        FontSize = 19
    };
    local l_Emphasis_0 = v7.Semantic.Color.Text.Emphasis;
    local l_Emphasis_1 = v7.Semantic.Color.Text.Emphasis;
    local l_Emphasis_2 = v7.Semantic.Color.Text.Emphasis;
    local v18 = {
        Font = l_AppFonts_0.default:getDefault(), 
        FontSize = 14
    };
    local v19 = if v5 then v7.Global.Color.Red else v7.Semantic.Color.Action.Alert.Content;
    local v20 = 0;
    local l_Bottom_0 = Enum.VerticalAlignment.Bottom;
    local v22 = 1;
    if v6.uiMode == l_UiMode_0.TenFoot then
        l_Space_200_0 = v7.Global.Space_800;
        l_Space_1000_0 = v7.Global.Space_800;
        l_Space_250_0 = v7.Global.Space_300 + v7.Global.Space_200;
        l_Size_1200_0 = v7.Global.Size_800 * 2;
        v13 = v7.Semantic.Typography.Header;
        v12 = v7.Semantic.Typography.Subheader;
        v14 = v7.Semantic.Typography.Body;
        l_Emphasis_2 = v7.Semantic.Color.Text.Default;
        v18 = v7.Semantic.Typography.CaptionBody;
        v20 = v7.Global.Space_100;
        l_Bottom_0 = Enum.VerticalAlignment.Center;
        v22 = 0.5;
    end;
    return {
        verticalPadding = l_Space_250_0, 
        iconSize = l_Size_1200_0, 
        layoutHeaderFont = v13, 
        headerFont = v12, 
        bodyFont = v14, 
        layoutTextColor = l_Emphasis_0, 
        headerTextColor = l_Emphasis_1, 
        bodyTextColor = l_Emphasis_2, 
        textAlertFont = v18, 
        textAlertColor = v19, 
        headerPadding = v20, 
        warningTextVerticalAlignment = l_Bottom_0, 
        buttonFrameWidth = v22, 
        getDevicePadding = function(v23) --[[ Line: 73 ]] --[[ Name: getDevicePadding ]]
            -- upvalues: l_Space_1000_0 (ref), l_Space_200_0 (ref)
            if v23 then
                return l_Space_1000_0;
            else
                return l_Space_200_0;
            end;
        end
    };
end;