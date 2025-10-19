import { defineConfig } from "vitepress";
import {
	groupIconMdPlugin,
	groupIconVitePlugin,
} from "vitepress-plugin-group-icons";

// https://vitepress.dev/reference/site-config
export default defineConfig({
	srcDir: "src",

	title: "dotfiles",
	description: "dotfiles",
	base: "/dotfiles/",

	markdown: {
		config(md) {
			md.use(groupIconMdPlugin);
		},
	},
	vite: {
		publicDir: "../public",
		plugins: [groupIconVitePlugin()],
	},

	themeConfig: {
		// https://vitepress.dev/reference/default-theme-config
		nav: [{ text: "Home", link: "/" }],

		socialLinks: [
			{ icon: "github", link: "https://github.com/tednaaa/dotfiles" },
		],

		sidebar: [
			{
				text: "How to manage?",
				link: "/manage",
				items: [
					{ text: "symlinks", link: "/manage/symlinks" },
					{ text: "packages", link: "/manage/packages" },
				],
			},
			{
				text: "Arch",
				items: [
					{ text: "Minimal setup", link: "/arch/minimal-setup" },
					{ text: "Hyprland", link: "/arch/hyprland" },
					{ text: "KDE", link: "/arch/kde" },
				],
			},
			{
				text: "Firefox",
				items: [{ text: "Bookmarks loading?", link: "/firefox/bookmarks" }],
			},
			{
				text: "Zed",
				items: [{ text: "Cheat sheet", link: "/zed/cheat-sheet" }],
			},
			{
				text: "Neovim",
				items: [{ text: "Cheat sheet", link: "/neovim/cheat-sheet" }],
			},
		],
	},
});
