use std::env;
use std::{fs, os::unix::fs::symlink, path::Path};

fn main() -> Result<(), std::io::Error> {
	if let Some(home) = dirs::home_dir() {
		let dotfiles_dir = home.join("dotfiles");

		let dotfiles_map = [
			("nvim", ".config/nvim"),
			("alacritty", ".config/alacritty"),
			("zed/settings.json", ".config/zed/settings.json"),
			("vscode/settings.json", ".config/VSCodium/User/settings.json"),
			("vscode/keybindings.json", ".config/VSCodium/User/keybindings.json"),
			(
				"vscode/snippets.json",
				".config/VSCodium/User/snippets/main.code-snippets",
			),
			("config.fish", ".config/fish/config.fish"),
			(".gitconfig", ".gitconfig"),
			(".tool-versions", ".tool-versions"),
			(".npmrc", ".npmrc"),
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
			_ => {}
		}
	}

	Ok(())
}

fn link(target: &Path, link_name: &Path) -> Result<(), std::io::Error> {
	if link_name.exists() {
		if let Ok(existing_target) = fs::read_link(link_name) {
			if existing_target == target {
				println!("Symlink already exists and is correct: {:?} -> {:?}", link_name, target);
				return Ok(());
			}
		}
	}

	if let Some(parent_dir) = link_name.parent() {
		fs::create_dir_all(parent_dir)?;
	}

	if let Err(error) = symlink(target, link_name) {
		if error.kind() != std::io::ErrorKind::AlreadyExists {
			Err(error)?;
		}

		println!("File already exists: {:?}", link_name);
		return Ok(());
	}

	println!("Symlink created: {:?} -> {:?}", link_name, target);
	Ok(())
}

fn unlink(link_name: &Path) -> Result<(), std::io::Error> {
	if link_name.exists() {
		fs::remove_file(link_name)?;
	}
	Ok(())
}
