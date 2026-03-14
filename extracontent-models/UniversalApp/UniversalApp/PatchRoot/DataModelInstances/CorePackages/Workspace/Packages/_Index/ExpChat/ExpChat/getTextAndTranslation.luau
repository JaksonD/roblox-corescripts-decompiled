local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.isWhiteSpaceOnly);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v3 = "";
    local v4 = "";
    if v2 and v2.Text and not v1(v2.Text) then
        v3 = v2.Text;
        v4 = v2.Translation;
    end;
    if (if v2 then v2.WasRewritten else false) and v2.RewrittenText and not v1(v2.RewrittenText) then
        v3 = v2.RewrittenText;
        v4 = v2.RewrittenTranslation;
    end;
    return v3, v4;
end;