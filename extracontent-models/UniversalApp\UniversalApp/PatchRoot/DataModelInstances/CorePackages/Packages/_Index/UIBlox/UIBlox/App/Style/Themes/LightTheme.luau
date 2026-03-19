local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Colors);
return {
    BackgroundDefault = {
        Color = v1.Alabaster, 
        Transparency = 0
    }, 
    BackgroundContrast = {
        Color = v1.Ash, 
        Transparency = 0
    }, 
    BackgroundMuted = {
        Color = v1.Chalk, 
        Transparency = 0
    }, 
    BackgroundUIDefault = {
        Color = v1.White, 
        Transparency = 0
    }, 
    BackgroundUIContrast = {
        Color = v1.White, 
        Transparency = 0.1
    }, 
    BackgroundOnHover = {
        Color = v1.Black, 
        Transparency = 0.9
    }, 
    BackgroundOnPress = {
        Color = v1.Black, 
        Transparency = 0.9
    }, 
    UIDefault = {
        Color = v1.Pumice, 
        Transparency = 0
    }, 
    UIMuted = {
        Color = v1.Black, 
        Transparency = 0.9
    }, 
    UIEmphasis = {
        Color = v1.Black, 
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
        Color = v1.Flint, 
        Transparency = 0
    }, 
    SystemPrimaryOnHover = {
        Color = v1.Flint, 
        Transparency = 0
    }, 
    SystemPrimaryContent = {
        Color = v1.White, 
        Transparency = 0
    }, 
    SecondaryDefault = {
        Color = v1.Black, 
        Transparency = 0.5
    }, 
    SecondaryOnHover = {
        Color = v1.Flint, 
        Transparency = 0
    }, 
    SecondaryContent = {
        Color = v1.Black, 
        Transparency = 0.5
    }, 
    IconDefault = {
        Color = v1.Black, 
        Transparency = 0.4
    }, 
    IconEmphasis = {
        Color = v1.Flint, 
        Transparency = 0
    }, 
    IconOnHover = {
        Color = v1.Flint, 
        Transparency = 0
    }, 
    TextEmphasis = {
        Color = v1.Flint, 
        Transparency = 0
    }, 
    TextDefault = {
        Color = v1.Smoke, 
        Transparency = 0
    }, 
    TextMuted = {
        Color = v1.Black, 
        Transparency = 0.4
    }, 
    TextLink = {
        Color = v1.Blue, 
        Transparency = 0
    }, 
    Divider = {
        Color = v1.Pumice, 
        Transparency = 0
    }, 
    Overlay = {
        Color = v1.Black, 
        Transparency = 0.7
    }, 
    DropShadow = {
        Color = v1.Black, 
        Transparency = 0.7
    }, 
    NavigationBar = {
        Color = v1.White, 
        Transparency = 0
    }, 
    PlaceHolder = {
        Color = v1.Black, 
        Transparency = 0.9
    }, 
    OnlineStatus = {
        Color = v1.Green, 
        Transparency = 0
    }, 
    OfflineStatus = {
        Color = v1.Black, 
        Transparency = 0.5
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
        Color = v1.Flint, 
        Transparency = 0
    }, 
    BadgeContent = {
        Color = v1.White, 
        Transparency = 0
    }, 
    SelectionCursor = {
        Color = v1.XboxBlue, 
        Transparency = 0, 
        AnimatedColor = v1.White, 
        GradientRotationSpeed = 2, 
        GradientColorSequence = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(0.514, 0.82, 0.992)), 
            ColorSequenceKeypoint.new(1, Color3.new(0.086, 0.678, 0.847))
        }), 
        GradientTransparencySequence = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(1, 0)
        })
    }, 
    PlayerBackgroundDefault = {
        Color = v1.White, 
        Transparency = 0, 
        Image = "component_assets/avatarBG_light"
    }, 
    ItemBackgroundDefault = {
        Color = v1.White, 
        Transparency = 0, 
        Image = "component_assets/itemBG_light"
    }
};