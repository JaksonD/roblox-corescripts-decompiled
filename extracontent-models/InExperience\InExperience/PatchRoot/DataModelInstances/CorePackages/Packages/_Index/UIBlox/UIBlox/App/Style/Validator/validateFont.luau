local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.t);
local v3 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v4 = v2.strictInterface({
    BaseSize = v2.numberMinExclusive(0), 
    Title = v3, 
    Header1 = v3, 
    Header2 = v3, 
    SubHeader1 = v3, 
    Body = v3, 
    CaptionHeader = v3, 
    CaptionSubHeader = v3, 
    CaptionBody = v3, 
    Footer = v3
});
local v5 = v2.strictInterface({
    BaseSize = v2.numberMinExclusive(0), 
    Title = v3, 
    Header1 = v3, 
    Header2 = v3, 
    SubHeader1 = v3, 
    Body = v3, 
    CaptionHeader = v3, 
    CaptionSubHeader = v3, 
    CaptionBody = v3, 
    Footer = v3, 
    HeadingLarge = v3, 
    HeadingSmall = v3, 
    TitleLarge = v3, 
    BodyLarge = v3, 
    CaptionLarge = v3, 
    BodySmall = v3, 
    CaptionSmall = v3
});
return v2.union(v4, v5);