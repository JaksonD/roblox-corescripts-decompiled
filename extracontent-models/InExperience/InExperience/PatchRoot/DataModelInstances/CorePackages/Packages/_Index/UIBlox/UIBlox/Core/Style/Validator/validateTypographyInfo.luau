local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
return v1.strictInterface({
    Font = v1.EnumItem, 
    FontSize = v1.numberMinExclusive(0), 
    LineHeight = v1.numberMinExclusive(0), 
    LetterSpacing = v1.number
});