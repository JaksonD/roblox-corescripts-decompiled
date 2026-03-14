local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v6 = require(l_Parent_0.Common.TextKeys);
local v7 = require(l_Parent_0.ContactsList.Components.ContactsInformationModal);
local v8 = l_Roact_0.PureComponent:extend("ContactsUploadErrorModal");
v8.render = function(_) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), v6 (copy), l_Roact_0 (copy), v7 (copy), l_Images_0 (copy)
    return l_withLocalization_0({
        hasUploadError = v6.UPLOAD_CONTACTS_FAILURE
    })(function(v10) --[[ Line: 17 ]]
        -- upvalues: l_Roact_0 (ref), v7 (ref), l_Images_0 (ref)
        return l_Roact_0.createElement(v7, {
            image = l_Images_0["icons/status/error_large"], 
            text = v10.hasUploadError
        });
    end);
end;
return v8;