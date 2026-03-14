local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.validationSystem.ValidationEnums);
local l_CollectionService_0 = game:GetService("CollectionService");
local v5 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
return {
    categories = v1.AllAssetUploadCategories, 
    requiredData = {
        v3.SharedDataMember.rootInstance
    }, 
    expectedFailures = {
        "Asset_EF_TaggedJacket", 
        "Bundle_EF_BodyWithLLLTagged.LeftLeg"
    }, 
    run = function(v6, v7) --[[ Line: 14 ]]
        -- upvalues: l_CollectionService_0 (copy), v5 (copy)
        local l_rootInstance_0 = v7.rootInstance;
        local l_l_rootInstance_0_Descendants_0 = l_rootInstance_0:GetDescendants();
        table.insert(l_l_rootInstance_0_Descendants_0, l_rootInstance_0);
        local v10 = {};
        for _, v12 in l_l_rootInstance_0_Descendants_0 do
            if #l_CollectionService_0:GetTags(v12) > 0 then
                table.insert(v10, v12:GetFullName());
            end;
        end;
        if #v10 > 0 then
            v6:fail(v5.Keys.InstanceTagsFound, {
                ProblematicDescendantPaths = table.concat(v10, ", ")
            });
        end;
    end
};