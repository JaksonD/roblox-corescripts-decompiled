local l_Parent_0 = script.Parent.Parent.Parent;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
return (l_memoize_0(function(v3, v4) --[[ Line: 162 ]]
    -- upvalues: l_Images_0 (copy)
    local v5 = {
        IsTenFoot = v3
    };
    if v3 then
        v5.ContainerPosition = UDim2.new(0.5, 0, 0.5, 0);
        v5.ContainerSize = UDim2.new(0, 350, 0, 720);
        v5.AnchorPoint = Vector2.new(0.5, 0.5);
        v5.PlayerDropDownSizeX = 0;
        v5.PlayerScrollListPosition = UDim2.new(0, 0, 0, 105);
        v5.PlayerScrollListSize = UDim2.new(1, 19, 1, 0);
        v5.PlayerScrollListInnerFramePosition = UDim2.new(0, 0, 0, 0);
        v5.PlayerScrollListInnerFrameSize = UDim2.new(1, 0, 1, 0);
        v5.EntrySizeX = 350;
        v5.PlayerEntrySizeY = 100;
        v5.EntryPadding = 5;
        v5.TeamEntrySizeY = 32;
        v5.StatEntrySizeX = 250;
        v5.EntryXOffset = -20;
        v5.BackgroundStyle = {
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
        v5.TeamEntryBackgroundTransparency = 0.25;
        v5.DefaultTextStyle = {
            Color = Color3.fromRGB(255, 255, 243), 
            Transparency = 0, 
            StrokeTransparency = 0.75, 
            StrokeColor = Color3.fromRGB(34, 34, 34)
        };
        v5.HoveredTextStyle = {
            Color = Color3.fromRGB(19, 19, 19), 
            Transparency = 0, 
            StrokeTransparency = 0.75, 
            StrokeColor = Color3.fromRGB(34, 34, 34)
        };
        v5.PlayerIconSize = UDim2.new(0, 64, 0, 64);
        v5.InitalPlayerEntryPadding = 18;
        v5.PlayerEntryPadding = 8;
        v5.PlayerEntryNamePadding = 8;
        v5.TeamEntryTextPadding = 5;
        v5.StatTextPadding = 0;
        v5.PlayerNameSize = UDim2.new(1, -88, 1, 0);
        v5.PlayerNameTextSize = 32;
        v5.StatTextSize = 32;
        v5.ScrollImageColor = Color3.fromRGB(31, 31, 31);
        v5.ScrollImageTransparency = 0.5;
    else
        v5.ContainerPadding = 4;
        v5.ContainerPosition = UDim2.new(1, -4, 0, 4);
        v5.ContainerSize = UDim2.new(0, 0, 0.5, 0);
        v5.ExtraContainerPadding = 16;
        v5.AnchorPoint = Vector2.new(1, 0);
        v5.PlayerDropDownSizeX = 300;
        v5.PlayerDropDownOffset = 4;
        v5.PlayerScrollListPosition = UDim2.new(0, 0, 0, 0);
        v5.PlayerScrollListSize = UDim2.new(1, -1, 1, 0);
        v5.EntryBaseSizeX = 150;
        v5.EntrySizeIncreasePerStat = 11;
        v5.PlayerEntrySizeY = 40;
        v5.EntryPadding = 0;
        v5.TeamEntrySizeY = 24;
        v5.StatEntrySizeX = 66;
        v5.TitleBarSizeY = 20;
        v5.EntryXOffset = 0;
        v5.TeamEntryBackgroundTransparency = 0.5;
        v5.IconButtonBackgroundTransparency = 0.3;
        v5.DropDownHeaderBackgroundTransparency = 0.1;
        v5.OverrideBackgroundTransparency = 0.3;
        v5.FadedBackgroundTransparency = 0.65;
        v5.FadedBackgroundScaleDelta = 0.05;
        v5.PlayerIconSize = UDim2.new(0, 16, 0, 16);
        v5.InitalPlayerEntryPadding = 12;
        v5.PlayerEntryPadding = 12;
        v5.PlayerEntryNamePadding = 4;
        v5.TeamEntryTextPadding = 15;
        v5.StatTextPadding = 4;
        v5.PlayerNameSize = UDim2.new(1, -34, 1, 0);
        v5.PlayerNameTextSize = 14;
        v5.StatTextSize = 14;
        v5.ScrollImageColor = Color3.fromRGB(216, 216, 216);
        v5.ScrollImageTransparency = 0.5;
        v5.ScrollBarOffset = 4;
        v5.ScrollBarSize = 8;
    end;
    v5.TopBarOffset = v4.TopBarHeight;
    v5.PlayerDropDownSizeXMobile = 327;
    v5.ScrollBarSizeMobile = 2;
    v5.PlayerNameSizeXMobile = 194;
    v5.PlayerIconSizeMobile = UDim2.fromOffset(20, 20);
    v5.PlayerNameTextSizeMobile = 16;
    v5.StatTextSizeMobile = 16;
    v5.PlayerNamePaddingXMobile = 14;
    v5.TeamEntryTextPadding = 15;
    v5.TeamEntryTextPaddingMobile = 14;
    v5.RowHoverColor = Color3.fromRGB(0, 0, 0);
    v5.RowDefaultColor = Color3.fromRGB(84, 84, 84);
    v5.MaxLeaderstats = 4;
    v5.MaxLeaderstatsSmallScreen = 1;
    v5.PlayerEntryFont = Enum.Font.SourceSans;
    v5.TitlePlayerEntryFont = Enum.Font.SourceSansBold;
    v5.TeamEntryFont = Enum.Font.SourceSans;
    v5.StatFont = Enum.Font.SourceSans;
    v5.TitleStatFont = Enum.Font.SourceSansBold;
    v5.TeamStatFont = Enum.Font.SourceSansBold;
    v5.StatNameFont = Enum.Font.SourceSans;
    v5.PlayerIconBackgroundSize = UDim2.new(0, 66, 0, 66);
    v5.PlayerBackgroundImage = "rbxasset://textures/ui/PlayerList/CharacterImageBackground.png";
    v5.RobloxIconImage = "rbxasset://textures/ui/Shell/Icons/RobloxIcon24.png";
    v5.IconSelectedColor = Color3.fromRGB(19, 19, 19);
    v5.IconUnSelectedColor = Color3.fromRGB(255, 255, 255);
    v5.SelectedEntryColor = Color3.fromRGB(0, 255, 255);
    v5.ShadowImage = "rbxasset://textures/ui/PlayerList/TileShadowMissingTop.png";
    v5.ShadowSize = 5;
    v5.ShadowSliceRect = Rect.new(6, 6, 9, 9);
    v5.DefaultThumbnail = "rbxasset://textures/ui/Shell/Icons/DefaultProfileIcon.png";
    v5.BlockedIcon = l_Images_0["icons/status/unavailable_small"];
    v5.FriendIcons = {
        [Enum.FriendStatus.Friend] = l_Images_0["icons/status/player/friend"], 
        [Enum.FriendStatus.FriendRequestReceived] = l_Images_0["icons/status/player/pending"]
    };
    v5.FollowingIcon = l_Images_0["icons/status/player/following"];
    v5.PlaceOwnerIcon = l_Images_0["icons/status/player/developer"];
    v5.MembershipIcons = {
        [Enum.MembershipType.Premium] = l_Images_0["icons/status/premium_small"]
    };
    v5.SubscriptionIcon = l_Images_0["icons/menu/gem_small"];
    v5.CustomPlayerIcons = {
        [7210880] = "rbxassetid://134032333", 
        [13268404] = "rbxassetid://113059239", 
        [261] = "rbxassetid://105897927"
    };
    v5.NeutralTeamColor = BrickColor.new("White");
    v5.NeutralTeamName = "Neutral";
    v5.DropDownButtonSizeY = 56;
    v5.DropDownButtonPadding = 0;
    v5.DropDownPadding = 10;
    v5.DropDownRightOptionSize = 55;
    v5.DropDownIconSize = 36;
    v5.DropDownHeaderSizeY = 80;
    v5.DropDownHeaderBackgroundSize = 65;
    v5.DropDownScreenSidePadding = 4;
    return v5;
end));