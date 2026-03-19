local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v6 = require(l_Parent_0.Colors);
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v8 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v9 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local v10 = require(l_Parent_0.Components.InspectAndBuyContext);
local v11 = v3.PureComponent:extend("PlayerNameLabel");
local l_verified_0 = v8.emoji.verified;
v11.render = function(v13) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: l_Players_0 (copy), v9 (copy), v7 (copy), l_verified_0 (copy), v3 (copy), v10 (copy), v6 (copy), l_AppFonts_0 (copy)
    local l_locale_0 = v13.props.locale;
    local l_view_0 = v13.props.view;
    local l_playerName_0 = v13.props.playerName;
    local v17 = tonumber(v13.props.playerId);
    local v18 = v17 and l_Players_0:GetPlayerByUserId(v17);
    local v19 = if v18 then v9.Utils.isPlayerVerified(v18) else false;
    local v20 = nil;
    v20 = l_playerName_0 == "" and "" or if v19 then v7:FormatByKeyForLocale("InGame.InspectMenu.Label.VerifiedAvatar", l_locale_0, {
        PLAYER_NAME = l_playerName_0, 
        VERIFIED_BADGE = l_verified_0
    }) else v7:FormatByKeyForLocale("InGame.InspectMenu.Label.Avatar", l_locale_0, {
        PLAYER_NAME = l_playerName_0
    });
    return v3.createElement(v10.Consumer, {
        render = function(v21) --[[ Line: 43 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v3 (ref), v6 (ref), v20 (ref), l_AppFonts_0 (ref)
            local v22 = v21[l_view_0];
            local v23 = v22.AvatarHeadShotSize + v22.BorderPaddingSize * 2 + 10;
            return v3.createElement("TextLabel", {
                Size = UDim2.new(1, -v23, 0, v22.TopSizeY), 
                BackgroundTransparency = 1, 
                TextColor3 = v6.White, 
                TextScaled = true, 
                Text = v20, 
                TextSize = 36, 
                Font = l_AppFonts_0.default:getBlack(), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 2
            }, {
                TextSizeConstraint = v3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 36
                })
            });
        end
    });
end;
return v4.UNSTABLE_connect2(function(v24, _) --[[ Line: 66 ]]
    return {
        view = v24.view, 
        playerName = v24.playerName, 
        playerId = v24.playerId, 
        locale = v24.locale
    };
end)(v11);