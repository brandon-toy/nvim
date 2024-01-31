
local M = {}

M.setup = function()
	local jdtls = require("jdtls")
	local cmp = require("cmp_nvim_lsp")
	local mason = require("mason-registry")
	local bemol = require("util.bemol")
	local java_config = require("config.java")

	local root_dir = jdtls.setup.find_root( { "packageInfo" }, "Config" )

	local on_attach = function()
		jdtls.extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
	end

	local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

	local cmd = function()
		local jdtls_install_dir = mason.get_package("jdtls"):get_install_path()

		return {
			java_config.java_17_dir .. "/bin/java",
			"-javaagent:" .. jdtls_install_dir .. "/lombok.jar",
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true", "-Dlog.level=ALL",
			"-Xms2g", "-Xmx4g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens", "java.base/java.util=ALL-UNNAMED",
			"--add-opens", "java.base/java.lang=ALL-UNNAMED",
			"-jar", vim.fn.glob(jdtls_install_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
			"-configuration", jdtls_install_dir .. "/config_linux/",
			"-data", vim.fn.stdpath("cache") .. "/jdtls/nvim-data/" .. vim.fn.fnamemodify(root_dir, ":p:h:t"),
		}
	end

	local settings = {
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				hashCodeEquals = {
					useJava7Objects = true,
				},
				useBlocks = true,
			},
			configuration = {
				runtimes = {
					{ name = "JavaSE-1.8", path = java_config.java_8_dir },
					{ name = "JavaSE-11", path = java_config.java_11_dir },
					{ name = "JavaSE-17", path = java_config.java_17_dir },
				},
			},
		},
	}

	local init_options = {
		workspaceFolders = bemol.ws_folders(root_dir).jdtls,
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	}

    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java" },
        callback = function(event)
			jdtls.start_or_attach({
				root_dir = root_dir,
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = cmd(),
				settings = settings,
				init_options = init_options,
			})
		end,
    })
end

return M

