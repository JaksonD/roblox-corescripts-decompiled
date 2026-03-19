local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CorePackages");
local l_status_0, l_result_0 = pcall(l_GuiService_0.GetResolutionScale, l_GuiService_0);
local l_Parent_0 = script.Parent;
local v5 = require(l_Parent_0.Generated.GetImageSetData);
local l_FixBlurryImages_0 = require(l_Parent_0.Flags).FixBlurryImages;
if not l_status_0 or not l_FixBlurryImages_0 and not l_script_FirstAncestor_0 then
    l_result_0 = 1;
end;
if l_GuiService_0:IsTenFootInterface() then
    l_result_0 = 3;
end;
return function() --[[ Line: 21 ]] --[[ Name: getResolutionScale ]]
    -- upvalues: v5 (copy), l_result_0 (ref)
    local _, v8 = v5(l_result_0);
    return v8;
end;