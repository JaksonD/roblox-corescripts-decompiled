local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
return function(v3) --[[ Line: 7 ]] --[[ Name: getBottomSpacing ]]
    -- upvalues: v1 (copy)
    if not v1.FoundationDialogBodyUpdate then
        return nil;
    else
        return -UDim.new(0, v3.Gap.XLarge - v3.Gap.XSmall);
    end;
end;