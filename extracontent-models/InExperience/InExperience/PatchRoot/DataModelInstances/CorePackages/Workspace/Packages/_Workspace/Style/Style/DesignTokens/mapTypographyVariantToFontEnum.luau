local v0 = {
    Black = Enum.Font.GothamBlack, 
    Bold = Enum.Font.GothamBold, 
    Medium = Enum.Font.GothamMedium, 
    Book = Enum.Font.Gotham
};
return function(v1) --[[ Line: 55 ]] --[[ Name: mapTypographyVariantToFontEnum ]]
    -- upvalues: v0 (copy)
    if v1.Font then
        return v1.Font;
    elseif v1.FontWeight then
        return v0[v1.FontWeight] or v0.Book;
    else
        return v0.Book;
    end;
end;