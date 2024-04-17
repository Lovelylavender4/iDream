add_rules("mode.debug", "mode.release")
set_allowedarchs("windows|x64")
set_defaultarchs("windows|x64")

add_repositories("MiF-repo https://github.com/MiracleForest/xmake-repo.git")

-- Dependencies from xmake-repo.
add_requires("fmt")
add_requires("magic_enum")
add_requires("nlohmann_json")

-- Dependencies from MiF-repo.
add_requires("iFamily")

if not has_config("vs_runtime") then
    set_runtimes("MD")
end

target("iDreamTests")
    set_kind("binary")
    add_files("iDream/tests/**.cpp")
    add_headerfiles(
        "iDream/include/**.h"
    )
    add_includedirs(
        "iDream/include"
    )
    add_cxflags(
        "/utf-8",
        "/permissive-",
        "/EHa",
        "/W4",
        "/w44265",
        "/w44289",
        "/w44296",
        "/w45263",
        "/w44738",
        "/w45204"
    )
    add_cxflags(
        "/EHs",
        "-Wno-microsoft-cast",
        "-Wno-invalid-offsetof",
        "-Wno-c++2b-extensions",
        "-Wno-microsoft-include",
        "-Wno-overloaded-virtual",
        "-Wno-ignored-qualifiers",
        "-Wno-potentially-evaluated-expression",
        "-Wno-pragma-system-header-outside-header",
        {tools = {"clang_cl"}}
    )
    add_defines(
        "_AMD64_",
        "NOMINMAX",
        "UNICODE",
        "WIN32_LEAN_AND_MEAN"
    )
    add_packages(
        "fmt",
        "magic_enum",
        "nlohmann_json",
        "iFamily",
        { public = true }
    )
    set_languages("c++20")
    set_symbols("debug")
    
    if is_mode("debug") then
        add_defines("IDREAM_DEBUG")
    end

target_end()