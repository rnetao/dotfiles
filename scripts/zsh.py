from pathlib import Path

def main():
    ohmyzsh = Path('../subgit/oh-my-zsh').resolve()
    zsh = Path('../zsh').resolve()
    zshenv = Path('../zsh/.zshenv').resolve()
    config_ohmyzsh_dir = Path.home() / '.config' / 'oh-my-zsh'
    config_zsh_dir = Path.home() / '.config' / 'zsh'
    config_zshenv = Path.home() / '.zshenv'
    if config_zsh_dir.exists(): config_zsh_dir.unlink()
    config_zsh_dir.symlink_to(zsh)
    if config_ohmyzsh_dir.exists(): config_ohmyzsh_dir.unlink()
    config_ohmyzsh_dir.symlink_to(ohmyzsh)
    if config_zshenv.exists(): config_zshenv.unlink()
    config_zshenv.symlink_to(zshenv)


if __name__ == "__main__":
    main()
