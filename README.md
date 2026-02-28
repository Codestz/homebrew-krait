# homebrew-krait

Homebrew tap for [krait](https://github.com/Codestz/krait) — code intelligence CLI for AI agents.

## Install

```bash
brew tap Codestz/krait
brew install krait
```

## What is krait?

Krait is a headless LSP client for AI coding agents. It provides semantic symbol search, hover, diagnostics, and editing — backed by real language servers, not regex.

```bash
krait find symbol PaymentService     # locate definition
krait hover PaymentService           # type info + docs
krait read symbol PaymentService     # extract full body
krait check src/payments.ts          # LSP diagnostics
cat fix.ts | krait edit replace processPayment  # semantic edit
```

No line numbers. No file parsing. The LSP is the source of truth.

## Language support

| Language | Server |
|----------|--------|
| TypeScript / JavaScript | vtsls |
| Go | gopls |
| Rust | rust-analyzer |
| C / C++ | clangd |

Language servers are auto-installed on first use.

## Links

- [Documentation](https://codestz.github.io/krait/)
- [GitHub](https://github.com/Codestz/krait)
- [crates.io](https://crates.io/crates/krait-cli)
- [Releases](https://github.com/Codestz/krait/releases)

## License

MIT
