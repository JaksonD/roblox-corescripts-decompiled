local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_TextService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services.TextService;
local v2 = require(l_script_FirstAncestor_0.Utility.noYield);
return function() --[[ Line: 5 ]] --[[ Name: getTextSizeOffset ]]
    -- upvalues: v2 (copy), l_TextService_0 (copy)
    return v2(function(v3, v4) --[[ Line: 6 ]]
        -- upvalues: l_TextService_0 (ref)
        v3 = v3 or 0;
        v4 = v4 or Font.fromEnum(Enum.Font.BuilderSans);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
            -- upvalues: l_TextService_0 (ref), v3 (ref), v4 (ref)
            return l_TextService_0:GetTextSizeOffsetAsync(v3, v4);
        end);
        if not l_status_0 then
            return nil;
        else
            return l_result_0;
        end;
    end);
end;