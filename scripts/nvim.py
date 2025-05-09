from pathlib import Path

def main():
    nvim = Path('../nvim').resolve()
    config_nvim_dir = Path.home() / '.config' / 'nvim'
    if config_nvim_dir.exists(): config_nvim_dir.unlink()
    config_nvim_dir.symlink_to(nvim)


if __name__ == "__main__":
    main()
