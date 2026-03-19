local v0 = game:GetService("ContentProvider").BaseUrl:lower();
v0 = string.gsub(v0, "/m.", "/www.");
v0 = string.gsub(v0, "/www.", "/thumbnails.");
v0 = string.gsub(v0, "http:", "https:");
return {
    Headshot = "rbxthumb://type=AvatarHeadShot&id=%d&w=%d&h=%d", 
    Bust = v0 .. "v1/users/avatar-bust?userIds=%d&size=%dx%d&format=Png&isCircular=false", 
    Thumbnail = "rbxthumb://type=Avatar&id=%d&w=%d&h=%d"
};