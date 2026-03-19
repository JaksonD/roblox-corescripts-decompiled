local v0 = require(script.Parent.FFlagAXLooksWidgetContextForOrganicContent);
local v1 = require(script.Parent.FFlagAXCustomizeMakeupSupport);
return pcall(function() --[[ Line: 4 ]]
    return Enum.AvatarAssetType.EyeMakeup;
end) and game:DefineFastFlag("AXCatalogMakeupSupport10", false) and v0 and v1;