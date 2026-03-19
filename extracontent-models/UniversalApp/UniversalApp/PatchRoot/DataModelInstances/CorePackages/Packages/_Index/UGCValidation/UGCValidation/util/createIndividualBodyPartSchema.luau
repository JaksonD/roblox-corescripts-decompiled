local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Constants);
return function(v3, v4, _) --[[ Line: 7 ]] --[[ Name: createIndividualBodyPartSchema ]]
    -- upvalues: v2 (copy)
    local v6 = v2.ASSET_TYPE_INFO[v3].subParts[v4];
    local v7 = {
        ClassName = "MeshPart", 
        Name = {
            v4
        }, 
        _children = {
            {
                Name = {
                    "AvatarPartScaleType"
                }, 
                ClassName = "StringValue"
            }, 
            {
                Name = {
                    v4, 
                    v4 .. "WrapTarget", 
                    "WrapTarget"
                }, 
                ClassName = "WrapTarget"
            }, 
            {
                Name = {
                    "SurfaceAppearance"
                }, 
                ClassName = "SurfaceAppearance", 
                _optional = true
            }
        }
    };
    table.insert(v7._children, {
        Name = {
            v6.rigAttachmentToParent.name
        }, 
        ClassName = "Attachment"
    });
    for v8 in pairs(v6.otherAttachments) do
        table.insert(v7._children, {
            Name = {
                v8
            }, 
            ClassName = "Attachment"
        });
    end;
    return v7;
end;