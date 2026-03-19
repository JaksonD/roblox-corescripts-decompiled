local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
return v2.memo(function(v5) --[[ Line: 20 ]] --[[ Name: Eyebrow ]]
    -- upvalues: v2 (copy), v3 (copy)
    if not v5.eyebrow then
        return nil;
    else
        return v2.createElement(v3, {
            input = v5.eyebrow, 
            tag = "size-full-0 auto-y text-label-large", 
            LayoutOrder = v5.layoutOrder
        });
    end;
end);