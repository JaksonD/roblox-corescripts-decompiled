local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
return (require(l_script_FirstAncestor_0.Logger):new(script:GetFullName() .. ":RoactPaginator"));