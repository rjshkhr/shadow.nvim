local M = {}

local colors = {
	bg = { gui = "#1D2326", cterm = 0 },
	fg = { gui = "#E6E7E6", cterm = 7 },
	black = { gui = "#242B2D", cterm = 0 },
	black_bright = { gui = "#485457", cterm = 8 },
	red = { gui = "#BC8F7D", cterm = 1 },
	red_bright = { gui = "#D4A394", cterm = 9 },
	green = { gui = "#96B088", cterm = 2 },
	green_bright = { gui = "#ABC49E", cterm = 10 },
	yellow = { gui = "#CCAC7D", cterm = 3 },
	yellow_bright = { gui = "#E2BF8F", cterm = 11 },
	blue = { gui = "#7E9AAB", cterm = 4 },
	blue_bright = { gui = "#94B1C4", cterm = 12 },
	magenta = { gui = "#A68CAA", cterm = 5 },
	magenta_bright = { gui = "#BC9EC0", cterm = 13 },
	cyan = { gui = "#839C98", cterm = 6 },
	cyan_bright = { gui = "#97B3AF", cterm = 14 },
	white = { gui = "#CED3DC", cterm = 7 },
	white_bright = { gui = "#E8EBF0", cterm = 15 },
}

local highlights = {
	-- Basic Editor UI
	Normal = { fg = colors.fg.gui, bg = colors.bg.gui, ctermfg = colors.fg.cterm, ctermbg = colors.bg.cterm }, -- Default text and background
	SignColumn = { bg = colors.bg.gui, ctermbg = colors.bg.cterm }, -- Column where signs (like git changes) are displayed
	MsgArea = { fg = colors.fg.gui, bg = colors.bg.gui, ctermfg = colors.fg.cterm, ctermbg = colors.bg.cterm }, -- Area for messages and cmdline
	ModeMsg = { fg = colors.fg.gui, bg = colors.bg.gui, ctermfg = colors.fg.cterm, ctermbg = colors.bg.cterm }, -- Mode messages (e.g., "-- INSERT --")
	MsgSeparator = { fg = colors.fg.gui, bg = colors.bg.gui, ctermfg = colors.fg.cterm, ctermbg = colors.bg.cterm }, -- Separator for scrolled messages
	MatchParen = {
		fg = colors.cyan.gui,
		bg = colors.black_bright.gui,
		ctermfg = colors.cyan.cterm,
		ctermbg = colors.black_bright.cterm,
	},

	-- Window separators
	WinSeparator = { fg = colors.black.gui, ctermfg = colors.black.cterm },

	-- Line Numbers and Cursor
	LineNr = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm }, -- Line numbers
	CursorLineNr = { fg = colors.green.gui, ctermfg = colors.green.cterm }, -- Current line number
	CursorLine = { bg = colors.bg.gui, ctermbg = colors.bg.cterm }, -- Line the cursor is on
	CursorColumn = { bg = colors.bg.gui, ctermbg = colors.bg.cterm }, -- Column the cursor is on

	-- Search and Selection
	Search = {
		fg = colors.bg.gui,
		bg = colors.blue_bright.gui,
		ctermfg = colors.bg.cterm,
		ctermbg = colors.blue_bright.cterm,
	},
	IncSearch = {
		fg = colors.bg.gui,
		bg = colors.yellow.gui,
		ctermfg = colors.bg.cterm,
		ctermbg = colors.yellow.cterm,
	},
	Visual = {
		fg = "NONE",
		bg = colors.black.gui,
		ctermfg = "NONE",
		ctermbg = colors.black.cterm,
	},
	VisualNOS = {
		fg = "NONE",
		bg = colors.black.gui,
		ctermfg = "NONE",
		ctermbg = colors.black.cterm,
	},

	-- Statusline
	StatusLine = { fg = colors.fg.gui, bg = colors.bg.gui, ctermfg = colors.fg.cterm, ctermbg = colors.bg.cterm }, -- Active statusline
	StatusLineNC = {
		fg = colors.black_bright.gui,
		bg = colors.bg.gui,
		ctermfg = colors.black_bright.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Inactive statusline

	-- Syntax Highlighting
	Comment = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm }, -- Comments
	Constant = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm }, -- Any constant
	String = { fg = colors.green.gui, ctermfg = colors.green.cterm }, -- String literals
	Identifier = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm }, -- Variable names
	Function = { fg = colors.blue.gui, ctermfg = colors.blue.cterm }, -- Function names
	Statement = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm }, -- Any statement
	Operator = { fg = colors.fg.gui, ctermfg = colors.fg.cterm }, -- Operators
	Keyword = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm }, -- Keywords
	PreProc = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm }, -- Preprocessor directives
	Type = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm }, -- Type declarations
	Special = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm }, -- Special symbols

	-- Popup Menu
	Pmenu = { fg = colors.fg.gui, bg = colors.black.gui, ctermfg = colors.fg.cterm, ctermbg = colors.black.cterm }, -- Popup menu normal item
	PmenuSel = {
		fg = colors.bg.gui,
		bg = colors.cyan.gui,
		ctermfg = colors.bg.cterm,
		ctermbg = colors.cyan.cterm,
	}, -- Popup menu selected item
	PmenuSbar = { bg = colors.black.gui, ctermbg = colors.black.cterm }, -- Popup menu scrollbar
	PmenuThumb = { bg = colors.cyan.gui, ctermbg = colors.cyan.cterm }, -- Popup menu scrollbar thumb

	-- Floating windows
	FloatTitle = {
		fg = colors.blue.gui,
		bg = colors.black.gui,
		ctermfg = colors.blue.cterm,
		ctermbg = colors.black.cterm,
	}, -- Floating window title
	FloatBorder = {
		fg = colors.black.gui,
		bg = colors.black.gui,
		ctermfg = colors.black.cterm,
		ctermbg = colors.black.cterm,
	}, -- Floating window border
	NormalFloat = { fg = colors.fg.gui, bg = colors.black.gui, ctermfg = colors.fg.cterm, ctermbg = colors.black.cterm }, -- Normal text in floating windows

	-- Diagnostics
	DiagnosticError = { fg = colors.red.gui, ctermfg = colors.red.cterm }, -- Error diagnostics
	DiagnosticWarn = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm }, -- Warning diagnostics
	DiagnosticInfo = { fg = colors.blue.gui, ctermfg = colors.blue.cterm }, -- Information diagnostics
	DiagnosticHint = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm }, -- Hint diagnostics

	DiagnosticUnderlineError = { sp = colors.red.gui, undercurl = true }, -- Error underline
	DiagnosticUnderlineWarn = { sp = colors.yellow.gui, undercurl = true }, -- Warning underline
	DiagnosticUnderlineInfo = { sp = colors.blue.gui, undercurl = true }, -- Info underline
	DiagnosticUnderlineHint = { sp = colors.cyan.gui, undercurl = true }, -- Hint underline

	-- Status line
	StatusLineMode = { fg = colors.blue.gui, ctermfg = colors.blue.cterm }, -- Mode indicator
	StatusLinePath = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm }, -- File path
	StatusLineFlags = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm }, -- File flags
	StatusLineFileType = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm }, -- File type
	StatusLinePosition = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm }, -- Line and column
	StatusLinePercent = { fg = colors.green.gui, ctermfg = colors.green.cterm }, -- Percentage
	StatusLineModified = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm }, -- Color for modified icon

	StatusLineModeNormal = { fg = colors.blue.gui, ctermfg = colors.blue.cterm },
	StatusLineModeInsert = { fg = colors.green.gui, ctermfg = colors.green.cterm },
	StatusLineModeVisual = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm },
	StatusLineModeCommand = { fg = colors.green.gui, ctermfg = colors.green.cterm },
	StatusLineModeReplace = { fg = colors.red.gui, ctermfg = colors.red.cterm },
	StatusLineModeTerminal = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },

	-- nvim-telescope
	TelescopeNormal = {
		fg = colors.fg.gui,
		bg = colors.bg.gui,
		ctermfg = colors.fg.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Telescope window text
	TelescopePromptNormal = {
		fg = colors.fg.gui,
		bg = colors.bg.gui,
		ctermfg = colors.fg.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Prompt window text
	TelescopeResultsNormal = {
		fg = colors.fg.gui,
		bg = colors.bg.gui,
		ctermfg = colors.fg.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Results window text
	TelescopeSelection = {
		fg = colors.fg.gui,
		bg = colors.black.gui,
		ctermfg = colors.fg.cterm,
		ctermbg = colors.black.cterm,
	}, -- Selected item
	TelescopeMatching = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm }, -- Matched characters in search

	-- nvim-cmp
	CmpItemAbbr = { fg = colors.fg.gui, ctermfg = colors.fg.cterm }, -- Completion menu text
	CmpItemAbbrDeprecated = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm, strikethrough = true }, -- Deprecated items
	CmpItemMenu = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm }, -- Menu text (e.g., [LSP])

	CmpItemKindVariable = {
		fg = colors.magenta.gui,
		bg = colors.bg.gui,
		ctermfg = colors.magenta.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Variables
	CmpItemKindFunction = {
		fg = colors.blue.gui,
		bg = colors.bg.gui,
		ctermfg = colors.blue.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Functions
	CmpItemKindMethod = {
		fg = colors.blue.gui,
		bg = colors.bg.gui,
		ctermfg = colors.blue.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Methods
	CmpItemKindClass = {
		fg = colors.yellow.gui,
		bg = colors.bg.gui,
		ctermfg = colors.yellow.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Classes
	CmpItemKindInterface = {
		fg = colors.yellow.gui,
		bg = colors.bg.gui,
		ctermfg = colors.yellow.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Interfaces
	CmpItemKindModule = {
		fg = colors.yellow.gui,
		bg = colors.bg.gui,
		ctermfg = colors.yellow.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Modules
	CmpItemKindProperty = {
		fg = colors.magenta.gui,
		bg = colors.bg.gui,
		ctermfg = colors.magenta.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Properties
	CmpItemKindField = {
		fg = colors.magenta.gui,
		bg = colors.bg.gui,
		ctermfg = colors.magenta.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Fields
	CmpItemKindEnum = {
		fg = colors.yellow.gui,
		bg = colors.bg.gui,
		ctermfg = colors.yellow.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Enums
	CmpItemKindSnippet = {
		fg = colors.cyan.gui,
		bg = colors.bg.gui,
		ctermfg = colors.cyan.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Snippets
	CmpItemKindFile = { fg = colors.fg.gui, bg = colors.bg.gui, ctermfg = colors.fg.cterm, ctermbg = colors.bg.cterm }, -- Files
	CmpItemKindFolder = { fg = colors.fg.gui, bg = colors.bg.gui, ctermfg = colors.fg.cterm, ctermbg = colors.bg.cterm }, -- Folders
	CmpItemKindKeyword = {
		fg = colors.magenta.gui,
		bg = colors.bg.gui,
		ctermfg = colors.magenta.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Keywords
	CmpItemKindConstant = {
		fg = colors.cyan.gui,
		bg = colors.bg.gui,
		ctermfg = colors.cyan.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Constants
	CmpItemKindOperator = {
		fg = colors.cyan.gui,
		bg = colors.bg.gui,
		ctermfg = colors.cyan.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Operators
	CmpItemKindReference = {
		fg = colors.magenta.gui,
		bg = colors.bg.gui,
		ctermfg = colors.magenta.cterm,
		ctermbg = colors.bg.cterm,
	}, -- References
	CmpItemKindValue = {
		fg = colors.cyan.gui,
		bg = colors.bg.gui,
		ctermfg = colors.cyan.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Values
	CmpItemKindUnit = {
		fg = colors.cyan.gui,
		bg = colors.bg.gui,
		ctermfg = colors.cyan.cterm,
		ctermbg = colors.bg.cterm,
	}, -- Units

	-- oil.nvim
	OilDir = { fg = colors.blue.gui, ctermfg = colors.blue.cterm }, -- Directory names
	OilFile = { fg = colors.fg.gui, ctermfg = colors.fg.cterm }, -- File names
	OilLink = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm }, -- Symbolic links

	-- Tree-sitter
	TSAnnotation = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm },
	TSAttribute = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	TSBoolean = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	TSCharacter = { fg = colors.green.gui, ctermfg = colors.green.cterm },
	TSComment = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm },
	TSConditional = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSConstant = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	TSConstBuiltin = { fg = colors.cyan_bright.gui, ctermfg = colors.cyan_bright.cterm },
	TSConstMacro = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	TSConstructor = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm },
	TSError = { fg = colors.red.gui, ctermfg = colors.red.cterm },
	TSException = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSField = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSFloat = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	TSFunction = { fg = colors.blue.gui, ctermfg = colors.blue.cterm },
	TSFuncBuiltin = { fg = colors.blue_bright.gui, ctermfg = colors.blue_bright.cterm },
	TSFuncMacro = { fg = colors.blue.gui, ctermfg = colors.blue.cterm },
	TSInclude = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSKeyword = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSKeywordFunction = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSKeywordOperator = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSLabel = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm },
	TSMethod = { fg = colors.blue.gui, ctermfg = colors.blue.cterm },
	TSNamespace = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm },
	TSNone = { fg = colors.fg.gui, ctermfg = colors.fg.cterm },
	TSNumber = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	TSOperator = { fg = colors.fg.gui, ctermfg = colors.fg.cterm },
	TSParameter = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSParameterReference = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSProperty = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSPunctDelimiter = { fg = colors.fg.gui, ctermfg = colors.fg.cterm },
	TSPunctBracket = { fg = colors.fg.gui, ctermfg = colors.fg.cterm },
	TSPunctSpecial = { fg = colors.fg.gui, ctermfg = colors.fg.cterm },
	TSRepeat = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
	TSString = { fg = colors.green.gui, ctermfg = colors.green.cterm },
	TSStringRegex = { fg = colors.green_bright.gui, ctermfg = colors.green_bright.cterm },
	TSStringEscape = { fg = colors.green_bright.gui, ctermfg = colors.green_bright.cterm },
	TSSymbol = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	TSTag = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm },
	TSTagDelimiter = { fg = colors.fg.gui, ctermfg = colors.fg.cterm },
	TSText = { fg = colors.fg.gui, ctermfg = colors.fg.cterm },
	TSTitle = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm },
	TSType = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	TSTypeBuiltin = { fg = colors.cyan_bright.gui, ctermfg = colors.cyan_bright.cterm },
	TSVariable = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },
=======
	-- mini.starter
	MiniStarterHeader = { fg = colors.blue.gui, ctermfg = colors.blue.cterm }, -- Header text
	MiniStarterItem = { fg = colors.fg.gui, ctermfg = colors.fg.cterm }, -- Item text
	MiniStarterItemBullet = { fg = colors.yellow.gui, ctermfg = colors.yellow.cterm }, -- Bullet points
	MiniStarterItemPrefix = { fg = colors.green.gui, ctermfg = colors.green.cterm }, -- Prefix text
	MiniStarterSection = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm }, -- Section text
	MiniStarterQuery = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm }, -- Query text
	MiniStarterFooter = { fg = colors.red.gui, ctermfg = colors.red.cterm }, -- Footer text

	-- which-key.nvim
	WhichKey = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	WhichKeySeparator = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm },
	WhichKeyGroup = { fg = colors.blue.gui, ctermfg = colors.blue.cterm },
	WhichKeyDesc = { fg = colors.green.gui, ctermfg = colors.green.cterm },
	WhichKeyFloat = { bg = colors.black.gui, ctermbg = colors.black.cterm },
	WhichKeyValue = { fg = colors.magenta.gui, ctermfg = colors.magenta.cterm },

	-- NvimTree
	NvimTreeNormal = { fg = colors.fg.gui, bg = colors.bg.gui, ctermfg = colors.fg.cterm, ctermbg = colors.bg.cterm },
	NvimTreeFolderName = { fg = colors.blue.gui, ctermfg = colors.blue.cterm },
	NvimTreeOpenedFolderName = { fg = colors.blue_bright.gui, ctermfg = colors.blue_bright.cterm },
	NvimTreeEmptyFolderName = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm },
	NvimTreeIndentMarker = { fg = colors.black_bright.gui, ctermfg = colors.black_bright.cterm },
	NvimTreeVertSplit = { fg = colors.black.gui, bg = colors.bg.gui, ctermfg = colors.black.cterm, ctermbg = colors.bg.cterm },
	NvimTreeRootFolder = { fg = colors.red.gui, ctermfg = colors.red.cterm },
	NvimTreeSymlink = { fg = colors.cyan.gui, ctermfg = colors.cyan.cterm },
	NvimTreeStatuslineNc = { fg = colors.black_bright.gui, bg = colors.bg.gui, ctermfg = colors.black_bright.cterm, ctermbg = colors.bg.cterm },
}

M.colors = colors

function M.setup()
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
