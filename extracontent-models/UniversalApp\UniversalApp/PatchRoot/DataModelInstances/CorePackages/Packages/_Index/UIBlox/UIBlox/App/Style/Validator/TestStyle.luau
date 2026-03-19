local v0 = {
    Color = Color3.fromRGB(0, 0, 0), 
    Transparency = 0
};
local v1 = {
    Color = Color3.new(0.086, 0.678, 0.847), 
    Transparency = 0, 
    AnimatedColor = Color3.new(1, 1, 1), 
    GradientRotationSpeed = 2, 
    GradientColorSequence = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0.514, 0.82, 0.992)), 
        ColorSequenceKeypoint.new(1, Color3.new(0.086, 0.678, 0.847))
    }), 
    GradientTransparencySequence = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), 
        NumberSequenceKeypoint.new(1, 0)
    })
};
local v2 = {
    Color = Color3.fromRGB(0, 0, 0), 
    Transparency = 0, 
    Image = ""
};
local v3 = {
    BackgroundDefault = v0, 
    BackgroundContrast = v0, 
    BackgroundMuted = v0, 
    BackgroundUIDefault = v0, 
    BackgroundUIContrast = v0, 
    BackgroundOnHover = v0, 
    BackgroundOnPress = v0, 
    UIDefault = v0, 
    UIMuted = v0, 
    UIEmphasis = v0, 
    ContextualPrimaryDefault = v0, 
    ContextualPrimaryOnHover = v0, 
    ContextualPrimaryContent = v0, 
    SystemPrimaryDefault = v0, 
    SystemPrimaryOnHover = v0, 
    SystemPrimaryContent = v0, 
    SecondaryDefault = v0, 
    SecondaryOnHover = v0, 
    SecondaryContent = v0, 
    IconDefault = v0, 
    IconEmphasis = v0, 
    IconOnHover = v0, 
    TextEmphasis = v0, 
    TextDefault = v0, 
    TextMuted = v0, 
    TextLink = v0, 
    Divider = v0, 
    Overlay = v0, 
    DropShadow = v0, 
    NavigationBar = v0, 
    PlaceHolder = v0, 
    OnlineStatus = v0, 
    OfflineStatus = v0, 
    Success = v0, 
    Alert = v0, 
    Badge = v0, 
    BadgeContent = v0, 
    SelectionCursor = v1, 
    PlayerBackgroundDefault = v2, 
    ItemBackgroundDefault = v2
};
local v4 = {
    Font = Enum.Font.GothamMedium, 
    RelativeSize = 1, 
    RelativeMinSize = 1
};
local v5 = {
    BaseSize = 10, 
    Title = v4, 
    Header1 = v4, 
    Header2 = v4, 
    SubHeader1 = v4, 
    Body = v4, 
    CaptionHeader = v4, 
    CaptionSubHeader = v4, 
    CaptionBody = v4, 
    Footer = v4, 
    HeadingLarge = v4, 
    HeadingSmall = v4, 
    TitleLarge = v4, 
    BodyLarge = v4, 
    CaptionLarge = v4, 
    BodySmall = v4, 
    CaptionSmall = v4
};
local v6 = {
    PreferredTransparency = 0.56, 
    ReducedMotion = true
};
return {
    Theme = v3, 
    Font = v5, 
    Settings = v6
};