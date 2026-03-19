local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_default_0 = require(l_Parent_1.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.App.Networking);
local l_ShareLinksNetworking_0 = v4.ShareLinksNetworking;
local l_LinkType_0 = v4.ShareLinksRodux.Enums.LinkType;
return function(v7, v8) --[[ Line: 15 ]]
    -- upvalues: l_LinkType_0 (copy), l_ShareLinksNetworking_0 (copy), l_default_0 (copy), v3 (copy)
    return function(v9) --[[ Line: 16 ]]
        -- upvalues: l_LinkType_0 (ref), v7 (copy), v8 (copy), l_ShareLinksNetworking_0 (ref), l_default_0 (ref), v3 (ref)
        local v10 = {
            linkType = l_LinkType_0.ContentPost.rawValue(), 
            postCreatorId = v7, 
            postId = v8
        };
        v9:dispatch(l_ShareLinksNetworking_0.GetOrGenerateLink.API(v10)):andThen(function(v11) --[[ Line: 25 ]]
            -- upvalues: l_default_0 (ref), v3 (ref)
            local l_shortUrl_0 = v11.responseBody.shortUrl;
            if not l_default_0 then
                return;
            else
                assert(l_default_0 ~= nil, "ExternalContentSharingProtocol is required");
                l_default_0:shareUrl({
                    context = v3.ContentFeedContext, 
                    url = l_shortUrl_0
                });
                return;
            end;
        end):catch(function(_) --[[ Line: 38 ]]

        end);
    end;
end;