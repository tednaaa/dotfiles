import { defineConfig } from "vitepress";
import {
	groupIconMdPlugin,
	groupIconVitePlugin,
} from "vitepress-plugin-group-icons";

// https://vitepress.dev/reference/site-config
export default defineConfig({
	title: "dotfiles",
	description: "dotfiles",
	base: "/dotfiles/",

	markdown: {
		config(md) {
			md.use(groupIconMdPlugin);
		},
	},
	vite: {
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
				text: "Dotfiles",
				items: [
					{ text: "How to manage?", link: "/dotfiles/manage" },
					{ text: "Setup script", link: "/dotfiles/setup-script" },
				],
			},
			{
				text: "Arch",
				items: [
					{ text: "Minimal setup", link: "/arch/minimal-setup" },
					{ text: "Post setup", link: "/arch/post-setup" },
					{ text: "KDE", link: "/arch/kde" },
					{ text: "Hyprland", link: "/arch/hyprland" },
				],
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
