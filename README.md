# neovim-config

## Config setup

This nvim uses the following setup:

- init.lua as a the core config
- lazy.nvim as the plugin manager

## Installing lua-langauge server

You can install it using luarocks
`sudo luarocks install lua-language-server`

Or build from Library

### Example

#### Replace with the actual download URL and filename

```bash
wget <download_url>/lua-language-server-linux-x86_64.tar.gz
tar -xvf lua-language-server-linux-x86_64.tar.gz
cd lua-language-server-linux-x86_64
chmod +x lua-language-server
sudo mv lua-language-server /usr/local/bin/  # Or another directory in your PATH
```

Make sure to export it to your path
Example: export PATH=/usr/local/bin/lua-language-server-3.14.0-linux-x64/bin

## Reading resources

- [nvim docs](https://neovim.io/doc/)
- [nvim lua](https://github.com/nanotee/nvim-lua-guide)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
