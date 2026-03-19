local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = {
    IMessage = v1.strictInterface({
        id = v1.string, 
        name = v1.string, 
        text = v1.string, 
        userId = v1.string, 
        timestamp = v1.number, 
        adornee = v1.union(v1.instanceIsA("BasePart"), v1.instanceOf("Model"))
    }), 
    IMessageData = v1.interface({
        ID = v1.number, 
        SpeakerUserId = v1.number, 
        FromSpeaker = v1.string, 
        Time = v1.number, 
        Message = v1.optional(v1.string)
    })
};
local v3 = {
    BubbleDuration = v1.optional(v1.number), 
    MaxBubbles = v1.optional(v1.number), 
    BackgroundColor3 = v1.optional(v1.Color3), 
    TextColor3 = v1.optional(v1.Color3), 
    TextSize = v1.optional(v1.number), 
    Font = v1.optional(v1.enum(Enum.Font)), 
    Transparency = v1.optional(v1.number), 
    CornerEnabled = v1.optional(v1.boolean), 
    CornerRadius = v1.optional(v1.UDim), 
    TailVisible = v1.optional(v1.boolean), 
    Padding = v1.optional(v1.number), 
    MaxWidth = v1.optional(v1.number), 
    BackgroundImage = v1.optional(v1.strictInterface({
        Image = v1.optional(v1.string), 
        ImageColor3 = v1.optional(v1.Color3), 
        ImageRectOffset = v1.optional(v1.Vector2), 
        ImageRectSize = v1.optional(v1.Vector2), 
        ScaleType = v1.optional(v1.enum(Enum.ScaleType)), 
        SliceCenter = v1.optional(v1.Rect), 
        SliceScale = v1.optional(v1.number), 
        TileSize = v1.optional(v1.UDim2)
    })), 
    BackgroundGradient = v1.optional(v1.strictInterface({
        Enabled = v1.optional(v1.boolean), 
        Color = v1.optional(v1.ColorSequence), 
        Offset = v1.optional(v1.Vector2), 
        Rotation = v1.optional(v1.number), 
        Transparency = v1.optional(v1.NumberSequence)
    })), 
    SizeAnimation = v1.optional(v1.strictInterface({
        Enabled = v1.optional(v1.boolean), 
        SpringDampingRatio = v1.optional(v1.number), 
        SpringFrequency = v1.optional(v1.number)
    })), 
    TransparencyAnimation = v1.optional(v1.strictInterface({
        Enabled = v1.optional(v1.boolean), 
        SpringDampingRatio = v1.optional(v1.number), 
        SpringFrequency = v1.optional(v1.number)
    })), 
    VerticalStudsOffset = v1.optional(v1.number), 
    LocalPlayerStudsOffset = v1.optional(v1.Vector3), 
    BubblesSpacing = v1.optional(v1.number), 
    MinimizeDistance = v1.optional(v1.number), 
    MaxDistance = v1.optional(v1.number), 
    AdorneeName = v1.optional(v1.string), 
    Voice = v1.optional(v1.strictInterface({
        ShowIndicator = v1.optional(v1.boolean)
    }))
};
local v4 = {};
for v5, v6 in pairs(v3) do
    v4[v5] = v6;
end;
v3.UserSpecificSettings = v1.optional(v1.map(v1.string, v1.strictInterface(v4)));
v2.IChatSettings = v1.strictInterface(v3);
return v2;