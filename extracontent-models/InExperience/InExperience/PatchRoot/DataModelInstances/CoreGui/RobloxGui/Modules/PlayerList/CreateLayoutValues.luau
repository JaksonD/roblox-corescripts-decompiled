local l_CorePackages_0 = game:GetService("CorePackages");
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v2 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v3 = require(script.Parent.Parent.TopBar.Constants);
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
if v2.Flags.FFlagUseNewPlayerList then
    local l_CreateLayoutValues_0 = v2.Common.CreateLayoutValues;
    return function(v6) --[[ Line: 18 ]]
        -- upvalues: l_CreateLayoutValues_0 (copy), v3 (copy)
        return l_CreateLayoutValues_0(v6, v3);
    end;
else
    return function(v7) --[[ Line: 22 ]]
        -- upvalues: l_Enabled_0 (copy), v3 (copy), l_Images_0 (copy)
        local v8 = {
            IsTenFoot = v7
        };
        if v7 then
            v8.ContainerPosition = UDim2.new(0.5, 0, 0.5, 0);
            v8.ContainerSize = UDim2.new(0, 350, 0, 720);
            v8.AnchorPoint = Vector2.new(0.5, 0.5);
            v8.PlayerDropDownSizeX = 0;
            v8.PlayerScrollListPosition = UDim2.new(0, 0, 0, 105);
            v8.PlayerScrollListSize = UDim2.new(1, 19, 1, 0);
            v8.PlayerScrollListInnerFramePosition = UDim2.new(0, 0, 0, 0);
            v8.PlayerScrollListInnerFrameSize = UDim2.new(1, 0, 1, 0);
            v8.EntrySizeX = 350;
            v8.PlayerEntrySizeY = 100;
            v8.EntryPadding = 5;
            v8.TeamEntrySizeY = 32;
            v8.StatEntrySizeX = 250;
            v8.EntryXOffset = -20;
            v8.BackgroundStyle = {
                Default = {
                    Color = Color3.fromRGB(60, 60, 60), 
                    Transparency = 0.25
                }, 
                Hovered = {
                    Color = Color3.fromRGB(50, 181, 255), 
                    Transparency = 0.25
                }, 
                HoveredTitle = {
                    Color = Color3.fromRGB(50, 181, 255), 
                    Transparency = 0
                }, 
                Title = {
                    Color = Color3.fromRGB(25, 25, 25), 
                    Transparency = 0
                }, 
                Selected = nil
            };
            v8.TeamEntryBackgroundTransparency = 0.25;
            v8.DefaultTextStyle = {
                Color = Color3.fromRGB(255, 255, 243), 
                Transparency = 0, 
                StrokeTransparency = 0.75, 
                StrokeColor = Color3.fromRGB(34, 34, 34)
            };
            v8.HoveredTextStyle = {
                Color = Color3.fromRGB(19, 19, 19), 
                Transparency = 0, 
                StrokeTransparency = 0.75, 
                StrokeColor = Color3.fromRGB(34, 34, 34)
            };
            v8.PlayerIconSize = UDim2.new(0, 64, 0, 64);
            v8.InitalPlayerEntryPadding = 18;
            v8.PlayerEntryPadding = 8;
            v8.PlayerEntryNamePadding = 8;
            v8.TeamEntryTextPadding = 5;
            v8.StatTextPadding = 0;
            v8.PlayerNameSize = UDim2.new(1, -88, 1, 0);
            v8.PlayerNameTextSize = 32;
            v8.StatTextSize = 32;
            v8.ScrollImageColor = Color3.fromRGB(31, 31, 31);
            v8.ScrollImageTransparency = 0.5;
        else
            v8.ContainerPadding = 4;
            v8.ContainerPosition = UDim2.new(1, -4, 0, 4);
            v8.ContainerSize = UDim2.new(0, 0, 0.5, 0);
            v8.ExtraContainerPadding = 16;
            v8.AnchorPoint = Vector2.new(1, 0);
            v8.PlayerDropDownSizeX = 300;
            v8.PlayerDropDownOffset = 4;
            v8.PlayerScrollListPosition = UDim2.new(0, 0, 0, 0);
            v8.PlayerScrollListSize = UDim2.new(1, -1, 1, 0);
            v8.EntryBaseSizeX = 150;
            v8.EntrySizeIncreasePerStat = 11;
            v8.PlayerEntrySizeY = 40;
            v8.EntryPadding = 0;
            v8.TeamEntrySizeY = 24;
            v8.StatEntrySizeX = 66;
            v8.TitleBarSizeY = 20;
            v8.EntryXOffset = 0;
            v8.TeamEntryBackgroundTransparency = 0.5;
            v8.IconButtonBackgroundTransparency = 0.3;
            v8.DropDownHeaderBackgroundTransparency = 0.1;
            v8.OverrideBackgroundTransparency = 0.3;
            v8.FadedBackgroundTransparency = 0.65;
            v8.FadedBackgroundScaleDelta = 0.05;
            v8.PlayerIconSize = UDim2.new(0, 16, 0, 16);
            v8.InitalPlayerEntryPadding = 12;
            v8.PlayerEntryPadding = 12;
            v8.PlayerEntryNamePadding = 4;
            v8.TeamEntryTextPadding = 15;
            v8.StatTextPadding = 4;
            v8.PlayerNameSize = UDim2.new(1, -34, 1, 0);
            v8.PlayerNameTextSize = 14;
            v8.StatTextSize = 14;
            v8.ScrollImageColor = Color3.fromRGB(216, 216, 216);
            v8.ScrollImageTransparency = 0.5;
            v8.ScrollBarOffset = 4;
            v8.ScrollBarSize = 8;
        end;
        if l_Enabled_0() then
            v8.TopBarOffset = v3.TopBarHeight;
        else
            v8.TopBarOffset = 36;
        end;
        v8.PlayerDropDownSizeXMobile = 327;
        v8.ScrollBarSizeMobile = 2;
        v8.PlayerNameSizeXMobile = 194;
        v8.PlayerIconSizeMobile = UDim2.fromOffset(20, 20);
        v8.PlayerNameTextSizeMobile = 16;
        v8.StatTextSizeMobile = 16;
        v8.PlayerNamePaddingXMobile = 14;
        v8.TeamEntryTextPadding = 15;
        v8.TeamEntryTextPaddingMobile = 14;
        v8.RowHoverColor = Color3.fromRGB(0, 0, 0);
        v8.RowDefaultColor = Color3.fromRGB(84, 84, 84);
        v8.MaxLeaderstats = 4;
        v8.MaxLeaderstatsSmallScreen = 1;
        v8.PlayerEntryFont = Enum.Font.SourceSans;
        v8.TitlePlayerEntryFont = Enum.Font.SourceSansBold;
        v8.TeamEntryFont = Enum.Font.SourceSans;
        v8.StatFont = Enum.Font.SourceSans;
        v8.TitleStatFont = Enum.Font.SourceSansBold;
        v8.TeamStatFont = Enum.Font.SourceSansBold;
        v8.StatNameFont = Enum.Font.SourceSans;
        v8.PlayerIconBackgroundSize = UDim2.new(0, 66, 0, 66);
        v8.PlayerBackgroundImage = "rbxasset://textures/ui/PlayerList/CharacterImageBackground.png";
        v8.RobloxIconImage = "rbxasset://textures/ui/Shell/Icons/RobloxIcon24.png";
        v8.IconSelectedColor = Color3.fromRGB(19, 19, 19);
        v8.IconUnSelectedColor = Color3.fromRGB(255, 255, 255);
        v8.SelectedEntryColor = Color3.fromRGB(0, 255, 255);
        v8.ShadowImage = "rbxasset://textures/ui/PlayerList/TileShadowMissingTop.png";
        v8.ShadowSize = 5;
        v8.ShadowSliceRect = Rect.new(6, 6, 9, 9);
        v8.DefaultThumbnail = "rbxasset://textures/ui/Shell/Icons/DefaultProfileIcon.png";
        v8.BlockedIcon = l_Images_0["icons/status/unavailable_small"];
        v8.FriendIcons = {
            [Enum.FriendStatus.Friend] = l_Images_0["icons/status/player/friend"], 
            [Enum.FriendStatus.FriendRequestReceived] = l_Images_0["icons/status/player/pending"]
        };
        v8.FollowingIcon = l_Images_0["icons/status/player/following"];
        v8.PlaceOwnerIcon = l_Images_0["icons/status/player/developer"];
        v8.MembershipIcons = {
            [Enum.MembershipType.Premium] = l_Images_0["icons/status/premium_small"]
        };
        v8.SubscriptionIcon = l_Images_0["icons/menu/gem_small"];
        v8.CustomPlayerIcons = {
            [7210880] = "rbxassetid://134032333", 
            [13268404] = "rbxassetid://113059239", 
            [261] = "rbxassetid://105897927"
        };
        v8.NeutralTeamColor = BrickColor.new("White");
        v8.NeutralTeamName = "Neutral";
        v8.DropDownButtonSizeY = 56;
        v8.DropDownButtonPadding = 0;
        v8.DropDownPadding = 10;
        v8.DropDownRightOptionSize = 55;
        v8.DropDownIconSize = 36;
        v8.DropDownHeaderSizeY = 80;
        v8.DropDownHeaderBackgroundSize = 65;
        v8.DropDownScreenSidePadding = 4;
        setmetatable(v8, {
            __index = function(_, v10) --[[ Line: 227 ]] --[[ Name: __index ]]
                error(string.format("%q is not a valid member of LayoutValues", (tostring(v10))), 2);
            end
        });
        return v8;
    end;
end;