local l_Parent_0 = script:FindFirstAncestor("LandingPage").Parent;
local l_Colors_0 = require(l_Parent_0.UIBlox).App.Style.Colors;
local v2 = require(l_Parent_0.Otter);
local v3 = {
    VERTICAL = 90, 
    HORIZONTAL = 0
};
return {
    ContentProps = {
        ContentFocusedStyle = {
            Position = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 1), 
            LogoPositionYScale = 0.08, 
            BodyPositionYScale = 0.3
        }
    }, 
    Common = {
        AccountCarouselAvatarScaleFactor = game:DefineFastInt("AccountCarouselAvatarScaleFactor", 125) / 100, 
        RobloxLogo = {
            IMAGE = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png", 
            ASPECT_RATIO = 5.78, 
            MAX_WIDTH_SMALL = 150, 
            MAX_WIDTH_LARGE = 460
        }, 
        DefaultBackground = {
            IMAGE = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg", 
            ASPECT_RATIO = 1
        }, 
        GenreBackgrounds = {
            RPG = {
                IMAGE = "rbxasset://textures/ui/LuaApp/graphic/Auth/RPGBackground.png", 
                ASPECT_RATIO = 1
            }, 
            Simulation = {
                IMAGE = "rbxasset://textures/ui/LuaApp/graphic/Auth/SimulationBackground.png", 
                ASPECT_RATIO = 1
            }, 
            Shooter = {
                IMAGE = "rbxasset://textures/ui/LuaApp/graphic/Auth/FPSBackground.png", 
                ASPECT_RATIO = 1
            }, 
            SportsAndRacing = {
                IMAGE = "rbxasset://textures/ui/LuaApp/graphic/Auth/SportsAndRacingBackground.png", 
                ASPECT_RATIO = 1
            }
        }, 
        GradientOrientation = {
            VERTICAL = v3.VERTICAL, 
            HORIZONTAL = v3.HORIZONTAL
        }, 
        IMAGE_ASSET_URL_TEMPLATE = "http://www.roblox.com/asset/?id=%s"
    }, 
    CustomizedLandingPage = {
        GameIcon = {
            SIZE = 100, 
            PADDING = 0, 
            CORNER_RADIUS = 0.12, 
            IMAGE_URI_TEMPLATE = "rbxthumb://type=GameIcon&id=%s&w=150&h=150"
        }, 
        BackgroundGradient = {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, l_Colors_0.Black), 
                ColorSequenceKeypoint.new(0.4, l_Colors_0.White), 
                ColorSequenceKeypoint.new(0.75, l_Colors_0.Black), 
                ColorSequenceKeypoint.new(1, l_Colors_0.Black)
            }), 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0), 
                NumberSequenceKeypoint.new(1, 0)
            }), 
            Rotation = v3.VERTICAL
        }, 
        BackgroundAnimation = {
            RIGHT_EDGE = 0, 
            LEFT_EDGE = 1, 
            TRANSPARENT = 1, 
            OPAQUE = 0, 
            OTTER_SCROLL_LEFT = v2.ease(1, {
                duration = 16, 
                easingStyle = Enum.EasingStyle.Linear
            }), 
            OTTER_INSTANT_RIGHT = v2.instant(0), 
            OTTER_FADE_OUT = v2.ease(1, {
                duration = 0.4, 
                easingStyle = Enum.EasingStyle.Linear
            }), 
            OTTER_INSTANT_IN = v2.instant(0)
        }
    }
};