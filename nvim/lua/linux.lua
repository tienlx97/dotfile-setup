if vim.fn.has("unnamedplus") == 1 then
	vim.opt.clipboard = "unnamedplus"
else
	vim.opt.clipboard = "unnamed"
end
--
-- local os = require("os")
-- os.system("xclip -selection clipboard -i")
