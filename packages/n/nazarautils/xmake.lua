package("nazarautils")
	set_homepage("https://github.com/NazaraEngine")
	set_description("Header-only utility library for Nazara projects")
	set_license("MIT")

	add_urls("https://github.com/NazaraEngine/NazaraUtils.git")

	add_versions("2022.05.23", "dc320157d1c8c25df5194cdcda64afcd22dbb13c")

	on_install(function (package)
		import("package.tools.xmake").install(package)
	end)

	on_test(function (package)
		assert(package:check_cxxsnippets({test = [[
			void test() {
				Nz::Bitset<> bitset;
				bitset.UnboundedSet(42);
				bitset.Reverse();
			}
		]]}, {configs = {languages = "c++17"}, includes = "Nazara/Utils/Bitset.hpp"}))
	end)
