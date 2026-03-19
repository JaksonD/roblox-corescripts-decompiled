local _ = script.Parent.Parent;
isCreatorStoreAssetType = function(v1) --[[ Line: 3 ]] --[[ Name: isCreatorStoreAssetType ]]
    if v1 == nil or type(v1) ~= "string" then
        return false;
    else
        for _, v3 in {
            "Model", 
            "Plugin", 
            "Audio", 
            "Decal", 
            "FontFamily", 
            "MeshPart", 
            "Video"
        } do
            if v1 == v3 then
                return true;
            end;
        end;
        return false;
    end;
end;
return isCreatorStoreAssetType;