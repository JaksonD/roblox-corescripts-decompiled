local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Colors);
return {
    BackgroundDefault = {
        Color = v1.Slate, 
        Transparency = 0
    }, 
    BackgroundContrast = {
        Color = v1.Carbon, 
        Transparency = 0
    }, 
    BackgroundMuted = {
        Color = v1.Obsidian, 
        Transparency = 0
    }, 
    BackgroundUIDefault = {
        Color = v1.Flint, 
        Transparency = 0
    }, 
    BackgroundUIContrast = {
        Color = v1.Black, 
        Transparency = 0.3
    }, 
    BackgroundOnHover = {
        Color = v1.White, 
        Transparency = 0.9
    }, 
    BackgroundOnPress = {
        Color = v1.Black, 
        Transparency = 0.7
    }, 
    UIDefault = {
        Color = v1.Graphite, 
        Transparency = 0
    }, 
    UIMuted = {
        Color = v1.Obsidian, 
        Transparency = 0.2
    }, 
    UIEmphasis = {
        Color = v1.White, 
        Transparency = 0.7
    }, 
    ContextualPrimaryDefault = {
        Color = v1.Green, 
        Transparency = 0
    }, 
    ContextualPrimaryOnHover = {
        Color = v1.Green, 
        Transparency = 0
    }, 
    ContextualPrimaryContent = {
        Color = v1.White, 
        Transparency = 0
    }, 
    SystemPrimaryDefault = {
        Color = v1.White, 
        Transparency = 0
    }, 
    SystemPrimaryOnHover = {
        Color = v1.White, 
        Transparency = 0
    }, 
    SystemPrimaryContent = {
        Color = v1.Flint, 
        Transparency = 0
    }, 
    SecondaryDefault = {
        Color = v1.White, 
        Transparency = 0.3
    }, 
    SecondaryOnHover = {
        Color = v1.White, 
        Transparency = 0
    }, 
    SecondaryContent = {
        Color = v1.White, 
        Transparency = 0.3
    }, 
    IconDefault = {
        Color = v1.White, 
        Transparency = 0.3
    }, 
    IconEmphasis = {
        Color = v1.White, 
        Transparency = 0
    }, 
    IconOnHover = {
        Color = v1.White, 
        Transparency = 0
    }, 
    TextEmphasis = {
        Color = v1.White, 
        Transparency = 0
    }, 
    TextDefault = {
        Color = v1.Pumice, 
        Transparency = 0
    }, 
    TextMuted = {
        Color = v1.White, 
        Transparency = 0.3
    }, 
    TextLink = {
        Color = v1.Blue, 
        Transparency = 0
    }, 
    Divider = {
        Color = v1.White, 
        Transparency = 0.8
    }, 
    Overlay = {
        Color = v1.Black, 
        Transparency = 0.5
    }, 
    DropShadow = {
        Color = v1.Black, 
        Transparency = 0.5
    }, 
    NavigationBar = {
        Color = v1.Carbon, 
        Transparency = 0
    }, 
    PlaceHolder = {
        Color = v1.Flint, 
        Transparency = 0.5
    }, 
    OnlineStatus = {
        Color = v1.Green, 
        Transparency = 0
    }, 
    OfflineStatus = {
        Color = v1.White, 
        Transparency = 0.3
    }, 
    Success = {
        Color = v1.Green, 
        Transparency = 0
    }, 
    Alert = {
        Color = v1.Red, 
        Transparency = 0
    }, 
    Badge = {
        Color = v1.White, 
        Transparency = 0
    }, 
    BadgeContent = {
        Color = v1.Flint, 
        Transparency = 0
    }, 
    SelectionCursor = {
        Color = v1.White, 
        Transparency = 0, 
        AnimatedColor = v1.White, 
        GradientRotationSpeed = 2, 
        GradientColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), 
            ColorSequenceKeypoint.new(1, Color3.new(0.336, 0.336, 0.336))
        }), 
        GradientTransparencySequence = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(1, 0)
        })
    }, 
    PlayerBackgroundDefault = {
        Color = v1.White, 
        Transparency = 0, 
        Image = "component_assets/avatarBG_dark"
    }, 
    ItemBackgroundDefault = {
        Color = v1.Black, 
        Transparency = 0, 
        Image = "component_assets/itemBG_dark"
    }
};