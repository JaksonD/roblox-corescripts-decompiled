return function(v0) --[[ Line: 3 ]]
    local v1 = {};
    v1.info = {
        webbundle = v0.fromString("www:bundles/{assetId}"), 
        webasset = v0.fromString("www:catalog/{assetId}"), 
        webpage = function(v2) --[[ Line: 10 ]] --[[ Name: webpage ]]
            -- upvalues: v1 (copy)
            if v2.assetType == "Bundle" then
                return v1.info.webbundle(v2);
            elseif v2.assetType == "Asset" then
                return v1.info.webasset(v2);
            else
                warn(string.format("%s - unknown assetType of %s", tostring(script.name), (tostring(v2.assetType))));
                return nil;
            end;
        end, 
        appsflyer = function(v3) --[[ Line: 20 ]] --[[ Name: appsflyer ]]
            -- upvalues: v0 (copy), v1 (copy)
            return v0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
                mobileUrl = v0.fromString("mobilenav:item_details?itemId={assetId}&itemType={assetType}")(v3), 
                webUrl = v1.info.webpage(v3)
            });
        end
    };
    return v1;
end;