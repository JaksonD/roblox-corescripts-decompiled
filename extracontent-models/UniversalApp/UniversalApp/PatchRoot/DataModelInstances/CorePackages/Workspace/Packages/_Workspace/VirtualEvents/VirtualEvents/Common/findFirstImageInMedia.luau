local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
return function(v2) --[[ Line: 15 ]] --[[ Name: findFirstImageInMedia ]]
    for _, v4 in v2 do
        if v4.assetType == "Image" and v4.imageId then
            return ("rbxassetid://%s"):format(v4.imageId);
        end;
    end;
    return nil;
end;