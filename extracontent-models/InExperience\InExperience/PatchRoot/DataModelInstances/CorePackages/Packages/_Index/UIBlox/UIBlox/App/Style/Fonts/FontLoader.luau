local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Cryo);
local _ = require(l_Parent_0.StyleTypes);
local v4 = {
    BASE_SIZE = 16, 
    FACTOR = 1.26
};
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v7 = {
        _tokens = v6
    };
    setmetatable(v7, v5);
    return v7;
end;
v5.loadFont = function(v8) --[[ Line: 25 ]] --[[ Name: loadFont ]]
    -- upvalues: v4 (copy), v2 (copy)
    local l__tokens_0 = v8._tokens;
    local l_BASE_SIZE_0 = v4.BASE_SIZE;
    local v11 = {
        BaseSize = l_BASE_SIZE_0 * v4.FACTOR, 
        HeadingLarge = {
            Font = Enum.Font.BuilderSansBold, 
            RelativeSize = l__tokens_0.Global.Size_350 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_300 / l_BASE_SIZE_0
        }, 
        HeadingSmall = {
            Font = Enum.Font.BuilderSansBold, 
            RelativeSize = l__tokens_0.Global.Size_250 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_200 / l_BASE_SIZE_0
        }, 
        TitleLarge = {
            Font = Enum.Font.BuilderSansBold, 
            RelativeSize = l__tokens_0.Global.Size_200 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0
        }, 
        BodyLarge = {
            Font = Enum.Font.BuilderSans, 
            RelativeSize = l__tokens_0.Global.Size_200 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0
        }, 
        CaptionLarge = {
            Font = Enum.Font.BuilderSansMedium, 
            RelativeSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_100 / l_BASE_SIZE_0
        }, 
        BodySmall = {
            Font = Enum.Font.BuilderSans, 
            RelativeSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_100 / l_BASE_SIZE_0
        }, 
        CaptionSmall = {
            Font = Enum.Font.BuilderSansMedium, 
            RelativeSize = l__tokens_0.Global.Size_125 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_100 / l_BASE_SIZE_0
        }
    };
    local v12 = v8:mapLegacyFont(v11, l_BASE_SIZE_0);
    return v2.Dictionary.join(v12, v11);
end;
v5.mapLegacyFont = function(_, v14, _) --[[ Line: 78 ]] --[[ Name: mapLegacyFont ]]
    return {
        Title = v14.HeadingLarge, 
        Header1 = v14.HeadingSmall, 
        Header2 = v14.TitleLarge, 
        SubHeader1 = v14.TitleLarge, 
        Body = v14.BodyLarge, 
        CaptionHeader = v14.CaptionLarge, 
        CaptionSubHeader = v14.CaptionLarge, 
        CaptionBody = v14.BodySmall, 
        Footer = v14.CaptionSmall
    };
end;
return v5;