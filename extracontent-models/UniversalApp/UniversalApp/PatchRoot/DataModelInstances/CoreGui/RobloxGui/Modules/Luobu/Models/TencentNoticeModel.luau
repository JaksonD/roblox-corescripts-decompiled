local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = {
    validateJson = v1.interface({
        NoticeId = v1.string, 
        Scene = v1.string, 
        Type = v1.string, 
        StartTime = v1.string, 
        EndTime = v1.string, 
        Title = v1.optional(v1.string), 
        HasRead = v1.optional(v1.boolean), 
        Content = v1.optional(v1.string), 
        NoticeUrl = v1.optional(v1.string), 
        WebTypeUrl = v1.optional(v1.string), 
        LandscapePicUrl = v1.optional(v1.string), 
        PortraitPicUrl = v1.optional(v1.string)
    }), 
    new = function() --[[ Line: 36 ]] --[[ Name: new ]]
        return {};
    end
};
v2.mock = function() --[[ Line: 40 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    local v3 = v2.new();
    v3.noticeId = 117617;
    v3.scene = "2";
    v3.type = "Image";
    v3.hasRead = false;
    v3.startTime = 1605686400;
    v3.endTime = 1614499200;
    v3.title = "Luobu";
    v3.noticeUrl = "https://www.roblox.cn/";
    return v3;
end;
local function _(v4) --[[ Line: 53 ]] --[[ Name: sanitizeUrl ]]
    if v4 == "" or v4 == " " then
        return nil;
    else
        return v4;
    end;
end;
v2.fromJsonData = function(v6) --[[ Line: 61 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v2 (copy)
    assert(v2.validateJson(v6), "Error: TencentNotice JSON file is not valid.");
    local v7 = v2.new();
    v7.noticeId = tonumber(v6.NoticeId);
    v7.scene = v6.Scene;
    v7.startTime = tonumber(v6.StartTime);
    v7.endTime = tonumber(v6.EndTime);
    v7.hasRead = v6.HasRead;
    v7.title = v6.Title;
    v7.content = v6.Content;
    v7.type = v6.Type;
    local l_NoticeUrl_0 = v6.NoticeUrl;
    v7.noticeUrl = if not (l_NoticeUrl_0 ~= "") or l_NoticeUrl_0 == " " then nil else l_NoticeUrl_0;
    l_NoticeUrl_0 = v6.WebTypeUrl;
    v7.webTypeUrl = if not (l_NoticeUrl_0 ~= "") or l_NoticeUrl_0 == " " then nil else l_NoticeUrl_0;
    v7.landscapePicUrl = v6.LandscapePicUrl;
    v7.portraitPicUrl = v6.PortraitPicUrl;
    return v7;
end;
return v2;