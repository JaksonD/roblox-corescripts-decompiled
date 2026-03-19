local v0 = require(script.Parent.utils.makeDefaultReadPolicy);
return {
    fields = {
        isSponsored = {}, 
        thumbnails = {
            read = v0({})
        }
    }
};