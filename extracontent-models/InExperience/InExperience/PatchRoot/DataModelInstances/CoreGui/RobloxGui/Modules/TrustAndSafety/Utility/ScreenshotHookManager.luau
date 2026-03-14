local v0 = {
    preScreenshot = function() --[[ Line: 2 ]] --[[ Name: preScreenshot ]]

    end, 
    postScreenshot = function() --[[ Line: 3 ]] --[[ Name: postScreenshot ]]

    end
};
return {
    setPreScreenshotHook = function(v1) --[[ Line: 7 ]] --[[ Name: setPreScreenshotHook ]]
        -- upvalues: v0 (copy)
        v0.preScreenshot = v1;
    end, 
    setPostScreenshotHook = function(v2) --[[ Line: 10 ]] --[[ Name: setPostScreenshotHook ]]
        -- upvalues: v0 (copy)
        v0.postScreenshot = v2;
    end, 
    doPreScreenshot = function() --[[ Line: 13 ]] --[[ Name: doPreScreenshot ]]
        -- upvalues: v0 (copy)
        v0.preScreenshot();
    end, 
    doPostScreenshot = function() --[[ Line: 16 ]] --[[ Name: doPostScreenshot ]]
        -- upvalues: v0 (copy)
        v0.postScreenshot();
    end
};