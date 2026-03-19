local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local _ = require(l_script_FirstAncestor_0.Types);
return function(v2) --[[ Line: 7 ]]
    return (not v2.buttons or #v2.buttons < 2) and (not v2.labelItems or #v2.labelItems == 0) and not v2.image and not v2.body and not v2.isDismissable;
end;