import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
	title: "dotfiles",
	description: "dotfiles",
	themeConfig: {
		// https://vitepress.dev/reference/default-theme-config
		nav: [{ text: "Home", link: "/" }],

		socialLinks: [
			{ icon: "github", link: "https://github.com/tednaaa/dotfiles" },
		],

		sidebar: [
			{
				text: "Dotfiles",
				link: "/dotfiles",
			},
			{
				text: "Arch",
				items: [
					{ text: "Minimal setup", link: "/arch/minimal-setup" },
					{ text: "KDE", link: "/arch/kde" },
					{ text: "Hyprland", link: "/arch/hyprland" },
				],
			},
			{
				text: "Neovim",
				items: [{ text: "Cheat sheet", link: "/neovim/cheat-sheet" }],
			},
		],
	},
});
