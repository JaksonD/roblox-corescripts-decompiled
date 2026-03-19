local l_CorePackages_0 = game:GetService("CorePackages");
local l_UIBlox_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).UIBlox;
local v2 = require(script.Parent.Images);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
return {
    Images = {
        RobloxLogo = v2["LuaApp/graphic/ic_logo"], 
        CloseButton = "rbxasset://textures/ui/TopBar/close.png", 
        RespawnIcon = v2["InGameMenu/Icons/RespawnIcon"], 
        ReportIcon = v2["LuaApp/icons/GameDetails/feedback"], 
        CloseModal = v2["LuaApp/icons/navigation/close"], 
        NavigateBack = v2["LuaApp/icons/navigation/pushBack"], 
        NavigateForward = v2["LuaApp/icons/navigation/pushRight"], 
        SendInvite = v2["LuaApp/icons/GameDetails/invite"], 
        InviteSuccess = v2["LuaApp/icons/status_progress"], 
        InviteMenu = v2["InGameMenu/Icons/MenuFriends"], 
        InviteFail = v2["LuaApp/graphic/ic_alert"], 
        ControlsMenu = v2["InGameMenu/Icons/MenuControls"], 
        Gamepad = "rbxasset://textures/ui/InGameMenu/GenericController.png", 
        GamepadXbox = "rbxasset://textures/ui/InGameMenu/XboxController.png", 
        GamepadQuest = "rbxassetid://13262267483", 
        KeyBorder = v2["InGameMenu/Icons/KeyBorder"], 
        Mouse1Press = v2["InGameMenu/Graphic/ClickLeft"], 
        Mouse2Press = v2["InGameMenu/Graphic/ClickRight"], 
        MouseWheelScroll = v2["InGameMenu/Graphic/WheelScroll"], 
        UpArrow = v2["InGameMenu/Icons/ArrowUp"], 
        DownArrow = v2["InGameMenu/Icons/ArrowDown"], 
        LeftArrow = v2["InGameMenu/Icons/ArrowLeft"], 
        RightArrow = v2["InGameMenu/Icons/ArrowRight"], 
        ScrollTop = "rbxasset://textures/ui/InGameMenu/ScrollTop.png", 
        ScrollMid = "rbxasset://textures/ui/InGameMenu/ScrollMiddle.png", 
        ScrollBottom = "rbxasset://textures/ui/InGameMenu/ScrollBottom.png", 
        RadialGlow = "rbxasset://textures/ui/InGameMenu/BackgroundGlow.png", 
        PlayersMenu = v2["InGameMenu/Icons/MenuPlayers"], 
        AddFriend = v2["LuaApp/graphic/actions_friends_addfriend"], 
        CancelFriendRequest = v2["InGameMenu/Icons/CancelFriendRequest"], 
        UnFriend = v2["InGameMenu/Icons/UnFriend"], 
        Friends = v2["InGameMenu/Icons/Friends"], 
        MoreActions = v2["LuaApp/icons/GameDetails/more"], 
        ViewAvatar = v2["InGameMenu/Icons/ViewAvatar"], 
        RoundedRect = {
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            Image = l_Images_0["component_assets/circle_17"]
        }, 
        RoundedRectBorder = {
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            Image = l_Images_0["component_assets/circle_17_stroke_1"]
        }, 
        WhiteSquare = {
            ScaleType = Enum.ScaleType.Stretch, 
            SliceCenter = Rect.new(0, 0, 0, 0), 
            Image = "rbxasset://textures/ui/InGameMenu/WhiteSquare.png"
        }, 
        Circle = l_Images_0["component_assets/circle_29"], 
        CircleCutout = "rbxasset://textures/ui/InGameMenu/CircleCutout.png", 
        QuarterCircle = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png", 
        ExpandArrow = v2["InGameMenu/Icons/ExpandArrow"], 
        SelectedCheck = v2["InGameMenu/Icons/SelectedCheck"], 
        SuccessTick = v2["LuaApp/icons/status_progress"], 
        RetryIcon = v2["LuaApp/icons/common_refresh"], 
        ClearIcon = v2["InGameMenu/Icons/Clear"], 
        SearchIcon = v2["LuaApp/icons/ic-search-new"], 
        GameSettings = v2["InGameMenu/Icons/GameSettings"], 
        Shadow = {
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(12, 12, 40, 40), 
            Size = 8, 
            Image = v2["InGameMenu/9Slice/DropShadow"]
        }, 
        ToggleOutline = {
            Image = v2["InGameMenu/9Slice/ToggleOutline"], 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(18, 18, 18, 18)
        }, 
        ToggleFill = {
            Image = v2["InGameMenu/9Slice/ToggleFill"], 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(18, 18, 18, 18)
        }, 
        ToggleKnob = v2["InGameMenu/Graphic/SliderButton"], 
        SliderHover = v2["InGameMenu/Graphic/sliderHover"], 
        SliderCircle = {
            Image = v2["InGameMenu/9Slice/sliderCircle"], 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            ScaleType = Enum.ScaleType.Slice
        }, 
        SliderButton = v2["InGameMenu/Graphic/SliderButton"], 
        PlaceholderGameIcon = l_Images_0["icons/imageUnavailable"]
    }
};