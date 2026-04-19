add_repositories("sculk-repo https://github.com/SculkCatalystMC/xmake-repo.git")

set_project("Protocol")

set_languages("cxx23")
add_rules("mode.debug", "mode.release")

add_requires("openssl", "reflection")

target("Protocol")
    set_kind("static")
    add_files("src/**.cpp")
    add_includedirs("include", {public = true})
    add_packages("openssl", "reflection")
    if is_plat("windows") then
        add_cxflags("/permissive", {tools = "cl"})
        add_cxflags("/utf-8")
        add_cxflags("/Ze")
        add_defines("UNICODE", "NOMINMAX")
        set_symbols("debug")
        add_ldflags("/MAP", {force = true})
    end