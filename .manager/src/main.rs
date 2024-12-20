use std::env;
use std::{fs, os::unix::fs::symlink, path::Path};

fn main() -> Result<(), std::io::Error> {
	if let Some(home) = dirs::home_dir() {
		let dotfiles_dir = home.join("dotfiles");

		let dotfiles_map = [
			// ~/.config
			("nvim", ".config/nvim"),
			("wezterm", ".config/wezterm"),
			("zellij", ".config/zellij"),
			("zed/settings.json", ".config/zed/settings.json"),
			("zed/keymap.json", ".config/zed/keymap.json"),
			("zed/snippets.json", ".config/zed/snippets.json"),
			("vscode/settings.json", ".config/VSCodium/User/settings.json"),
			("fish/config.fish", ".config/fish/config.fish"),
			// ~
			("git/.gitconfig", ".gitconfig"),
			("npm/.npmrc", ".npmrc"),
		];

		let args: Vec<String> = env::args().collect();
		let command = args[1].as_str();

		match command {
			"link" => {
				for &(key, value) in &dotfiles_map {
					let target = Path::new(&dotfiles_dir).join(key);
					let link_name = Path::new(&home).join(value);

					link(&target, &link_name)?;
				}
			}
			"unlink" => {
				for &(_, value) in &dotfiles_map {
					let link_name = Path::new(&home).join(value);
					unlink(&link_name)?;
				}
			}
			_ => panic!("{command}: command not found"),
		}
	}

	Ok(())
}

fn link(original_path: &Path, symlink_target_path: &Path) -> Result<(), std::io::Error> {
	if symlink_target_path.exists() {
		if let Ok(existing_target) = fs::read_link(symlink_target_path) {
			if existing_target == original_path {
				println!("✅ Already linked: {:?} -> {:?}", symlink_target_path, original_path);
				return Ok(());
			}
		}
	}

	if let Some(parent_dir) = symlink_target_path.parent() {
		fs::create_dir_all(parent_dir)?;
	}

	if let Err(error) = symlink(original_path, symlink_target_path) {
		if error.kind() != std::io::ErrorKind::AlreadyExists {
			Err(error)?;
		}

		println!("❌ File already exists: {:?}", symlink_target_path);
		return Ok(());
	}

	println!("✅ Symlink created: {:?} -> {:?}", symlink_target_path, original_path);
	Ok(())
}

fn unlink(symlink_target_path: &Path) -> Result<(), std::io::Error> {
	if symlink_target_path.exists() {
		fs::remove_file(symlink_target_path)?;
	}

	println!("✅ Deleted: {:?}", symlink_target_path);
	Ok(())
}
